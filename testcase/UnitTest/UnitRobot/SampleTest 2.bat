set date2=%date%
set time2=%time%
set time2=%time2:~0,2%%time2:~3,2%%time2:~6,2%
set now=%date2% %time2%
set dir="C:\Swing-TestFrameWork\SimpleHttpHarViewerServer\httproot\result\%now%"
mkdir %dir%
robot --outputdir %dir% wbrowsertest.robot