
if !has('python')
	finish
endif

let s:path = expand('<s-file>:p:h')

function! xpv#check_xp()
	pyfile lib/check_xp.py
endfunction

" TODO
function! xpv#open_pipeline()
	pyfile lib/open_pipeline.py
endfunction

function! xpv#run_pipeline(...) " only one argument, force, is supported
	pyfile lib/run_pipeline.py
endfunction

function! xpv#run_task(...) " only one argument, force, is supported
	pyfile lib/run_task.py
endfunc

function! xpv#get_task_status()
	pyfile lib/get_task_status.py
endfunc

function! xpv#unmark_task()
	pyfile lib/unmark_task.py
endfunc

function! xpv#unmark_pipeline(...) " only one arg, recur, is supported
	pyfile lib/unmark_pipeline.py
endfunc

" Bind all the functions to user commands
command! CheckXP call xpv#check_xp()
command! OpenPipeline call xpv#open_pipeline()
command! -nargs=? RunPipeline call xpv#run_pipeline(<f-args>)
command! -nargs=? RunTask call xpv#run_task(<f-args>)
command! GetTaskStatus call xpv#get_task_status()
command! UnmarkTask call xpv#unmark_task()
command! -nargs=? UnmarkPipeline call xpv#unmark_pipeline(<f-args>)
