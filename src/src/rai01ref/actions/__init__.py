# -*- coding: utf-8 -*-

from protoExt.utils.utilsBase import traceError
from protoExt.utils.downloadFile import getFullPath
from protoExt.utils.utilsConvert import slugify2
from protoExt.utils.utilsBase import getReadableError



def doBusinessProcessDiagram(modeladmin, request, queryset, parameters):
    """ 
    Business Process Diagram  ( Artefact Based )
    """

#   El QSet viene con la lista de Ids
    if queryset.count() < 1:
        return {'success': False, 'message': 'No record selected'}

    try:
        from rai01ref.actions.grBusinesProc import BusinessProcess
        gModel = BusinessProcess()

        gModel.getDiagramDefinition(queryset)
        dotData = gModel.generateDotModel()

#   Recorre los registros selccionados
    except Exception as e:
        traceError()
        return {'success': False, 'message': getReadableError(e)}
        pass


#   Genera el archvivo dot
    fileName = 'bp_' + slugify2(queryset[0].code) + '.dot'
    fullPath = getFullPath(request, fileName)

    fo = open(fullPath, "wb")
    fo.write(dotData.encode('utf-8'))
    fo.close()

    try:
        import pygraphviz
        fileNamePdf = fileName.replace('.dot', '.pdf')
        fullPathPdf = getFullPath(request, fileNamePdf)

        graph = pygraphviz.AGraph(fullPath)
        graph.layout(prog='dot')
        graph.draw(fullPathPdf, format='pdf')

        fileName = fileNamePdf
    except ImportError:
        pass

    return {'success': True, 'message': fileName,  'fileName': fileName}



def doTreeDiagram(modeladmin, request, queryset, parameters):
    """ 
    TreeDependency  ( Artefact , Requirement, Capacity )
    """

#   El QSet viene con la lista de Ids
    if queryset.count() < 1:
        return {'success': False, 'message': 'No record selected'}

    try:
        from rai01ref.actions.grTreeGraph import TreeGraph
        gModel = TreeGraph()

        gModel.getDiagramDefinition(queryset)
        dotData = gModel.generateDotModel()

#   Recorre los registros selccionados
    except Exception as e:
        traceError()
        return {'success': False, 'message': getReadableError(e)}
        pass


#   Genera el archvivo dot
    fileName = 'bp_' + slugify2(queryset[0].code) + '.dot'
    fullPath = getFullPath(request, fileName)

    fo = open(fullPath, "wb")
    fo.write(dotData.encode('utf-8'))
    fo.close()

    try:
        import pygraphviz
        fileNamePdf = fileName.replace('.dot', '.pdf')
        fullPathPdf = getFullPath(request, fileNamePdf)

        graph = pygraphviz.AGraph(fullPath)
        graph.layout(prog='dot')
        graph.draw(fullPathPdf, format='pdf')

        fileName = fileNamePdf
    except ImportError:
        pass

    return {'success': True, 'message': fileName,  'fileName': fileName}



def doRaiMenu(modeladmin, request, queryset, parameters):
    """ 
    Genera el menu de rai00base 
    """

#   El QSet viene con la lista de Ids
    if queryset.count() < 1:
        return {'success': False, 'message': 'No record selected'}

    from .buildRaiMenu import doBuildRaiConfig

    return doBuildRaiConfig(request, queryset)


def doUpdateMeta(modeladmin, request, queryset, parameters):
    """ 
    Update document fields for formSelector 
    """

    from .buildFieldList import doBuildFieldList
    doBuildFieldList(modeladmin, request, queryset)

    # TODO add returnMsg
    return {'success': True, 'message': 'Ok'}
