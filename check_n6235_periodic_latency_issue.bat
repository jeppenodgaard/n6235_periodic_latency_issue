@echo off

reg query HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0003 | findstr AdapterModel | findstr Centrino | findstr Advanced-N | findstr 6235
if errorlevel 1 (
   echo %0 only works with Intel Centrino Advanced-N 6235
   sleep 5
   exit
)

reg query HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0003 | findstr ScanWhenAssociated | findstr 0x0
if errorlevel 1 (
   echo ScanWhenAssociated is on! This might cause periodic latency issues approximately every 60 second
   echo This can be fixed by opening regedit and change Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0003\ScanWhenAssociated to 0
   sleep 5
   exit
)
