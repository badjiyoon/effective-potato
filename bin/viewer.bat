@echo off
setlocal

if not exist "%~dp0\setenv.bat" goto runbat
@echo "RUN..... setenv.bat"
call "%~dp0\setenv.bat"
:runbat

@rem echo %NODE_HOME%\node.exe %W_TEST_HOME%\viewer\bin\www
echo "http://localhost:3000/"
%NODE_HOME%\node.exe %W_TEST_HOME%\viewer\bin\www

