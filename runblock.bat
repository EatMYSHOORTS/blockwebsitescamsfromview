@echo off
REM Add registry entry to block scam websites
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\https://download.cnet.com" /v "*" /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\https://download.cnet.com\www" /v "*" /t REG_DWORD /d 4 /f
start chrome --deny-url "https://download.cnet.com"
echo Websites blocked successfully.
pause
