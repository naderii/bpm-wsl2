@echo off
title Stop ProcessMaker Dev Environment

echo ==============================================
echo   Stopping ProcessMaker Dev Environment
echo ==============================================
echo.

:: Navigate to the current project directory
cd /d %~dp0

:: Stop and remove all Docker services
docker-compose down

echo ✔ All services have been stopped successfully.
pause
