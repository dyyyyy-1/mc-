@echo off
setlocal
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
    echo [ERROR] Missing .venv. Run setup.bat first.
    pause
    exit /b 1
)
".venv\Scripts\python.exe" main_debug.py %*
endlocal
