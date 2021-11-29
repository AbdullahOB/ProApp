import time
from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.webdriver.common.by import By
from requests import get
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait as wait
from selenium.webdriver.support import expected_conditions


url = "https://www.midasbuy.com/midasbuy/tr/buy/pubgm"

def open_browser():

    driver = driver = webdriver.Chrome(ChromeDriverManager().install())
    for v in range(100):
        driver.get(url)
        # wait(driver, 30).until(expected_conditions.element_to_be_clickable((By.XPATH,'/html/body/div[2]/div/div')))
        # driver.find_element(By.XPATH,'/html/body/div[2]/div/div').click()
        # time.sleep(10)
        wait(driver, 30).until(expected_conditions.element_to_be_clickable((By.CLASS_NAME, 'input')))
        content = driver.find_element(By.CLASS_NAME, 'input')
        content.send_keys('5126163233')
        # time.sleep(10)
        wait(driver, 30).until(expected_conditions.element_to_be_clickable((By.XPATH, '//*[@id="app"]/div[3]/div[1]/div[3]/div/div/div[1]/div[2]')))
        driver.find_element(By.XPATH, '//*[@id="app"]/div[3]/div[1]/div[3]/div/div/div[1]/div[2]').click()
        time.sleep(10)
        # wait(driver, 30).until(((By.XPATH, '//*[@id="app"]/div[3]/div[1]/div[3]/div/div/div/div[1]/div[1]/p')))
        name = driver.find_element(By.XPATH, '//*[@id="app"]/div[3]/div[1]/div[3]/div/div/div/div[1]/div[1]/p').text
        print(name)
        time.sleep(10)
        



open_browser()
# get_cpf()