@ECHO OFF
ECHO:
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO UPDATE EVERYTHING: This script invokes all the automated-maintainance
ECHO scripts for this branch. Used before commiting, to ensure nothing is left out.
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO 1) Invoking "minify-gh-pandoc.bat": create minified version of "gh-pandoc.css".
CALL minify-gh-pandoc.bat
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO 2) Invoking "readmesupdate.bat": cleanup and auto-TOC all MD document files.
CALL readmesupdate.bat
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO 3) Invoking "cleanupmarkdown.bat": cleanup MD examples-include files.
CALL cleanupmarkdown.bat
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ECHO 3) Invoking "../pb-prebuild.bat": pre-build HLJS packages.
CD..
CALL pb-prebuild.bat
ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CD pb-prebuilder
ECHO Done...