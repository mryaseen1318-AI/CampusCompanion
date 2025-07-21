@echo off
echo Building CampusCompanion APK...
echo.

:: Check if we're in the right directory
if not exist "app\src\main\AndroidManifest.xml" (
    echo Error: Please run this script from the project root directory.
    echo The app\src\main\AndroidManifest.xml file was not found.
    pause
    exit /b 1
)

echo Creating temporary build files...

:: Create local.properties if it doesn't exist
if not exist "local.properties" (
    echo sdk.dir=C\:\\Users\\%USERNAME%\\AppData\\Local\\Android\\Sdk > local.properties
)

:: Create gradle wrapper files
if not exist "gradle\wrapper" mkdir gradle\wrapper

echo distributionBase=GRADLE_USER_HOME > gradle\wrapper\gradle-wrapper.properties
echo distributionPath=wrapper/dists >> gradle\wrapper\gradle-wrapper.properties
echo distributionUrl=https\://services.gradle.org/distributions/gradle-7.4.2-bin.zip >> gradle\wrapper\gradle-wrapper.properties
echo zipStoreBase=GRADLE_USER_HOME >> gradle\wrapper\gradle-wrapper.properties
echo zipStorePath=wrapper/dists >> gradle\wrapper\gradle-wrapper.properties

:: Create a simple gradlew.bat
(
echo @if "%%DEBUG%%" == "" @echo off
echo @rem ##########################################################################
echo @rem
echo @rem  Gradle startup script for Windows
echo @rem
echo @rem ##########################################################################
echo @rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal
set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%
@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=
echo Starting Gradle...
call :execute
:execute
@rem Setup the command line
set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar
@rem Execute Gradle
"%JAVA_HOME%\bin\java.exe" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% ^
  -Dorg.gradle.appname="%APP_BASE_NAME" ^
  -classpath "%CLASSPATH%" ^
  org.gradle.wrapper.GradleWrapperMain %*
:end
@rem End local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" endlocal
:omega
) > gradlew.bat

:: Now try to build
echo.
echo Starting build process...
call gradlew.bat assembleDebug

if %errorlevel% equ 0 (
    echo.
    echo Build successful! Your APK is located at:
    echo %~dp0app\build\outputs\apk\debug\app-debug.apk
) else (
    echo.
    echo Build failed. Please check the error messages above.
)

pause
