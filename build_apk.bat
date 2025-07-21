@echo off
echo Building CampusCompanion APK...
echo.

:: Check if gradlew exists
if not exist "gradlew.bat" (
    echo gradlew.bat not found. Please make sure you're in the project root directory.
    pause
    exit /b 1
)

:: Clean the project
call gradlew clean
if %errorlevel% neq 0 (
    echo Error: Failed to clean project.
    pause
    exit /b %errorlevel%
)

:: Build debug APK
call gradlew assembleDebug
if %errorlevel% neq 0 (
    echo Error: Failed to build debug APK.
    pause
    exit /b %errorlevel%
)

echo.
echo APK built successfully!
echo.
echo The APK is located at:
echo %~dp0app\build\outputs\apk\debug\app-debug.apk
echo.
pause
