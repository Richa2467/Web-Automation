*** Settings ***
Documentation   This is the resource file for ajio page.
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/UsersPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/LoginPageLocator.robot

Library    ImapLibrary2
Library    SeleniumLibrary    run_on_failure=Web.Capture Page Screenshot    WITH NAME       Web
Library    ApplicationLibrary.DesktopLibrary    run_on_failure=Windows.Capture Page Screenshot    WITH NAME       Windows
Library    AppiumLibrary    run_on_failure=Mobile.Capture Page Screenshot    WITH NAME       Mobile
Library    Collections
Library    String
Library    DateTime
Library    pyotp
Library    app

*** Keywords ***
Open SurePass On Browser
    [Arguments]    ${url}=${SurePassUrl}    ${expectedElement}=${SignInButton}
    Web.Open Browser    url=${url}    browser=${Browser}
    Web.Maximize Browser Window
    Web.Wait Until Element Is Visible    ${expectedElement}    ${StandardTimeout}
    #Web.Open Browser  url=${url}  browser=${Browser}
    #Web.Set Window Size  1050  1080
    #Web.Set Window position  0  0
    #Web.Wait Until Element Is Visible  ${expectedElement}  ${StandardTimeout}

Submit First Login Page
    Web.Wait Until Element Is Enabled             ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Input Text       ${UserNameLocator}       ${UserName}
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text       ${PasswordLocator}       ${Password}
    Web.Click Element    ${SignInButton}

Submit First Login Page for Dummy User
    Web.Wait Until Element Is Enabled             ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Input Text       ${UserNameLocator}        ${UserValue2}          #TestUserName_0033
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text       ${PasswordLocator}       ${Passwordvalue2}        #WTBTUSRanfasn[0
    Web.Click Element    ${SignInButton}

Submit 2FA Page Using Email OTP
    [Arguments]    ${OtpLength}
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Web.Click Element    ${EmailIcon}
    Sleep    ${SleepDelay5s}    # Waiting for email to arrive
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{${OtpLength}}
    Delete Email         ${LATEST}
    Web.Input Text       ${OtpTextBox}    ${otpText}[0]
    #Web.Input Text       ${OtpTextBox}    ${otpText}
    Web.Click Element    ${VerifyOtpButton}
    #Web.Wait Until Element Is Enabled     ${HomeTab}    ${StandardTimeout}
    Select the Checkbox if Terms of Use Page is visible

Submit 2FA For Invalid OTP
    [Arguments]    ${OtpLength}
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Web.Click Element    ${EmailIcon}
    Sleep    ${SleepDelay5s}    # Waiting for email to arrive
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{${OtpLength}}
    Delete Email         ${LATEST}
    Web.Input Text       ${OtpTextBox}    ${otpText}[0]
    #Web.Input Text       ${OtpTextBox}    ${otpText}
    Web.Click Element    ${VerifyOtpButton}

Submit First Login Page for Helpdesk User
    [Arguments]     ${HepldeskUName}   ${HelpdeskPwd}
    Web.Wait Until Element Is Enabled    ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text                       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled    ${UserNameLocator}    ${StandardTimeout}
    Web.Input Text                       ${UserNameLocator}    ${HepldeskUName}
    Web.Wait Until Element Is Enabled    ${PasswordLocator}    ${StandardTimeout}
    Web.Input Text                       ${PasswordLocator}    ${HelpdeskPwd}
    Web.Click Element                    ${SignInButton}
    Submit 2FA Page Using Email OTP HelpDeskUser     6

Submit 2FA Page Using Email OTP HelpDeskUser
     [Arguments]    ${OtpLength}
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Web.Click Element    ${EmailIcon}
    sleep    ${SleepDelay5s}    # Waiting for email to arrive
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{${OtpLength}}
    Delete Email         ${LATEST}
    Web.Input Text       ${OtpTextBox}    ${otpText}[0]
    Web.Click Element    ${VerifyOtpButton}

Select the Checkbox if Terms of Use Page is visible
    ${Status}   Run Keyword and return status   Web.Wait Until Element Is Visible    ${TermOfUserPage}    ${StandardTimeout}
    Run Keyword If    '${status}' == 'True'  Select the Checkbox for the Agree to terms of use

Select the Checkbox for the Agree to terms of use
    Scroll Page To Location   0   5000
    Web.Wait Until Element Is Visible    ${CheckBoxAgreeToTermUse}    ${StandardTimeout}
    Web.Click Element	  ${CheckBoxAgreeToTermUse}
    Select the Ack Button

Select the Ack Button
    Web.Wait Until Element Is Visible    ${selectAckBtn}    ${StandardTimeout}
    Web.Click Element	  ${selectAckBtn}

Get OTP From Mobile APP And Enter It
    Open Test Application
    Mobile.Wait Until Element Is Visible    ${GetAppOTP}
    ${AppOTP}=    Mobile.Get Text    ${GetAppOTP}
    Web.Input Text    //*[@id="tbxOTP"]    ${AppOTP}
    Web.Click Element    //*[@id="btnVerifyOtp"]
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}

Send Push Notification
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    //*[@id="btTapAuthPush"]    ${StandardTimeout}
    Web.Click Element    //*[@id="btTapAuthPush"]

Enter OTP On 2FA Page
#    Submit First Login Page
    Open Test Application
    [Arguments]    ${AppOTP}
    Web.Input Text    //*[@id="tbxOTP"]    ${AppOTP}
    Web.Click Element    //*[@id="btnVerifyOtp"]

Click On Forgot Password Link
    Web.Wait Until Element Is Visible    ${LogoutLocator}    ${StandardTimeout}
    Web.Click Element    ${LogoutLocator}
    Web.Wait Until Element Is Enabled    ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text    ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Visible    ${ForgotPasswordLocator}    ${StandardTimeout}
    Web.Click Element    ${ForgotPasswordLocator}

Send Recovery Link For Forgot Password
    [Arguments]    ${EmailAddress}
    Web.Wait Until Element Is Visible    ${ForgotPWEmailField}    ${StandardTimeout}
    Web.Input Text    ${ForgotPWEmailField}    ${EmailAddress}
    Web.Click Element    ${SendPWRecoveryBtn}
    Web.Wait Until Element Is Visible    ${RecoveryMailSuccess}    ${StandardTimeout}

Start Appium Server Connection
    [Arguments]    ${portNum}
    [Documentation]    Start appium server on specific port
    ${returnValue}    startAppiumServer    ${portNum}
    RETURN    ${returnValue}

Stop Appium Server Connection
    [Arguments]    ${serverPort}
    [Documentation]    Stop appium server on specific port
    ${returnValue}    stopAppiumServe

#Wait Until the Update Icon Disappear
#    ${Status}   Run Keyword and return status   Web.Wait Until Element Is Visible    ${UpdateIcon}    ${StandardTimeout}
#    Run Keyword If    '${status}' == 'True'  Sleep  60s

Wait Until the Update Icon Disappear
    sleep  100ms
    Wait Until Element Is Not Visible  ${UpdateIcon}    ${StandardTimeout}

Submit 2FA Page Using Email OTP for Super Admin
    [Arguments]    ${OtpLength}
    Submit First Login Page for Super Admin
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Web.Click Element    ${EmailIcon}
    sleep    ${SleepDelay5s}    # Waiting for receive Email
    Open Mailbox    host=${GmailHost}    user=${SuperGmailId}    password=${SuperGmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{${OtpLength}}
    Delete Email         ${LATEST}
    Web.Input Text       ${OtpTextBox}    ${otpText}[0]
    #Web.Input Text       ${OtpTextBox}    ${otpText}
    Web.Click Element    ${VerifyOtpButton}
    #Web.Wait Until Element Is Enabled     ${HomeTab}    ${StandardTimeout}

Submit First Login Page for Super Admin
    Web.Wait Until Element Is Enabled             ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Input Text       ${UserNameLocator}       ${SuperUserName}
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text       ${PasswordLocator}       ${SuperPassword}
    Web.Click Element    ${SignInButton}
