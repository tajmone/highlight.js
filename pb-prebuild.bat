@ECHO OFF
ECHO ==============================================================================
ECHO                    highlight.js PureBASIC Mod: Pre-Builder                    
ECHO:
ECHO ----------------------------{ v1.1 - 2017/01/17 }-----------------------------
ECHO:
ECHO                               by Tristano Ajmone                              
ECHO ==============================================================================
ECHO This script automates building HJS with modded-PureBASIC syntax. It will build
ECHO various combinations of PB and other languages syntax, for common use scenarios.
ECHO Pre-built files will be copied to "/pb-prebuilt/" folder.
ECHO ------------------------------------------------------------------------------
ECHO WARNING: HJS build tool doesn't provide exit codes, so you'll have to verify
ECHO          manually for errors by reading the output in this screen.
ECHO ------------------------------------------------------------------------------
SET _HLJSVER=9.9.0b
SET _DATE="Jan 17, 2017"
:: ==============================================================================
::                                    PB-ONLY                                    
:: ==============================================================================
SET _FOLDER=hljs-pb-only
ECHO 1) Building "/%_FOLDER%/":
ECHO    Included langs: PureBASIC.
ECHO    ---------------
CALL :hljsbuild purebasic
ECHO    ---------------
CALL :hljsmove %_FOLDER%
CALL :cssbuild purebasic
SET _TITLE="HLJS-PB v%_HLJSVER% :: PureBASIC Only"
CALL :md2html "%~dp0pb-prebuilt\%_FOLDER%\" ex-pb-only
:: ==============================================================================
::                                    PB-DEV1                                    
:: ==============================================================================
ECHO ------------------------------------------------------------------------------
SET _FOLDER=hljs-pb-dev1
ECHO 2) Building "/%_FOLDER%/":
ECHO    Included langs: PureBASIC + Bash + DOS + Ini + PowerShell + FASM.
ECHO    ---------------
CALL :hljsbuild "purebasic bash dos ini powershell fasm"
ECHO    ---------------
CALL :hljsmove %_FOLDER%
CALL :cssbuild  monokai-sublime purebasic bash fasm
SET _TITLE="HLJS-PB v%_HLJSVER% :: PB-DEV1"
CALL :md2html "%~dp0pb-prebuilt\%_FOLDER%\" ex-pb-only ex-pb-dev1
:: ==============================================================================
::                                    PB-DEV2                                    
:: ==============================================================================
ECHO ------------------------------------------------------------------------------
SET _FOLDER=hljs-pb-dev2
ECHO 3) Building "/%_FOLDER%/":
ECHO    Included langs: PureBASIC + Bash + DOS + Ini + PowerShell + FASM + Diff + Makefile + JSON.
ECHO    ---------------
CALL :hljsbuild "purebasic bash dos ini powershell fasm diff makefile json"
ECHO    ---------------
CALL :hljsmove %_FOLDER%
CALL :cssbuild  monokai-sublime purebasic bash fasm diff
SET _TITLE="HLJS-PB v%_HLJSVER% :: PB-DEV2"
CALL :md2html "%~dp0pb-prebuilt\%_FOLDER%\" ex-pb-only ex-pb-dev1 ex-pb-dev2
:: ==============================================================================
::                                    PB + ALL                                   
:: ==============================================================================
ECHO ------------------------------------------------------------------------------
ECHO ------------------------------------------------------------------------------
SET _FOLDER=hljs-all
ECHO 4) Building "/%_FOLDER%/":
ECHO    Included langs: ALL.
ECHO    ---------------
CALL :hljsbuild
ECHO    ---------------
CALL :hljsmove %_FOLDER%
CALL :cssbuild monokai-sublime purebasic bash fasm diff
SET _TITLE="HLJS-PB v%_HLJSVER% :: All Languages"
CALL :md2html "%~dp0pb-prebuilt\%_FOLDER%\" ex-pb-only ex-pb-dev1 ex-pb-dev2
EXIT /B

:: ******************************************************************************
:: *                                                                            *
:: *                              BATCH FUNCTIONS                               *
:: *                                                                            *
:: ******************************************************************************
:: 
:: ==============================================================================
::                                   hljsbuild                                   
:: ==============================================================================
:hljsbuild
node tools/build.js --target browser %~1
EXIT /B
:: ==============================================================================
::                                    hljsmove                                   
:: ==============================================================================
:hljsmove
MOVE /Y "build\highlight.pack.js" "pb-prebuilt\%~1\highlight.pack.js"
EXIT /B
:: ==============================================================================
::                                    cssbuild                                   
:: ==============================================================================
:cssbuild
SET _SOURCE=
:getParamCSS
IF NOT "%1" == "" (
	SET _SOURCE=%_SOURCE% pb-prebuilt\css\%~1.css
	SHIFT
	GOTO :getParamCSS
)
CALL cleancss -o pb-prebuilt\%_FOLDER%\highlight.css %_SOURCE%
EXIT /B
:: ==============================================================================
::                                    md2html                                    
:: ==============================================================================
:md2html
SET _TARGET="%~1example.html"
SET _SOURCE=
:getParamMD
SHIFT
IF NOT "%1" == "" (
	SET _SOURCE=%_SOURCE% pb-prebuilder\%~1.md
    GOTO :getParamMD
)
SET _SOURCE=%_SOURCE% pb-prebuilder\metadata.yaml
pandoc -M title=%_TITLE% -M date=%_DATE% -s -t html5 --template=pb-prebuilder\pandoc.html5 --no-highlight --smart --normalize --toc -o %_TARGET% %_SOURCE%
EXIT /B
