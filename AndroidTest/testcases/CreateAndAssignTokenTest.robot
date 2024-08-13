*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/AddNewSoftTokenResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/CreateAndAssignTokenResource.robot
Resource    ../resources/AndroidResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify the alert message when token is assigned with no serial number provided
    [Tags]  CRT_ASGN_TKN_001        SurePassID_M1   SurePassId_Web
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${AssignTokenLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}
    Verify PopUp Message receive or not     ${TknSrNoerrorMsg}
    Web.Page Should Contain Element     ${redTextTknSrNo}       ${StandardTimeout}

Verify the alert message when token is assigned with an invalid serial number
    [Tags]  CRT_ASGN_TKN_002        SurePassID_M1   SurePassId_Web
    Web.Wait Until Element Is Visible    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Input Text    ${AssignTokenSrNo}    ${invalidTokenSerialNo}
    Web.Wait Until Element Is Visible    ${TokenAddButton}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}
    Verify PopUp Message receive or not     ${invalidSrNoMsg}

Verify that when "Allow assigned tokens to be reassigned" field is unchecked, the token is not getting reassigned
    [Tags]  CRT_ASGN_TKN_003        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Go To Tokens Page
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AssignTokenLink}
    Web.Input Text  ${SerialNumber}     ${TokenSerialNumber}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${CheckOTPAction}
    Wait Until the Update Icon Disappear
    Web.Page Should Contain         Token ${TokenSerialNumber} is currently assigned to ${mainUserName}

Verify that when "Allow assigned tokens to be reassigned" field is checked, the token is getting reassigned
    [Tags]  CRT_ASGN_TKN_004        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Go To Tokens Page
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AssignTokenLink}
    Web.Input Text  ${SerialNumber}     ${TokenSerialNumber}
    Web.Input Text  ${UserTokenInputField}     ${UserName3}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AllowReassignCheckbox}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${TokenStatusEnabled}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${EmailUserCheckbox}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${CheckOTPAction}
    Wait Until the Update Icon Disappear
    Verified Success Message For Token Assigning      ${SuccessMessageToken}

Verify that when "Email token activation to the user" field is checked, the user receives an Email when a token is assigned
    [Tags]  CRT_ASGN_TKN_005        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Go To Tokens Page
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AssignTokenLink}
    Web.Input Text  ${SerialNumber}     ${TokenSerialNumber}
    Web.Input Text     ${UserTokenInputField}    ${UserName3}
    Web.Wait Until Element Is Visible    xpath://*[text()="${UserName3} (Adam3 Snow)"]    ${StandardTimeout}
    Web.Click Element    xpath://*[text()="${UserName3} (Adam3 Snow)"]
    #Web.Input Text  ${UserTokenInputField}     ${UserName3}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AllowReassignCheckbox}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${CheckOTPAction}
    Verified Success Message For Token Assigning      ${SuccessMessageToken}
#    Sleep   2s  #Wait to receive Email
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    Wait Until the Update Icon Disappear
    Should Contain    ${HTML}    Your authentication device is ready. Here is that you will need to activate your device:

Verify that when "Email token activation to the user" field is unchecked, the user does not receive an Email when a token is assigned
    [Tags]  CRT_ASGN_TKN_006        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Go To Tokens Page
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AssignTokenLink}
    Web.Input Text  ${SerialNumber}     ${TokenSerialNumber}
    Web.Input Text  ${UserTokenInputField}     ${UserName3}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${EmailUserCheckbox}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${CheckOTPAction}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${clickOnCheckAssigBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnCheckAssigBtn}
    Web.Page Should Contain         Token ${TokenSerialNumber} is currently assigned to ${mainUserName}

Verify that when "Allow assigned tokens to be reassigned" field is unchecked, the token is not getting assigned
    [Tags]  CRT_ASGN_TKN_007        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Go To Tokens Page
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AssignTokenLink}
    Web.Input Text  ${SerialNumber}     ${TokenSerialNumber}
    Web.Input Text  ${UserTokenInputField}     ${UserName3}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${EmailUserCheckbox}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${CheckOTPAction}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${CheckOTPAction}
    Wait Until the Update Icon Disappear
    Web.Page Should Contain         Token ${TokenSerialNumber} is currently assigned to ${mainUserName}

Verify that when "Change token status to Enabled" field is checked, the disabled token is changing to enabled upon getting assigned
    [Tags]  CRT_ASGN_TKN_008        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Wait Until the Update Icon Disappear
    Web.Select From List by Value    //*[@id="ctl00_ContentPlaceHolder1_ddlDeviceStatusData"]    1
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Go To Tokens Page
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AssignTokenLink}
    Web.Input Text  ${SerialNumber}     ${TokenSerialNumber}
    Web.Input Text  ${UserTokenInputField}     ${UserName3}
    Wait Until the Update Icon Disappear
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AllowReassignCheckbox}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${EmailUserCheckbox}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${CheckOTPAction}
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     //*[@class="jq-toast-heading"]//parent::div["Token ${TokenSerialNumber} is now assigned to ${mainUserName}"]

Verify that Check Assignment button is working as expected with an assigned token
    [Tags]  CRT_ASGN_TKN_009        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Go To Tokens Page
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${AssignTokenLink}
    Web.Input Text      ${SerialNumber}     ${TokenSerialNumber}
    Web.Input Text      ${UserTokenInputField}     ${UserName3}
    Wait Until the Update Icon Disappear
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${EmailUserCheckbox}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${TokenStatusEnabled}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element       ${CheckAssignmentBtn}
    Wait Until the Update Icon Disappear
    Web.Page Should Contain         Token ${TokenSerialNumber} is currently assigned to ${mainUserName}

Verify that Check Assignment button is working as expected with an unassigned token
    [Tags]  CRT_ASGN_TKN_010        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${clickOnNewOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnNewOption}
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    set global variable    ${TokenSerialNo}
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}
    Scroll Page To Location     1000   1
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${AssignTokenLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Input Text    ${AssignTokenSrNo}    ${TokenSerialNo}
    Web.Wait Until Element Is Visible    ${clickOnCheckAssigBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnCheckAssigBtn}
    Wait Until the Update Icon Disappear
    Verified Success Message For Token Assigning      ${SuccessMessageToken}

Verify that Check Assignment button is working as expected with an invalid token
    [Tags]  CRT_ASGN_TKN_011        SurePassID_M1   SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${AssignTokenLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Input Text    ${AssignTokenSrNo}    ${invalidTokenSerialNo}
    Web.Wait Until Element Is Visible    ${clickOnCheckAssigBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnCheckAssigBtn}
    Wait Until the Update Icon Disappear
    Verify PopUp Message receive or not     ${invalidSrNoMsg}

Verify that Check Assignment button is working as expected when no token number is provided
    [Tags]  CRT_ASGN_TKN_012        SurePassID_M1   SurePassId_Web
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${AssignTokenLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${clickOnCheckAssigBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnCheckAssigBtn}
    Wait Until the Update Icon Disappear
    Verify PopUp Message receive or not     ${TknSrNoerrorMsg}

Verify that when close button is clicked in the Add Token page, the user is getting redirected to the Tokens List page
    [Tags]  CRT_ASGN_TKN_013        SurePassID_M1   SurePassId_Web
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${clickOnNewOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnNewOption}
    Web.Wait Until Element Is Visible    ${clickOnCloseLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnCloseLink}
    Web.Wait Until Element Is Visible    ${TokenPageHeader}    ${StandardTimeout}

Verify the popup when user clicks on Email Token Activation for an unassigned token
    [Tags]  CRT_ASGN_TKN_014        SurePassID_M1   SurePassId_Web
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${clickOnNewOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnNewOption}
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}
    Sleep   ${SleepDelay5s}         # Wait to disappear the Success Toast Popup Notification (Avoid message conflict)
    Web.Wait Until Element Is Visible    ${clickOnEmailTknActivation}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnEmailTknActivation}
    Wait Until the Update Icon Disappear
    Verified Error Message For Token Activation     ${ErrorMsgTkn}

Verify the popup and email when user clicks on Email Token Activation for an assigned token
    [Tags]  CRT_ASGN_TKN_015        SurePassID_M1       SurePassId_Web
    Delete Token If Existing     TestSPIDAuthTknName
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    Verified Success Message For Token      ${SuccessMessageToken}
    Web.Wait Until Element Is Visible    ${clickOnEmailTknActivation}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnEmailTknActivation}
    Wait Until the Update Icon Disappear
    Verified Success Message For Token      ${SuccessMessageToken}

Verify that token is getting provisioned when a future Provision Expiration Date is selected
    [Tags]  CRT_ASGN_TKN_016        SurePassID_M1
    Get Token Activation Link And Add It To SurePass Auth App
    sleep    ${SleepDelay10s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    ${TokenSerialNo}

Verify that token is not getting provisioned when the present date is selected in Provision Expiration Date
    [Tags]  CRT_ASGN_TKN_017        SurePassID_M1
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Click on Add button
    Verify User added Success Message receive or not
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${clickOnNewOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnNewOption}
    Web.Input Text     ${clickOnAssignToUsr}    Test
    Web.Wait Until Element Is Visible    xpath://*[text()="${assignToUsrName}"]    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    xpath://*[text()="${assignToUsrName}"]
    ${CurrentDate}    Get Current Date    result_format=%m/%d/%Y
    Web.Wait Until Element Is Visible    ${calender}     ${StandardTimeout}
    Web.Input Text    ${calender}    ${CurrentDate}
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    set global variable    ${TokenSerialNo}
    Web.Select From List by Value           ${MobileSetupVerification}        0
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}
    Sleep   ${SleepDelay10s}
    ${CurrentDate}    Get Current Date    result_format=%m/%d/%Y
    Web.Wait Until Element Is Visible    ${calender}     ${StandardTimeout}
    Web.Input Text    ${calender}    ${CurrentDate}
    Sleep   ${SleepDelay10s}
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}
    Sleep   ${SleepDelay10s}
    Web.Wait Until Element Is Visible    ${clickOnInstantActivationBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnInstantActivationBtn}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    Open Test Application
    sleep    ${SleepDelay10s}
    Open Browser With Activation Link       ${TokenActivationLink}
    sleep   ${SleepDelay10s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${AddAuthenticationDevice}    ${StandardTimeout}
    Mobile.Wait Until Element Is Visible    ${ErrorDownloadPushNotiSMsg}    ${StandardTimeout}
    [Teardown]    Delete Token If Existing    ${TokenSerialNo}

Verify that token is not getting provisioned when the past date is selected in Provision Expiration Date
    [Tags]  CRT_ASGN_TKN_018        SurePassID_M1
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Click on Add button
    Verify User added Success Message receive or not
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${clickOnNewOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnNewOption}
    Web.Input Text     ${clickOnAssignToUsr}    Test
    Web.Wait Until Element Is Visible    xpath://*[text()="${assignToUsrName}"]    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    xpath://*[text()="${assignToUsrName}"]
    ${Pastdate}     Get Current Date    result_format=%m/%d/%Y    increment=-1 day
    Web.Wait Until Element Is Visible    ${calender}     ${StandardTimeout}
    Web.Input Text    ${calender}    ${Pastdate}
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    set global variable    ${TokenSerialNo}
    Web.Select From List by Value           ${MobileSetupVerification}        0
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}
    Sleep   ${SleepDelay10s}
    Web.Wait Until Element Is Visible    ${calender}     ${StandardTimeout}
    Web.Input Text    ${calender}    ${Pastdate}
    Sleep   ${SleepDelay10s}
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}
    Sleep   ${SleepDelay10s}
    Web.Wait Until Element Is Visible    ${clickOnInstantActivationBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${clickOnInstantActivationBtn}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    Open Test Application
    sleep    ${SleepDelay10s}
    Open Browser With Activation Link       ${TokenActivationLink}
    sleep   ${SleepDelay10s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${AddAuthenticationDevice}    ${StandardTimeout}
    Mobile.Wait Until Element Is Visible    ${ErrorDownloadPushNotiSMsg}    ${StandardTimeout}
    [Teardown]    Delete Token If Existing    ${TokenSerialNo}