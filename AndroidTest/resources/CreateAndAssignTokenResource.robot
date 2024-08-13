*** Settings ***
Documentation    Users Page related resources including this file.
Library     OperatingSystem
Resource    ../resources/LoginPageResource.robot
Resource    ../labels/UsersPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../locators/UsersPageLocator.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/TokenPageLocator.robot
Resource    ../resources/AddNewSoftTokenResource.robot
Resource    ../labels/CreateAndAssignTokenLabel.robot
Resource    ../locators/CreateAndAssignTokenLocator.robot

*** Keywords ***
Verify PopUp Message receive or not
    [Arguments]     ${ActualMsg}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Be Equal     ${SuccessMsg}      ${ActualMsg}

Verify Error PopUp Message receive or not
    [Arguments]     ${ContainTextMsg}
    #sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Contain     ${SuccessMsg}      ${ContainTextMsg}

Check Email Token Activation message received or not
    sleep    ${SleepDelay10s}
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    Should Contain  ${HTML}     ${tokenActivationEmailMsg}

Check Email Message
    ${msg}    Run Keyword And Expect Error    No email received within 30s
    ...        Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=30

Assign to User token through AutoCompletelist
    [Arguments]    ${UserName}    ${TokenSerialNo}
    Web.Wait Until Element Is Visible    ${AssignTokenLink}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${AssignTokenLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${AssignTokenLink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Input Text    ${AssignTokenSrNo}    ${TokenSerialNo}
    Web.Input Text    ${AssignTokenSrNo}    ${TokenSerialNo}
    Web.Input Text     ${clickOnAssignToUsr}    Test
    Web.Wait Until Element Is Visible    xpath://*[text()="${UserName}"]    ${StandardTimeout}
    Web.Click Element    xpath://*[text()="${UserName}"]
    Web.Wait Until Element Is Visible    ${EmailUserCheckbox}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${EmailUserCheckbox}
    Run Keyword If    '${status}' == 'False'  Web.Click Element    ${EmailUserCheckbox}
    #Web.Click Element    ${EmailUserCheckbox}
    Web.Wait Until Element Is Visible    ${AssignTokenBtn}     ${StandardTimeout}
    Web.Click Element    ${AssignTokenBtn}
    Web.Wait Until Page Contains    Token ${TokenSerialNo} is currently assigned    ${StandardTimeout}

Add Token for Assign New Token
    [Arguments]    ${TokenType}=None    ${UserDefinedName}=None    ${AuthType}=None    ${OTPWindowSize}=None    ${OTPType}=None    ${TokenStatus}=None
    # 0=Push Authentication Only, 1=OTP Authentication Only, 2=OTP and Push Authentication
    Web.Wait Until Element Is Visible    ${UserDefinedNameField}    ${StandardTimeout}
    Run Keyword If    '${TokenType}' != 'None'    Run Keyword    Select Token Type    ${TokenType}
    Run Keyword If    '${UserDefinedName}' != 'None'    Web.Input Text    ${UserDefinedNameField}    ${UserDefinedName}
    Run Keyword If    '${AuthType}' != 'None'    Web.Select From List by Value    ${AuthUsageDropdown}    ${AuthType}
    Run Keyword If    '${OTPType}' != 'None'    Run Keywords    Web.Select From List by Value    ${OTPTypeDropdown}    ${OTPType}
    ...                AND                         Select Token PIN
    Run Keyword If     '${TokenStatus}' != 'None'     Run Keyword    Web.Select From List by Value    ${TokenStatusLocator}    ${TokenStatus}
    Web.Scroll Element Into View    ${CopyrightSection}
    sleep    ${SleepDelay5s}
    Run Keyword If    '${OTPWindowSize}' != 'None'    Web.Input Text    ${OTPWindowSizeLocator}    ${OTPWindowSize}
    Sleep    ${SleepDelay5s}
    Run Keyword If    '${TokenType}' != '8'    Run Keyword    Check token type is not NymiBand  ${TokenType}

Verify Assign Success Toast Message
    Sleep   ${SleepDelay2s}
    Web.Element Text Should Be          ${ToastSuccess}     Success
