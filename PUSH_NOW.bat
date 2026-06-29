@echo off
cd /d D:\Meditourworld\meditourdworld.com
echo.
echo === MediTrip World - Commit and Push ===
echo.
git add -A
git commit -m "Fix logo CSS and email form, enable GitHub Pages"
git push https://meditripworld-maker@github.com/meditripworld-maker/MediTrip-World.git main
echo.
echo =========================================
echo Done! Site live at:
echo https://meditripworld-maker.github.io/MediTrip-World/
echo =========================================
echo.
pause
