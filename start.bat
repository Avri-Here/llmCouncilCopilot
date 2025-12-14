@echo off
setlocal enabledelayedexpansion

:: LLM Council - Windows Start Script

echo.
echo ====================================
echo   Starting LLM Council...
echo ====================================
echo.

:: Get current directory
set "CURRENT_DIR=%CD%"

:: Check if Windows Terminal is available
where wt.exe >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Using Windows Terminal with tabs...
    echo.
    
    :: Start Windows Terminal with two tabs
    start "" wt.exe new-tab --title "Backend (8001)" --suppressApplicationTitle -d "%CURRENT_DIR%" cmd /k "uv run python -m backend.main" ; new-tab --title "Frontend (5173)" --suppressApplicationTitle -d "%CURRENT_DIR%\frontend" cmd /k "npm run dev"
    
    :: Wait for servers to start
    echo Waiting for servers to initialize...
    timeout /t 5 /nobreak >nul
    
) else (
    echo Windows Terminal not found, using separate windows...
    echo.
    
    :: Fallback to separate minimized windows
    start /min "Backend (8001)" cmd /k "uv run python -m backend.main"
    timeout /t 3 /nobreak >nul
    start /min "Frontend (5173)" cmd /k "cd frontend && npm run dev"
    timeout /t 2 /nobreak >nul
)

:: Open browser
echo.
echo ====================================
echo   Opening browser...
echo ====================================
echo.
start http://localhost:5173

echo.
echo ====================================
echo   LLM Council is running!
echo ====================================
echo.
echo   Backend:  http://localhost:8001
echo   Frontend: http://localhost:5173
echo.
echo   Check Windows Terminal tabs:
echo   - Tab 1: Backend server
echo   - Tab 2: Frontend server
echo.
echo   This window will close in 3 seconds...
echo.
timeout /t 3 /nobreak >nul
exit
