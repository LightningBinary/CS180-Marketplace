@echo off
REM ============================================
REM CS180 Marketplace - Run Client (Marketplace)
REM ============================================
setlocal enabledelayedexpansion

set PROJECT_DIR=%~dp0
set OUT_DIR=%PROJECT_DIR%out
set LIB_DIR=%PROJECT_DIR%libs

:: Set Java path (JDK 17 installed to C:\tools)
set JAVA_HOME=C:\tools\jdk-17.0.18+8
set PATH=%JAVA_HOME%\bin;%PATH%

set CLASSPATH=%OUT_DIR%
for %%j in ("%LIB_DIR%\*.jar") do set CLASSPATH=!CLASSPATH!;%%j

echo Starting Marketplace Client...
echo Make sure the Server is already running (run-server.bat in another window)
echo.
java -cp "%CLASSPATH%" Marketplace

if %ERRORLEVEL% neq 0 (
    echo.
    echo Client exited with error code %ERRORLEVEL%
    pause
)

endlocal
