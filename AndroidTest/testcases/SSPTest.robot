*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/SSPResource.robot
Resource    ../locators/LoginPageLocator.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../labels/SSPPageLabel.robot
Resource    ../locators/SettingsPageLocator.robot

Suite Setup    Run Keywords    Add Helpdesk User and retreive login details
...            AND              Open ServicePass On Browser
Suite Teardown      Close All Browsers

*** Test Cases ***

Verify User should receive proper error message if any of the Login field(s) is blank.
   [Tags]  SSP_004
   [Setup]   Run Keyword       Open ServicePass On Browser
   Submit First SSP Login Page
   Web.Wait Until Element is Visible    ${LoginErrorMsgLocator}      ${SleepDelay10s}
   Web.Wait Until Element is Enabled    ${LoginErrorMsgLocator}
   Web.Element Should Contain     ${LoginErrorMsgLocator}       Username is a mandatory field. Please enter a username.
   #Web.Close Window

Verify User is not able to Login incase any of the login fields is incorrect or invalid.
   [Tags]  SSP_003
   Submit First SSP Login Page     ${IncorrectUserValue3}      ${IncorrectPasswordvalue3}
   Web.Wait Until Element is Visible    ${LoginErrorMsgLocator}      ${SleepDelay10s}
   Web.Wait Until Element is Enabled    ${LoginErrorMsgLocator}
   Web.Element Should Contain     ${LoginErrorMsgLocator}       User login failure for ${IncorrectUserValue3}. Password is incorrect, account does not exist or account is disabled.

Verify User is not able to Login incase any of the login fields is incorrect or invalid.
   [Tags]  SSP_003_1
   Submit First SSP Login Page

Verify User is able to Login successfully with an account of the same Tenant.
    [Tags]  SSP_001_002
    Submit First SSP Login Page   ${UserValue3}    ${Passwordvalue3}
    Submit SSP 2FA
    Web.Wait Until Element Is Visible    ${SSPAddNewMobileToken}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${SSPAddNewMobileToken}     ${StandardTimeout}

Verify user should get proper validation message if incorrect/blank OTP via Email is entered while 2FA.
    [Tags]      SSP_009
    [Setup]   Run Keyword       Open ServicePass On Browser
    Submit First SSP Login Page   ${UserValue3}    ${Passwordvalue3}
    Web.Click Element    ${SignInButton}

Verify user should get proper validation message if expired OTP via Email is entered while 2FA.
    [Tags]  SSP_010
    Verify Expiration time for Valid Email OTP
    Open ServicePass On Browser
    Submit First SSP Login Page     UserName2=${UserValue3}       Password2=${Passwordvalue3}
    Web.Wait Until Element Is Enabled     ${OTPTextLocator}   30s
    Web.Wait Until Element Is Visible     ${SSPEMailIcon}   30s
    Web.Click Element    ${SSPEMailIcon}
    sleep    ${SleepDelay10s}
    Open Mailbox    host=imap.gmail.com    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText1}    Get Regexp Matches    ${HTML}    \\d{6}
    Delete Email    ${LATEST}
    sleep      ${ExpirationValue}min ${ExpirationValueSeconds}s
    Web.Input Text    ${OTPTextLocator}    ${otpText1}
    Web.Click Element    ${SignInButton}
    Web.Element Should Contain     ${LoginErrorMsgLocator}       Passcode could not be validated. Please verify that you have the correct token and you have entered the correct passcode. If you are certain these are correct then contact your system administrator.

Verify Admin is not able to update Password from ServicePass Portal
    [Tags]      SSP_016
    [Setup]   Run Keywords       Close All Browsers
    ...  AND                     Open SurePass On Browser
    ...  AND                     Submit 2FA Page Using Email OTP    6
    ...  AND                     Delete User form the User List if existing     ${inputUserName2}
    ...  AND                     Add Admin User2 and retreive login detials
    Open ServicePass On Browser
    Web.Wait Until Element Is Enabled       ${RestPINLocator}      ${StandardTimeout}
    Web.Click Element                       ${RestPINLocator}
    Input Email into Reset Password field      ${inputEmailId2}
    Web.Element Should Contain    ${ResetPageErrorMsgLocator}               Password recovery is not possible for ${inputEmailId2}. This user must use the administration portal password recovery.

Verify User is able to Reset PIN.
    [Tags]    SSP_017
    [Setup]   Run Keywords       Open SurePass On Browser
    ...  AND                     Submit 2FA Page Using Email OTP    6
    ...  AND                     Delete User form the User List if existing      ${inputUserName2}
    ...  AND                     Add User2 and retreive login detials
    Open ServicePass On Browser
    Web.Wait Until Element Is Enabled       ${RestPINLocator}      ${StandardTimeout}
    Web.Click Element                       ${RestPINLocator}
    Input Email into Reset Password field        ${inputEmailId2}
    Web.Element Should Contain    ${ResetPageErrorMsgLocator}             Email has been sent

Verify Helpdesk User is able to Reset PIN.
    [Tags]    SSP_018
    [Setup]   Run Keywords       Close All Browsers
    ...  AND                     Add Helpdesk User and get Password
    Open ServicePass On Browser
    Web.Wait Until Element Is Enabled       ${RestPINLocator}      ${StandardTimeout}
    Web.Click Element                       ${RestPINLocator}
    Input Email into Reset Password field        ${inputEmailId}
    Web.Element Should Contain    ${ResetPageErrorMsgLocator}             This user must use the administration portal password recovery.

Verify User should receive proper validation message if Email entered is not registered / invalid.
    [Tags]    SSP_019
    Open ServicePass On Browser
    Web.Wait Until Element Is Enabled      ${RestPINLocator}     ${StandardTimeout}
    Web.Click Element      ${RestPINLocator}
    Web.Input Text         ${InputEmailLocator}          incorrect.mail@volansystech.com
    Web.Click Element      ${SendEmailLocator}
    Web.Element Should Contain    ${ResetPageErrorMsgLocator}           Send password recovery email for incorrect.mail@volansystech.com failed. This user name or password is invalid.

Verify user should receive proper formatted email after requesting for Reset PIN.
    [Tags]    SSP_020
     Verify Helpdesk User is able to Reset PIN.
     Input Email into Reset Password field         emailtext=inputEmailId
     Verify Email format for Password Recovery Request
     ${MailContent}     Get Links From Email    ${LATEST}
     ${HTML} =    Get Email Body    ${LATEST}
     ${linkMatches}    Get Regexp Matches    ${HTML}    https:[\'\"]?([^\'\" ^<>]+)
     ${newURL}    Replace String Using Regexp    ${linkMatches}[0]    &amp;    &
     set global variable  ${newURL}

Verify user should reset password with the available link in email notification.
    [Tags]  SSP_021
     Input Email into Reset Password field         emailtext=${inputEmailId}
     Verify Email format for Password Recovery Request
     Extract Password Rest URL
     Open SurePass On Browser    url=${newURL}     expectedElement=//*[@id="lblNewPassword"]

Verify user gets proper validation message if PIN entered on Reset PIN is incorrect.
    [Tags]   SSP_022
    Add User and retreive login details
    Input Email into Reset Password field         emailtext=${inputEmailId}
    Verify Email format for Password Recovery Request
    Extract Password Rest URL
    Open SurePass On Browser    url=${newURL}     expectedElement=//*[@id="lblNewPassword"]
    Enter Rest PIN fields    NewPIN=12345    ConfirmPIN=12345
    Web.Element Should Contain     ${ResetPageErrorMsgLocator}         PIN is invalid.

Verify user gets proper validation message if New PIN and confirm PIN are not same.
    [Tags]   SSP_023
    Add User and retreive login details
    Input Email into Reset Password field         emailtext=${inputEmailId}
    Verify Email format for Password Recovery Request
    Extract Password Rest URL
    Open SurePass On Browser    url=${newURL}     expectedElement=//*[@id="lblNewPassword"]
    Enter Rest PIN fields    NewPIN=123456     ConfirmPIN=123457
    Web.Element Should Contain      ${ResetPageErrorMsgLocator}       New PIN and Confirm PIN do not match.

After successful reset of PIN, user should receive email notification of successful update of new PIN.
   [Tags]   SSP_024
    Add User and retreive login details
    Input Email into Reset Password field         emailtext=${inputEmailId}
    Verify Email format for Password Recovery Request
    Extract Password Rest URL
    Open SurePass On Browser    url=${newURL}     expectedElement=//*[@id="lblNewPassword"]
    Enter Rest PIN fields    NewPIN=123456     ConfirmPIN=123456
    Verify Email for Password Changed

User should be able to login with updated PIN.
    [Tags]    SSP_025
    [Setup]   Run Keywords       Close All Browsers
    ...  AND                     Add User and retreive login details
    Input Email into Reset Password field         emailtext=${inputEmailId}
    Verify Email format for Password Recovery Request
    Extract Password Rest URL
    Open SurePass On Browser    url=${newURL}     expectedElement=//*[@id="lblNewPassword"]
    Enter Rest PIN fields    NewPIN=123456     ConfirmPIN=123456
    Web.Click Element       ${RestPwdCloseLocator}
    Submit First SSP Login Page   ${inputUserName}    ${CorrectPIN}
    Web.Wait Until Element Is Enabled     ${OTPTextLocator}   30s
    Web.Wait Until Element Is Visible     ${SSPEMailIcon}   30s
    Web.Click Element    ${SSPEMailIcon}
    sleep    ${SleepDelay10s}
    Open Mailbox    host=imap.gmail.com    user=${inputEmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    log to console     ${otpText}
    Delete Email    ${LATEST}
    sleep    ${SleepDelay10s}
    Web.Input Text    ${OTPTextLocator}    ${otpText}
    Web.Click Element    ${SignInButton}
    Web.Wait Until Element Is Visible    ${SSPAddNewMobileToken}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${SSPAddNewMobileToken}     ${StandardTimeout}

Verify User is able to add Mobile Token.
    [Tags]   SSP_026
    [Setup]   Run Keywords       Close All Browsers
    ...    AND                   Open SurePass On Browser
    ...   AND                    Submit 2FA Page Using Email OTP         6
    ...  AND                     Add New Helpdesk User with SurePassId Authentication Token
    Open ServicePass On Browser
    Submit First SSP Login Page   ${UserValue3}    ${Passwordvalue3}
    Submit SSP 2FA
    Web.Click Element     ${SSPAddNewMobileToken}
    ${SSPTokenName}    Web.Get Text    ${SSPTokenLabel}
    set global variable    ${SSPTokenName}

Verify User is able to activate Mobile Token
     [Tags]    SSP_027
     [Setup]   Run Keywords       Close All Browsers
     ...      AND                   Open SurePass On Browser
     ...     AND                    Submit 2FA Page Using Email OTP         6
     ...  AND                     Add New Helpdesk User with SurePassId Authentication Token
     Open ServicePass On Browser
     Submit First SSP Login Page   ${UserValue3}    ${Passwordvalue3}
     Submit SSP 2FA
     Add Mobile Token
     Activate Mobile Token
     Web.Click Element         ${BackBtnLocator}
     Web.Wait Until Element Is Visible    //a[contains(text(), "${SSPTokenName}")]     ${StandardTimeout}
     Web.Click Element     //a[contains(text(), "${SSPTokenName}")]
     Delete Token

Verify user should get validation message if Passcode text field is blank or incorrect.
     [Tags]    SSP_029
     [Setup]   Run Keywords         Open SurePass On Browser
      ...  AND                     Submit 2FA Page Using Email OTP    6
      ...  AND                     Add New Helpdesk User with SurePassId Authentication Token
     Open ServicePass On Browser
     Submit First SSP Login Page   ${inputUserName}    ${Passwordvalue3}
     Submit SSP 2FA
     Add Mobile Token
     Activate Mobile Token
     Web.Click Element     ${VerifyBtnLocator}
     Web.Element Should Contain      ${ResetPageErrorMsgLocator}       Passcode is invalid
     Web.Click Element         ${BackBtnLocator}
     Delete Token

#User should be able to delete token successfully.
#    [Tags]    SSP_0040
#    Delete Selected Token   ${SSPTokenName}
#
#Verify User is able to add FIDO U2F token.
#    [Tags]    SSP_33 SSP_34
#    Open ServicePass On Browser
#    Submit First SSP Login Page    ${UserValue3}    ${Passwordvalue3}
#    Submit SSP 2FA
#    Add U2F Token
#    Web.Element Should Contain      ${ResetPageErrorMsgLocator}       This token is currently NOT registered as Fido key for this account.
#    Delete Token
#    Web.Close Browser















