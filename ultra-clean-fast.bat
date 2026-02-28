@echo off
title Ultra Deep Clean Utility (FAST MODE)
color 0A
setlocal

echo ==============================================
echo        Ultra Deep Clean Utility (FAST)
echo ==============================================
echo User: %USERNAME%
echo Run as Administrator.
echo ==============================================
pause

:: Admin check
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run as Administrator.
    pause
    exit /b
)

echo.
echo Stopping Windows Update services...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1

echo.
echo Starting FAST cleanup...
echo.

:: =========================================
:: SYSTEM + USER CONTENT CLEAN (FAST)
:: =========================================
for %%F in (
"%TEMP%"
"%LOCALAPPDATA%\Temp"
"%LOCALAPPDATA%\CrashDumps"
"%LOCALAPPDATA%\D3DSCache"
"%LOCALAPPDATA%\Microsoft\Windows\INetCache"
"%LOCALAPPDATA%\Microsoft\Windows\WER"
"%SystemRoot%\Temp"
"%SystemRoot%\Prefetch"
"%SystemRoot%\SoftwareDistribution\Download"
"%SystemRoot%\Logs"
"%SystemRoot%\Minidump"
"%SystemRoot%\LiveKernelReports"
"C:\PerfLogs"
) do (
    if exist "%%F" (
        echo Cleaning contents: %%F
        del /f /s /q "%%F\*" >nul 2>&1
        for /d %%D in ("%%F\*") do rd /s /q "%%D" >nul 2>&1
    )
)

:: =========================================
:: UV SPECIAL (INSTANT MOVE-DELETE)
:: =========================================
echo.
echo Handling UV cache (fast mode)...
taskkill /f /im uv.exe >nul 2>&1
timeout /t 1 >nul

if exist "%LOCALAPPDATA%\uv" (
    move "%LOCALAPPDATA%\uv" "%TEMP%\uv_delete_%RANDOM%" >nul 2>&1
    rd /s /q "%TEMP%\uv_delete_%RANDOM%" >nul 2>&1
)

:: =========================================
:: FULL CACHE FOLDER REMOVE
:: =========================================
for %%F in (
"%USERPROFILE%\.cache"
"%USERPROFILE%\.npm"
"%USERPROFILE%\.pnpm-store"
"%USERPROFILE%\.gradle"
"%USERPROFILE%\.antigravity"
"%USERPROFILE%\.claude"
"%USERPROFILE%\.config"
"%USERPROFILE%\.crossnote"
"%USERPROFILE%\.gemini"
"%USERPROFILE%\.qoder"

"%LOCALAPPDATA%\cache"
"%LOCALAPPDATA%\Qoder"
"%LOCALAPPDATA%\antigravity"
"%LOCALAPPDATA%\npm-cache"
"%LOCALAPPDATA%\pnpm-cache"
"%LOCALAPPDATA%\pnpm-state"
"%LOCALAPPDATA%\pip\cache"
"%LOCALAPPDATA%\Yarn\Cache"
"%LOCALAPPDATA%\ms-playwright-go"
"%LOCALAPPDATA%\FLiNGTrainer"
"%LOCALAPPDATA%\ImageViewer"
"%LOCALAPPDATA%\Package Cache"
"%LOCALAPPDATA%\setup"
"%LOCALAPPDATA%\SquirrelTemp"
"%LOCALAPPDATA%\UnrealEngine"
"%LOCALAPPDATA%\UnrealEngineLauncher"
"%LOCALAPPDATA%\Epic Games"
"%LOCALAPPDATA%\EpicGamesLauncher"

"%APPDATA%\Qoder"
"%APPDATA%\antigravity"
"%APPDATA%\Docker"
"%APPDATA%\dgVoodoo"
"%APPDATA%\DMCache"
"%APPDATA%\dvdcss"
"%APPDATA%\GameSave Manager"
"%APPDATA%\GSM Backups"
"%APPDATA%\NVIDIA"
"%APPDATA%\Naughty Dog"

"%ProgramData%\Naughty Dog"
) do (
    if exist "%%F" (
        echo Removing: %%F
        rd /s /q "%%F" >nul 2>&1
    )
)

echo.
echo Restarting Windows Update services...
net start wuauserv >nul 2>&1
net start bits >nul 2>&1

echo.
echo ==============================================
echo        FAST CLEANUP COMPLETED
echo ==============================================
echo Recommended: Restart your PC.
pause
exit /b