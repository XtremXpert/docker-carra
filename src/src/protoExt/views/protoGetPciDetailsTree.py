# -*- coding: utf-8 -*-

import json

from django.http import HttpResponse
from protoLib.getStuff import getDjangoModel 

from protoExt.utils.utilsWeb import JsonError
from . import validateRequest 

from protoExt.views.prototypeActions import isPrototypePci 
from protoExt.views.protoGrid import getModelDetails
from protoExt.utils.utilsConvert import toInteger


def protoGetDetailsTree(request):
    """ return full field tree 
    """

    cBase, msgReturn = validateRequest( request )
    if msgReturn: return msgReturn  

    
    try: 
        cBase.model = getDjangoModel(cBase.viewEntity)
    except :
        return JsonError('model not found: {0}'.format( cBase.viewEntity )) 
        

    detailList = []

    if isPrototypePci( cBase ): 

        protoEntityId = request.POST.get( 'protoEntityId', 0 )
        if not toInteger( protoEntityId )  >= 0:
            return JsonError('invalid idEntity')

        try:  
            from prototype.actions.viewDefinition import GetDetailsConfigTree
            detailList = GetDetailsConfigTree(  protoEntityId )
        except: 
            return JsonError( 'invalid idEntity')

    else: 
        modelDetails = getModelDetails( cBase.model )
        for detail in modelDetails: 
            addDetailToList( detailList,  detail ,  ''  )
    
        
    # Codifica el mssage json 
    context = json.dumps( detailList )
    return HttpResponse(context, content_type="application/json")



def addDetailToList(  detailList , detail,  detailPath   ):
    """ return parcial detail tree  ( Called from protoGetFieldTree )
    
    detailList    : Lista con los detalles 
    detail        : registro del detalle 
    detailField   : jerarquia vista desde el campo  
    detailPath    : jerarquia inversa vista desde el maestro 
    """


    if len( detailPath ) > 0:
        detailPath += '/'  
    detailPath +=  detail[ 'menuText' ]
    

    # Agrega el campo solicitado
    menuDetail = {
        "id"            : detailPath ,  
        "conceptDetail" : detail[ 'conceptDetail' ] , 
        "detailField"   : detail[ 'detailField' ] ,                    
        "masterField"   : 'pk',                
        "leaf"          : True 
        }
    
    detailList.append( menuDetail ) 
    
    # Evita demasiada recursividad ( 5 niveles debe ser mas q suficiente )
    # Si el mismo campo ya aparece en el camino seguramente es una autoreferencia
    detailField =  detail[ 'detailField' ]
    if detailField.count( '__') > 5 or detailField.count( '__' + detail[ 'detailName' ] + '__' ) > 0:
        return 

    else: 
        detailChild= []
        relmodel = getDjangoModel( detail[ 'conceptDetail' ]  )
        modelDetails = getModelDetails( relmodel )
        for sDetail in modelDetails: 
            sDetail[ 'detailField' ] = sDetail[ 'detailName' ] + '__' + detail[ 'detailField' ] 
            addDetailToList( detailChild,  sDetail ,  detailPath  )
    
        # Si el modelo de base es el modelo de trabajo, no entro al loop 
        if len( detailChild ) > 0:  
            menuDetail['leaf'] = False 
            menuDetail['children'] = detailChild
            
