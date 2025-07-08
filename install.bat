@echo off
setlocal

:: GitHub ZIP file URL (raw link)
set "URL=https://github.com/wick44449/-YulgangAdditional/raw/main/26000.zip"

:: Temporary zip file path
set "ZIPFILE=%TEMP%\26000.zip"

:: Destination folder
set "DEST=C:\Playpark\Yulgang\datas\NCSData"

echo.
echo [INFO] Downloading ZIP file from GitHub...
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%ZIPFILE%'"

if not exist "%ZIPFILE%" (
    echo [ERROR] Failed to download the file. ZIP not found.
    pause
    exit /b
)

echo [INFO] Extracting ZIP to: %DEST%
powershell -Command "Expand-Archive -Path '%ZIPFILE%' -DestinationPath '%DEST%' -Force"

echo [INFO] Cleaning up temporary ZIP file...
del /f /q "%ZIPFILE%"

echo.
echo [SUCCESS] All done. Files have been extracted to:
echo          %DEST%
pause
