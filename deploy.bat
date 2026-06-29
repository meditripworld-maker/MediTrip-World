@echo off
echo === MediTrip Deploy Script ===
cd /d D:\Meditourworld\meditourdworld.com

echo Checking git status...
git status 2>nul
if errorlevel 1 (
  echo.
  echo [INFO] No git repo found. Initializing...
  git init
  git branch -M main
)

echo.
echo Checking for remote...
git remote -v 2>nul

echo.
echo Staging all changes...
git add -A

echo.
echo Committing...
git commit -m "Fix logo (flex+relative spans), add photo lightbox, fix HTTPS CSP"

echo.
echo Pushing to origin/main...
git push origin main 2>&1

if errorlevel 1 (
  echo.
  echo Push failed. If you haven't set a remote yet, run:
  echo   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
  echo   git push -u origin main
)

echo.
echo Done! Check Railway for auto-redeploy.
pause
