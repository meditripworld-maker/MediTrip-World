@echo off
cd /d D:\Meditourworld\meditourdworld.com

echo Fixing remote config...
git remote remove origin 2>nul
git remote add origin https://github.com/meditripworld-maker/MediTrip-World.git

echo.
echo Remote set to:
git remote -v

echo.
echo Pushing to GitHub...
git push -u origin main

if errorlevel 1 (
  echo.
  echo Push failed — you may need to authenticate.
  echo A browser window should open for GitHub login.
  echo Or run: git push -u origin main
)

echo.
echo Done!
pause
