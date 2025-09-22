@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion
title ProcessMaker Dev Environment Setup

echo ==============================================
echo   ProcessMaker Dev Setup - Automated Script
echo ==============================================
echo.

:: Check Windows version
ver | findstr /C:"10." >nul
if errorlevel 1 (
    echo ❌ This script only works on Windows 10 and 11.
    pause
    exit /b 1
)

:: Enable WSL2 and Virtual Machine Platform
echo ▶ Enabling WSL2 and Virtual Machine Platform...
powershell -Command "dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart"
powershell -Command "dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart"

:: Set WSL2 as default
echo ▶ Setting WSL2 as the default version...
wsl --set-default-version 2

:: Check if Ubuntu-22.04 is available
echo ▶ Checking for Ubuntu-22.04 availability...
wsl --list --online | findstr "Ubuntu-22.04" >nul
if errorlevel 1 (
    echo ❌ Ubuntu-22.04 is not available. Please install it manually.
    pause
    exit /b 1
)

:: Install Ubuntu-22.04 if not already installed
wsl --list | findstr "Ubuntu-22.04" >nul
if errorlevel 1 (
    echo ▶ Installing Ubuntu-22.04...
    wsl --install -d Ubuntu-22.04
) else (
    echo ✔ Ubuntu-22.04 is already installed.
)

:: Check if Docker Desktop is installed
echo ▶ Checking for Docker Desktop...
where docker >nul 2>nul
if errorlevel 1 (
    echo ❌ Docker Desktop is not installed.
    echo Please install Docker Desktop and rerun this script.
    pause
    exit /b 1
) else (
    echo ✔ Docker Desktop detected.
)

:: Test Docker
echo ▶ Testing Docker...
docker run --rm hello-world

if errorlevel 1 (
    echo ❌ Docker did not run successfully.
    echo Please check WSL2 backend settings in Docker Desktop.
    pause
    exit /b 1
)

echo ==============================================
echo ✔ Initial setup is complete.
echo You can now run start-dev.bat to launch the environment.
echo ==============================================
pause
endlocal
