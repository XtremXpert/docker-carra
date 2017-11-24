# -*- coding: utf-8 -*-

"""
Quick test debuger  
"""
from django.contrib.auth import authenticate

from protoExt.tests.test_ProtoGetDetails import ProtoGetDetailsTreeTest
from protoExt.tests.test_ProtoMenu import ProtoMenuTest
from protoExt.utils.utilsBase import traceError
from protoLib.tests.dataSetup import MySession

from prototype.tests.models.test_ModelProtoDef_prototype import ProjectPropertiesTest


def protoQuickTest(request):

    userdata = {'login': 'dario', 'password': '1' }
    request.session = MySession()
    request.user = authenticate(username=userdata['login'], password=userdata['password'])

    try: 
        pass 

        test_protoGetDetailsTree( request )
#         test_protoMenu( request )
        
#         test_protoGetFieldTree_pci( request )
        # test_structure( request )        
        # test_savePCI( request )

        # test_metaStructure( request )
        # test_getPCI( request )
   
    except: 
        traceError()


def test_protoGetDetailsTree( request ):

    t1 =  ProtoGetDetailsTreeTest()
    t1.request = request 
    t1.userdata = { 'viewCode' : 'protoLib.TeamHierarchy' }
    t1.request.method = 'POST'
    t1.request.POST = t1.userdata

    t1.test_protogetdetailstree()
    

def test_protoMenu( request ):

    t1 = ProtoMenuTest()
    t1.request = request 
    t1.userdata = { 'viewCode' : 'protoLib.UserProfile' }
    t1.request.method = 'POST'
    t1.request.POST = t1.userdata

    t1.test_protogetmenudata()
    

def test_protoGetFieldTree_pci( request ):
    from protoExt.tests.test_ProtoGetFieldTree import ProtoGetFieldTreeTest
    
    t1 = ProtoGetFieldTreeTest()

    t1.request = request 
    t1.userdata = { 'viewCode' : 'protoLib.UserProfile' }
    t1.request.method = 'POST'
    t1.request.POST = t1.userdata
    
    t1.test_protogetfieldtree_pci()    


def test_structure( request ):

    t1 = ProjectPropertiesTest()
    t1.test_structure()


def test_savePCI( request ):

    from protoExt.tests.test_ProtoSaveProtoObj import ProtoSaveProtoObjTest
    
    t1 = ProtoSaveProtoObjTest()
    t1.request = request 
    t1.userdata = { 'viewCode' : 'protoLib.UserProfile' }
    t1.request.method = 'POST'
    t1.request.POST = t1.userdata
     
    t1.test_protosaveprotoobj_save_pci()
    t1.test_protosaveprotoobj_custom_test()

def  test_metaStructure( request ):
    from protoExt.tests.test_metastructure import TestMetaStructure
    t1 = TestMetaStructure()
    t1.test_verifyMeta_createpci()
    t1.test_verifyMeta_create_tnode()


def  test_getPCI( request ):

    from protoExt.tests.test_ProtoGetPci import ProtoGetPciTest
    t1 = ProtoGetPciTest()
    t1.request = request 
    t1.userdata = { 'viewCode' : 'protoLib.UserProfile' }
    t1.request.method = 'POST'
    t1.request.POST = t1.userdata
     
    t1.test_protoGetPCI_newpci()

