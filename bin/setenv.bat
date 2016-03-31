@echo off
rem setlocal
rem =============== MH Start =============================================
REM
REM where am I ?
REM expands %I to a drive letter and path only
REM
for /f %%i in ('echo %0') do set CURRDIR=%%~dpi
for /f %%i in ('echo %0') do set CURRDEV=%%~di

rem ************** Bitte nur hier anpassen : Start *********************
rem *
rem --
rem -- Systemvariable definition
rem --
title SpringBootSkeleton-Project
color 84

set CURR_ENV= *** Office Environment ***

set APP_HOME=%CURRDIR%\..
rem admin folder with additinal feature like edit, ....
set ADMIN_HOME=D:\apps\admin

set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_05
set M2_HOME=D:\tools\maven\apache-maven-3.3.3

rem Eclipse setting

set eclipse=D:\eclipse\eclipse-jee-mars\eclipse.exe
set workspace=D:\dev\ws_SpringBoot

rem *
rem ************** Bitte nur hier anpassen : End *********************
rem *

:localSetting
if not exist "%CURRDIR%setenv_%COMPUTERNAME%.bat" goto setPath
echo Starting: %CURRDIR%setenv_%COMPUTERNAME%.bat
call %CURRDIR%setenv_%COMPUTERNAME%.bat

:setPath
set PATH=%JAVA_HOME%\bin
set PATH=%PATH%;%M2_HOME%\bin
set PATH=%PATH%;%SystemRoot%;%SystemRoot%\system32;
set PATH=%PATH%;%ADMIN_HOME%

:setClasspath
rem --
rem -- work out classpath --
rem --
rem set CLASSPATH=.;
rem set CLASSPATH=.;.\build\classes
rem set CLASSPATH=%CLASSPATH%;e:\junit3.8.1\junit.jar;

:showValues
rem --
rem --  Tell us about environment
rem ----------------------------------------------------------------------------
rem --
echo.
echo ===========================================================================
echo ==================== %CURR_ENV% ==========================
echo ===========================================================================
echo Using JAVA_HOME    : %JAVA_HOME%
echo Using MAVEN_HOME   : %M2_HOME%
echo .
echo Using CLASSPATH    : %CLASSPATH%
echo .
echo Using PATH         : %PATH%
echo ============================================================================
rem echo SUBST J: D:\jakarta-tomcat-5.0.19\webapps\DBTest\WEB-INF\classes
rem echo ============================================================================
echo.

rem Change to wirking directory
cd /D %APP_HOME%

explorer .

rem mvn -version

rem SET PRG="C:\Program Files (x86)\Notepad++\notepad++.exe"
edit README.md
rem ========================== MH Ende =====================================
