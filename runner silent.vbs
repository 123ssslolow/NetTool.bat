Set WshShell = CreateObject("WScript.Shell")
strPath = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\"))

' 1 = Visible Classic Window, 0 = Hidden Background
' We call cmd.exe directly to avoid the Windows Terminal "Default" setting
WshShell.Run "cmd.exe /c " & chr(34) & strPath & "MainScript.bat" & chr(34), 1

Set WshShell = Nothing