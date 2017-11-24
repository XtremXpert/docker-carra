# -*- coding: utf-8 -*-

''' 
Dgt 1503
Exportar vistas de un prototypo para ser usadas por una aplicacion generada a partir del prototypo
'''
  
from protoExt.utils.utilsConvert import slugify2
import json
from protoExt.utils.utilsBase import getClassName
from jsonfield2.utils import JSONEncoder
from protoExt.models import ViewDefinition


def exportProtoJson(request, pModel ):
    """
    Genera la definicion de las vistas para los modelos Django 
    """

    cViews = { 
      'code' :  pModel.code, 
      'model':  slugify2(pModel.code, '_'), 
      'entities' : {},
    }

    for pEntity in pModel.entity_set.all():

        # Do not delete ( dgt ) 
        cEntity = { 
           'code'  : pEntity.code, 
           'entity' :  getClassName( pEntity.code ), 
           'fullName' : cViews['model' ] + '.' + getClassName( pEntity.code ), 
#          'properties' : {},   
           'prototypes' : {},   
        } 

        cViews['entities'][ cEntity['code'] ]  = cEntity 

#         Do not delete  ( dgt ) 
#         for pProperty in pEntity.property_set.all():
#             
#             
#             cProperty =  {
#                 'code'      : pProperty.code, 
#                 'property'  : slugify2(pProperty.code, '_'),
#                 'isForeign' : pProperty.isForeign,  
#                 
#                 'baseType'   : pProperty.baseType,
#                 'prpLength'  : pProperty.prpLength,
#                 'prpScale'   : pProperty.prpScale,
# 
#                 'isPrimary'   : pProperty.isPrimary,
#                 'isReadOnly'  : pProperty.isReadOnly,
# 
#                 'isNullable'  : pProperty.isNullable,
#                 'isRequired'  : pProperty.isRequired,
#                 'isSensitive' : pProperty.isSensitive,
#                 'prpChoices'  : pProperty.prpChoices,
#                 'prpDefault'  : pProperty.prpDefault,
#                 'vType'       : pProperty.vType,
# 
#                 'crudType'    : pProperty.crudType,
#                 'description' : pProperty.description,
#                 'notes'       : pProperty.notes,
# 
#                 'dbName'      : pProperty.dbName,
#                 'isEssential' : pProperty.isEssential,
#                 'isLookUpResult' : pProperty.isLookUpResult,
#             }
# 
#             
#             if pProperty.isForeign:
#                 cProperty[ 'refEntity' ]    = pProperty.relationship.refEntity.code
#                 cProperty[ 'refCode' ]      = getClassName( pProperty.relationship.refEntity.code )
#                  
#                 cProperty[ 'baseMax']       = pProperty.relationship.baseMax
#                 cProperty[ 'baseMin']       = pProperty.relationship.baseMin
#                 cProperty[ 'onRefDelete']   = pProperty.relationship.onRefDelete
#                 cProperty[ 'refMax']        = pProperty.relationship.refMax
#                 cProperty[ 'refMin']        = pProperty.relationship.refMin
#                 cProperty[ 'relatedName']   = pProperty.relationship.relatedName
#                 cProperty[ 'typeRelation']  = pProperty.relationship.typeRelation
#                  
#             cEntity['properties'][ cProperty['code'] ]  = cProperty  


        for pPrototype in pEntity.prototype_set.all():

            # Migration proto - App
            sAux = pPrototype.metaDefinition.replace( "info__", "").replace( "-", "_" )
            sAux = sAux.replace( "prototype.ProtoTable.", "" )  
            sAux = sAux.replace( '"' + slugify2(pModel.code, '_') + '_', '"' + cViews['model' ] + '.' )
              
            cProto = json.loads( sAux )

            # Propiedades de base
            try:
                del cProto[ 'jsonField' ]
                del cProto[ 'protoEntity' ]  
                del cProto[ 'protoEntityId' ]
                del cProto['__ptType']
            except: 
                pass 
                
            cProto[ 'localSort' ] = False 
            cProto[ 'viewIcon' ]  = 'icon-1'
            cProto[ 'viewEntity' ] = cEntity[ 'fullName'] 
            
            # Elimina campos de control de prototypos y redirecciona zooms  
            newFields = [] 
            for fld in cProto['fields'] : 
                if fld['name'] in [ 'entity', 'entity_id', 'info' ]: 
                    continue
                if fld['name'] == '__str__':   
                    try: 
                        del fld['cpFromZoom']
                        del fld['cpFromField']
                        del fld['physicalName']
                    except: 
                        pass 

                try: 
                    del fld['__ptType']
                except:
                    pass 
                newFields.append( fld )
            
            cProto['fields'] = newFields 
            
            cPrototype =  {
                'code'           : pPrototype.code, 
                'description'    : pPrototype.description,
                'notes'          : cEntity[ 'fullName'],
                'metaDefinition' : cProto  
            } 
            
            cEntity['prototypes'][ cPrototype['code'] ]  = cPrototype  

            # Creacion de la vista 
            try:
                protoDef  = ViewDefinition.objects.get_or_create(code = cProto[ 'viewCode' ] )[0]
                protoDef.active = True 
                protoDef.overWrite = False 
                protoDef.description  = cEntity.get('fullName','')  + ' - '  + cProto.get('viewCode','')  + '<br>'
                protoDef.description += cProto.get('shortTitle','')   + '<br>' + cProto.get( 'description','')   

                protoDef.metaDefinition = json.dumps( cProto, cls = JSONEncoder ) 
                protoDef.save()   
        
            except :
                pass 


    return json.dumps( cViews , cls = JSONEncoder , sort_keys= True, indent = 4, separators=(',', ':') )