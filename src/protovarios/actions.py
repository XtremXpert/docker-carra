

# 
# def doWFlowResume(modeladmin, request, queryset, parameters):
#     """ 
#     Genera un resumen de las novedades para WFlow, 
#     se apoya en la tabla de parametros para obtner las entidades wflow y la llave   
#     """
# 
#     from protoLib.models import ParametersBase, WflowAdminResume, getDjangoModel
#     from django.db.models import Count
#     from datetime import datetime
# 
# #   Mensaje de retorno
#     returnMsg = ''
# 
# #   Borra la tabla de resumen
#     WflowAdminResume.objects.all().delete()
# 
# #   Recorre los parametros para conocer las tablas de wFlow
#     Qs = ParametersBase.objects.filter(parameterKey='wflow')
#     for pParam in Qs:
# 
#         try:
#             wfModel = getDjangoModel(pParam.parameterValue)
#         except :
#             continue
#         wfStatus = pParam.parameterTag or 'I'
# 
#         QsResume = wfModel.objects.filter(smWflowStatus=wfStatus).values('smOwningUser', 'smOwningTeam', 'smCreatedBy').order_by().annotate(regCount=Count('smCreatedBy'))
#         for regResume in QsResume:
#             adminResume = WflowAdminResume()
#             adminResume.viewEntity = pParam.parameterValue
#             adminResume.smWflowStatus = wfStatus
#             adminResume.activityCount = regResume.get('regCount')
#             adminResume.smCreatedBy_id = regResume.get('smCreatedBy')
#             adminResume.smOwningUser_id = regResume.get('smOwningUser')
#             adminResume.smOwningTeam_id = regResume.get('smOwningTeam')
# 
#             try:
#                 setattr(adminResume, 'smModifiedBy', request.user)
#                 setattr(adminResume, 'smRegStatus', '0')
#             except :
#                 pass
# 
#             adminResume.save()
# 
#     # TODO add returnMsg
#     return {'success':True, 'message' : returnMsg }


