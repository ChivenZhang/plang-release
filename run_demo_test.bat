cd %~dp0

"bin/x64/plang.exe" -s src -o library

"bin/x64/plang.exe" -s test

"bin/x64/plang.exe" -c test/Test

"bin/x86/plang32.exe" -c test/Test

pause