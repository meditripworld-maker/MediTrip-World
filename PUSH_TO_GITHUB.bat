@echo off
echo =============================================
echo  MediTrip — Push to GitHub
echo =============================================
echo.
echo The commit is already done. Now we just need
echo to push it to your GitHub repo.
echo.
echo Your GitHub repo URL should look like:
echo   https://github.com/YourUsername/YourRepo.git
echo.
echo Once you add the remote and push, Railway will
echo auto-redeploy the site within ~60 seconds.
echo.
echo --- Running git remote add + push ---
echo.

cd /d D:\Meditourworld\meditourdworld.com

REM Check if remote already exists
git remote get-url origin >nul 2>&1
if not errorlevel 1 (
  echo Remote 'origin' already set to:
  git remote get-url origin
  echo.
  echo Pushing now...
  git push -u origin main
) else (
  echo No remote found. You need to run these two commands:
  echo.
  echo   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
  echo   git push -u origin main
  echo.
  echo Replace YOUR_USERNAME and YOUR_REPO with your actual GitHub details.
  echo.
  echo If you don't have a GitHub repo yet, go to:
  echo   https://github.com/new
  echo Create a NEW EMPTY repo (no README), then run the commands above.
)

echo.
pause
