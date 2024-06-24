*** Settings ***
Library  SeleniumLibrary
Library  AppiumLibrary
Library    XML



*** Variables ***
${URL}   https://mfa-alpha.surepassid.com/
${AccountName}   //input[@id="tbxDomain_Name"]
${UserName}  //input[@id="tbxUser_Name"]
${Password}  //input[@id="tbxPassword"]
${LoginButton}   //input[@id="btnLogin"]
${OtpField}  //input[@id="tbxOTP"]
${VerifyOtp}     //input[@id="btnVerifyOtp"]
${devicename}     RZ8R31425NA
${pVersion}     11.0
${plateformName}     Android
${appPackage}    com.surepassid.otp.authenticator
${appActivity}   com.surepassid.authenticator.activity.AuthenticatorActivity
${automationName}    uiautomator2

*** Keywords ***

*** Test Cases ***
Login
     Open Browser   ${URL}   chrome
     SeleniumLibrary.Input Text   ${AccountName}    volansys.com
     SeleniumLibrary.Input Text   ${UserName}     Kalpesh.Patel
     SeleniumLibrary.Input Text   ${Password}     Volansys@123
     SeleniumLibrary.Click Button    ${LoginButton}
    Open Application    http://localhost:4723/wd/hub    platformName=${plateformName}      noReset=true     maxInstances=${maxInstances} deviceName=${devicename}   appPackage=${appPackage}  appActivity=${appActivity}      automationName=${automationName}
    ${otp}=   AppiumLibrary.Get Text     xpath=//android.widget.TextView[@resource-id="com.surepassid.otp.authenticator:id/token_value" and @index="2"]
#    Click Element   xpath=//android.widget.Button[@index="0"]
    Set Global Variable  ${otp}
    Log To Console    ${otp}

    SeleniumLibrary.Input Text   ${OtpField}    ${otp}
    SeleniumLibrary.Click Button   ${VerifyOtp}
    SeleniumLibrary.Click Element   xpath=//span[@id="ctl00_LoggedInAs"]










