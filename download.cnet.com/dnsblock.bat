@echo off
REM Add a firewall rule to block outbound traffic to example.com
set domain=example.com

REM Resolve domain to IP addresses (manually or use a script to fetch)
REM Replace with the resolved IPs of the website
set ip1=93.184.216.34
set ip2=2606:2800:220:1:248:1893:25c8:1946

REM Block all outbound traffic to these IPs
netsh advfirewall firewall add rule name="Block %domain% Outbound" dir=out action=block remoteip=%ip1%
netsh advfirewall firewall add rule name="Block %domain% IPv6 Outbound" dir=out action=block remoteip=%ip2%

echo Website %domain% blocked!
echo Flushing DNS cache...
ipconfig /flushdns
echo DNS cache has been successfully flushed.
pause
