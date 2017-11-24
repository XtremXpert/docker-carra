# -*- coding: utf-8 -*-
from protoLib.models.smbase import getUserProfile


try:
    from django.apps import apps
    get_model = apps.get_model
    get_models = apps.get_models
except ImportError:
    from django.db.models.loading import get_model, get_models  



def getUserTeam( cuser): 
    if cuser is None: return None 
    return getUserProfile( cuser ).userTeam 


def getDjangoModel(modelName):
    """
    Obtiene el modelo
    """

    if modelName.count('.') == 1:
        model = get_model(*modelName.split('.'))

    elif modelName.count('.') == 0:
        # No trae app ( caso extremandamente raro )          
        for m in get_models(include_auto_created=True):
            if m._meta.object_name.lower() == modelName.lower():
                model = m
                break

    elif modelName.count(".") == 2:
        # Es una vista, ( prototype or referentiel )          
        model = get_model(*modelName.split(".")[0:2])

    if model is None:
        raise Exception('model not found:' + modelName)

    return model




# -----------------------------------------------
# DGT: Verificar y borrar lo q no se necesite 



def getUserNodes(pUser, viewEntity):
    """
    Verifica la jerarquia hacia los nodos superiores ( CELL - RefOnly )
    """
    userProfile = getUserProfile(pUser)
    userNodes = None
    if userProfile and userProfile.userTree:
        userNodes = userProfile.userTree.split(',')

    return userNodes



def getModelPermission( pUser, model , perm=None):
    appName = model._meta.app_label
    modName = model._meta.model_name

    return  pUser.is_superuser or pUser.has_perm(appName + '.' + perm + '_' + modName)
    

def getAllModelPermissions(pUser, model ):
    """
    Equivalente de get_all_permissions por objeto 
    get_all_permissions : no trae lo q necesito, pues lo guarda en un cache y filtra por objeto,
    """

    permissions = {}
    for perm in [ 'menu', 'list', 'add', 'change', 'delete', 'config', 'custom', 'refallow' ]:
        if getModelPermission( pUser, model, perm ):
            permissions[ perm ] = True  

    return  permissions

#  ---------------


def  getUserLanguage( usrLanguage ):

    if usrLanguage not in ['es', 'en', 'fr' ] :
        usrLanguage = 'en'
    usrLanguage = 'protoExt.localisation.' + usrLanguage
    myModule = __import__( usrLanguage, globals(), locals(), ['__language' ], 0)

    return myModule.__language


def isInstalledApp( app ):
    
    from django.conf import settings 
    return (app in settings.INSTALLED_APPS)  


class cAux: 
    """
    Vide class for passing parameters 
    """
    pass 



def getProtoAdmin(model):
    """ 
    Carga la protoDefinicion, del modelo y luego del admin,
    La definicion del admin sirve para definir los EntryPoint, 
    pero no es necesario, la protoDefinicion se puede guardar directamente 
    en el modelo 
    """

    from django.contrib.admin.sites import  site

    # Siempre existe, la creacion del site la asigna por defecto
    model_admin = site._registry.get(model)

    # Si no esta registrado genera una definicion en blanco
    if not model_admin: model_admin = {}

    protoExclude = getattr(model_admin , 'exclude', [])
    if protoExclude is None: protoExclude = []

    protoModel = getattr(model, 'protoExt', {})
    protoAdmin = getattr(model_admin, 'protoExt', {})

    protoModel[ 'exclude'] = protoModel.get('exclude', []) + protoExclude

    if not isinstance(protoModel, dict): protoModel = {}
    if not isinstance(protoAdmin, dict): protoAdmin = {}

    #  PAra garantizar la creacion la meta 
    protoMeta = {}
    protoMeta.update( protoModel ) 
    protoMeta.update( protoAdmin)

    return  model_admin, protoMeta



def getRowById(myModelName, myId):
    """
    Retorna un registro dado un cBase.modelo y un id
    """

#   Obtiene los datos
    model = getDjangoModel(myModelName)
    myList = model.objects.filter(pk=myId)
    if len(myList) > 0:
        return myList[0]
    else:  
        return None

