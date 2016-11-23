@ECHO OFF
ECHO:
ECHO Creating minified version of "gh-pandoc.css"
SET _TARGET=..\pb-prebuilt\resources\gh-pandoc
CALL cleancss -o %_TARGET%.min.css %_TARGET%.css