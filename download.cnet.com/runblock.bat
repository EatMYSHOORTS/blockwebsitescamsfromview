@echo off
REM Add registry entry to block download.cnet.com because of possible scams
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\https://download.cnet.com" /v "*" /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\https://download.cnet.com\www" /v "*" /t REG_DWORD /d 4 /f
echo Websites blocked successfully.
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge\URLBlocklist" /v "1" /t REG_SZ /d "https://download.cnet.com" /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge\URLAllowlist" /v "1" /t REG_SZ /d "*" /f
echo Blocked webpage for Edge!
copy policies.json "%ProgramFiles%\Mozilla Firefox\distribution\policies.json"
echo Blocked webpage for Firefox!
echo Start
set "gx_path=%LOCALAPPDATA%\Programs\Opera GX"

REM Check if Opera GX is installed
if exist "%gx_path%" (
    echo Opera GX detected. Configuring block settings...
    rem Example of blocking via modifying hosts or adding an extension
    echo 127.0.0.1 https://download.cnet.com >> "%WINDIR%\System32\drivers\etc\hosts"
    echo Block rule applied for Opera GX.
) else (
    echo Opera GX is not installed. No action taken.
)
echo Flushing DNS cache...
ipconfig /flushdns
echo DNS cache has been successfully flushed.
pause
