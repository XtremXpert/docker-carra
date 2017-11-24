# -*- coding: utf-8 -*-
from protoExt.utils.utilsBase import traceError

from django.utils.encoding import smart_unicode
from protoExt.utils.downloadFile import getFullPath
from protoExt.utils.utilsBase import getReadableError

def doMatrixRaccordement(modelAdmin, request, selectedKeys, detKeys, parameters):

	def expandRaccordment(matrixDef, rowRacc):
		lineRacc = []
		for sKey in matrixDef:
			lineRacc.append(rowRacc.get(sKey, ''))  
		
		return lineRacc  
	
	def getLineCsv(line):
		sAux = u''
		for e in line:
			sAux = sAux + ',"' + smart_unicode(e) + '"'
		return sAux[1:] + '\n'

	from rai00base.models import ModeleRaccordement, Raccordement 

	# Definicion de las cols 
	matrixDef = ['MR', 'MR_ENT', 'MR_EDN' ]

	# matrix dispersa compuesta por eltos de cada tupla 
	matrixRac = []

	try: 
		QsMR = ModeleRaccordement.objects.filter(pk__in=detKeys[ 'mod_modrac1'])
		for dMRac in QsMR :
			MR = 'MR'
			ML = 'M{0:03d}'.format(dMRac.mod_modrac2.pk)
	
			matrixDef.extend([ ML , ML + '_ENT', ML + '_EDN' ])
	
			QsR = Raccordement.objects.filter(modrac_rac=dMRac.pk)
	
			for dRac in QsR :
				
				if dRac.eledon_rac1 is None or dRac.eledon_rac2 is None: 
					continue 

				if dRac.eledon_rac1.entite_elem is None or dRac.eledon_rac2.entite_elem is None: 
					continue 
				
				linRac = { 
	                   MR :  dMRac.mod_modrac1.nom_modele,
	                   ML :  dMRac.mod_modrac2.nom_modele,
	
	                   MR + '_ENT' :  dRac.eledon_rac1.entite_elem.nom_entite,
	                   ML + '_ENT' :  dRac.eledon_rac2.entite_elem.nom_entite,
	
	                   MR + '_EDN' :  dRac.eledon_rac1.nom_element_donnee,
	                   ML + '_EDN' :  dRac.eledon_rac2.nom_element_donnee    
	            }
				matrixRac.append(linRac)

	except Exception as e:
		traceError()
		return  {'success':False, 'message' : getReadableError(e) }


	fileName = 'mraccordement.csv'
	fullpath = getFullPath(request, fileName)

	import codecs
	with codecs.open(fullpath , 'w', 'utf-8') as outfile:
		outfile.write(getLineCsv(matrixDef)) 
		for row in matrixRac:
			lineRacc = expandRaccordment(matrixDef, row)
			outfile.write(getLineCsv(lineRacc))

	return  {'success':True , 'message' : fileName, 'fileName' : fileName }

