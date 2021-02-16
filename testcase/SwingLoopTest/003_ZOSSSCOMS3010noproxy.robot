# RobotFramework에서 제공해주는 Chrome / IE / FireFox가 아닌 W-Browser를 사용하기 위해서는
# window에서 report 파일을 이동 시 다음과 같은 batch Program을 통한 report를 output 할 수 있음
# robot --outputdir %dir% wbrowsertest.robot
*** Settings ***
Metadata                    VERSION     0.1
Library	                    Selenium2Library
Library	                    W-BrowserCorenoproxy.py
Library                     Collections
Library                     OperatingSystem
Library                     String
Resource                    W-BrowserResourcenoproxy.robot

*** Variables ***
${1PAGEID}                  통합스케줄러 작업관리
${INDEX}                    0
${URL}                      

*** Keywords ***
# RobotFramework에서 report를 원하는 경로로 이동하기 위해서는 MAC / Linux 계열의 환경에서는 .sh
# 파일로 조작이 필요함. Windows 계열에서는 .bat파일을 통한 report파일에 대한 조작이 필요함.

# Swing PC화면에 임시로그인을 하기위한 Process
Login Process
    [Documentation]              Login Process (mdi01_subWindow0_iframe)
    Set Selenium Speed           1 seconds
    set selenium implicit wait   10 seconds
    Select Frame                 id=mdi01_subWindow0_iframe
    Execute JavaScript           dst_input.setCellData(0, "login_id", "UK869");

# Swing 테스트를 위한 JS 오버라이딩 Keyword
    Execute JavaScript           ${CURDIR}/LoginFnOverride.js
    Execute Javascript           scwin.btn_search_onclick();
.
# Swing 검색화면을 통합스케줄러 작업관리 화면이동 Process
Move Frame Process
    [Documentation]              Move1 Frame Process (top_frame 1PAGE Move)
    Unselect Frame
    Click Element                id=btn_findPop
    Execute Javascript           wfm_findLayer_edt_keyword.setValue("고객상담");
    Click Element                id=wfm_findLayer_btn_findBtn
    
Move Frame Process1
    set selenium implicit wait   10 seconds
    #Unselect Frame
	#Execute Javascript           mdi01_subWindow1_iframe.getWindow().ngmf.promise.dialog("OSS", "ZOSSSCOM12330");
    #Unselect Frame
	#set selenium implicit wait   10 seconds
    #Execute Javascript          mdi01_subWindow1_iframe.getWindow().WebSquare.clearMemory();
	Execute Javascript           mdi01_subWindow1_iframe.getWindow().location.reload();    
    #Execute Javascript            ZOSSSCOM12330_close.click();

*** Test Cases ***
[TEST-002] 003_ZOSSSCOMS3010(통합스케쥴러 작업관리) noproxy SKT Swing TestCase Runnable
    Init W-Browser
    Login Process
	Move Frame Process
    :FOR  ${INDEX}  IN RANGE  1000
	\  Move Frame Process1
    \  Exit For Loop If    ${INDEX} == 1000