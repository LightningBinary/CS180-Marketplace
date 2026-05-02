@echo off
REM ============================================
REM CS180 Marketplace - Run Server
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

echo Starting Marketplace Server...
echo Make sure you have compiled first (run compile.bat)
echo.
java -cp "%CLASSPATH%" Server

if %ERRORLEVEL% neq 0 (
    echo.
    echo Server exited with error code %ERRORLEVEL%
    pause
)

endlocal
