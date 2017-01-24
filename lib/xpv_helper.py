import logging

def config_logging(level=logging.WARN):
	logging.basicConfig(level=level,format='%(message)s')

	return

