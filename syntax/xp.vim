" Vim syntax file
" Language:		xp
" Maintainer:	Derek Ruths <druths@networkdynamics.org>

"syntax on

if exists("b:current_syntax")
	finish
endif

" TODO: define the xpSnip

""""""""""""""""
" Function for setting specific syntax regions
""""""""""""""""
function! CreateCodeSnip(lang_name,lang_suffix)

	let group=toupper(a:lang_name)
	if exists('b:current_syntax')
		unlet b:current_syntax
	endif

	execute 'syntax include @'.group.' syntax/'.a:lang_name.'.vim'

	"""
	" Top-level
	let start_pat='^\*\?\h\w*\.'.a:lang_suffix.':.*$'
	let end_pat='^\*\?\w\+\&'
	execute 'syntax region '.a:lang_name.'Snip matchgroup=xpSnip start="'.start_pat.'" end="'.end_pat.'" contains=@'.group

	"""
	" Inner-level
	let start_pat='^\scode.'.a:lang_suffix.':.*$'
	let end_pat='^\s\?\*\?\w\+\&'
	execute 'syntax region '.a:lang_name.'Snip matchgroup=xpSnip start="'.start_pat.'" end="'.end_pat.'" contains=@'.group

endfunction

"""""""""""""""""""
" Alphabetical by language
"""""""""""""""""""

" gnuplot
call CreateCodeSnip('gnuplot','gnuplot')

" ipython
call CreateCodeSnip('python','ipy')

" matlab
call CreateCodeSnip('matlab','ml')

" python
call CreateCodeSnip('python','py')

" python hadoop map-reduce
call CreateCodeSnip('python','pyhmr')

" R
call CreateCodeSnip('r','r')

" shell
call CreateCodeSnip('sh','sh')

" SQL
call CreateCodeSnip('sql','sql')

