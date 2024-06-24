*** Settings ***
Documentation    Suite description
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/SettingsPageResource.robot

Suite Setup    Run Keywords    Open SurePass On Browser
...          AND              Submit 2FA Page Using Email OTP    6
...          AND              Select the Checkbox if Terms of Use Page is visible
Suite Teardown    run keyword    Web.Close All Browsers

*** Test Cases ***
Verify User should not be able to edit Maximum Users Licensed, Maximum Tokens Licensed and Account Expiration Date fields in the 'Account Limits' section
    [Tags]   SETTINGS_001       SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Web.Wait Until Element Is Visible     ${MaxUsersLicensedTextField}
    Web.Element Should Be Disabled        ${MaxUsersLicensedTextField}
    Web.Wait Until Element Is Visible     ${MaxTokensLicensedTextField}
    Web.Element Should Be Disabled        ${MaxTokensLicensedTextField}
    Web.Element Should Be Disabled        ${AccountExpDatePicker}

Verify User should not be able to edit 'Current Culture' field in the 'Culture and Time Zone'section
    [Tags]   SETTINGS_002       SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Web.Wait Until Element Is Visible     ${CurrCulureTextFiled}
    Web.Element Should Be Disabled        ${CurrCulureTextFiled}

Verify User is able to select 'Time Zone' field from dropdown list in the 'Culture and Time Zone' section
    [Tags]   SETTINGS_003       SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Select Timezone    India Standard Time

Verify User is able to edit 'Allowable Failed OTP Validations Per Token' field in the 'Security' section
    [Tags]   SETTINGS_004       SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Web.Wait Until Element Is Visible     ${otpValidationToken}   ${StandardTimeout}
    Web.Input Text                        ${otpValidationToken}    ${otpValidationNumber}
    Update and Confirm Success Message  ${SettingsUpdateMsg}

Verify User is able to select 'Account Password Expiration' field from dropdown list in the 'Security'section
    [Tags]   SETTINGS_005       SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Web.Click Element                     ${AccPwdExpDropdown}
    Web.Select From List By Value         ${AccPwdExpDropdown}     ${AccountPWValidationValue}
    Update and Confirm Success Message  ${SettingsUpdateMsg}

Verify User is able to Update time in Minutes and Seconds for 'Mobile notifications are valid for' field
    [Tags]  SETTINGS_006        SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Select Mobile notification valid for time from dropdown list      ValidMobileMin=2    ValidMobileSec=10
    Update and Confirm Success Message  ${SettingsUpdateMsg}
    Enter the initial data once again for MOTP notification

Verify User is able to Update time in Minutes and Seconds for 'Email OTP is valid for'field
    [Tags]  SETTINGS_007        SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Select Email notification valid for time from dropdown list      ValidEmailMin=2    ValidEmailSec=10
    Update and Confirm Success Message  ${SettingsUpdateMsg}
    Enter the initial data once again for MOTP notification

Verify User is able to Update time in Minutes and Seconds for 'Temporary OTP is valid for'field
    [Tags]  SETTINGS_008        SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Select Temporary notification valid for time from dropdown list      ValidTempMin=2    ValidTempSec=10
    Update and Confirm Success Message  ${SettingsUpdateMsg}
    Enter the initial data once again for MOTP notification

Verify User is able to check only one option ( SurePassID Directory ) available in dropdown list for 'User Authentication Method'
    [Tags]  SETTINGS_009        SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    ${Values}    Web.Get Selected List Labels     ${UsrAuthMethodDropdown}
    Should Be Equal     ${Values}[0]           SurePassID Directory

Verify User is able to tick-mark Severe, Warning, Success, Action Required and Informational options which are available under 'Event Log Synchronization Filters' section
    [Tags]  SETTINGS_010        SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Mark all the options checkboxes

Verify User is able to Update settings after selecting checkboxes for Severe, Warning, Success, Action Required and Informational options which are available under Event Log Synchronization Filters section
    [Tags]  SETTINGS_011        SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Uncheck All the options
    Update and Confirm Success Message  ${SettingsUpdateMsg}
    Mark all the options checkboxes
    Update and Confirm Success Message  ${SettingsUpdateMsg}

Verify User is able to close settings Page
    [Tags]  SETTINGS_012        SurePassID_M2       SurePassId_Web
    Click on Account Tab
    Navigate to Settings Tab
    Web.Wait Until Element Is Visible    ${CloseButton}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${CloseButton}
    Web.Element Should Contain     ${AccPageHeader}     Update Account
