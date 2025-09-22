@echo off
title Start ProcessMaker Dev Environment

echo ==============================================
echo   Starting ProcessMaker Dev Environment
echo ==============================================
echo.

:: Navigate to the current project directory
cd /d %~dp0

:: Run Docker Compose
docker-compose up -d

if errorlevel 1 (
    echo ❌ Docker Compose failed to start.
    pause
    exit /b 1
)

echo ✔ All services are up and running.
echo To stop the services, run stop-dev.bat.
pause
