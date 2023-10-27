from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def chromedriver(Url):
    options = Options()
    options.page_load_strategy = 'normal'
    driver = webdriver.Chrome(options=options)
    driver.get(Url)
    driver.quit()
