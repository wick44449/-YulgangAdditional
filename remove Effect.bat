@echo off
set "basePath=C:\Playpark\Yulgang"
set "effectPath=%basePath%\datas\EFFECT"

if not exist "%effectPath%" (
    echo Folder not found: %effectPath%
    pause
    exit /b
)

echo Deleting files with specified keywords and extensions in %effectPath% and its subfolders

REM List of keywords to search for in the file names
set keywords=aura asc bagua thunder bolt intense attribute inner outer poison water wind

REM List of file extensions to delete (adding both lowercase and uppercase for case insensitivity)
set extensions=dxt DXT amd AMD fx FX fxm FXM

REM Delete files that contain keywords and have specific extensions (only in EFFECT folder)
for %%k in (%keywords%) do (
    for %%e in (%extensions%) do (
        del /s /q "%effectPath%\*%%k*.%%e"
    )
)

REM Delete specific files by name (still from base folder, not just EFFECT)
del /s /q "%basePath%\6002104_M.amd"
del /s /q "%basePath%\6002301_M.amd"
del /s /q "%basePath%\Playpark.wmv"

echo Done deleting matching files in %effectPath% and specific files in %basePath%
pause
