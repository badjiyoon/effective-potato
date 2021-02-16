@echo off
setlocal

if not exist "%~dp0\setenv.bat" goto runbat
call "%~dp0\setenv.bat"
:runbat

set date2=%date%
set time2=%time%
set time2=%time2:~0,2%%time2:~3,2%%time2:~6,2%
set now=%date2%%time2%
set dir="%W_TEST_HOME%\result\%now%"
mkdir %dir%
robot --outputdir %dir% "%W_TEST_HOME%\testcase\SwingUnit
pause