@echo off
setlocal enabledelayedexpansion

rem Get the directory where the batch file is located
for %%i in ("%~dp0.") do set "BatchDir=%%~i"

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}" /ve /t REG_SZ /d "ZangoInstaller Class" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\InprocServer32" /ve /t REG_SZ /d "%BatchDir%\zango\ZangoInstaller.dll" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\InprocServer32" /v "ThreadingModel" /t REG_SZ /d "Apartment" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\MiscStatus" /ve /t REG_SZ /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\MiscStatus\1" /ve /t REG_SZ /d "132497" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\ProgID" /ve /t REG_SZ /d "ZangoInstaller.ZangoInstaller.1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\ToolboxBitmap32" /ve /t REG_SZ /d "%BatchDir%\zango\ZangoInstaller.dll, 101" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\TypeLib" /ve /t REG_SZ /d "{FF0312E0-F60C-4109-94B8-0A564A58E43B}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\Version" /ve /t REG_SZ /d "1.0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}\VersionIndependentProgID" /ve /t REG_SZ /d "ZangoInstaller.ZangoInstaller" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\zango" /v "did" /t REG_SZ /d "2393" /f
echo Registry keys for Zango have been imported.
endlocal

cd /d "%~dp0"

echo Starting game..

<YOUR GAME EXECUTABLE>.exe

echo Removing Registry keys..

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\CLSID\{99410CDE-6F16-42ce-9D49-3807F78F0287}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\zango" /f

echo Registry keys deleted.

pause
