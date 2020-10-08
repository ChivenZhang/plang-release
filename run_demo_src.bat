cd %~dp0

"bin/x64/plang.exe" -s src -o library

"bin/x64/plang.exe" -c Test -o library

"bin/x86/plang32.exe" -c Test -o library

pause