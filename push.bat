@echo off
chcp 65001 >nul
setlocal

set REPO=https://github.com/HBrOcean/DesktopMascot1999.git

cd /d "%~dp0"

git init
git add -A
git commit -m "feat: project wall"
if errorlevel 1 echo [i] nothing new to commit

git remote remove origin 2>nul
git remote add origin %REPO%
git branch -M main

echo.
echo Pushing to %REPO%
git push -u origin main --force
if errorlevel 1 goto FAIL

echo.
echo Done. Site: https://hbrocean.github.io/DesktopMascot1999/
echo Remember: Settings - Pages - Source - GitHub Actions
goto END

:FAIL
echo.
echo Push failed. Check your proxy settings:
echo   git config --global --unset http.proxy
echo   git config --global --unset https.proxy

:END
pause
