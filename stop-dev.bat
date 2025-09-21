@echo off
title Stop ProcessMaker Dev Environment

echo ==============================================
echo   Stopping ProcessMaker Dev Environment
echo ==============================================
echo.

cd /d %~dp0

docker-compose down

echo ✔ تمام سرویس‌ها متوقف شدند.
pause
