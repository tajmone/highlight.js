# Bash

Custom CSS theme by Tristano Ajmone, based on xterm default palette.

``` {.bash}
#!/bin/bash

###### CONFIG
ACCEPTED_HOSTS="/root/.hag_accepted.conf"
BE_VERBOSE=false

if [ "$UID" -ne 0 ]
then
 echo "Superuser rights required"
 exit 2
fi

genApacheConf(){
 echo -e "# Host ${HOME_DIR}$1/$2 :"
}
```

# DOS .bat

> **NOTE**: Currently there is no custom CSS definition for this language.

``` {.dos}
cd \
copy a b
ping 192.168.0.1
@rem ping 192.168.0.1
net stop sharedaccess
del %tmp% /f /s /q
del %temp% /f /s /q
ipconfig /flushdns
taskkill /F /IM JAVA.EXE /T

cd Photoshop/Adobe Photoshop CS3/AMT/
if exist application.sif (
    ren application.sif _application.sif
) else (
    ren _application.sif application.sif
)

taskkill /F /IM proquota.exe /T

sfc /SCANNOW

set path = test

xcopy %1\*.* %2
```

# Ini

> **NOTE**: Currently there is no custom CSS definition for this language.

``` {.ini}
; boilerplate
[package]
name = "some_name"
authors = ["Author"]
description = "This is \
a description"

[[lib]]
name = ${NAME}
default = True
auto = no
counter = 1_000
```

# PowerShell

> **NOTE**: Currently there is no custom CSS definition for this language.

``` {.powershell}
$initialDate = [datetime]'2013/1/8'

$rollingDate = $initialDate

do {
    $client = New-Object System.Net.WebClient
    $results = $client.DownloadString("http://not.a.real.url")
    Write-Host "$rollingDate.ToShortDateString() - $results"
    $rollingDate = $rollingDate.AddDays(21)
    $username = [System.Environment]::UserName
} until ($rollingDate -ge [datetime]'2013/12/31')
```

# FASM

> **NOTE 1**: Currently, the FASM language definition (`fasm.js`) is just a copy of `x86asm.js` (**highlight.js**'s gerneric language definition for Intel x86 Assembly), so it doesn't render FASM syntax 100% correctly. In due time, the language definition will be tweaked to become FASM-specific and fully compliant. I've chosen to early-adopt a renamed version of `x86asm.js` file to avoid having to change --- in the future --- all language class attributes in source documents.

> **NOTE 2**: The current theme uses **xterm**'s color palette. I wanted to provide an old-school look to FASM syntax. But the theme palette will change when the language definition shall be completed.

``` {.fasm}
; Beer - example of tiny (one section) Win32 program

format PE GUI 4.0

include 'win32a.inc'

; no section defined - fasm will automatically create .flat section for both
; code and data, and set entry point at the beginning of this section

    invoke  MessageBoxA,0,_message,_caption,MB_ICONQUESTION+MB_YESNO
    cmp eax,IDYES
    jne exit

    invoke  mciSendString,_cmd_open,0,0,0
    invoke  mciSendString,_cmd_eject,0,0,0
    invoke  mciSendString,_cmd_close,0,0,0

exit:
    invoke  ExitProcess,0

_message db 'Do you need additional place for the beer?',0
_caption db 'Desktop configuration',0

_cmd_open db 'open cdaudio',0
_cmd_eject db 'set cdaudio door open',0
_cmd_close db 'close cdaudio',0

; import data in the same section

data import

 library kernel32,'KERNEL32.DLL',\
     user32,'USER32.DLL',\
     winmm,'WINMM.DLL'

 import kernel32,\
    ExitProcess,'ExitProcess'

 import user32,\
    MessageBoxA,'MessageBoxA'

 import winmm,\
    mciSendString,'mciSendStringA'

end data
```

(example taken from **FASM** for Windows distribution package, examples folder, `BEER.ASM`)

<!-- EOF -->
