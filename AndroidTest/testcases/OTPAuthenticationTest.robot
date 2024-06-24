*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/AndroidResource.robot
Resource    ../locators/OTPAuthenticationLocator.robot

Suite Setup    Run Keywords    Open SurePass On Browser    AND
...           Submit 2FA Page Using Email OTP    6
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify user is able to login with Email OTP.
    [Tags]    OTP_Auth_011    SurePassID_M1     SurePassId_Web
    Web.Wait Until Element Is Visible    ${LogoutLocator}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${LogoutLocator}
    Submit 2FA Page Using Email OTP    6
    [Teardown]   Web.Close All Browsers

Verify User should not be able to login with expired OTP.
    [Tags]    OTP_Auth_012    SurePassID_M1     SurePassId_Web
    Open SurePass On Browser
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${EmailIcon}
    Sleep   ${SleepDelay80s}    # Waiting for OTP to expire
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    Delete Email    ${LATEST}
    Web.Input Text    ${OtpTextBox}    ${otpText}
    Web.Wait Until Element Is Visible    ${VerifyOtpButton}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${VerifyOtpButton}
    Web.Page Should Not Contain Element    ${HomeTab}
    [Teardown]   Web.Close All Browsers

Verify user is only logins with latest OTP, incase of multiple OTP sent to mobile.
    [Tags]    OTP_Auth_013    SurePassID_M1     SurePassId_Web
    [Setup]    Run Keywords    Open SurePass On Browser    AND
    ...           Submit 2FA Page Using Email OTP    6
    Web.Wait Until Element Is Visible    ${LogoutLocator}    ${StandardTimeout}
    Web.Click Element    ${LogoutLocator}
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${EmailIcon}
    sleep    ${SleepDelay5s}    # Waiting for email to arrive
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    Delete Email    ${LATEST}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${EmailIcon}
    sleep    ${SleepDelay5s}   # Waiting for the second email to arrive
    Web.Input Text    ${OtpTextBox}    ${otpText}
    Web.Wait Until Element Is Visible    ${VerifyOtpButton}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${VerifyOtpButton}
    Web.Page Should Not Contain Element    ${HomeTab}
    [Teardown]    Run Keywords    Web.Close All Browsers
    ...     AND                   Open SurePass On Browser
    ...     AND                   Submit 2FA Page Using Email OTP    6

If token is deleted from the SurePassID token, it should not be able accessible from SurePass mobile application.
    [Tags]    OTP_Auth_014    SurePassID_M1
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Token12
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Wait Until Keyword Succeeds    3 times    10 sec    Delete Token If Existing    ${TokenSerialNo}
    sleep    ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${LogoutLocator}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${LogoutLocator}
    Submit First Login Page
    ${AppOTP}   Mobile.Get Text    ${GetAppOTP}
    Web.Input Text    //*[@id="tbxOTP"]    ${AppOTP}
    Web.Wait Until Element Is Visible    //*[@id="btnVerifyOtp"]   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    //*[@id="btnVerifyOtp"]
    Web.Page Should Not Contain Element    ${HomeTab}
    [Teardown]    Run Keywords    Web.Close All Browsers
    ...     AND                   Open SurePass On Browser
    ...     AND                   Submit 2FA Page Using Email OTP    6
    ...     AND                   Delete Token If Existing    ${TokenSerialNo}

Verify Forgot Password link is working as expected.
    [Tags]    OTP_Auth_015    SurePassID_M1
    Click On Logout option
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element       ${ForgotPasswordLocator}
    Web.Element Should Be Visible         ${ForgetPWLink}
    Web.Element Should Be Visible       ${ResetPasswordpage}

Verify registered email is accepted by SurePassId system and mail notification is received successfully for resetting the password.
    [Tags]    OTP_Auth_016    SurePassID_M1
    Click On Logout option
    Web.Wait Until Element Is Visible    ${ForgotPasswordLocator}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element       ${ForgotPasswordLocator}
    Send Recovery Link For Forgot Password    ${GmailId}
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    subject=[SurePassId] Your recovery request.    status=UNSEEN    timeout=300
    ${HTMLBody} =    Get Email Body    ${LATEST}
    set global variable      ${HTMLBody}
    Should Be True    ${LATEST}>0
    Delete Email    ${LATEST}

Verify User should be able to login with temporary password successfully after going through Forgot Password.
    [Tags]    OTP_Auth_018    SurePassID_M1
    Click On Logout option
    Web.Wait Until Element Is Visible    ${ForgotPasswordLocator}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element       ${ForgotPasswordLocator}
    Send Recovery Link For Forgot Password    parth.jani+1138@volansys.com
    Set Global Variable     ${HTMLBody}
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTMLBody} =    Get Email Body    ${LATEST}
    ${linkMatches}    Get Regexp Matches    ${HTMLBody}    http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
    ${newURL}    Replace String Using Regexp    ${linkMatches}[0]    &amp;    &
    Open SurePass On Browser    url=${newURL}     expectedElement=${NewPasswordText}
    Web.Input Text    ${NewPasswordField}    Mozart@123
    Web.Input Text    ${ConfirmPassword}     Mozart@123
    Web.Click Element    ${UpdatePasswordField}
    Web.Wait Until Element Is Visible    ${RecoveryMailSuccess}
    Web.Page Should Contain    Password has been changed. You can now login.
    Web.Click Element    //*[@id="btnSend"]
    Web.Wait Until Element Is Enabled    ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text    ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled    ${UserNameLocator}    ${StandardTimeout}
    Web.Input Text    ${UserNameLocator}    ${inputUserName}
    Web.Wait Until Element Is Enabled    ${PasswordLocator}    ${StandardTimeout}
    Web.Input Text    ${PasswordLocator}    Mozart@123
    Web.Click Element    ${SignInButton}
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Web.Click Element    ${EmailIcon}
    sleep    ${SleepDelay5s}    # Waiting for email to arrive
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    Delete Email    ${LATEST}
    Web.Input Text    ${OtpTextBox}    ${otpText}
    Web.Wait Until Element Is Visible    ${VerifyOtpButton}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${VerifyOtpButton}
    Select the Checkbox if Terms of Use Page is visible
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
    [Teardown]    Web.Close All Browsers

Verify user receives proper error message, if email entered on Forgot Password link is not of registered user.
    [Tags]    OTP_Auth_017    SurePassID_M1
    [Setup]    Run Keywords    Open SurePass On Browser    AND
    ...           Submit 2FA Page Using Email OTP    6
    Click On Forgot Password Link
    Send Recovery Link For Forgot Password    JohnDoe@gmail.com
    Web.Wait Until Element Is Visible    ${ErrorSignIncorrectEmail}    ${StandardTimeout}
    Web.Page Should Contain Element    ${ErrorSignIncorrectEmail}
    [Teardown]    Web.Close All Browsers

Verify User is able to create Temproray Passcode.
    [Tags]    OTP_Auth_019    SurePassID_M1
    [Setup]    Run Keywords    Open SurePass On Browser    AND
    ...           Submit 2FA Page Using Email OTP    6
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=TestAuthTknName
    ${TempTokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Set Global Variable    ${TempTokenSerialNo}
    ${SuccessMsg}    Create Temporary Password
    Should Contain   ${SuccessMsg}    Success

Verify Token is not able to assign to any user if token is already assigned.
    [Tags]    OTP_Auth_022    SurePassID_M1
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=TestAuthTknName
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${AssignTokenLink}    ${StandardTimeout}
    Web.Click Element    ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Input Text    ${AssignTokenSrNo}    ${TokenSerialNo}
    Web.Input Text     ${clickOnAssignToUsr}    Adam3
    Web.Wait Until Element Is Visible    xpath://*[text()="${assignTokenTo}"]    ${StandardTimeout}
    Web.Click Element    xpath://*[text()="${assignTokenTo}"]
    Web.Wait Until Element Is Visible    ${AllowReassignCheckbox}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${AllowReassignCheckbox}
    Run Keyword If    '${status}' == 'False'  Web.Click Element    ${AllowReassignCheckbox}
    Web.Wait Until Element Is Visible    xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]
    Verify PopUp Message receive or not     Token ${TokenSerialNo} is currently assigned to ${mainUserName}
    [Teardown]    Delete Token If Existing    ${TokenSerialNo}

Verify shared token is only used by assignee for authentication.
    [Tags]    OTP_Auth_023    SurePassID_M1
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=TestAuthTknName
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Share Token With A User    ${UserFirstName3}
    Go To Token Page And Search Token    ${TokenSerialNo}    DropdownType=1
    Web.Wait Until Page Contains Element    //*[contains(text(), "${UserFirstName3}")]    ${StandardTimeout}
    ${SharedSrNo}    Web.Get Text    //*[contains(text(), "${UserFirstName3}")]//parent::div//parent::div//parent::div//div[2]/*
    [Teardown]    Run Keywords    Delete Token If Existing    ${TokenSerialNo}
    ...           AND             Delete Token If Existing    ${SharedSrNo}

Verify Search feature on Share token page is working properly.
    [Tags]    OTP_Auth_024    SurePassID_M1
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=TestAuthTknName
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Web.Wait Until Element Is Visible    ${ShareTokenLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${ShareTokenLink}
    Web.Wait Until Element Is Visible    ${ShareTokenSearchBox}    ${StandardTimeout}
    Web.Input Text    ${ShareTokenSearchBox}    ${UserFirstName3}
    Web.Click Element    ${ShareTokenSearchIcon}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${ShareTokenUserDropDwn}
    Web.Wait Until Page Contains Element    //*[@id="ctl00_ContentPlaceHolder1_ddlAssigned_Partner_User_IdData"]/*[contains(text(),"${UserFirstName3}")]    ${StandardTimeout}
    Web.Page Should Contain Element    //*[@id="ctl00_ContentPlaceHolder1_ddlAssigned_Partner_User_IdData"]/*[contains(text(),"${UserFirstName3}")]
    [Teardown]    Delete Token If Existing    ${TokenSerialNo}

Verify user should be navigated to Update token page after clicking on Close button.
    [Tags]    OTP_Auth_025    SurePassID_M1
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=TestAuthTknName
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Web.Wait Until Element Is Visible    ${ShareTokenLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.click element       ${ShareTokenLink}
    Web.Wait Until Element Is Visible    ${CloseTempPwd}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${CloseTempPwd}
    Web.Wait Until Element Is Visible    ${TokenPageHeader}    ${StandardTimeout}
    [Teardown]    Delete Token If Existing    ${TokenSerialNo}

Verify User is able to check incorrect OTP from Mobile mobile authenticator to Surepassid web account.
    [Tags]    OTP_Auth_027    SurePassID_M1
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker30
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    ${InvalidOTP}    Generate random string    6    0123456789
    Check OTP From Tokens Page For Expired OTP    ${InvalidOTP}
    [Teardown]    Run Keywords       Delete Token If Existing    ${TokenSerialNo}
    ...      AND                     Delete SurePassToken

Verify User is able to check Correct OTP from Mobile mobile authenticator to Surepassid web account.
    [Tags]    OTP_Auth_026    SurePassID_M1
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Mobile.Wait Until Element Is Visible    ${GetAppOTP}
    ${AppOTP}   Mobile.Get Text    ${GetAppOTP}
    ${AppOTPWithoutSpace}    Remove String Using Regexp    ${AppOTP}    \\s+
    Check OTP From Tokens Page    ${AppOTPWithoutSpace}
    [Teardown]    Delete Token If Existing    ${TokenSerialNo}

Verify User is able to update Token name
    [Tags]    OTP_Auth_028    SurePassID_M1
    Open Test Application
    Edit SurePassToken Name    Tinker32
    Mobile.Wait Until Element Is Visible    ${TokenNameText}
    ${updatedName}    Mobile.Get Text    ${TokenNameText}
    Should Be Equal As Strings    ${updatedName}    Tinker32
    [Teardown]    Delete SurePassToken

Verify Synchronize Token with Valid OTP and correct time window.
    [Tags]    OTP_Auth_029    SurePassID_M1
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    OTPWindowSize=240
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Mobile.Wait Until Element Is Visible    ${GetAppOTP}
    ${AppOTP}   Mobile.Get Text    ${GetAppOTP}
    ${AppOTPWithoutSpace}    Remove String Using Regexp    ${AppOTP}    \\s+
    Enter OTP in Synchronize Section    ${AppOTPWithoutSpace}
    #sleep    ${SleepDelay2s}
    Web.Wait Until Element Is Visible    ${CreateTempPwdMsg}    ${StandardTimeout}
    Web.Page Should Contain    Token has been synchronized.
    [Teardown]    Run Keywords    Delete Token If Existing    ${TokenSerialNo}
    ...      AND                  Delete SurePassToken
