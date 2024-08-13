*** Settings ***
Documentation    Suite description
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../labels/SettingsPageLabel.robot
Resource    ../locators/SettingsPageLocator.robot

*** Keywords ***
Click on Account Tab
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${clickOnAccountTab}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${clickOnAccountTab}

Navigate to Settings Tab
    Web.Wait Until Element Is Visible    ${clickOnSettingsTab}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${clickOnSettingsTab}

Enter the different valid detail
    Web.Wait Until Element Is Enabled    ${otpValidationToken}    ${StandardTimeout}
    Web.Input Text    ${otpValidationToken}    20

Enter the initial data once again
    Web.Wait Until Element Is Enabled    ${otpValidationToken}    ${StandardTimeout}
    Web.Input Text    ${otpValidationToken}    10

Click on Settings Update button
    Web.Wait Until Element Is Visible    ${clickOnSettingsUpdateBtn}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${clickOnSettingsUpdateBtn}

Verify Settings updated Success Message receive or not
    Web.Wait Until Element Is Visible    ${successBarforSettingsPage}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successBarforSettingsPage}
    Should Be Equal     ${SuccessMsg}       Record has been updated.

Select Mobile notification valid for time from dropdown list
    [Arguments]     ${ValidMobileMin}=None    ${ValidMobileSec}=None
    set global variable             ${ValidMobileMin}
    set global variable             ${ValidMobileSec}
    Web.Select From List by Value   ${mobileNotiDropdown}   ${ValidMobileMin}
    Web.Select From List by Value   ${MobileNotfValidSec}   ${ValidMobileSec}

Select Email notification valid for time from dropdown list
    [Arguments]     ${ValidEmailMin}=None    ${ValidEmailSec}=None
    set global variable             ${ValidEmailMin}
    set global variable             ${ValidEmailSec}
    Web.Select From List by Value   ${EmailNotfValidMin}   ${ValidEmailMin}
    Web.Select From List by Value   ${EmailNotfValidSec}   ${ValidEmailSec}

Select Temporary notification valid for time from dropdown list
    [Arguments]     ${ValidTempMin}=None    ${ValidTempSec}=None
    set global variable             ${ValidTempMin}
    set global variable             ${ValidTempSec}
    Web.Select From List by Value   ${TempNotfValidMin}   ${ValidTempMin}
    Web.Select From List by Value   ${TempNotfValidSec}   ${ValidTempSec}

Enter the initial data once again for MOTP notification
    Select Mobile notification valid for time from dropdown list         ValidMobileMin=1     ValidMobileSec=0
    Select Email notification valid for time from dropdown list          ValidEmailMin=1      ValidEmailSec=0
    Select Temporary notification valid for time from dropdown list      ValidTempMin=1       ValidTempSec=0
    Update and Confirm Success Message  ${SettingsUpdateMsg}

Uncheck All the options
    Web.Wait Until Element Is Enabled    ${severeChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${severeChecbox}
    Web.Wait Until Element Is Enabled    ${warningChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${warningChecbox}
    Web.Wait Until Element Is Enabled    ${SuccessChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${SuccessChecbox}
    Web.Wait Until Element Is Enabled    ${ActionChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${ActionChecbox}
    Web.Wait Until Element Is Enabled    ${InfoChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${InfoChecbox}

Mark all the options checkboxes
    Web.Wait Until Element Is Enabled    ${severeChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${severeChecbox}
    Web.Wait Until Element Is Enabled    ${warningChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${warningChecbox}
    Web.Wait Until Element Is Enabled    ${SuccessChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${SuccessChecbox}
    Web.Wait Until Element Is Enabled    ${ActionChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${ActionChecbox}
    Web.Wait Until Element Is Enabled    ${InfoChecbox}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${InfoChecbox}

Uncheck all MFA Options For Portal Login
    Web.Wait Until Element Is Enabled    ${SendOtpSms}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${SendOtpSms}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${SendOtpSms}

    Web.Wait Until Element Is Enabled    ${SendOtpEmail}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${SendOtpEmail}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${SendOtpEmail}

    Web.Wait Until Element Is Enabled    ${SendOtpVoice}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${SendOtpVoice}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${SendOtpVoice}

    Web.Wait Until Element Is Enabled    ${PushSmsQuestion}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${PushSmsQuestion}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${PushSmsQuestion}

    Web.Wait Until Element Is Enabled    ${PushAppQuestion}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${PushAppQuestion}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${PushAppQuestion}

    Web.Wait Until Element Is Enabled    ${PushVoice}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${PushVoice}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${PushVoice}

Check All MFA options
    Web.Wait Until Element Is Enabled    ${SendOtpSms}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${SendOtpSms}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${SendOtpSms}

    Web.Wait Until Element Is Enabled    ${SendOtpEmail}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${SendOtpEmail}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${SendOtpEmail}

    Web.Wait Until Element Is Enabled    ${SendOtpVoice}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${SendOtpVoice}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${SendOtpVoice}

    Web.Wait Until Element Is Enabled    ${PushSmsQuestion}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${PushSmsQuestion}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${PushSmsQuestion}

    Web.Wait Until Element Is Enabled    ${PushAppQuestion}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${PushAppQuestion}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${PushAppQuestion}

    Web.Wait Until Element Is Enabled    ${PushVoice}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${PushVoice}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${PushVoice}

Mark Only Send Email OTP option
    Web.Wait Until Element Is Enabled    ${SendOtpEmail}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element	  ${SendOtpEmail}

Check Status of Send Email OTP checkbox
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${SendOtpEmail}
    Run Keyword If    '${status}' == 'False'  Mark Only Send Email OTP option

Click On Logout option
    Web.Wait Until Element Is Enabled  ${ClickOnLogout}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${ClickOnLogout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnLogout}

Page should contain only Send Email Otp
    Web.Page Should Contain Element     ${btnEMailOTP}       ${StandardTimeout}
    Web.Page Should Not Contain Element     ${btnTapAuthPush}       ${StandardTimeout}
    Web.Page Should Not Contain Element     ${btVoicePush}       ${StandardTimeout}
    Web.Page Should Not Contain Element     ${btnSendSMSOTP}       ${StandardTimeout}
    Web.Page Should Not Contain Element     ${btnSendVoiceOTP}       ${StandardTimeout}
    Web.Page Should Not Contain Element     ${btSMSPush}       ${StandardTimeout}

Verify Success message for Account Settings
    Web.Wait Until Element Is Visible    ${SettingsSuccessBar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${SettingsSuccessBar}
    Should Be Equal     ${SuccessMsg}       Record has been updated.

Page should contain All MFA Options For Portal Login
    Web.Page Should Contain Element     ${btnEMailOTP}       ${StandardTimeout}
    Web.Page Should Contain Element     ${btnTapAuthPush}       ${StandardTimeout}
    Web.Page Should Contain Element     ${btVoicePush}       ${StandardTimeout}
    Web.Page Should Contain Element     ${btnSendSMSOTP}       ${StandardTimeout}
    Web.Page Should Contain Element     ${btnSendVoiceOTP}       ${StandardTimeout}
    Web.Page Should Contain Element     ${btSMSPush}       ${StandardTimeout}

Select Timezone
    [Arguments]          ${TimeZoneValue}
    Web.Wait Until Element Is Visible        ${TimezoneDropdown}               ${StandardTimeout}
    Web.Click Element                        ${TimezoneDropdown}
    Web.Select From List By Value            ${TimezoneDropdown}               ${TimeZoneValue}
    Update and Confirm Success Message  ${SettingsUpdateMsg}

Update and Confirm Success Message
    [Arguments]          ${Message}
    Web.Wait Until Element Is Visible        ${clickOnSettingsUpdateBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element                        ${clickOnSettingsUpdateBtn}
    Web.Element Text Should Be          ${SuccessBarforSettingsPage}     Success
