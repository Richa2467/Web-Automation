import time

from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
driver.get("https://www.amazon.in/")
driver.maximize_window()
driver.set_page_load_timeout(8)

# signin = driver.find_element(By.XPATH,'(//span[@class = "nav-action-inner"])[1]')
# signin.click()

driver.find_element(By.XPATH, '//span[@id="nav-link-accountList-nav-line-1"]').click()
driver.find_element(By.XPATH, '//input[@id="ap_email"]').send_keys("7453054374")
driver.find_element(By.XPATH, '//input[@id="continue"]').click()
time.sleep(5)

driver.find_element(By.XPATH,'//input[@id="ap_password"]').send_keys("Tyagi@123")
time.sleep(6)
driver.find_element(By.XPATH,'//input[@id="signInSubmit"]').click()
time.sleep(8)

if (driver.find_element(By.XPATH, '//span[@id = "nav-link-accountList-nav-line-1"]').text == "Hello, Richa"):
    print("Verified")
else:
    print("Not-verified")


