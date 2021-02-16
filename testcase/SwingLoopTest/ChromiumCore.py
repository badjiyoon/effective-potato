from selenium import webdriver

def ChromiumOptions(proxy):
    chrome_options = webdriver.ChromeOptions()
    chrome_options.binary_location = "C:/chrome-win32/chrome.exe"
    chrome_options.add_argument("--proxy-server={0}".format(proxy.proxy))
    return chrome_options