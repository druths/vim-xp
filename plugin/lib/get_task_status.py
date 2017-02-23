import os, sys
import datetime
import logging
import vim
from xp.pipeline import get_pipeline, FORCE_NONE, FORCE_TOP, FORCE_ALL, FORCE_SOLO, Task

script_path = vim.eval('s:path')
sys.path.insert(0,os.path.join(script_path,'lib'))
from xpv_helper import *

def main():
	# setup the logger
	logger = logging.getLogger('main')
	config_logging()
	
	# load the pipeline in the current buffer
	pln_fname = vim.current.buffer.name
	
	try:
		pln = get_pipeline(pln_fname)
	except Exception as e:
		logger.error('unable to load pipeline: %s' % e.message)
		return
	
	# get the current task
	task = pln.get_stmt_from_lineno(vim.current.window.cursor[0])
	if task is None or not isinstance(task,Task):
		logger.error('no task found under cursor')
		return
	else:
		mark_str = 'Unmarked'
		if task.is_marked():
			ts_dt = datetime.datetime.fromtimestamp(task.mark_timestamp())
			mark_str = 'Last marked at %s' % ts_dt.strftime('%Y-%m-%d %H:%M:%S')

		print 'Task %s status:' % task.name
		print '  %s' % mark_str

	return

main()
