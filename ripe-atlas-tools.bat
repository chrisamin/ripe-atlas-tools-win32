@echo off

mode 84,50
title RIPE Atlas Tools
prompt $$$S
cd /d "%LOCALAPPDATA%\Programs\Ripe Atlas Tools\ripe-atlas"

echo Welcome to RIPE Atlas Tools
echo.

if not EXIST "%USERPROFILE%\.config\ripe-atlas-tools\" (
    echo To start measurements, first create a key at https://atlas.ripe.net/ and run:
    echo ripe-atlas configure --set authorisation.create=YOUR_KEY_HERE
    echo.
)

ripe-atlas --help
echo on
