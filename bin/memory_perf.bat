@echo off
setlocal

if not exist "%~dp0\setenv.bat" goto runbat
call "%~dp0\setenv.bat"
:runbat

if exist "%W_TEST_HOME%\result_perf" goto folderexist
mkdir "%W_TEST_HOME%\result_perf"

:folderexist


For /f "tokens=1-4 delims=/- " %%a in ('date.exe /t') do (set mydate=%%a%%b%%c)
For /f "tokens=1-3 delims=/:." %%a in ("%TIME%") do (set mytime=%%a%%b%%c)
echo COMPUTER : %computername%
echo DATE : %mydate%
echo TIME : %mytime%
echo filename : %W_TEST_HOME%\result_perf\%computername%_%mydate%%mytime%.csv
@rem typeperf "\process(W-*)\% Processor Time" "\processor(_Total)\% Processor Time" "\process(W-*)\Working Set - Private" "\memory\Available Bytes" -si 5 -o %W_TEST_HOME%\result_perf\%computername%_%mydate%%mytime%.csv

typeperf "\PhysicalDisk(_Total)\Avg. Disk Queue Length" "\PhysicalDisk(_Total)\Disk Reads/sec" "\PhysicalDisk(_Total)\Disk Writes/sec" "\Memory\Pages/sec" "\Memory\Page Reads/sec" "\Memory\Page Writes/sec" "\memory\Available Bytes" "\process(W-*)\% Processor Time" "\processor(_Total)\% Processor Time" "\process(W-*)\Working Set - Private" -si 5 -o  %W_TEST_HOME%\result_perf\%computername%_%mydate%%mytime%.csv

