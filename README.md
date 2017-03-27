# Welcome

Introducing the Vim plugin for the xp system.  The goal of the plugin is to
make Vim a fully functional interface for working with xp pipelines.  To this
end, this plugin provides:

  - syntax definitions that intelligently highlight different language blocks
	correctly
  - functions for querying, editing, and running pipelines from within vim

# Installation

The Vim plugin requires that [xp](https://github.com/druths/xp) be installed on your system.

If you have Pathogen, simply install the plugin into your `.vim/bundles` directory:

	cd ~/.vim/bundles
	git clone git@github.com:druths/vim-xp.git


# Usage

## Syntax Highlighting
By default, syntax highlighting will apply to files with the `.xp` file suffix.
To manually enable the syntax highlighting, in NORMAL mode, enter `set
filetype=xp`.

## Functions
The plugin provides several user commands.  All assume that the current buffer contains a valid xp pipeline.

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

# Contributions

If you have any issues, don't hesistate to create an issue in the Github or
send me an [email](mailto:druths@networkdynamics.org).  Code contributions are
welcome!

# Coming soon...

That's all for now.  Stay tuned for upcoming and exciting additions to xp and vim-xp!

