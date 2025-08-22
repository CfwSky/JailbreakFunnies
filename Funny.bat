@echo off
setlocal

REM Define Roblox temp folder path
set "robloxTemp=%temp%\roblox"

REM Step 1: Delete everything inside %temp%\roblox
if exist "%robloxTemp%" (
    echo Clearing Roblox temp folder...
    rd /s /q "%robloxTemp%"
) else (
    echo Roblox temp folder does not exist, creating it...
)

REM Step 2: Create the "http" folder inside %temp%\roblox
echo Creating http folder...
mkdir "%robloxTemp%\http" >nul 2>&1

REM Step 3: Copy files from local "Files" folder to %temp%\roblox\http
if exist "Files" (
    echo Copying files to Roblox http cache...
    xcopy "Files\*" "%robloxTemp%\http\" /e /i /y >nul
) else (
    echo ERROR: "Files" folder not found in script directory.
)

echo Done.
pause
