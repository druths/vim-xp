"============================================================================
"File:        xpv.vim
"Description: Vim plugin for using xp functionality inside vim editor.
"Maintainer:  Derek Ruths <druths@networkdynamics.org>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. 
"============================================================================

if !has('python')
	echo 'python must be installed for xpv to work'
	finish
endif

" get the path to the directory holding this script
let s:path = expand('<sfile>:p:h')

function! xpv#check_xp()
	execute 'pyfile ' . s:path . '/lib/check_xp.py'
endfunction

" TODO
function! xpv#open_pipeline()
	execute 'pyfile ' . s:path . '/lib/open_pipeline.py'
endfunction

function! xpv#run_pipeline(...) " only one argument, force, is supported
	execute 'pyfile ' . s:path . '/lib/run_pipeline.py'
endfunction

function! xpv#run_task(...) " only one argument, force, is supported
	execute 'pyfile ' . s:path . '/lib/run_task.py'
endfunction

function! xpv#get_task_status()
	execute 'pyfile ' . s:path . '/lib/get_task_status.py'
endfunction

function! xpv#unmark_task()
	execute 'pyfile ' . s:path . '/lib/unmark_task.py'
endfunction

function! xpv#unmark_pipeline(...) " only one arg, recur, is supported
	execute 'pyfile ' . s:path . '/lib/unmark_pipeline.py'
endfunction

" Bind all the functions to user commands
command! XPCheck call xpv#check_xp()
command! XPOpenPipeline call xpv#open_pipeline()
command! -nargs=? XPRunPipeline call xpv#run_pipeline(<f-args>)
command! -nargs=? XPRunTask call xpv#run_task(<f-args>)
command! XPGetTaskStatus call xpv#get_task_status()
command! XPUnmarkTask call xpv#unmark_task()
command! -nargs=? XPUnmarkPipeline call xpv#unmark_pipeline(<f-args>)
