from selenium import webdriver

def WBrowserOptionsnoproxy():
    chrome_options = webdriver.ChromeOptions()
    chrome_options.binary_location = "C:/inswave/w-browser/W-browser.exe"
    return chrome_options