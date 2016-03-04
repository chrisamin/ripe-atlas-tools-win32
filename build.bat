@echo off

if "%PROGRAMFILES(x86)%" == "" (
    set NSIS="%PROGRAMFILES%\NSIS\makensis"
) else (
    set NSIS="%PROGRAMFILES(x86)%\NSIS\makensis"
)

pyinstaller ..\ripe-atlas-tools\scripts\ripe-atlas --additional-hooks-dir=pyinstaller-hooks --clean --runtime-hook pyinstaller-hooks\runtime-hooks.py -y || exit /b

%NSIS% ripe-atlas-tools.nsi || exit /b
copy RipeAtlasToolsSetup.exe "%USERPROFILE%\Desktop"
