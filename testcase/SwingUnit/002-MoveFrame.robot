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
${2PAGEID}                  청구수납관리

*** Keywords ***
# Swing 검색화면을 통한 청구수납관리 화면이동 Process
Move2 Frame Process
    [Documentation]              Move2 Frame Process (top_frame 2PAGE Move)
    Click Element                id=btn_findPop
    Input Text                   id=wfm_findLayer_edt_keyword        ${2PAGEID}
    Click Element                id=wfm_findLayer_btn_findBtn
 #   Execute Javascript           wfm_findLayer_grd_serachResult_cell_0_0.click();
    set selenium implicit wait   5 seconds
    Click Element                id=mdi01ZPAYSCLM00100_winclose

*** Test Cases ***
[TEST-002] W-browser SKT Swing Move2 Frame
    Move2 Frame Process