import os, sys
import logging
import vim
from xp.pipeline import get_pipeline

script_path = vim.eval('s:path')
sys.path.insert(0,script_path)
from xpv_helper import *

def main():
	# setup the logger
	logger = logging.getLogger('main')
	config_logging()

	# load the pipeline in the current buffer
	pln_fname = vim.current.buffer.name
	params = vim.eval('a:000')
	
	# figure out the recur flag
	recur = False
	if len(params) > 0:
		if params[0] == 'recur':
			recur = True
		else:
			logger.error('argument was "%s", expected "recur"' % params[0])
	
	try:
		pln = get_pipeline(pln_fname)
	except Exception as e:
		logger.error('unable to load pipeline: %s' % e.message)
		return
	
	pln.unmark_all_tasks(recur=recur)
	
	# done

main()
