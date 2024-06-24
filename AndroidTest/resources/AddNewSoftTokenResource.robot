*** Settings ***
Documentation    Users Page related resources including this file.
Library     OperatingSystem
Resource    ../resources/LoginPageResource.robot
Resource    ../labels/UsersPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../locators/UsersPageLocator.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/TokenPageLocator.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../locators/AddNewSoftTokenLocator.robot
Resource    ../labels/AddNewSoftTokenLabel.robot

*** Keywords ***
Select Token Type on Add Token Page
    [Arguments]    ${TokenType}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible     ${selectTokenType}       ${StandardTimeout}
    Web.Select From List by Value   ${selectTokenType}   ${TokenType}

Try to edit Printed Serial and Internal Serial Number Field
    ${status}   Run Keyword And Return Status	     Web.Wait Until Element Is Enabled    ${editPrintedSerialData}    ${StandardTimeout}=${SleepDelay5s}
    ${status}   Convert To String   ${status}
    Should Be Equal  ${status}   False
    ${status}   Run Keyword And Return Status	     Web.Wait Until Element Is Enabled    ${editSerialNumberData}    ${StandardTimeout}=${SleepDelay5s}
    ${status}   Convert To String   ${status}
    Should Be Equal  ${status}   False

Select OTP Type
    [Arguments]    ${OTPType}
    Web.Wait Until Element Is Visible     ${dataOTPType}       ${StandardTimeout}
    Web.Select From List by Value   ${dataOTPType}   ${OTPType}

Check Inital Counter Edit Field
    Web.Page Should Contain Element     ${intialCounter}       ${StandardTimeout}
    ${status}   Run Keyword And Return Status	     Web.Input Text    ${intialCounter}    ${randomNumber}
    ${status}   Convert To String   ${status}
    Should Be Equal  ${status}   False

Check Starting Time Edit Field
    Web.Page Should Contain Element     ${intialCounter}       ${StandardTimeout}
    ${status}   Run Keyword And Return Status	     Web.Input Text    ${intialCounter}    ${randomNumber}
    ${status}   Convert To String   ${status}
    Should Be Equal  ${status}   False

Get Printed Serial Number
    Web.Wait Until Element Is Visible    ${editPrintedSerialData}   ${StandardTimeout}
    ${tokenSrNumber}     Web.Get Value    ${editPrintedSerialData}
    Set Global Variable     ${tokenSrNumber}
    RETURN    ${tokenSrNumber}

Get Token ID
    Web.Wait Until Element Is Visible    ${tokenIDField}   ${StandardTimeout}
    ${tokenID}     Web.Get Value    ${tokenIDField}
    Set Global Variable     ${tokenID}
    RETURN    ${tokenID}

Click on Email Icon beside Token ID
    Sleep   ${SleepDelay2s}
    Web.Wait Until Element Is Visible    ${emailIconBesideTknId}    ${StandardTimeout}
    Web.Click Element	  ${emailIconBesideTknId}

Check Received Email Message
    [Arguments]    ${TokenID}
    Sleep   ${SleepDelay10s}
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    Should Contain  ${HTML}     Your DeviceId is ${TokenID}.  Save your DeviceId. You might require it later for activation.
    Should Not Contain  ${HTML}     %activatedeviceurl%

Select OTP length
    [Arguments]    ${OTPlength}
    Web.Select From List by Value   ${dataOTPLength}   ${OTPlength}

Check options for Authenticator Usage
    Web.Wait Until Element Is Visible    ${AuthenticatorUsage}    ${StandardTimeout}
    Web.Page Should Contain         OTP Authentication Only
    Web.Page Should Not Contain         Push Authentication Only
    Web.Page Should Not Contain         OTP and Push Authentication

Edit Maximum Uses Field
    [Arguments]    ${inputUsersNumber}
    Web.Wait Until Element Is Enabled    ${maxUsesDataEditField}    ${StandardTimeout}
    Web.Input Text    ${maxUsesDataEditField}    ${inputUsersNumber}

Login through SurePassID App
    [Arguments]    ${LoginNumber}
    FOR     ${i}  IN RANGE      ${LoginNumber}
        Click On Logout option
        Submit First Login Page
        Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
        Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
        Open Test Application
        ${AppOTP}   Mobile.Get Text    ${GetAppOTP}
        Web.Input Text    ${OTPTextLocator}    ${AppOTP}
        Web.Click Element    ${VerifyOtpButton}
        sleep    60s
    END

Login through Desktop Authenticator Application
    [Arguments]    ${LoginNumber}
    FOR     ${i}  IN RANGE      ${LoginNumber}
        Click On Logout option
        Submit First Login Page
        Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
        Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
        ${DesktopOTPValue}      Windows.Get Element Attribute    ${OTPLabel}   Name
        Web.Input Text    ${OTPTextLocator}    ${DesktopOTPValue}
        Web.Click Element    ${VerifyOtpButton}
        sleep    30s
    END
