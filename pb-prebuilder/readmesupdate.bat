@ECHO OFF
ECHO:
ECHO ==============================================================================
ECHO                   READMES CLEANER AND AUTO-TOC GENERATOR                     
ECHO:
ECHO ------------------------------- { 2016/11/23 } -------------------------------

ECHO:
ECHO                               by Tristano Ajmone                              
ECHO ==============================================================================
::   | This batch file auto-cleans up the markdown source and re-generates its TOC |
::   | Requires Pandoc and gfmtoc to be installed on OS.       |
::   | -- Pandoc:
::   |    http://pandoc.org
::   | -- gfmtoc (requires Node.JS):
::   |    https://github.com/hail2u/node-gfmtoc

CALL :mdcleanup "../PureBASIC_README.md"
CALL :mdcleanup "../pb-prebuilt/README.md"
EXIT /B
::   ******************************************************************************
::   *                                                                            *
::   *                              BATCH FUNCTIONS                               *
::   *                                                                            *
::   ******************************************************************************
::
::   ==============================================================================
::                                  Invoke "gfmtoc"                                
::   ==============================================================================
::   | Gfmtoc is a Node.JS app that auto-generates a GitHub Flavour Markdown-Style |
::   | Table of Contents within the target markdown file.                          |
::   | Gfmtoc will look for the following HTML-comment tags for placing the TOC:   |
::   <!-- #toc -->
::   <!-- /toc -->
:mdcleanup
ECHO 1) Invoking gfmtoc on "%1" for TOC creation/update
CALL gfmtoc "%1"
IF ERRORLEVEL 1 (
	ECHO:
	ECHO    ERROR -- Something went wrong during gfmtoc invocation! 1>&2
	GOTO:PRINT_HELP
	)
ECHO    DONE!

ECHO:
ECHO 2) Invoking Pandoc on "%1" for markdown source cleanup
pandoc --smart --wrap=none --normalize -f markdown -t markdown -o "%1" "%1"
IF ERRORLEVEL 1 (
	ECHO:
	ECHO    ERROR -- Something went wrong during Pandoc invocation! 1>&2
	GOTO:PRINT_HELP
	)
ECHO    DONE!

EXIT /B 0
