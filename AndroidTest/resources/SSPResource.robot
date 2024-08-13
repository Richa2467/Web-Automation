*** Settings ***
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../labels/TokenPageLabel.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/UsersPageLocator.robot
Resource    ../locators/SSPLocator.robot
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../locators/SettingsPageLocator.robot


*** Keywords ***
Open ServicePass On Browser
    [Arguments]    ${url}=${ServicePassUrl}    ${expectedElement}=${SignInButton}     ${alias}=None
    Web.Open Browser    url=${url}    browser=${Browser}     alias=2
    Sleep    3s
    Web.Maximize Browser Window
    Web.Wait Until Element Is Visible    ${expectedElement}    ${StandardTimeout}


Submit First SSP Login Page
    [Arguments]    ${UserName2}=${EMPTY}    ${Password2}=${EMPTY}
    Web.Wait Until Element Is Enabled    ${SSPAccountName}    30s
    Web.Input Text    ${SSPAccountName}    ${UserName2}
    Web.Wait Until Element Is Enabled    ${PasswordLocator}    30s
    Web.Input Text    ${SSPPINLocator}    ${Password2}
    Web.Click Element    ${SignInButton}


Submit SSP 2FA
    Web.Wait Until Element Is Enabled     ${OTPTextLocator}   30s
    Web.Wait Until Element Is Visible     ${SSPEMailIcon}   30s
    Web.Click Element    ${SSPEMailIcon}
    sleep    ${SleepDelay10s}
    Open Mailbox    host=imap.gmail.com    user=${inputEmailId}   password=${SecondUserGmailPw}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    Delete Email    ${LATEST}
    Web.Input Text    ${OTPTextLocator}    ${otpText}
    Web.Click Element    ${SignInButton}



Submit Incorrect SSP Login Page
    #Web.Wait Until Element Is Enabled    ${SSPAccountName}    30s
    #Web.Input Text    ${SSPAccountName}    ${AccountName}
    Web.Wait Until Element Is Enabled    ${SSPAccountName}    30s
    Web.Input Text    ${SSPAccountName}    ${UserName2}
    Web.Wait Until Element Is Enabled    ${PasswordLocator}    30s
    Web.Input Text    ${SSPPINLocator}    ${Password@44}
    Web.Click Element    ${SignInButton}

Verify Expiration time for Valid Email OTP
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP      6
    Sleep     3s
    Web.Click Element        ${clickOnAccountTab}
    Web.Wait Until Element Is Enabled     ${clickOnSettingsTab}    20s
    Web.Wait Until Element Is Visible     ${clickOnSettingsTab}    20s
    Web.Click Element        ${clickOnSettingsTab}
    sleep   ${SleepDelay5s}
    ${ExpirationValue}       Web.Get Value            xpath://*[@id="ctl00_ContentPlaceHolder1_ddlSMSOTPimeMins"]
    Set Global Variable     ${ExpirationValue}
    ${ExpirationValueSeconds}    Web.Get Value        xpath://*[@id="ctl00_ContentPlaceHolder1_ddlSMSOTPTimeSecs"]
    Set Global Variable     ${ExpirationValueSeconds}
    Web.Close Browser

Input Email into Reset Password field
     [Arguments]    ${emailtext}=None
     Open ServicePass On Browser
     Web.Wait Until Element Is Enabled      ${RestPINLocator}     ${StandardTimeout}
     Web.Click Element      ${RestPINLocator}
     Web.Input Text         ${InputEmailLocator}          ${Emailtext}
     Web.Click Element      ${SendEmailLocator}


Verify Helpdesk User is able to Reset PIN.
    [Tags]    SSP_022
     Open SurePass On Browser
     Submit 2FA Page Using Email OTP      6
     Add Helpdesk User and get Password
     Open ServicePass On Browser
     Web.Wait Until Element Is Enabled       ${RestPINLocator}      ${StandardTimeout}
     Web.Click Element                       ${RestPINLocator}
     Input Email into Reset Password field        ${inputEmailId}
     Web.Element Should Contain    ${ResetPageErrorMsgLocator}             Email has been sent


Verify Email format for Password Recovery Request
     Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
     ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN  subject=${RestPwdSubjectText}    timeout=30
     set global variable    ${LATEST}
     should be true   ${LATEST}>${0}

Extract Password Rest URL
     ${MailContent}     Get Links From Email    ${LATEST}
     ${HTML} =    Get Email Body    ${LATEST}
     ${linkMatches}    Get Regexp Matches    ${HTML}    https:[\'\"]?([^\'\" ^<>]+)
     ${newURL}    Replace String Using Regexp    ${linkMatches}[0]    &amp;    &
     set global variable  ${newURL}


Enter Rest PIN fields
      [Arguments]    ${NewPIN}    ${ConfirmPIN}
      Web.Input text     ${NewPasswordLocator}          ${NewPIN}
      Web.Input text     ${ConfirmPasswordLocator}      ${ConfirmPIN}
      Web.Click Element   ${SendEmailLocator}


Verify Email for Password Changed
     Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
     ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN  subject=${PwdChangeText}    timeout=30
     set global variable    ${LATEST}
     should be true   ${LATEST}>${0}

Add Mobile Token
     Web.Click Element     ${SSPAddNewMobileToken}
     ${SSPTokenName}    Web.Get Text    ${SSPTokenLabel}
     set global variable    ${SSPTokenName}


Delete Token
     Web.Wait Until Element Is Visible    ${SSPDeleteToken}     ${StandardTimeout}
     Web.Click Element     ${SSPDeleteToken}
     sleep    ${SleepDelay5s}
     Web.Page Should Contain    Token ${SSPTokenName} has been deleted from your account.


Delete Selected Token
     [Arguments]      ${SSPTokenName}
     Web.Wait Until Element Is Visible    //a[contains(text(), "${SSPTokenName}")]     ${StandardTimeout}
     Web.Click Element     //a[contains(text(), "${SSPTokenName}")]
     ${TokenValue}    Web.Get Text       ${TokenIDValue}
     set global variable     ${TokenValue}
     sleep     ${SleepDelay5s}
     Delete Token


Activate Mobile Token
     Web.Click Element        ${ActivateBtnLocator}
     Web.Wait Until Element Is Visible    ${ActivateBtnLocator}     ${SleepDelay10s}
     Web.Wait Until Element Is Enabled    ${ActivateBtnLocator}     ${SleepDelay10s}
     Web.Click Element        ${ActivateBtnLocator}


Add U2F Token
     Web.Click Element     ${SelectU2FLocator}
     ${SSPTokenName}    Web.Get Text    ${SSPTokenLabel}
     set global variable    ${SSPTokenName}


Enable Selected Mobile Token
     Open ServicePass On Browser
     Submit First SSP Login Page      ${UserValue}    ${Passwordvalue}
     Submit SSP 2FA
     Web.Wait Until Element Is Visible     xpath://a[contains(text(), "${TokenDefName}")]     ${StandardTimeout}
     Web.Click Element                     xpath://a[contains(text(), "${TokenDefName}")]
     sleep    ${SleepDelay10s}
     Web.Click Element        ${EnableToken}
     Web.Element Should Contain     ${2FAErrorMsgLocator}     Token has been enabled.


Add Helpdesk User and retreive login details
     Add Helpdesk User and get Password
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account      TokenType=9    UserDefinedName=${TokenDefName}      TokenStatus=0
     Web.Close All Browsers

Add User and retreive login details
     Add User and get Password
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account      TokenType=9    UserDefinedName=${TokenDefName}      TokenStatus=0
     Web.Close All Browsers

Add Helpdesk User and get Password
     Open SurePass On Browser
     Submit 2FA Page Using Email OTP         6
     Delete User form the User List if existing      ${inputUserName}
     Add Helpdesk User
     ${UserValue3}    Web.Get Value    ${UserNameField}
     set global variable    ${UserValue3}
     log to console      ${UserValue3}

Add User and get Password
     Open SurePass On Browser
     Submit 2FA Page Using Email OTP         6
     Delete User form the User List if existing      ${inputUserName}
     Add User and retrieve login details
#     ${UserValue3}    Web.Get Value    ${UserNameField}
#     set global variable    ${UserValue3}
#     log to console      ${UserValue3}