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
${1PAGEID}                  통합접촉이력조회

*** Keywords ***
# Swing 검색화면을 통한 통합접촉이력조회 화면이동 Process
Move1 Frame Process
    [Documentation]              Move1 Frame Process (top_frame 1PAGE Move)
    Unselect Frame
    set selenium implicit wait   5 seconds
    Click Element                id=btn_findPop
    Input Text                   id=wfm_findLayer_edt_keyword        ${1PAGEID}
    Click Element                id=wfm_findLayer_btn_findBtn
#    Execute Javascript           wfm_findLayer_grd_serachResult_cell_0_0.click();
    set selenium implicit wait   5 seconds
    Click Element                id=mdi01ZORDSS08S4010_winclose

*** Test Cases ***
[TEST-001] W-browser SKT Swing Move1 Frame
    Move1 Frame Process