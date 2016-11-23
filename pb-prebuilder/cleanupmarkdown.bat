@ECHO OFF
FOR /R %%i IN (.\*.md) DO (
	ECHO Processing %%i
	pandoc --smart --wrap=none --normalize -f markdown -t markdown -o "%%i" "%%i"
)
