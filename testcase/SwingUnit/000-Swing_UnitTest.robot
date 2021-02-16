# RobotFramework에서 제공해주는 Chrome / IE / FireFox가 아닌 W-Browser를 사용하기 위해서는
# window에서 report 파일을 이동 시 다음과 같은 batch Program을 통한 report를 output 할 수 있음
# robot --outputdir %dir% wbrowsertest.robot
*** Settings ***
Metadata                    VERSION     0.1
Library	                    Selenium2Library
Library	                    W-BrowserCore.py
Library                     Collections
Library                     OperatingSystem
Library                     BrowserMobProxyLibrary
Resource                    W-BrowserResource.robot

*** Variables ***
#${1PAGEID}                  통합접촉이력조회
#${2PAGEID}                  청구수납관리
#${3PAGEID}                  고객상담

*** Keywords ***
# RobotFramework에서 report를 원하는 경로로 이동하기 위해서는 MAC / Linux 계열의 환경에서는 .sh
# 파일로 조작이 필요함. Windows 계열에서는 .bat파일을 통한 report파일에 대한 조작이 필요함.

# Swing PC화면에 임시로그인을 하기위한 Process
Login Process
    [Documentation]              Login Process (mdi01_subWindow0_iframe)
    Set Selenium Speed           1 seconds
    set selenium implicit wait   10 seconds
    Select Frame                 id=mdi01_subWindow0_iframe
    Execute JavaScript           dst_input.setCellData(0, "login_id", "UK089");
# Swing 테스트를 위한 JS 오버라이딩 Keyword
    Execute JavaScript           ${CURDIR}/LoginFnOverride.js
    Execute Javascript           scwin.btn_search_onclick();


*** Test Cases ***
[TEST-000] W-browser SKT Swing TestCase Runnable
    Init W-Browser
    Make Har
    Login Process
#    Move1 Frame Process
#    Move2 Frame Process
#    Move3 Frame Process
#    Save Har
#    Close Br