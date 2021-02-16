*** Settings ***
Library	 Selenium2Library

*** Variables ***
${APP}            uftHelp
#${URL}            http://localhost:8080/5.0_2.2936B.20180114.155240_1.5_without_testcase/websquare/websquare.html?w2xPath=/TEST/WS5/autoComplete_noResult_WPF-1092_(WSQ-389).xml
${URL}            https://www.google.co.kr
${BROWSER}        chrome

*** Test Cases ***
[TC-001]-Launching the browser and search and launch the 'uftHelp' Application on naver.com
    Launch Browser
    Search Application On Google
    Launch Application
    Close Br

*** Keywords ***
Launch Browser
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Search Application On Google
    Input Text    id=lst-ib    ${APP}
    Execute JavaScript   _fZl.click();

Launch Application
#    Wait Until Element Is Visible    link=User-Friendly Techy-Help      20 Seconds
    Click Link     xpath=//a[@href="http://ufthelp.com/"]

Close Br
	Close BROWSER
