*** Settings ***
Documentation    This is our demo test
Library      AppiumLibrary



*** Variables ***
${devicename}     RZ8R31425NA
${pVersion}     11.0
${plateformName}     Android
#${appPackage}    com.flipkart.android
#${appActivity}   com.flipkart.android.SplashActivity
${appPackage}    in.amazon.mShop.android.shopping
${appActivity}   com.amazon.mShop.splashscreen.StartupActivity
${automationName}    uiautomator2

*** Test Cases ***
Test
    Open Application    http://localhost:4723/wd/hub    platformName=${plateformName}     deviceName=${devicename}   appPackage=${appPackage}  appActivity=${appActivity}      automationName=${automationName}    noReset=true

    Sleep  10s
    Wait Until Element Is Visible   xpath=//android.widget.Image[@text="Fashion"]
    Click Element    xpath=//android.widget.Image[@text="Fashion"]
    Sleep  10s

    Wait Until Element Is Visible   xpath=//android.widget.Image[@text="Women"]
    Click Element    xpath=//android.widget.Image[@text="Women"]
    Sleep  10s

    Wait Until Element Is Visible   xpath=//android.view.View[@content-desc="Tops, tees & jeans"]
    Click Element    xpath=//android.view.View[@content-desc="Tops, tees & jeans"]
    Sleep  20s


    Wait Until Element Is Visible   xpath=(//android.widget.Button[@text="Add to cart"])[1]
    Click Element    xpath=(//android.widget.Button[@text="Add to cart"])[1]
    Sleep  10s

     Wait Until Element Is Visible   xpath=//android.widget.TextView[@text="L"]
     Click Element    xpath=//android.widget.TextView[@text="L"]
     Sleep  10s

     Wait Until Element Is Visible   xpath=//android.widget.Button[@text="Add to cart"]
     Click Element    xpath=//android.widget.Button[@text="Add to cart"]




