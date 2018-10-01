@ECHO OFF
ECHO ==============================================================================
ECHO                    Highlight.js :: PureBASIC Archives Build                   
ECHO:
ECHO ----------------------------{ v2.0 - 2018/10/01 }-----------------------------
ECHO:
ECHO                               by Tristano Ajmone                              
ECHO ==============================================================================
ECHO This script builds a custom HLJS package (with modded-PureBASIC syntax) for
ECHO the PureBASIC Archives project. It bundles together the language syntaxes used
ECHO within PB Archives documents:
:: =============================================================================
::                             GET SHARED ENV VARS                              
:: =============================================================================
::   Call a common batch file that sets required env vars:
::    -- %hjsModVer%  = Current HLJS-PB version.
::    -- %hjsModDate% = Current HLJS-PB release date.
::    -- %hjsVer%     = Highlight.js version.
::    -- %hjsDate%    = Highlight.js release date.
::    -- %hjsPBver%   = PureBASIC version in HLJS.
CALL HLJS-PB_env-vars.bat
:: =============================================================================
::                             SET LANGUAGES LISTS                              
:: =============================================================================
:: For a full list of languages available, see:
:: http://highlightjs.readthedocs.io/en/latest/css-classes-reference.html#language-names-and-aliases
:: -----------------------------------------------------------------------------
::    NOTE: Language names must be lower case!
SET "_LANGS=purebasic fasm bash dos ini markdown xml css yaml"
FOR %%a IN (%_LANGS%) DO ECHO  - %%a
ECHO The built HLJS package will be copied to the "pb-archives" folder.
ECHO ------------------------------------------------------------------------------
ECHO WARNING: HJS build tool doesn't provide exit codes, so you'll have to verify
ECHO          manually for errors by reading the output in this screen.
ECHO ==============================================================================
::                                  HLJS PB-ARCHIVES                               
::   ==============================================================================
ECHO 1) Building HLJS package.
ECHO ------------------------------------------------------------------------------
node tools/build.js --target browser %_LANGS%
ECHO ==============================================================================
ECHO 2) Moving HLJS package to "pb-archives" folder.
ECHO ------------------------------------------------------------------------------
MOVE /Y "build\highlight.pack.js" "pb-archives\highlight.pack.js"
ECHO ==============================================================================
ECHO 3) Creating "pb-archives\LANGS.txt"
ECHO ------------------------------------------------------------------------------
::   Create a "LANGS.txt" file in "pb-archives" folder, listing all bundled langs.
ECHO Highlight.js PureBASIC mod v%hjsModVer% (%hjsModDate%).> pb-archives\LANGS.txt
ECHO Bundled languages:>> pb-archives\LANGS.txt
FOR %%a IN (%_LANGS%) DO ECHO - %%a>> pb-archives\LANGS.txt
ECHO ==============================================================================
ECHO DONE!
EXIT /B
