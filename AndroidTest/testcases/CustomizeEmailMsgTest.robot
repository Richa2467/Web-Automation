*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../resources/CustomizeEmailMsgResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/CustomizeMobileMSGResource.robot


Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify User is able to see 'SMTP Server Settings' and 'Customize Email Messages' Section on the 'Customize Email Messages' form page.
    [Tags]  SMTP_SER_SET_001   SurePassID_M3    SurePassId_Web
    Click on Account Tab
    Click On Customize Email MSG
    Web.Page Should Contain Element     ${SMTPSettings}       ${StandardTimeout}
    Web.Page Should Contain Element     ${Emailseetings}       ${StandardTimeout}

Verify User is able to see Host Name/IP, Port, Username, Password fields under 'SMTP Server Settings'.
    [Tags]  SMTP_SER_SET_002   SurePassID_M3    SurePassId_Web
    Web.Page Should Contain Element     ${HostName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${portName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${SMTPUserName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${SMTPPassword}       ${StandardTimeout}

Verify User is not able to edit 'SMTP Server Settings' without selecting 'Use Custom SMTP Settings' checkbox.
    [Tags]  SMTP_SER_SET_003   SurePassID_M3    SurePassId_Web
    Web.Wait Until Element Is Enabled    ${customSMTPCB}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Page Should Contain Element     ${disableHostNamefield}       ${StandardTimeout}
    Web.Page Should Contain Element     ${disablePortfield}       ${StandardTimeout}
    Web.Page Should Contain Element     ${disableSMTPUNfield}       ${StandardTimeout}
    Web.Page Should Contain Element     ${disableSMTPPWfield}       ${StandardTimeout}

Verify User is able to edit 'SMTP Server Settings' by selecting 'Use Custom SMTP Settings' checkbox
    [Tags]  SMTP_SER_SET_004   SurePassID_M3    SurePassId_Web
    Web.Wait Until Element Is Enabled    ${customSMTPCB}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Wait Until Element Is Enabled    ${inputSMTPHostName}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPHostName}    ${SMTPGmailHost}
    Web.Input Text    ${inputSMTPPort}    ${SMTPPortNo}
    Web.Input Text    ${inputSMTPUsrName}    ${SMTPTestUserName}
    Web.Wait Until Element Is Enabled    ${clickOnLock}    ${StandardTimeout}
    Web.Click Element    ${clickOnLock}
    Web.Wait Until Element Is Enabled    ${inputSMTPPswd}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPPswd}    ${SMTPTestPwd}
    Web.Wait Until Element Is Enabled    ${clickOnLock}    ${StandardTimeout}
    Web.Click Element    ${clickOnLock}

User should be able to check the password edit field should be enabled/disabled, after clicking on Lock symbol
    [Tags]  SMTP_SER_SET_005   SurePassID_M3    SurePassId_Web
    Web.Wait Until Element Is Enabled    ${customSMTPCB}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Page Should Contain Element     ${disableHostNamefield}       ${StandardTimeout}
    Web.Page Should Contain Element     ${disablePortfield}       ${StandardTimeout}
    Web.Page Should Contain Element     ${disableSMTPUNfield}       ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${customSMTPCB}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Wait Until Element Is Enabled    ${inputSMTPHostName}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPHostName}    ${SMTPGmailHost}
    Web.Input Text    ${inputSMTPPort}    ${SMTPPortNo}
    Web.Input Text    ${inputSMTPUsrName}    ${SMTPTestUserName}
    Web.Wait Until Element Is Enabled    ${clickOnLock}    ${StandardTimeout}
    Web.Click Element    ${clickOnLock}
    Web.Wait Until Element Is Enabled    ${inputSMTPPswd}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPPswd}    ${SMTPTestPwd}

Verify User is able to see all the fields of Customize Email Messages.
    [Tags]  CUSTM_EMAIL_MSG_001   SurePassID_M3     SurePassId_Web
    Web.Page Should Contain Element     ${textEmailFormat}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textSysAction}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textFromEmailName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textFromEmailName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textSubject}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textMessageBody}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textMessage}       ${StandardTimeout}

Verify User is able to choose 'HTML' and 'Plain Text'format to send the email.
    [Tags]  CUSTM_EMAIL_MSG_002   SurePassID_M3     SurePassId_Web
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Wait Until Element Is Visible    ${selectEmailFormat}   ${StandardTimeout}
    Web.Select From List by Value       ${selectEmailFormat}      ${PlainTextFormat}
    Web.Select From List by Value       ${selectEmailFormat}      ${HTMLFormat}

Verify User should be able to edit 'From Name' edit field.
    [Tags]  CUSTM_EMAIL_MSG_003   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Enabled    ${inputFromEmail}    ${StandardTimeout}
    Web.Input Text    ${inputFromEmail}    ${EditUsrNameCEM}

Verify User should be able to edit 'Subject' edit field.
    [Tags]  CUSTM_EMAIL_MSG_004   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Enabled    ${inutSubject}    ${StandardTimeout}
    Web.Input Text    ${inutSubject}    ${SubjectNameCEM}

Verify User should be able to edit 'Message' body field.
    [Tags]  CUSTM_EMAIL_MSG_005   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Visible    ${textMessageBody}   ${StandardTimeout}
    Web.Clear Element Text	${textMessageBody}
    Web.Input Text    ${textMessageBody}    ${inputTextMsgCEM}

Verify User Should be able to select one option from 'System Action' dropdown list.
    [Tags]  CUSTM_EMAIL_MSG_006   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Visible    ${selectSysAction}   ${StandardTimeout}
    Web.Select From List by Value       ${selectSysAction}      ${AccountLoginSysActionCEM}
    Web.Select From List by Value       ${selectSysAction}      ${SetUpInstSysActionCEM}
    Web.Select From List by Value       ${selectSysAction}      ${SendOTPSysActionCEM}

Verify User should not be able to edit 'From Address' field.
    [Tags]  CUSTM_EMAIL_MSG_007   SurePassID_M3     SurePassId_Web
    Web.Page Should Contain Element     ${FromEmailAdd}       ${StandardTimeout}

Verify User is able to Update the Customize Email Messages.
    [Tags]  CUSTM_EMAIL_MSG_008   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Visible    ${btnAction}   ${StandardTimeout}
    Web.Click Element    ${btnAction}
    Web.Wait Until Element Is Visible    xpath://*[@class="jq-toast-single jq-has-icon jq-icon-success"]    ${StandardTimeout}
    #${SuccessMsg}     Web.Get Text	  ${successGreenBarCEMsg}
    #Should Be Equal     ${SuccessMsg}      ${RecordUpdatedSucMsg}
    Page should contain     Custom Email Messages have been updated successfully.

Verify User is able to see the same message on his associated account email address.
    Web.Wait Until Element Is Visible    ${selectEmailFormat}   ${StandardTimeout}
    Web.Select From List by Value       ${selectEmailFormat}    ${PlainTextFormat}
    Web.Wait Until Element Is Visible    ${selectSysAction}   ${StandardTimeout}
    Web.Select From List by Value       ${selectSysAction}      ${SendOTPSysActionCEM}
    Web.Wait Until Element Is Visible    ${btnAction}   ${StandardTimeout}
    Web.Click Element    ${btnAction}
    Web.Wait Until Element Is Visible    xpath://*[@class="jq-toast-single jq-has-icon jq-icon-success"]    ${StandardTimeout}
    #${SuccessMsg}     Web.Get Text	  ${successGreenBarCEMsg}
    #Should Be Equal     ${SuccessMsg}      ${RecordUpdatedSucMsg}
    Page should contain     Custom Email Messages have been updated successfully.
    Web.Wait Until Element Is Visible    ${btnLogout}    ${StandardTimeout}
    Web.Click Element    ${btnLogout}
    Web.Close All Browsers
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6

Verify User is able to set default message again.
    [Tags]  CUSTM_EMAIL_MSG_010   SurePassID_M3     SurePassId_Web
    Click on Account Tab
    Click On Customize Email MSG
    Web.Page Should Contain Element     ${SMTPSettings}       ${StandardTimeout}
    Web.Page Should Contain Element     ${Emailseetings}       ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${textMessageBody}   ${StandardTimeout}
    Clear Element Text	${textMessageBody}
    Web.Input Text    ${textMessageBody}    ${inputTextMsgCEM}
    Scroll Page To Location     1000   1
    Web.Wait Until Element Is Visible    ${btnSetDefault}   ${StandardTimeout}
    Web.Click Element	${btnSetDefault}
    Web.Wait Until Element Is Visible    ${textMessageBody}    ${StandardTimeout}
    ${textMsg}     Web.Get Text	  ${textMessageBody}
    Should Contain     ${textMsg}      ${VerificationPassCodeMsgCEM}

Verify User is able to select 'Setup Instructions' as a System Action and able to see a respective message.
    [Tags]  CUSTM_EMAIL_MSG_011   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Visible    ${selectSysAction}   ${StandardTimeout}
    Web.Select From List by Value       ${selectSysAction}      ${SetUpInstSysActionCEM}
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${textMessageBody}    ${StandardTimeout}
    ${textMsg}     Web.Get Text	  ${textMessageBody}
    Should Contain     ${textMsg}      ${AuthicationDeviceReadyCEM}

Verify User is able to select 'Account Login Information' as a System Action and able to see a respective message.
    [Tags]  CUSTM_EMAIL_MSG_012   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Visible    ${selectSysAction}   ${StandardTimeout}
    Web.Select From List by Value       ${selectSysAction}      ${AccountLoginSysActionCEM}
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${textMessageBody}    ${StandardTimeout}
    ${textMsg}     Web.Get Text	  ${textMessageBody}
    Should Contain     ${textMsg}      ${AccountReadyCEM}

Verify User is able to select 'Send OTP' as a System Action and able to see a respective message.
    [Tags]  CUSTM_EMAIL_MSG_013   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Visible    ${selectSysAction}   ${StandardTimeout}
    Web.Select From List by Value       ${selectSysAction}      ${SendOTPSysActionCEM}
    Web.Wait Until Element Is Visible    ${textMessageBody}    ${StandardTimeout}
    ${textMsg}     Web.Get Text	  ${textMessageBody}
    Should Contain     ${textMsg}      ${VerificationCodeMsgCEM}

Verify Using SMTP server setting user should be able to receive OTP message on account associated mail address.
    [Tags]  SMTP_SER_SET_006   SurePassID_M3_S
    #${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${customSMTPCB}
    #Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Click on Account Tab
    Click On Customize Email MSG
    Web.Page Should Contain Element     ${SMTPSettings}       ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${customSMTPCB}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Wait Until Element Is Enabled    ${inputSMTPHostName}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPHostName}    ${SMTPGmailHost}
    Web.Input Text    ${inputSMTPPort}    ${SMTPPortNo}
    Web.Input Text    ${inputSMTPUsrName}    ${GmailId}
    Web.Wait Until Element Is Enabled    ${clickOnLock}    ${StandardTimeout}
    Web.Click Element    ${clickOnLock}
    Sleep   3s
    Web.Wait Until Element Is Enabled    ${inputSMTPPswd}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPPswd}    ${GmailPassword}
    Web.Wait Until Element Is Enabled    ${clickOnLock}    ${StandardTimeout}
    Web.Click Element    ${clickOnLock}