*** Settings ***
Resource    ../locators/LoginPageLocator.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/MFAOptionsPortalLoginResource.robot
Resource    ../resources/OpenSystemAlertResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    Run keyword   Web.Close All Browsers

*** Test Cases ***
Verify User is able to select checkboxes for Send Sms Otp, Send Email Otp, Voice Otp, Push Sms Question,Push Question To App and Call My Phone options which are available under 'MFA Options For Portal Login' section
    [Tags]    MFA_LGN_OPSN_001        SurePassID_M3     SurePassId_Web
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Check All MFA Options For Portal Login Under Account Section

Verify User is able to Update settings after selecting checkboxes for Send Sms Otp, Send Email Otp, Voice Otp, Push Sms Question,Push Question To App and Call My Phone options which are available under 'MFA Options For Portal Login section.
    [Tags]    MFA_LGN_OPSN_002        SurePassID_M3     SurePassId_Web
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Check All MFA Options For Portal Login Under Account Section
    Click on Settings Update Button Under Account Section
    Wait Until the Update Icon Disappear
    Scroll Page To Location     0       -5000
    Verify Success message for Account Section

Verify User is able to visible all the selected options on 'SurePassId Portal Login Page' as a 2FA Options
    [Tags]    MFA_LGN_OPSN_003        SurePassID_M3     SurePassId_Web
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Check All MFA Options For Portal Login Under Account Section
    Click on Settings Update Button Under Account Section
    Wait Until the Update Icon Disappear
    Verify Success message for Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page
    Page should contain All MFA Options For Portal Login Page

Verify User is able to see only 'Send SMS OTP to my Phone(Send Sms Otp)' on Second factor authentication SurePassID Login Protal
    [Tags]    MFA_LGN_OPSN_004        SurePassID_M3     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Select Send Sms OTP Option
    Select Send Email Otp
    Click on Settings Update Button Under Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page
    Second Factor Login Contain Send SMS OTP to my Phone Option
    Web.Close All Browsers

Verify User is able to see only 'Send authentication request to your mobile device-requires SurePassId Mobile Authenticator app (Push Question To App)' on Second factor authentication SurePassID Login Protal
    [Tags]    MFA_LGN_OPSN_005        SurePassID_M3     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Select Push Question To App
    Select Send Email Otp
    Click on Settings Update Button Under Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page
    Second Factor Login Contain Push Question To App Option
    Web.Close All Browsers

Verify User is able to see only 'Send IVR authentication request to your mobile device(Call My Phone)' on Second factor authentication SurePassID Login Protal
    [Tags]    MFA_LGN_OPSN_006        SurePassID_M3     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Select Call My Phone
    Select Send Email Otp
    Click on Settings Update Button Under Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page
    Second Factor Login Contain Send IVR authentication request to your mobile device Option
    Web.Close All Browsers

Verify User is able to see only 'Say the OTP on my phone(Voice Otp)' on Second factor authentication SurePassID Login Protal
    [Tags]    MFA_LGN_OPSN_007        SurePassID_M3     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Select Voice Otp
    Select Send Email Otp
    Click on Settings Update Button Under Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page
    Second Factor Login Contain Say the OTP on my phone Option
    Web.Close All Browsers

Verify User is able to see only 'Send OTP to my Email(Send Email Otp)' on Second factor authentication SurePassID Login Protal
    [Tags]    MFA_LGN_OPSN_008        SurePassID_M3     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Select Send Email Otp
    Click on Settings Update Button Under Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page
    Second Factor Login Contain Send OTP to my Email Option
    Web.Close All Browsers

Verify User is able to see only 'Send SMS authentication request to my phone(Push Sms Question)' on Second factor authentication SurePassID Login Protal
    [Tags]    MFA_LGN_OPSN_009        SurePassID_M3     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Select Push Sms Question
    Select Send Email Otp
    Click on Settings Update Button Under Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page
    Second Factor Login Contain Send SMS authentication request to my phone Option
    Web.Close All Browsers

Verify User is able to see all the options on 'SurePassId Portal Login Page' as a 2FA Options,despite all disable options in 'MFA Options For Portal Login'section.
    [Tags]    MFA_LGN_OPSN_010        SurePassID_M3     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Click on Settings Update Button Under Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page
    Page should contain All MFA Options For Portal Login Page
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Check All MFA Options For Portal Login Under Account Section
    Click on Settings Update Button Under Account Section
    Web.Close All Browsers