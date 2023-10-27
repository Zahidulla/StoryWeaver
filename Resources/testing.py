from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def chromedriver(Url):
    browser_path = '/usr/bin/google-chrome'
    options = webdriver.ChromeOptions()
    options.binary_location = browser_path
    options.add_argument('headless')
    options.add_argument('--disable-infobars')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--no-sandbox')
    options.add_argument('--remote-debugging-port=9222')
    driver = webdriver.Chrome(options=options)
    driver.get(Url)
    driver.quit()
