@echo off
echo Initializing Gradle Wrapper...

echo Creating gradle wrapper files...
echo. > settings.gradle
echo. > build.gradle

:: Create gradle wrapper directory
if not exist "gradle\wrapper" mkdir gradle\wrapper

:: Create gradle wrapper properties
echo distributionBase=GRADLE_USER_HOME > gradle\wrapper\gradle-wrapper.properties
echo distributionPath=wrapper/dists >> gradle\wrapper\gradle-wrapper.properties
echo distributionUrl=https\://services.gradle.org/distributions/gradle-7.4.2-bin.zip >> gradle\wrapper\gradle-wrapper.properties
echo zipStoreBase=GRADLE_USER_HOME >> gradle\wrapper\gradle-wrapper.properties
echo zipStorePath=wrapper/dists >> gradle\wrapper\gradle-wrapper.properties

echo.
echo Gradle wrapper initialized. Now run 'gradlew.bat assembleDebug' to build the APK.
pause
