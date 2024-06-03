from selenium import webdriver
driver = webdriver.Chrome()
driver.maximize_window()
driver.get("https://www.tutorialspoint.com/index.htm")
# Open Mailbox    server=smtp.gmail.com    user=xxxx@gmail.com    password=xxxx
# ${LATEST}=    Wait For Email    fromEmail=xxxxx@gmail.com    toEmail=xxxxx@gmail.com   subject=xxxxx
# ${parts} =    Get Email Body    ${LATEST}
# @{words} =    Split String    ${parts}
# Input Text    css=input[name="otp"]    ${words}[39]

