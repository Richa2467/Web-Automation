*** Settings ***
Library    AppiumLibrary

*** Variables ***
${pVersion}  11.0
${deviceName}    RZ8R31425NA
${plateformName}     Android
${appPackage}    com.google.android.apps.authenticator2
${appActivity}   com.google.android.apps.authenticator.AuthenticatorActivity
${automationName}    uiautomator2

*** Test Cases ***
login
     Open Application    http://localhost:4723/wd/hub    platformName=${plateformName}      noReset=true  deviceName=${devicename}   appPackage=${appPackage}  appActivity=${appActivity}      automationName=${automationName}
      ${otp}=   AppiumLibrary.Get Text     xpath=////android.widget.TextView[@resource-id=com.google.android.apps.authenticator2":id/token_value" and @index="3"]
      Set Global Variable   ${otp}
      Log To Console   ${otp}