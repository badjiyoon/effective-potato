# Browser URL / BrowserMobProxyLibrary를 통한 Har파일 생성 및 W-Browser Create WebDriver 생성하는 Resource 파일
*** Settings ***
Library	                     Selenium2Library
Library	                     W-BrowserCore.py
Library                      Collections
Library                      OperatingSystem
Library                      BrowserMobProxyLibrary
Resource                     W-BrowserResource.robot

*** Variables ***
${HARDOWNURL}                %{W_TEST_HOME}/viewer/public/network/har
${URL}                       http://172.31.196.21:8060/websquare/websquare.html?w2xPath=/SWING/lib/xml/ZLIBSMAN90010.xml&coClCd=T&svrLocation=SWGS
#${executor}                  http://127.0.0.1:4444/wd/hub

*** Keywords ***
# W-Browser WebDriver Create Keywords
# RobotFramework에서 제공해주는 Chrome / IE / FireFox가 아닌 chromium기반의 W-Browser를 사용하기 위해서는
# WebDriver 생성시 binary_location을 W-Browser.exe의 위치를 지정해야한다.
Init W-Browser
    [Documentation]          W-Browser / BrowserMob Proxy Loading
    Start Local Server       %{W_TEST_HOME}/browsermob-proxy/bin/browsermob-proxy
    ${BrowserMob_Proxy}=     Create Proxy
    ${options}               WBrowserOptions              ${BrowserMob_Proxy}
    Create Webdriver         Chrome                       chrome_options=${options}   
 
# browserMobProxy에서 har파일 생성 Keyword
Make Har
    [Documentation]          Make Har
    New Har                  SKT Swing
    Go To                    ${url}

# browserMobProxy에서 har파일 저장 Keyword
Save Har
    [Documentation]          Save Har
    ${har}=                  Get Har As Json
    create file              ${HARDOWNURL}${/}file.har    ${har}

Clear Cache
    Clear Dns Cache