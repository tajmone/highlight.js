Bash
====

> **NOTE**: Currently there is no custom CSS definition for this language.

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

DOS .bat
========

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

Ini
===

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

PowerShell
==========

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
