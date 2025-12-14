@echo off
setlocal enabledelayedexpansion

:: LLM Council - Windows Start Script

echo.
echo ====================================
echo   Starting LLM Council...
echo ====================================
echo.

:: Start backend server
echo [1/3] Starting backend on http://localhost:8001...
start "LLM Council - Backend" cmd /k "uv run python -m backend.main"

:: Wait for backend to initialize
echo [2/3] Waiting for backend to initialize...
timeout /t 3 /nobreak >nul

:: Start frontend server
echo [3/3] Starting frontend on http://localhost:5173...
cd frontend
start "LLM Council - Frontend" cmd /k "npm run dev"
cd ..

:: Wait a moment for frontend to start
timeout /t 2 /nobreak >nul

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
echo   Two command windows opened:
echo   - Backend server (Python/FastAPI)
echo   - Frontend server (Vite)
echo.
echo   Close those windows to stop the servers.
echo.
pause
