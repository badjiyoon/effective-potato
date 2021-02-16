from selenium import webdriver

def WBrowserOptions(proxy):
    chrome_options = webdriver.ChromeOptions()
    chrome_options.binary_location = "C:/inswave/w-browser/W-browser.exe"
    chrome_options.add_argument("--proxy-server={0}".format(proxy.proxy))
    #chrome_options.add_argument("--lang=de")
    #chrome_remote = webdriver.Remote('http://127.0.0.1:4444/wd/hub', chrome_options.to_capabilities())
    return chrome_options