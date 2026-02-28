@echo off
title Ultra Deep Clean Utility (Stable Edition)
color 0A
setlocal EnableDelayedExpansion

echo ==============================================
echo        Ultra Deep Clean Utility (Stable)
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

set /a TOTAL_FREED=0

:: Stop Windows Update
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1

echo.
echo Starting cleanup...
echo.

:: ================================
:: CLEAN FUNCTION INLINE (NO LABELS)
:: ================================
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

        for /f %%A in ('powershell -NoProfile -Command ^
            "if (Test-Path \"%%F\") { (Get-ChildItem -Recurse -Force -ErrorAction SilentlyContinue \"%%F\" | Measure-Object Length -Sum).Sum } else { 0 }"') do set SIZE=%%A

        if not defined SIZE set SIZE=0
        set /a FREED=!SIZE!/1024/1024

        echo Cleaning: %%F  (Approx !FREED! MB)

        rd /s /q "%%F" >nul 2>&1

        set /a TOTAL_FREED+=!FREED!
    )
)

:: ================================
:: UV SPECIAL FIX (NO HANG)
:: ================================
echo.
echo Handling UV cache safely...
taskkill /f /im uv.exe >nul 2>&1
timeout /t 2 >nul

if exist "%LOCALAPPDATA%\uv" (
    move "%LOCALAPPDATA%\uv" "%TEMP%\uv_delete" >nul 2>&1
    rd /s /q "%TEMP%\uv_delete" >nul 2>&1
)

:: Restart Windows Update
net start wuauserv >nul 2>&1
net start bits >nul 2>&1

echo.
echo ==============================================
echo Cleanup Completed
echo Total Space Freed: %TOTAL_FREED% MB
echo ==============================================
echo.
echo Recommended: Restart your PC.
pause
exit /b