@echo off
title Start ProcessMaker Dev Environment

echo ==============================================
echo   Starting ProcessMaker Dev Environment
echo ==============================================
echo.

:: رفتن به مسیر فعلی پروژه
cd /d %~dp0

:: اجرای Docker Compose
docker-compose up -d

if errorlevel 1 (
    echo ❌ اجرای docker-compose با خطا مواجه شد.
    pause
    exit /b 1
)

echo ✔ تمام سرویس‌ها اجرا شدند.
echo برای توقف سرویس‌ها stop-dev.bat را اجرا کنید.
pause
