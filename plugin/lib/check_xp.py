import vim

# check whether the xp module is available
try:
	import xp
	print 'xp module ok'
except:
	print 'xp python module not found'

# check whether xp is in the path
vim.command('![[ $(type -P "xp") ]] && echo "xp is in PATH" || { echo "xp is NOT in PATH" 1>&2; exit 1; }')

