*** Settings ***
Documentation    Suite description
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/SettingsPageResource.robot

Suite Setup    Run Keywords    Open SurePass On Browser
...          AND              Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword    Web.Close All Browsers

*** Test Cases ***
Verify User is able to see only 'Send OTP to my Email(Send Email Otp)' on Second factor authentication SurePassID Login Protal
    [Tags]  MFA_LGN_OPSN_008
    Click on account tab
    Uncheck all MFA Options For Portal Login
    Check Status of Send Email OTP checkbox
    Click on Settings Update button
    Verify Success message for Account Settings
    Click On Logout option
    Open SurePass On Browser
    Submit First Login Page
    Page should contain only Send Email Otp
    Web.Close Browser
    [Teardown]  Run Keywords  Open SurePass On Browser
    ...  AND                  Submit 2FA Page Using Email OTP    6
    ...  AND                  Click on account tab
    ...  AND                  Check All MFA options
    ...  AND                  Click on Settings Update button

Verify User is able to see all the options on 'SurePassId Portal Login Page' as a 2FA Options,despite all disable options in 'MFA Options For Portal Login'section
    [Tags]  MFA_LGN_OPSN_010   SurePassID_POC
    Click on Home Tab
    Click on account tab
    Uncheck all MFA Options For Portal Login
    Click on Settings Update button
    Verify Success message for Account Settings
    Click On Logout option
    Open SurePass On Browser
    Submit First Login Page
    Page should contain All MFA Options For Portal Login
    [Teardown]  Run Keywords  Open SurePass On Browser
    ...  AND                  Submit 2FA Page Using Email OTP    6
    ...  AND                  Click on account tab
    ...  AND                  Check All MFA options
    ...  AND                  Click on Settings Update button