"============================================================================
"File:        xp.vim
"Description: Vim plugin for using xp functionality inside vim editor.
"Maintainer:  Derek Ruths <druths@networkdynamics.org>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. 
"============================================================================

if !has('python') && !has('python3')
	echo 'python or python3 must be installed for vim-xp to work'
	finish
endif

" get the path to the directory holding this script
let s:path = expand('<sfile>:p:h')

function! xp#check_xp()
	execute (has('python3') ? 'py3file ' : 'pyfile ') . s:path . '/lib/check_xp.py'
endfunction

" TODO
function! xp#open_pipeline()
	execute (has('python3') ? 'py3file ' : 'pyfile ') . s:path . '/lib/open_pipeline.py'
endfunction

function! xp#run_pipeline(...) " only one argument, force, is supported
	execute (has('python3') ? 'py3file ' : 'pyfile ') . s:path . '/lib/run_pipeline.py'
endfunction

function! xp#run_task(...) " only one argument, force, is supported
	execute (has('python3') ? 'py3file ' : 'pyfile ') . s:path . '/lib/run_task.py'
endfunction

function! xp#get_task_status()
	execute (has('python3') ? 'py3file ' : 'pyfile ') . s:path . '/lib/get_task_status.py'
endfunction

function! xp#unmark_task()
	execute (has('python3') ? 'py3file ' : 'pyfile ') . s:path . '/lib/unmark_task.py'
endfunction

function! xp#unmark_pipeline(...) " only one arg, recur, is supported
	execute (has('python3') ? 'py3file ' : 'pyfile ') . s:path . '/lib/unmark_pipeline.py'
endfunction

" Bind all the functions to user commands
command! XPCheck call xp#check_xp()
command! XPOpenPipeline call xp#open_pipeline()
command! -nargs=? XPRunPipeline call xp#run_pipeline(<f-args>)
command! -nargs=? XPRunTask call xp#run_task(<f-args>)
command! XPGetTaskStatus call xp#get_task_status()
command! XPUnmarkTask call xp#unmark_task()
command! -nargs=? XPUnmarkPipeline call xp#unmark_pipeline(<f-args>)
