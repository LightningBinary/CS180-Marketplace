@echo off
REM ============================================
REM CS180 Marketplace - Build Script
REM ============================================
setlocal enabledelayedexpansion

set PROJECT_DIR=%~dp0
set SRC_DIR=%PROJECT_DIR%src
set OUT_DIR=%PROJECT_DIR%out
set LIB_DIR=%PROJECT_DIR%libs

:: Set Java path (JDK 17 installed to C:\tools)
set JAVA_HOME=C:\tools\jdk-17.0.18+8
set PATH=%JAVA_HOME%\bin;%PATH%

echo [1/3] Cleaning output directory...
if exist "%OUT_DIR%" rmdir /s /q "%OUT_DIR%"
mkdir "%OUT_DIR%"

echo [2/3] Building classpath...
set CLASSPATH=%OUT_DIR%
for %%j in ("%LIB_DIR%\*.jar") do set CLASSPATH=!CLASSPATH!;%%j

echo [3/3] Compiling Java sources...
pushd "%SRC_DIR%"
javac -d "%OUT_DIR%" -cp "%CLASSPATH%" *.java
popd

if %ERRORLEVEL% equ 0 (
    echo.
    echo ====== BUILD SUCCESSFUL ======
    echo.
    echo To start the server:
    echo     run-server.bat
    echo.
    echo To start the marketplace client:
    echo     run-marketplace.bat
    echo.
) else (
    echo.
    echo ====== BUILD FAILED ======
    echo.
)

endlocal
pause
