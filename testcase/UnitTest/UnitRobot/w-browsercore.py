from selenium import webdriver

def Wbrowseroptions(proxy):
    chrome_options = webdriver.ChromeOptions()
    chrome_options.binary_location = "C:/inswave/w-browser/W-browser.exe"
    chrome_options.add_argument("--proxy-server={0}".format(proxy.proxy))
    return chrome_options