@echo off
title Logs - ProcessMaker Dev Environment

echo ==============================================
echo   Viewing Logs (Press CTRL+C to exit)
echo ==============================================
echo.

cd /d %~dp0

docker-compose logs -f
