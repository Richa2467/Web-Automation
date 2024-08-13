*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot

Suite Setup    Run Keywords    Open SurePass On Browser    AND
...           Submit 2FA Page Using Email OTP    6
Suite Teardown    Close All Browsers

*** Test Cases ***


Verify that when "Email token activation to the user" field is unchecked, the user does not receive an Email when a token is assigned
    [Tags]    CRT_ASGN_TKN_008    POC
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker9
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Go To Tokens Page
    Assign Token To The User    Andy2 Gill3    ${TokenSerialNo}
    sleep    ${SleepDelay10s}
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${msg}    Run Keyword And Expect Error    No email received within 30s
    ...        Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=30
    [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Go To Token Page And Delete Token    ${TokenSerialNo}

Verify that when "Allow assigned tokens to be reassigned" field is unchecked, the token is not getting assigned
    [Tags]    CRT_ASGN_TKN_009    POC
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker10
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Go To Tokens Page
    Web.Click Element    ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Input Text    ${AssignTokenSrNo}    ${TokenSerialNo}
    Web.Click Element    ${AssignTokenUsrDropdown}
    Web.Click Element    ${AssignTokenUsrDropdown}/option[contains(text(), "Andy2 Gill3")]
    Web.Click Element    ${EmailUserCheckbox}
    Web.Click Element    ${AssignTokenBtn}
    Web.Wait Until Page Contains    Token ${TokenSerialNo} is currently assigned    ${StandardTimeout}
    [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Go To Token Page And Delete Token    ${TokenSerialNo}

Verify that when "Change token status to Enabled" field is checked, the disabled token is changing to enabled upon getting assigned
    [Tags]    CRT_ASGN_TKN_010    POC
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker11
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Web.Select From List by Value    //*[@id="ctl00_ContentPlaceHolder1_ddlDeviceStatusData"]    1
    Web.Scroll Element Into View    ${CopyrightSection}
    sleep    ${SleepDelay2s}
    Web.Click Element    ${TokenAddButton}
    Web.Wait Until Page Contains    Record has been updated.
    Go To Tokens Page
    Assign Token To The User    Andy2 Gill3    ${TokenSerialNo}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${ContainsSrNoDropdown}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenSerialNo}
    Web.Click Element    ${SrNoFilterSearchIcon}
    Web.Wait Until Element Is Visible    //*[text()="${TokenSerialNo}"]/parent::div/parent::div//*[text()="Enabled"]    ${StandardTimeout}
    [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Go To Token Page And Delete Token    ${TokenSerialNo}

Verify Check OTP functionality with SurePassID Authentication Token
    [Tags]    SHR_SYNC_TKN_004    POC
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker14
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    ${TempPwd}    Create Temporary Password
    Check OTP From Tokens Page    ${TempPwd}
    [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Go To Token Page And Delete Token    ${TokenSerialNo}

Verify Create Temporary Passcode functionality for SurePassId Authentication token
    [Tags]    SHR_SYNC_TKN_010    POC
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker15
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    ${TempPwd}    Create Temporary Password
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${UserDefinedNameField}    ${StandardTimeout}
    [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Go To Token Page And Delete Token    ${TokenSerialNo}
