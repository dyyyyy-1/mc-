@echo off
setlocal
cd /d "%~dp0"

where uv >nul 2>nul
if %errorlevel%==0 (
    echo [1/2] Creating Python 3.12 venv with uv ...
    uv venv --python 3.12 .venv || goto :failed
    echo [2/2] Installing dependencies ...
    uv pip install --python ".venv\Scripts\python.exe" -r requirements.txt --no-deps || goto :failed
) else (
    echo [1/2] Creating Python 3.12 venv with py launcher ...
    py -3.12 -m venv .venv || goto :failed
    echo [2/2] Installing dependencies ...
    ".venv\Scripts\python.exe" -m pip install -r requirements.txt --no-deps || goto :failed
)

echo.
echo Done. Start with run.bat or run_debug.bat
pause
exit /b 0

:failed
echo.
echo [ERROR] Setup failed. Check that Python 3.12 or uv is available.
pause
exit /b 1
