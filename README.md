Welcome
-------

Introducing the Vim plugin for the xp system.  The goal of the plugin is to
make Vim a fully functional interface for working with xp pipelines: writing
them, editing them, and running them.

Installation
------------

The Vim plugin requires that [xp](https://github.com/druths/xp) be installed on your system.

Besides that, simply install the plugin into your `.vim/bundles` directory.

Usage
-----

Once installed, the plugin provides several user commands.  All assume that the current buffer contains a valid xp pipeline.

  * `:XPCheck` - ensure that xpv can find the local installation of xp.  This should be your first stop if things aren't working.

  * `:XPRunPipeline [none|top|all|solo]` - run all tasks in the current pipeline.
	The argument indicates what the forcing policy is (if the task or its
	dependencies are already marked, how they should be handled). If omitted,
	`none` is assumed.

  * `:XPGetTaskStatus` - print information about the task that the cursor is currently over.

  * `:XPRunTask [none|top|all|solo]` - run the task that the cursor is currently over.  
	The argument indicates (as with the `:RunPipeline` command) what forcing
	policy should be used. If omitted, `none` is assumed.

  * `:XPUnmarkPipeline` - unmark all tasks in the pipeline.

  * `:XPUnmarkTask` - unmark the task that the cursor is currently over.

Coming soon...
--------------

That's all for now.  Stay tuned for upcoming and exciting additions to xp and xpv!

