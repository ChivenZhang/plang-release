cd %~dp0

git add .

git commit -m 'auto-update'

git pull origin master

git push origin master

pause