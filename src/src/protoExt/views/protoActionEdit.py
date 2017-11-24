# -*- coding: utf-8 -*-

import json

from django.http import HttpResponse
from django.utils.encoding import smart_str

from protoLib.getStuff import getDjangoModel
from protoLib.models.protomodel import smControlFields
from . import validateRequest

from protoExt.utils.utilsConvert import toInteger, toDate, toDateTime, toTime, toFloat, toDecimal, toBoolean,\
    setString
from protoExt.utils.utilsBase import getReadableError, list2dict
from protoExt.utils.utilsWeb import doReturn
from jsonfield2.utils import JSONEncoder


from protoLib.getStuff import getModelPermission
from protoExt.views.protoActionList import Q2Dict
from protoExt.views.protoGetPci import getGenericPci
from protoExt.utils.utilsBase import traceError

# Error Constants
ERR_NOEXIST = '<b>ErrType:</b> KeyNotFound<br>The specifique record does not exist'
ERR_REFONLY = '<b>ErrType:</b> RefOnly<br>The specifique record is reference only'

# Actions
ACT_INS = 'add'
ACT_UPD = 'change'
ACT_DEL = 'delete'


def protoCreate(request):
    myAction = ACT_INS
    msg = _protoEdit(request, myAction)
    return msg


def protoUpdate(request):
    myAction = ACT_UPD
    return _protoEdit(request, myAction)


def protoDelete(request):
    myAction = ACT_DEL
    return _protoEdit(request, myAction)


def _protoEdit(request, myAction):

    cBase, msgReturn = validateRequest(request)
    if msgReturn:
        return msgReturn

    msgReturn = getGenericPci(cBase, True)
    if msgReturn:
        return msgReturn

    msgReturn = ''

    cBase.model = getDjangoModel(cBase.viewEntity)

#   Autentica
    if not getModelPermission(request.user, cBase.model, myAction):
        return doReturn({'success': False, 'message': 'No ' + myAction + 'permission'})


#   Verfica si es un protoModel ( maneja TeamHierarchy )
    cBase.isProtoModel = hasattr(cBase.model, '_protoObj')
    cBase.isPJsonModel = hasattr(cBase.model, '_protoJson')
    cBase.jsonField = cBase.protoMeta.get('jsonField', '')
    cBase.fakeId = hasattr(cBase.model, '_fakeId')

    if cBase.isPJsonModel:
        cBase.jsonField = 'smInfo'

#   Decodifica los eltos
    # Verifica q sea una lista de registros, (no deberia pasar, ya desde Extjs
    # se controla )
    rows = request.POST.get('rows', [])
    rows = json.loads(rows)
    if type(rows).__name__ == 'dict':
        rows = [rows]

#   Fields
    fieldsDict = list2dict(cBase.protoMeta['fields'], 'name')

    pList = []
    for data in rows:

        data['_ptStatus'] = ''

        if myAction == ACT_INS:
            rec = cBase.model()
        else:
            try:
                rec = cBase.model.objects.get(pk=data['id'])
            except:
                data['_ptStatus'] = data['_ptStatus'] + ERR_NOEXIST + '<br>'
                pList.append(data)
                continue

        if not (myAction == ACT_DEL):
            # Upd, Ins
            for key in data:
                key = smart_str(key)
                if key in ['id', '_ptStatus', '_ptId', '__str__']:
                    continue

#               Tree Specific vars   
                if key in ['leaf', 'parentId']:
                    continue

                vFld = fieldsDict[key]
                if vFld.get('crudType') in ["screenOnly", "readOnly" ]:
                    continue

                #  Los campos de seguridad se manejan a nivel registro
                if cBase.isProtoModel and key in smControlFields:
                    continue

                #  cBase.JsonField
                if key == cBase.jsonField or key.startswith(cBase.jsonField + '__'):
                    continue

                try:
                    setRegister(cBase, rec, key, data)
                except Exception as e:
                    traceError()
                    data['_ptStatus'] = data['_ptStatus'] + getReadableError(e)

            if len(cBase.jsonField) > 0:
                jsonInfo = {}
                for key in data:
                    if not key.startswith(cBase.jsonField + '__'):
                        continue
                    jKey = key[len(cBase.jsonField) + 2:]
                    jsonInfo[jKey] = data[key]
                setattr(rec, cBase.jsonField, jsonInfo)

            # Guarda el idInterno para concatenar registros nuevos en la grilla
            try:
                _ptId = data['_ptId']
            except:
                _ptId = ''

            try:
                rec.save()

                # Para retornar el resultado, algunos tipos de datos (ie. date), generan un error, es necesario hacerlo detalladamente
                # Convierte el registro en una lista y luego toma solo el
                # primer elto de la lista resultado.
                data = Q2Dict(cBase, [rec])[0]
                data['_ptId'] = _ptId

            except Exception as e:
                data['_ptStatus'] = data['_ptStatus'] + getReadableError(e)
                data['_ptId'] = _ptId

        else:  # Action Delete
            try:
                rec.delete()

            except Exception as e:
                data['_ptStatus'] = data['_ptStatus'] + getReadableError(e)

        pList.append(data)

        if data.get('_ptStatus', ''):
            msgReturn += data['_ptStatus'] + ';'

    context = {
        'totalCount': pList.__len__(),
        'message': msgReturn,
        'rows': pList,
        'success': True
    }

    return HttpResponse(json.dumps(context, cls=JSONEncoder), content_type="application/json")


# ---------------------


def setRegister(cBase, rec, key, data):

    try:
        field = cBase.model._meta.get_field(key)
    except:
        return

    # Tipo de attr
    cName = field.__class__.__name__

    # Si es definido como no editable en el modelo
    if getattr(field, 'editable', False) == False:
        return
    if cName == 'AutoField':
        return

    # Obtiene el valor
    value = data[key]

    try:

        if cName == 'CharField' or cName == 'TextField' or cName == 'EmailField':
            setattr(rec, key, value)
            return

        elif cName == 'ForeignKey':
            if not key.endswith('_id'):
                keyId = key + '_id'
            else:
                keyId = key

            exec('rec.' + keyId + ' =  ' + setString(data[keyId]))
            return

        elif cName == 'DateField':
            value = toDate(value)
        elif cName == 'TimeField':
            value = toTime(value)
        elif cName == 'DateTimeField':
            value = toDateTime(value)

        elif cName == 'BooleanField':
            value = toBoolean(value)
        elif cName == 'IntegerField':
            value = toInteger(value)
        elif cName == 'DecimalField':
            value = toDecimal(value)
        elif cName == 'FloatField':
            value = toFloat(value)
        elif cName in [ 'JsonField', 'JSONField' ] :
            if type(value) == type('') and len(value) == 0:
                value = {}

        else: 
            value = str( value ) 
             
        setattr(rec, key, value)

    except Exception:
        raise Exception
