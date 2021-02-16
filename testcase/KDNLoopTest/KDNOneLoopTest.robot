*** Settings ***
Library	 Selenium2Library

*** Variables ***
${APP}            uftHelp
${URL}            
${BROWSER}        ie

*** Test Cases ***
[KDN TestCase1] UI Open & Close
    Launch Browser
    TestCase init
    ForTestCase
#    Close Br

*** Keywords ***
Launch Browser
    Open Browser    			 ${URL}  ${BROWSER}
    Set Selenium Speed           1 seconds
    set selenium implicit wait   10 seconds

TestCase init
    Click Element                id=trv_Cocmp_label_211
    Click Element                id=trv_Cocmp_label_212
    Click Element                id=trv_Cocmp_label_213
    Click Element                id=trv_Cocmp_label_214
    Execute Javascript           windowContainer1.closeWindow()

TestCase loop
    Click Element                id=trv_Cocmp_label_214
    Execute Javascript           windowContainer1.closeWindow()

ForTestCase
     :FOR  ${INDEX}  IN RANGE  100
	\  TestCase loop
    \  Exit For Loop If    ${INDEX} == 100

Close Br
	Close BROWSER