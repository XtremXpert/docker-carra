# -*- coding: utf-8 -*-

#  Dgt 1503 - Permite importar la configuracion exportada con export2json
 
# Restricciones :  Debe cargarse sobre el mismo nombre de modelo para q las vistas funcionen, 
# ya q las vistas tienen una referencia directa al prototable

# Import Database class
from prototype.models import  Entity, Property, Relationship, Prototype 
from protoExt.utils.utilsBase import reduceDict

#  Export 2 Json 
import json



def importProto4Json(request, pModel):

#   To set permissions 
#     userProfile = getUserProfile( request.user)

#   Get filename   
    fileName = request.POST.get( 'actionFiles', {}).get('file')  
# 
#   Get file data
    try: 
        json_data = open( fileName )   
        jModel = json.load(json_data) 
        json_data.close()
    except: 
        return 'load file error' 


#   entity      ==============================
    for jEntity in jModel[ 'entities' ]: 
 
        defAux = reduceDict ( jEntity , [ "code", "dbName", "description" ] )
 
        pEntity = Entity.objects.get_or_create( model = pModel, code = defAux['code'], defaults= defAux )[0]
        pModel.entity_set.add( pEntity )


#       property      ==============================
        for jAux in jEntity.get( 'property_set' ): 
            jAux["isForeign"] = False 

            pProp = Property.objects.get_or_create( entity = pEntity, code = jAux['code'], defaults= jAux )[0]
            pEntity.property_set.add( pProp )

#       Prototype      ==============================
        for jAux in jEntity.get( 'prototype_set' ): 
            setRealEntity( jAux, pEntity.id  )
            pProp = Prototype.objects.get_or_create( 
                    entity = pEntity, 
                    code = jAux['code'], 
                    defaults= jAux )[0]
            pEntity.prototype_set.add( pProp )


#   entity      ==============================
    for jAux in jModel[ 'relations' ]: 
 
        pEntity = Entity.objects.get( model = pModel, code = jAux['entity'] )
        pRefEntity = Entity.objects.get( model = pModel, code = jAux['refEntity'] )
 
        del jAux['entity']
        del jAux['refEntity']

        Relationship.objects.get_or_create( entity = pEntity, refEntity = pRefEntity, defaults = jAux )[0]


    return 'Ok'


def setRealEntity(jAux, entityId):
    """
    Import set the real EntityId in prototype definition 
    """

    pci = jAux[ 'metaDefinition' ] 
    pci['protoEntityId'] = entityId 
    
    for lField in pci.get( 'fields', []) : 
        if lField['name'] == "entity_id": 
            lField['prpDefault'] = entityId 
            lField['type'] =  'foreignid'
        elif lField['name'] == "entity": 
            lField['type'] =  'foreigntext'


    pci.get("gridConfig", {})[ "baseFilter" ] = [ { 'property':'entity', 'filterStmt' : '=' + str( entityId ) } ]
