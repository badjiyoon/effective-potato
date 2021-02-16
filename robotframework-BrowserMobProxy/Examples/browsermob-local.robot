*** Settings ***
Documentation               This is just a BrowserMob Proxy Library tutorial
...
Metadata                    VERSION     0.1
Library                     Selenium2Library
Library                     Collections
Library                     OperatingSystem
Library                     BrowserMobProxyLibrary
Suite Setup                 Start Browser
Suite Teardown              Close Browsers


*** Variables ***
${PAGE_URL}                 https://www.google.com
${BROWSER}                  Firefox

*** Keywords ***
Start Browser
    [Documentation]         Start firefox browser
    Set Selenium Implicit Wait  10
    ## Init BrowserMob Proxy
    Start Local Server      /home/saint/Downloads/selenium/browsermob-proxy-2.1.0-beta-1/bin/browsermob-proxy

    ## Create dedicated proxy on BrowserMob Proxy
    ${BrowserMob_Proxy}=    Create Proxy

    ## Configure Webdriver to use BrowserMob Proxy
    Create Webdriver        ${BROWSER}    proxy=${BrowserMob_Proxy}

Close Browsers
    Close All Browsers
    Stop Local Server

*** Test Cases ***
Check something
    [Documentation]         Check the page title
    New Har                 google
    Go to                   ${PAGE_URL}
    Title Should Be         Google
    ${har}=                 Get Har As JSON
    create file             ${EXECDIR}${/}file.har     ${har}
    log to console          Browsermob Proxy HAR file saved as ${EXECDIR}${/}file.har