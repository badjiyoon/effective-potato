# Browser URL / BrowserMobProxyLibrary를 통한 Har파일 생성 및 W-Browser Create WebDriver 생성하는 Resource 파일
*** Settings ***
Library	                     Selenium2Library
Library	                     W-BrowserCorenoproxy.py
Library                      Collections
Library                      OperatingSystem

*** Variables ***
${URL}                       

*** Keywords ***
# W-Browser WebDriver Create Keywords
# RobotFramework에서 제공해주는 Chrome / IE / FireFox가 아닌 chronium기반의 W-Browser를 사용하기 위해서는
# WebDriver 생성시 binary_location을 W-Browser.exe의 위치를 지정해야한다.
Init W-Browser
    [Documentation]          W-Browser / BrowserMob Proxy Loading
    ${options}               WBrowserOptionsnoproxy
    Create Webdriver         Chrome                       chrome_options=${options}
	Go To                    ${url}