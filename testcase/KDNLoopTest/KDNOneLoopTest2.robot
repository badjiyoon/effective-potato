*** Settings ***
Library  Selenium2Library

*** Variables ***
${APP}            uftHelp
${URL}            
${BROWSER}        ie

*** Test Cases ***
[KDN TestCase1] UI Open & Close
    Launch Browser
#    Login Process
    TestCase init
    ForTestCase
#    Close Br

*** Keywords ***
Launch Browser
    Open Browser                 ${URL}  ${BROWSER}
    Set Selenium Speed           100ms
    set selenium implicit wait   10 seconds

Login Process
    Execute Javascript  ibx_UserId.setValue("mmk1700012")
    Execute Javascript  ibx_PassWd.setValue("1")
    Execute Javascript  btn_Login.click()
    set selenium implicit wait   15 seconds
    Execute Javascript  location.hash="w2xPath=/index.xml"
    set selenium implicit wait   10 seconds

TestCase init
    Click Element                id=trv_Cocmp_label_145
    Click Element                id=trv_Cocmp_label_146
    Click Element                id=trv_Cocmp_label_147
    Click Element                id=trv_Cocmp_label_150
    Click Element                id=trv_Cocmp_label_155


TestCase loop
     :FOR  ${label}  IN RANGE  148  160
    \   Execute Javascript           try{scwin._onclose && scwin._onclose()} catch(e){}
    \   Continue For Loop If    ${label} == 150
    \   Continue For Loop If    ${label} == 155
    \   Click Element           id=trv_Cocmp_label_${label}
    \   set selenium implicit wait   1 seconds

    :FOR  ${INDEX2}  IN RANGE  10
    \   Execute Javascript           try{scwin._onclose && scwin._onclose()} catch(e){}
    \   Execute Javascript           windowContainer1.closeWindow()
    \   set selenium implicit wait   500ms

ForTestCase
     :FOR  ${INDEX}  IN RANGE  100
    \  TestCase loop

Close Br
    Close BROWSER