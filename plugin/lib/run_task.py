import os, sys
import traceback
import logging
import vim
from xp.pipeline import get_pipeline, reset_pipeline_factory, FORCE_NONE, FORCE_TOP, FORCE_ALL, FORCE_SOLO, Task

script_path = vim.eval('s:path')
sys.path.insert(0,os.path.join(script_path,'lib'))
from xpv_helper import *

force_flag_lookup = {
'none':'none',
'top':'top',
'all':'all',
'solo':'solo'
}

def main():
	# setup the logger
	logger = logging.getLogger('main')
	config_logging()
	
	# load the pipeline in the current buffer
	pln_fname = vim.current.buffer.name
	params = vim.eval('a:000')
	
	# figure out the force flag
	force_flag = 'none'
	if len(params) > 0:
		force_flag = force_flag_lookup[params[0]]
	
	try:
                reset_pipeline_factory()
		pln = get_pipeline(pln_fname)
	except Exception as e:
		logger.error('unable to load pipeline: %s' % e.message)
                exc_info = sys.exc_info()
                traceback.print_exception(*exc_info)
                del exc_info
		return
	
	# get the current task
	task = pln.get_stmt_from_lineno(vim.current.window.cursor[0])
	if task is None or not isinstance(task,Task):
		logger.error('no task found under cursor')
		return
	else:
                vim.command('!xp run -f %s %s %s' % (force_flag.upper(),pln_fname,task.name))

	return

main()
