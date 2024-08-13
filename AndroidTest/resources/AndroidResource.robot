*** Settings ***
Resource    ../labels/AndroidLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../locators/AndroidLocator.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/DesktopAuthenticatorResource.robot
Resource    ../resources/UsersPageResource.robot
#Resource    /home/richatyagi/PycharmProjects/pythonProject/AndroidTest/lib/pyResource.py
Library   /home/richatyagi/PycharmProjects/pythonProject/AndroidTest/lib/pyResource.py
*** Keywords ***
Open Test Application
    Mobile.Open Application  ${AppiumURL}   automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}    deviceName=${AndroidDeviceName}
    ...  appPackage=${AndroidSurePassPackageName}     appActivity=${AndroidSurePassActivityName}     noReset=true


#    appPackage=${AndroidSurePassPackageName}     appActivity=${AndroidSurePassActivityName}     noReset=true

Open Test Application With Reset
    Mobile.Open Application  ${AppiumURL}   automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}    deviceName=${AndroidDeviceName}
    ...  appPackage=${AndroidSurePassPackageName}     appActivity=${AndroidSurePassActivityName}

Open Eribank Application
    Mobile.Open Application  ${AppiumURL}   automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}    deviceName=${AndroidDeviceName}
    ...  app=${EribankApp}  appPackage=${AndroidEribankPackageName}     appActivity=${AndroidEribankActivityName}     noReset=true

#Open SMS Application
#    Mobile.Open Application  ${AppiumURL}   automationName=${ANDROID_AUTOMATION_NAME}
#    ...  platformName=${ANDROID_PLATFORM_NAME}    deviceName=${AndroidDeviceName}
#    ...  app=${SMSANDROID_APP}  appPackage=com.simplemobiletools.smsmessenger     appActivity=com.simplemobiletools.smsmessenger.activities.MainActivity   android:exported="true"   noReset=true

Open Google Authentication Application
    Mobile.Open Application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}    deviceName="FAAUG6ZLTOAE5DHE"
    ...  app=${GoogleANDROID_APP}  appPackage=com.google.android.apps.authenticator2     appActivity=com.google.android.apps.authenticator.AuthenticatorActivity     noReset=true

Open SMS Application
    Mobile.Open Application  ${AppiumURL}   automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}    deviceName=${AndroidDeviceName}
    ...    appPackage=com.google.android.apps.messaging    appActivity=com.google.android.apps.messaging.main.MainActivity    noReset=true
#deleted app=${SMSANDROID_APP2} from Open sms application
Open Browser With Activation Link
    [Arguments]    ${ActivationLink}
    ${rc}    Run And Return Rc    adb shell am start -a android.intent.action.VIEW -d ${ActivationLink}
    Should Be Equal    '${rc}'    '0'

Press Enter Key
    ${rc}    Run And Return Rc    adb shell input keyevent 66
    Should Be Equal    '${rc}'    '0'

Lock The Phone Screen
    ${rc}    Run And Return Rc    adb shell input keyevent 26
    Should Be Equal    '${rc}'    '0'

Unlock The Phone Screen
    ${rc}    Run And Return Rc    adb shell input keyevent 82
    Should Be Equal    '${rc}'    '0'

Navigate Back
    ${rc}    Run And Return Rc    adb shell input keyevent KEYCODE_BACK
    Should Be Equal    '${rc}'    '0'






Delete SurePassToken
    Open Test Application
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    Mobile.Long Press    ${SurePassTokenValue}
    Mobile.Wait Until Element Is Visible    ${SurePassTokenDeleteIcon}
    Mobile.Click Element    ${SurePassTokenDeleteIcon}
    Mobile.Wait Until Element Is Visible    ${SurePassTokenDeleteOK}
    Mobile.Click Element    ${SurePassTokenDeleteOK}
    sleep    ${SleepDelay2s}
#    Mobile.Close Application
#    Open Test Application
#    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
#    Mobile.long_press        ${SurePassTokenValue}       duration=4000
#    ${x}=    Set Variable    160    # Replace with actual x-coordinate
#    ${y}=    Set Variable    280    # Replace with actual y-coordinate
#    ${duration}=    Set Variable    5000
#    Run Keyword And Ignore Error    adb shell input tap ${x} ${y}
#    Sleep    ${duration}
#    Run Keyword And Ignore Error    adb shell input tap ${x} ${y}


#    ${firstFinger}=    Create List   273    264
#    BuiltIn.Sleep    5s
#    Tap With Positions  ${1000}    ${firstFinger}    duration=10000
#    Mobile.Wait Until Element Is Visible    ${SurePassTokenDeleteIcon}
#
#    Mobile.Click Element    ${SurePassTokenDeleteIcon}
#    Mobile.Wait Until Element Is Visible    ${SurePassTokenDeleteOK}
#    Mobile.Click Element    ${SurePassTokenDeleteOK}
#    sleep    ${SleepDelay2s}
#    Mobile.Close Application

Delete SMS From Mobile
    Open SMS Application
    Mobile.Wait Until Element Is Visible    ${SMSTitleVMSURJTQ}    ${StandardTimeout}
    Mobile.Long Press    ${SMSTitleVMSURJTQ}
    Mobile.Wait Until Element Is Visible    ${SMSDeleteIcon}
    Mobile.Click Element    ${SMSDeleteIcon}
    Mobile.Wait Until Element Is Visible    ${clickOnDeleteBtn}
    Mobile.Click Element    ${clickOnDeleteBtn}
    sleep    ${SleepDelay2s}

Delete SMS From Mobile if already existing
    Open SMS Application
    ${status}    Run Keyword And Return Status    Mobile.Get Matching Xpath Count   ${SMSTitleVMSURJTQ}
    Run Keyword If    '${status}' == 'True'    Delete Mobile SMS

Delete Mobile SMS
    Mobile.Wait Until Element Is Visible    ${SMSTitleVMSURJTQ}    ${StandardTimeout}
    Mobile.Long Press    ${SMSTitleVMSURJTQ}
    Mobile.Wait Until Element Is Visible    ${SMSDeleteIcon}
    Mobile.Click Element    ${SMSDeleteIcon}
    Mobile.Wait Until Element Is Visible    ${clickOnDeleteBtn}
    Mobile.Click Element    ${clickOnDeleteBtn}

Delete SMS From Mobile if already existing for SSP
    Open SMS Application
    ${status}    Run Keyword And Return Status    Mobile.Get Matching Xpath Count   ${SMSTitleNumber}
    Run Keyword If    '${status}' == 'True'    Delete Mobile SMS for SSP
    Mobile.Close Application

Delete Mobile SMS for SSP
    Mobile.Wait Until Element Is Visible    ${SMSTitleNumber}    ${StandardTimeout}
    Mobile.Long Press    ${SMSTitleNumber}
    Mobile.Wait Until Element Is Visible    ${SMSDeleteIcon}
    Mobile.Click Element    ${SMSDeleteIcon}
    Mobile.Wait Until Element Is Visible    ${clickOnDeleteBtn}
    Mobile.Click Element    ${clickOnDeleteBtn}

Edit SurePassToken Name
    [Arguments]    ${NewName}
    Open Test Application
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    Mobile.Long Press    ${SurePassTokenValue}
    Mobile.Wait Until Element Is Visible    ${EditIcon}
    Mobile.Click Element    ${EditIcon}
    Mobile.Wait Until Element Is Visible    ${EditNameBox}
    Mobile.Input Text    ${EditNameBox}    ${NewName}
    Mobile.Click Element    ${SaveNewNameBtn}
    sleep    ${SleepDelay2s}

Copy SurePassToken Value
    Open Test Application
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    Mobile.Long Press    ${SurePassTokenValue}
    Mobile.Wait Until Element Is Visible    ${CopyButton}    ${StandardTimeout}
    Mobile.Click Element    ${CopyButton}
    Mobile.Wait Until Element Is Visible    ${CopySucessPopup}    ${StandardTimeout}
    Mobile.Page Should Contain Element    ${CopySucessPopup}
    sleep    ${SleepDelay2s}

#Turn Authenticator Notification Off
#    ${rc}    Run And Return Rc    adb shell input keyevent KEYCODE_HOME
#    Should Be Equal    '${rc}'    '0'
#    Mobile.Wait Until Page Contains Element    ${AuthenticatorIcon}
#    Mobile.Long Press    ${AuthenticatorIcon}
#    Mobile.Wait Until Page Contains Element    ${AppInfoOption}
#    Mobile.Click Element    ${AppInfoOption}
#    Mobile.Wait Until Page Contains Element    ${NotificationsOption}
#    Mobile.Click Element    ${NotificationsOption}
#    Mobile.Wait Until Page Contains Element    ${NotificationToggle}
#    Mobile.Click Element    ${NotificationToggle}
#    Mobile.Wait Until Page Contains Element    ${NotificationToggleOff}

# Done some modification in this.
Turn Authenticator Notification Off
      Mobile.Wait Until Page Contains Element    ${AuthenticatorIcon}
      Mobile.Wait Until Page Contains Element    ${NotificationsOption}
      Mobile.Click Element    ${NotificationsOption}
      Mobile.Wait Until Page Contains Element    ${NotificationToggle}
      Mobile.Click Element    ${NotificationToggle}
      Mobile.Wait Until Page Contains Element    ${NotificationToggleOff}



Turn Authenticator Notification On
    ${rc}    Run And Return Rc    adb shell input keyevent KEYCODE_HOME
    Should Be Equal    '${rc}'    '0'
    Mobile.Wait Until Page Contains Element    ${AuthenticatorIcon}
    Mobile.Long Press    ${AuthenticatorIcon}
    Mobile.Wait Until Page Contains Element    ${AppInfoOption}
    Mobile.Click Element    ${AppInfoOption}
    Mobile.Wait Until Page Contains Element    ${NotificationsOption}
    Mobile.Click Element    ${NotificationsOption}
    Mobile.Wait Until Page Contains Element    ${NotificationToggle}
    Mobile.Click Element    ${NotificationToggle}
    Mobile.Wait Until Page Contains Element    ${NotificationToggleOn}

Navigate To Authenticator Settings Page
    ${rc}    Run And Return Rc    adb shell input keyevent KEYCODE_HOME
    Should Be Equal    '${rc}'    '0'
    Mobile.Wait Until Page Contains Element    ${AuthenticatorIcon}
    Mobile.Long Press    ${AuthenticatorIcon}
    Mobile.Wait Until Page Contains Element    ${AppInfoOption}
    Mobile.Click Element    ${AppInfoOption}
    Mobile.Wait Until Page Contains Element    ${NotificationsOption}
    Mobile.Click Element    ${NotificationsOption}
    Mobile.Wait Until Page Contains Element    ${NotificationToggle}

#Open Notification Panel
#    ${rc}    Run And Return Rc    adb shell service call statusbar 1
#    Should Be Equal    '${rc}'    '0'

Open Notification Panel
    ${rc}    Run And Return Rc    adb shell input swipe 500 0 500 1000
    Should Be Equal    '${rc}'    '0'
    Sleep    4s


Close Notification Panel
    ${rc}    Run And Return Rc    adb shell service call statusbar 2
    Should Be Equal    '${rc}'    '0'

Accept Push Notification After Phone Is Locked
    Web.Wait Until Element Is Visible    //*[@id="btTapAuthPush"]    ${SleepDelay5s}
    Web.Click Element    //*[@id="btTapAuthPush"]
    Lock The Phone Screen
    sleep    1s
    ${status}    Run Keyword And Return Status    Run Keyword    Mobile.Wait Until Page Contains Element    //android.widget.Button[@text="Approve"]    ${SleepDelay5s}
    Run Keyword If    '${status}'=='True'    Mobile.Click Element    //android.widget.Button[@text="Approve"]
    ${status}    Run Keyword And Return Status    Run Keyword    Web.Wait Until Element Is Enabled    ${HomeTab}    ${SleepDelay10s}
    Run Keyword If    '${status}'=='False'    Web.Click Element    //*[@id="btnCancelPush"]

Demo Keyword
    Lock The Phone Screen
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    //*[@id="btTapAuthPush"]    ${SleepDelay5s}
    Web.Click Element    //*[@id="btTapAuthPush"]
    sleep    ${SleepDelay2s}
    Unlock The Phone Screen
    Open Notification Panel
    ${ApproveStatus}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    //android.widget.Button[@resource-id="android:id/action0"]
    Run Keyword If    '${status}'=='True'    Mobile.Click Element    //android.widget.Button[@resource-id="android:id/action0" and @content-desc="Approve"]
    ${status}    Run Keyword And Return Status    Run Keyword    Web.Wait Until Element Is Enabled    ${HomeTab}    ${SleepDelay10s}
    Run Keyword If    '${status}'=='False'    Web.Click Element    //*[@id="btnCancelPush"]

Get Token Activation Link And Add It To SurePass Auth App
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Web.Click Element    ${InstantActivationIcon}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    Sleep   ${SleepDelay5s}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    ${src_code}    Web.Get Text    ${TokenID}
    set global variable       ${src_code}
    set global variable       ${TokenActivationLink}
    log to console            ${TokenActivationLink}
    Open Test Application
    sleep    ${SleepDelay2s}
    Open Browser With Activation Link    ${TokenActivationLink}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Open Test Application
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}


Select SurePass As Default On Browser
    Mobile.Click Element    ${OpenWithSPAuthApp}
    sleep    ${SleepDelay2s}
    Mobile.Click Element    ${AlwaysButton}
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}

Approve Push Notification
    Open Test Application
#    Mobile.Wait Until Element Is Visible    ${ExpandPush}    ${StandardTimeout}
    Mobile.Click Element    ${ExpandPush}
    Sleep    2s
#    Mobile.Wait Until Element Is Visible    ${PushNotificationOptions}    ${StandardTimeout}
    Mobile.Click Element    ${PushNotificationApprove}

Reject Push Notification
    Open test application
    Mobile.Click Element    ${ExpandPush}
    Sleep    2s
#    Mobile.Wait Until Element Is Visible    ${PushNotificationOptions}    ${StandardTimeout}
    Mobile.Click Element    ${PushNotificationReject}

Open Google Authenticator Application
    Mobile.Open Application  ${AppiumURL}   automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}    deviceName=${AndroidDeviceName}
    ...      appPackage=${AndroidGoogleAuthPackageName}     appActivity=${AndroidGoogleAuthActivityName}     noReset=true


Add Google Authenticator Token and Extract Token Id
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=8    UserDefinedName=${TokenDefName}      TokenStatus=0
    sleep     ${SleepDelay5s}
    Extract Activation Code

Extract Activation Code
    Go To Token Page And Search Token       Dummy_Token
    Web.Click Element	                     xpath://*[text()= "Dummy_Token"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
    Sleep    ${SleepDelay10s}
    Web.Click Element                             ${QRCode}
    Web.Wait Until Element Is Visible             ${ImageQRCode}     60s
    ${src_value}     Web.Get Element Attribute    ${ImageQRCode}     src
    download_image    ${src_value}
    Sleep    ${SleepDelay5s}
    ${act_code}    decode activation code
    log to console    ${act_code}
    ${code}      Get Regexp Matches    ${act_code}    secret=[A-Z0-9]+
    log to console     ${code}[0][7:]
    ${finalCode}    set variable     ${code}[0][7:]
    set global variable         ${finalCode}
    [RETURN]    ${finalCode}


Add Token in Google Authenticator App
#    Mobile.Click Element     ${GetStarted}
#    Sleep  ${SleepDelay5s}
#    Mobile.Click Element     ${Back}
#    Sleep  ${SleepDelay5s}
    Mobile.Click Element     ${AddGoogleToken}
    sleep  ${SleepDelay10s}
    Mobile.Click Element     ${EnterSetupKey}
    Sleep   ${SleepDelay5s}
    Mobile.Input Text        ${AccNameTextField}      Volansys_token
    Mobile.Input Text        ${TokenIdTextField}      ${finalCode}
    sleep   ${SleepDelay10s}
    Mobile.Click Element     ${AddButton}

Extract OTP from SMS
    Open SMS Application
    sleep    ${SleepDelay2s}
    Mobile.Wait Until Element Is Visible    ${SMSTitleNumber}
    Mobile.Click Element    ${SMSTitleNumber}
    Mobile.Wait Until Element Is Visible    ${getTextFromSMS}
    ${textFromSMS}      Mobile.Get Text    ${getTextFromSMS}
    ${OTPPasscode}    Get Regexp Matches    ${textFromSMS}    \\d{6}
    log to console        ${OTPPasscode}
    set global variable    ${OTPPasscode}
    #RETURN    ${OTPCode}

Delete Google Authenticator Token
    Open Google Authenticator Application
    Mobile.Wait Until Element Is Visible    ${Vol_Token}    ${StandardTimeout}
    Mobile.Long Press    ${Vol_Token}
    Mobile.Wait Until Element Is Visible    ${Delete_GoogleToken}
    Mobile.Click Element    ${Delete_GoogleToken}
    Mobile.Wait Until Element Is Visible    ${RemoveAccount}
    Mobile.Click Element    ${RemoveAccount}
    sleep    ${SleepDelay2s}
    Mobile.Close Application

Add Token in Google Authenticator and extract OTP
#    Delete Google Authenticator Token
    Open Google Authenticator Application
    Add Token in Google Authenticator App
    Sleep   ${SleepDelay5s}
#    Mobile.Click Element       ${AddAccount}
#    Sleep   ${SleepDelay5s}
    #Fetch Passcode
    ${PinValue}     Mobile.Get Text     ${PinValue}
    log to console   ${PinValue}
    ${OTPValue}=    Remove String    ${PinValue}    ${SPACE}
    set global variable      ${OTPValue}
    Mobile.Close Application

Get SurePassId Token OTP
    Open Test Application
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    set global variable     ${OTP_Text}
    log to console     ${OTP_Text}
    ${OTPValue}=    Remove String    ${OTP_Text}    ${SPACE}
    set global variable    ${OTPValue}
    log to console         ${OTPValue}

Open DateTime Application
    Mobile.Open Application  ${AppiumURL}   automationName=${ANDROID_AUTOMATION_NAME}
    ...  platformName=${ANDROID_PLATFORM_NAME}    deviceName=${AndroidDeviceName}
    ...  app=${DateTimeApp}     appPackage=${AndroidDateTimePackageName}     appActivity=${AndroidDateTimeActivityName}     noReset=true

Open DateTime Application and Update Time behind an hour
     Open DateTime Application
     Sleep    ${SleepDelay10s}
     Mobile.Click Element                ${OpenDateTime}
     Mobile.Wait Until Element Is Visible       ${UpdateAutoTime}        ${StandardTimeout}
     Mobile.Click Element                       ${UpdateAutoTime}
     Sleep    ${SleepDelay10s}
     Mobile.Click Element                       ${SetTime}
     Sleep   ${SleepDelay5s}
     Mobile.Click Element                       ${Hour}
     Sleep    ${SleepDelay5s}
     ${HourValue}=    Mobile.Get Text                            ${Hour}
     set global variable    ${HourValue}
     log to console         ${HourValue}
     #Mobile.Click Element                      ${Min}
     #Mobile.Input Text                          ${Min}
      ${HourNumValue}    Get Regexp Matches    ${HourValue}    \\d+
      log to console     ${HourNumValue}
      #Web.Input Text       ${Hour}    ${HourNumValue}[0]
      ${IntValue}    Convert To Integer    ${HourNumValue}[0]
      ${FinalIntValue}    Evaluate    ${IntValue}-${1}
      log to console      ${FinalIntValue}
      set global variable      ${FinalIntValue}
      Mobile.Input Text      ${Hour}       ${FinalIntValue}
      Sleep    ${SleepDelay5s}
      Mobile.Click Element      ${Done}
      Mobile.Close All Applications

Open DateTime Application and Update Time ahead an hour
     Open DateTime Application
     Sleep    ${SleepDelay10s}
     Mobile.Click Element                ${OpenDateTime}
     Mobile.Wait Until Element Is Visible       ${UpdateAutoTime}        ${StandardTimeout}
     Mobile.Click Element                       ${UpdateAutoTime}
     Sleep    ${SleepDelay10s}
     Mobile.Click Element                       ${SetTime}
     Sleep   ${SleepDelay5s}
     Mobile.Click Element                       ${Hour}
     Sleep    ${SleepDelay5s}
     ${HourValue}=    Mobile.Get Text                            ${Hour}
     set global variable    ${HourValue}
     log to console         ${HourValue}
     #Mobile.Click Element                      ${Min}
     #Mobile.Input Text                          ${Min}
      ${HourNumValue}    Get Regexp Matches    ${HourValue}    \\d+
      log to console     ${HourNumValue}
      #Web.Input Text       ${Hour}    ${HourNumValue}[0]
      ${IntValue}    Convert To Integer    ${HourNumValue}[0]
      ${FinalIntValue}    Evaluate    ${IntValue}+${2}
      log to console      ${FinalIntValue}
      set global variable      ${FinalIntValue}
      Mobile.Input Text      ${Hour}       ${FinalIntValue}
      Sleep    ${SleepDelay5s}
      Mobile.Click Element      ${Done}
      Mobile.Close All Applications

Reset Current DateTime
     Open DateTime Application
     Sleep   ${SleepDelay10s}
     Mobile.Click Element                ${OpenDateTime}
     Mobile.Wait Until Element Is Visible       ${UpdateAutoTime}        ${StandardTimeout}
     Mobile.Click Element                       ${UpdateAutoTime}
     Repeat Keyword    2 times     Navigate Back
     Mobile.Close Application