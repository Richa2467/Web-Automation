from appium import webdriver
from appium.webdriver.common.touch_action import TouchAction
from appium.webdriver.common.mobileby import MobileBy
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException

# Step 1: Create "Desired Capabilities"
desired_caps = {
    'platformName': 'Android',
    'platformVersion': '11',
    'deviceName': 'RZ8R31425NA',
    'appPackage': 'com.surepassid.otp.authenticator',
    'appActivity': 'com.surepassid.authenticator.activity.AuthenticatorActivity',
    'automationName': 'uiautomator2',
    'noReset': 'true',
}

# Step 2: Create "Driver object"
driver = webdriver.Remote('http://127.0.0.1:4723', desired_caps)
time.sleep(8)

# Step 3: Find the element and perform long press action
try:
    # Wait for up to 30 seconds until the element is located
    ele = WebDriverWait(driver, 30).until(
        EC.visibility_of_element_located((MobileBy.XPATH,
                                          '//android.widget.LinearLayout[@resource-id="com.surepassid.otp.authenticator:id/issuer_account_token_code_data"]'))
    )

    # Perform long press action on the element
    actions = TouchAction(driver)
    actions.long_press(ele).perform()

    time.sleep(5)
except TimeoutException:
    print("Timeout occurred. Element not found within 30 seconds.")
    # Print page source to debug
    print(driver.page_source)
finally:
    driver.quit()

