*** Settings ***
Library  AppiumLibrary
Library    re    # Import the 're' module




*** Variables ***
${devicename}    RZ8R31425NA
${pVersion}     11.0
${plateformName}     Android
${appPackage}    com.surepassid.otp.authenticator
${appActivity}   com.surepassid.authenticator.activity.AuthenticatorActivity
${automationName}    uiautomator2


*** Test Cases ***
OTP
    Open Application    http://localhost:4723/wd/hub    platformName=${plateformName}      noReset=true  deviceName=${devicename}   appPackage=${appPackage}  appActivity=${appActivity}      automationName=${automationName}
    ${otp}=    Get Text     xpath=//android.widget.TextView[@resource-id="com.surepassid.otp.authenticator:id/token_value"]
    Set Global Variable  ${otp}
#    Log    Variable value:${otp}
#  Click Element   xpath=//android.widget.Button[@index="0"]
#    Set Global Variable  ${otp}
    Log To Console   ${otp}





