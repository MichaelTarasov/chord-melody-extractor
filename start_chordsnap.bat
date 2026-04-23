@echo off
chcp 65001 >nul 2>nul
title ChordSnap - Chord Recognition
color 0A

cd /d "D:\_Git\Python\chord-melody-extractor"

echo ========================================
echo    ChordSnap - Chord Recognition
echo ========================================
echo.

REM Check if Node.js is installed
where node >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Node.js not found!
    echo.
    echo Please install Node.js from: https://nodejs.org/
    echo Make sure to check "Add to PATH" during installation
    echo.
    pause
    exit /b 1
)

echo [OK] Node.js found: 
node --version
echo.

REM Check if node_modules exists
if not exist "node_modules\" (
    echo First run: Installing dependencies...
    echo This may take 2-3 minutes...
    echo.
    call npm install
    echo.
    echo [OK] Dependencies installed
    echo.
)

REM Check if running on correct port
echo Starting ChordSnap server...
echo.
echo The app will open in your browser automatically
echo Press Ctrl+C in this window to stop the server
echo.

REM Start the development server
start http://localhost:3000/
npm run dev

pause