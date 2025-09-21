@echo off
setlocal
title ProcessMaker Dev Environment Setup

echo ==============================================
echo   ProcessMaker Dev Setup - Automated Script
echo ==============================================
echo.

:: چک کردن نسخه ویندوز
ver | findstr /C:"10." >nul
if errorlevel 1 (
    echo ❌ این اسکریپت فقط روی ویندوز 10 و 11 کار می‌کند.
    pause
    exit /b 1
)

:: فعال کردن WSL و Virtual Machine Platform
echo ▶ فعال‌سازی WSL2 و Virtual Machine Platform...
powershell -Command "dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"
powershell -Command "dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"

:: تنظیم WSL نسخه 2 به عنوان پیش‌فرض
echo ▶ تنظیم WSL2 به عنوان نسخه پیش‌فرض...
wsl --set-default-version 2

:: بررسی نصب Ubuntu-22.04
echo ▶ بررسی نصب Ubuntu-22.04 ...
wsl --list --online | findstr "Ubuntu-22.04" >nul
if errorlevel 1 (
    echo ❌ نسخه Ubuntu-22.04 در دسترس نیست. لطفاً دستی نصب کنید.
    pause
    exit /b 1
)

wsl --list | findstr "Ubuntu-22.04" >nul
if errorlevel 1 (
    echo ▶ نصب Ubuntu-22.04 ...
    wsl --install -d Ubuntu-22.04
) else (
    echo ✔ Ubuntu-22.04 قبلاً نصب شده است.
)

:: بررسی نصب Docker Desktop
echo ▶ بررسی نصب Docker Desktop...
where docker >nul 2>nul
if errorlevel 1 (
    echo ❌ Docker Desktop نصب نیست.
    echo لطفاً Docker Desktop را نصب کنید و دوباره این اسکریپت را اجرا کنید.
    pause
    exit /b 1
) else (
    echo ✔ Docker Desktop شناسایی شد.
)

:: تست اجرای Docker
echo ▶ تست اجرای Docker...
docker run --rm hello-world

if errorlevel 1 (
    echo ❌ Docker به درستی اجرا نشد.
    echo لطفاً تنظیمات WSL2 Backend در Docker Desktop را بررسی کنید.
    pause
    exit /b 1
)

echo ==============================================
echo ✔ آماده‌سازی اولیه کامل شد.
echo حالا می‌توانید با اجرای start-dev.bat محیط را راه‌اندازی کنید.
echo ==============================================
pause
endlocal
