@echo off
REM Add registry entry to block www.example.com
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\https://download.cnet.com" /v "*" /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\https://download.cnet.com\www" /v "*" /t REG_DWORD /d 4 /f
echo Website blocked successfully.
pause
