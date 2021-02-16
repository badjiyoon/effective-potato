set date2=%date%
set time2=%time%
set time2=%time2:~0,2%%time2:~3,2%%time2:~6,2%
set now=%date2%%time2%
set dir="C:\automation-test\testcase\KDNLoopTest\%now%"
mkdir %dir%
robot --variable URL:http://192.168.150.191:7070/main/index.jsp?w2xPath=/index.xml --outputdir %dir% KDNOneLoopTest.robot