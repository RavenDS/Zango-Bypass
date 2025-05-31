@echo off
:: Request administrative privileges if not already running as admin
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

setlocal enabledelayedexpansion

:: Get the directory where the batch file is located
for %%i in ("%~dp0.") do set "BatchDir=%%~i"

:: Adding registry keys
echo Importing registry keys for Zango...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}" /ve /t REG_SZ /d "ZangoInstaller Class" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\InprocServer32" /ve /t REG_SZ /d "%BatchDir%\zango\ZangoInstaller.dll" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\zango" /v "did" /t REG_SZ /d "2393" /f
echo Registry keys for Zango have been imported.
echo -------------------------
echo When prompted to reinstall Zango Components, choose 'Yes'. Components will NOT be installed.

cd /d "%~dp0"

:: Start the game
echo Starting game...
start /wait jade.exe

:: Cleanup registry after the game exits
echo Removing Registry keys...
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\zango" /f
echo Registry keys deleted.

exit