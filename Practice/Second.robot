*** Settings ***
Documentation    This is our demo test
Library      AppiumLibrary



*** Variables ***
${devicename}     RZ8R31425NA
${pVersion}     11.0
${plateformName}     Android
${appPackage}    com.sec.android.app.popupcalculator
${appActivity}   com.sec.android.app.popupcalculator.Calculator
${automationName}    uiautomator2

*** Test Cases ***
Test
    Open Application    http://localhost:4723/wd/hub    platformName=${plateformName}     deviceName=${devicename}   appPackage=${appPackage}  appActivity=${appActivity}      automationName=${automationName}
     Wait Until Element Is Visible     xpath=//android.widget.Button[@content-desc="5"]
     Click Element   xpath=//android.widget.Button[@content-desc="5"]

     Click Element   xpath=//android.widget.Button[@content-desc="Plus"]

     Click Element   xpath=//android.widget.Button[@content-desc="6"]

     Click Element   xpath=//android.widget.Button[@content-desc="Equal"]

