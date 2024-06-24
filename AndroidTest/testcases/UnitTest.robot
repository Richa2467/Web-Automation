*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenGroupResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../locators/UserGroupLocator.robot
Resource    ../resources/UserGroupResource.robot
Resource    ../resources/AddNewSoftTokenResource.robot
Resource    ../resources/CreateAndAssignTokenResource.robot
Resource    ../resources/AndroidResource.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../resources/CustomizeEmailMsgResource.robot
Resource    ../locators/CustomizeMobileMSGLocators.robot
Resource    ../resources/CustomizeMobileMSGResource.robot
Resource    ../resources/OpenSystemAlertResource.robot
Resource    ../resources/MFAOptionsPortalLoginResource.robot


Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify Admin User is able to create new user with 'Administrator' user role.
    [Tags]  CRT_NEW_USR_010   UnitTest_001     SurePassId_Web   Add_User
    Delete User form the User List if existing  ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Click on Add button
    Verify User added Success Message receive or not

Verify Admin User is able to create new user with 'Helpdesk' user role.
    [Tags]  CRT_NEW_USR_012   UnitTest_002     SurePassId_Web   Add_User
    Navigate to Users Folder
    Delete User form the User List if existing  ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Select Helpdesk User role
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter for Helpdesk User Role
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOndeleteAction}

Verify Admin User is able to create a new user with default User role (User-No portal access).
    [Tags]  CRT_NEW_USR_013   UnitTest_003     SurePassId_Web   Add_User
    Delete User form the User List if existing  ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOndeleteAction}

Verify New option is working properly.
    [Tags]  EDIT_USR_001   UnitTest_004    SurePassId_Web   Add_User
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Click on New Option from Edit User
    Web.Wait Until Element Is Visible    ${UserDetailPageHeader}    ${StandardTimeout}
    Web.Page Should Contain Element     ${UserDetailPageHeader}       ${StandardTimeout}

Verify 'Test SMS' option is working properly or Not.
    [Tags]  EDIT_USR_009   UnitTest_005    SurePassId_Web   Test SMS
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Click on Test SMS option
    Verify Success Message for sent test SMS successfully on the mobile number

Verify 'Test Call' option is working properly or Not.
    [Tags]  EDIT_USR_010   UnitTest_006    SurePassId_Web   Test Call
    Click on Test Call option
    Verify Success Message Bar for sent test Call successfully on the mobile number

Verify User is able to delete single users from the user's list.
    [Tags]  DELETE_USR_001      UnitTest_008   SurePassId_Web   Delete User
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOndeleteAction}

Verify Users Group created successfully or Not
    [Tags]  USR_GRP_001     UnitTest_009   SurePassId_Web   User Group
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Select multiple checkbox option to add users in group
    Click on Users group Add button
    Verify User Group added Success Message receive or not

Verify User is able to create a desktop token with default values of the form
    [Tags]  USR_NEW_TKN_010     UnitTest_010   SurePassId_Web   Create_Token
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${DesktopToken}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a desktop token with a user-defined token name
    [Tags]  USR_NEW_TKN_011     UnitTest_011   SurePassId_Web   Create_Token
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker6
    [Teardown]    Delete Token If Existing    Tinker6

Verify User is able to create a Fido token with default values of the form
    [Tags]  USR_NEW_TKN_012     UnitTest_012   SurePassId_Web   Create_Token
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectFidoToken}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Fido token with a user-defined token name
    [Tags]  USR_NEW_TKN_013     UnitTest_013   SurePassId_Web   Create_Token
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectFidoToken}
    Enter User Define Name    TestGoogleAuthTknName
    Click on Add button
    Verify Device/Token added Success Message receive or not
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Google Authentication token with default values of the form
    [Tags]  USR_NEW_TKN_014     UnitTest_014   SurePassId_Web   Create_Token
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectGoogleAuthToken}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Google Authentication token with a user-defined token name
    [Tags]  USR_NEW_TKN_015     UnitTest_015   SurePassId_Web   Create_Token
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectGoogleAuthToken}    UserDefinedName=TestGoogleAuthTknName
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Nymi Band token with default values of the form
    [Tags]  USR_NEW_TKN_016     UnitTest_016   SurePassId_Web   Create_Token
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectNymiBand}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Nymi Band token with a user-defined token name
    [Tags]  USR_NEW_TKN_017     UnitTest_017   SurePassId_Web   Create_Token
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectNymiBand}    UserDefinedName=TestNymiBandTknName
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a SMS token with default values of the form
    [Tags]  USR_NEW_TKN_018     UnitTest_018   SurePassId_Web   Create_Token
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectSMSToken}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a SMS token with a user-defined token name
    [Tags]  USR_NEW_TKN_019     UnitTest_019   SurePassId_Web   Create_Token
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSMSToken}    UserDefinedName=TestSMSTknName
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a SurePassID Authentication token with default values of the form
    [Tags]  USR_NEW_TKN_020     UnitTest_020   SurePassId_Web   Create_Token
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectSurePassIDAuthToken}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a SurePassID Authentication token with a user-defined token name
    [Tags]  USR_NEW_TKN_021     UnitTest_021   SurePassId_Web   Create_Token
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Voice Message OTP token with default values of the form
    [Tags]  USR_NEW_TKN_022     UnitTest_022   SurePassId_Web   Create_Token
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectVoiceMessageOTP}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Voice Mesage OTP token with a user-defined token name
    [Tags]  USR_NEW_TKN_023     UnitTest_023   SurePassId_Web   Create_Token
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectVoiceMessageOTP}    UserDefinedName=TVoiceMsgOTPTknName
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify the alert message when token is assigned with no serial number provided
    [Tags]  CRT_ASGN_TKN_001        UnitTest_024   SurePassId_Web   Create_Token
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${AssignTokenLink}    ${StandardTimeout}
    Web.Click Element    ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Web.Click Element    ${TokenAddButton}
    Verify PopUp Message receive or not     ${TknSrNoerrorMsg}
    Web.Page Should Contain Element     ${redTextTknSrNo}       ${StandardTimeout}

Verify the alert message when token is assigned with an invalid serial number
    [Tags]  CRT_ASGN_TKN_002        UnitTest_025   SurePassId_Web   Create_Token
    Web.Wait Until Element Is Visible    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Input Text    ${AssignTokenSrNo}    ${invalidTokenSerialNo}
    Web.Wait Until Element Is Visible    ${TokenAddButton}     ${StandardTimeout}
    Web.Click Element    ${TokenAddButton}
    Verify PopUp Message receive or not     ${invalidSrNoMsg}

Verify User is able to see 'SMTP Server Settings' and 'Customize Email Messages' Section on the 'Customize Email Messages' form page.
    [Tags]  SMTP_SER_SET_001   UnitTest_026    SurePassId_Web   Settings
    Click on Home Tab
    Click on Account Tab
    Click On Customize Email MSG
    Web.Page Should Contain Element     ${SMTPSettings}       ${StandardTimeout}
    Web.Page Should Contain Element     ${Emailseetings}       ${StandardTimeout}

Verify User is able to see Host Name/IP, Port, Username, Password fields under 'SMTP Server Settings'.
    [Tags]  SMTP_SER_SET_002   UnitTest_027    SurePassId_Web   Settings
    Web.Page Should Contain Element     ${HostName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${portName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${SMTPUserName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${SMTPPassword}       ${StandardTimeout}

Verify User is not able to edit 'SMTP Server Settings' without selecting 'Use Custom SMTP Settings' checkbox.
    [Tags]  SMTP_SER_SET_003   UnitTest_028    SurePassId_Web   Settings
    Web.Wait Until Element Is Enabled    ${customSMTPCB}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Page Should Contain Element     ${disableHostNamefield}       ${StandardTimeout}
    Web.Page Should Contain Element     ${disablePortfield}       ${StandardTimeout}
    Web.Page Should Contain Element     ${disableSMTPUNfield}       ${StandardTimeout}
    Web.Page Should Contain Element     ${disableSMTPPWfield}       ${StandardTimeout}

Verify User is able to edit 'SMTP Server Settings' by selecting 'Use Custom SMTP Settings' checkbox
    [Tags]  SMTP_SER_SET_004   UnitTest_029    SurePassId_Web   Settings
    Web.Wait Until Element Is Enabled    ${customSMTPCB}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Wait Until Element Is Enabled    ${inputSMTPHostName}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPHostName}    ${SMTPGmailHost}
    Web.Input Text    ${inputSMTPPort}    ${SMTPPortNo}
    Web.Input Text    ${inputSMTPUsrName}    ${SMTPTestUserName}
    Web.Wait Until Element Is Enabled    ${clickOnLock}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnLock}
    Web.Wait Until Element Is Enabled    ${inputSMTPPswd}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPPswd}    ${SMTPTestPwd}
    Web.Wait Until Element Is Enabled    ${clickOnLock}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnLock}

User should be able to check the password edit field should be enabled/disabled, after clicking on Lock symbol
    [Tags]  SMTP_SER_SET_005   UnitTest_030    SurePassId_Web   Settings
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
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnLock}
    Web.Wait Until Element Is Enabled    ${inputSMTPPswd}    ${StandardTimeout}
    Web.Input Text    ${inputSMTPPswd}    ${SMTPTestPwd}

Verify User is able to see all the fields of Customize Email Messages.
    [Tags]  CUSTM_EMAIL_MSG_001   UnitTest_031     SurePassId_Web   Settings
    Web.Page Should Contain Element     ${textEmailFormat}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textSysAction}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textFromEmailName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textFromEmailName}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textSubject}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textMessageBody}       ${StandardTimeout}
    Web.Page Should Contain Element     ${textMessage}       ${StandardTimeout}

Verify User is able to choose 'HTML' and 'Plain Text'format to send the email.
    [Tags]  CUSTM_EMAIL_MSG_002   UnitTest_032     SurePassId_Web   Settings
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${customSMTPCB}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${customSMTPCB}
    Web.Wait Until Element Is Visible    ${selectEmailFormat}   ${StandardTimeout}
    Web.Select From List by Value       ${selectEmailFormat}      ${PlainTextFormat}
    Web.Select From List by Value       ${selectEmailFormat}      ${HTMLFormat}

Verify User is able to select 'Twilio' option as a SMS Provider
    [Tags]  CUSTM_MBL_MSG_001   UnitTest_033   SurePassId_Web   Settings
    Go to CustomizeMobileMSG
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Select From List By Value            ${SMSProviderDropdown}     ${Twilio}
    Update and Verify Success Message

Verify If select 'Twilio' option as an SMS Provider, User is able to see 'Account SID', 'Auth Token' and 'From Phone Number' fields.
    [Tags]  CUSTM_MBL_MSG_002   UnitTest_034   SurePassId_Web   Settings
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Select From List By Value            ${SMSProviderDropdown}     ${Twilio}
    Web.Wait Until Element Is Visible       ${AccountSIDField}    ${StandardTimeout}
    Web.Wait Until Element Is Visible       ${AuthTokenField}    ${StandardTimeout}
    Web.Wait Until Element Is Visible       ${FrmPhnNoField}    ${StandardTimeout}

Verify User is able to edit each message body.
    [Tags]  CUSTM_MBL_MSG_003   UnitTest_035   SurePassId_Web   Settings
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Select From List By Value            ${SMSProviderDropdown}     ${Twilio}
    Web.Wait Until Element Is Visible       ${SMSServerLgnName}    ${StandardTimeout}
    Web.Clear Element Text	    ${SMSServerLgnName}
    Web.Input Text    ${SMSServerLgnName}    Test Login Name
    Web.Wait Until Element Is Visible       ${SMSServerLgnPw}    ${StandardTimeout}
    Web.Clear Element Text	    ${SMSServerLgnPw}
    Web.Input Text    ${SMSServerLgnPw}    Test Login Password
    Web.Wait Until Element Is Visible       ${CellPhnNo}    ${StandardTimeout}
    Web.Clear Element Text	    ${CellPhnNo}
    Web.Input Text    ${CellPhnNo}    12345

Verify User is able to set default message again for 'Activating a mobile token'.
    [Tags]  CUSTM_MBL_MSG_004   UnitTest_036   SurePassId_Web   Settings
    Web.Clear Element Text	    ${SMSSenderActivationMsgBody}
    Web.Input Text    ${SMSSenderActivationMsgBody}    ${MsgBodyMessage}
    Web.Wait Until Element Is Visible    ${SetDftBtnSMSSendActvn}    ${StandardTimeout}
    Web.Click Element    ${SetDftBtnSMSSendActvn}

Verify User is able to set default message again for 'Sending One Time Passcode'.
    [Tags]  CUSTM_MBL_MSG_005   UnitTest_037   SurePassId_Web   Settings
    Web.Clear Element Text	    ${SMSCreateTRCTNMsgBody}
    Web.Input Text    ${SMSCreateTRCTNMsgBody}    ${MsgBodyMessage}
    Web.Wait Until Element Is Visible    ${SetDftBtnSMSCreate}    ${StandardTimeout}
    Web.Click Element    ${SetDftBtnSMSCreate}

Verify User is able to select checkboxes for Send Sms Otp, Send Email Otp, Voice Otp, Push Sms Question,Push Question To App and Call My Phone options which are available under 'MFA Options For Portal Login' section
    [Tags]    MFA_LGN_OPSN_001  UnitTest_038     SurePassId_Web     Settings
    Navigate To Home Page
    Navigate To Account Details Page
    Uncheck All MFA Options For Portal Login Under Account Section
    Check All MFA Options For Portal Login Under Account Section

Verify User should not be able to edit Maximum Users Licensed, Maximum Tokens Licensed and Account Expiration Date fields in the 'Account Limits' section
    [Tags]   SETTINGS_001   UnitTest_039   SurePassId_Web   Settings
    Navigate To Home Page
    Click on Account Tab
    Navigate to Settings Tab
    Web.Wait Until Element Is Visible     ${MaxUsersLicensedTextField}
    Web.Element Should Be Disabled        ${MaxUsersLicensedTextField}
    Web.Wait Until Element Is Visible     ${MaxTokensLicensedTextField}
    Web.Element Should Be Disabled        ${MaxTokensLicensedTextField}
    Web.Element Should Be Disabled        ${AccountExpDatePicker}

Verify User should not be able to edit 'Current Culture' field in the 'Culture and Time Zone'section
    [Tags]   SETTINGS_002   UnitTest_040    SurePassId_Web    Settings
    Click on Account Tab
    Navigate to Settings Tab
    Web.Wait Until Element Is Visible     ${CurrCulureTextFiled}
    Web.Element Should Be Disabled        ${CurrCulureTextFiled}

Verify User is able to select 'Time Zone' field from dropdown list in the 'Culture and Time Zone' section
    [Tags]   SETTINGS_003   UnitTest_041    SurePassId_Web    Settings
    Click on Account Tab
    Navigate to Settings Tab
    Select Timezone    India Standard Time

Verify User is able to edit 'Allowable Failed OTP Validations Per Token' field in the 'Security' section
    [Tags]   SETTINGS_004   UnitTest_042    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    Web.Wait Until Element Is Visible     ${otpValidationToken}   ${StandardTimeout}
    Web.Input Text                        ${otpValidationToken}    10
    Update and Confirm Success Message  ${SettingsUpdateMsg}

Verify User is able to select 'Account Password Expiration' field from dropdown list in the 'Security'section
    [Tags]   SETTINGS_005   UnitTest_043    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    Web.Click Element                     ${AccPwdExpDropdown}
    Web.Select From List By Value         ${AccPwdExpDropdown}     0
    Update and Confirm Success Message  ${SettingsUpdateMsg}

Verify User is able to Update time in Minutes and Seconds for 'Mobile notifications are valid for' field
    [Tags]  SETTINGS_006    UnitTest_044    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    Select Mobile notification valid for time from dropdown list      ValidMobileMin=2    ValidMobileSec=10
    Update and Confirm Success Message  ${SettingsUpdateMsg}
    Enter the initial data once again for MOTP notification

Verify User is able to Update time in Minutes and Seconds for 'Email OTP is valid for'field
    [Tags]  SETTINGS_007    UnitTest_045    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    Select Email notification valid for time from dropdown list      ValidEmailMin=2    ValidEmailSec=10
    Update and Confirm Success Message  ${SettingsUpdateMsg}
    Enter the initial data once again for MOTP notification

Verify User is able to Update time in Minutes and Seconds for 'Temporary OTP is valid for'field
    [Tags]  SETTINGS_008    UnitTest_046    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    Select Temporary notification valid for time from dropdown list      ValidTempMin=2    ValidTempSec=10
    Update and Confirm Success Message  ${SettingsUpdateMsg}
    Enter the initial data once again for MOTP notification

Verify User is able to check only one option ( SurePassID Directory ) available in dropdown list for 'User Authentication Method'
    [Tags]  SETTINGS_009    UnitTest_047    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    ${Values}    Web.Get Selected List Labels     ${UsrAuthMethodDropdown}
    log to console    ${Values}
    Should Be Equal     ${Values}[0]           SurePassID Directory

Verify User is able to tick-mark Severe, Warning, Success, Action Required and Informational options which are available under 'Event Log Synchronization Filters' section
    [Tags]  SETTINGS_010    UnitTest_048    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    Mark all the options checkboxes

Verify User is able to Update settings after selecting checkboxes for Severe, Warning, Success, Action Required and Informational options which are available under Event Log Synchronization Filters section
    [Tags]  SETTINGS_011    UnitTest_049    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    Uncheck All the options
    Update and Confirm Success Message  ${SettingsUpdateMsg}
    Mark all the options checkboxes
    Update and Confirm Success Message  ${SettingsUpdateMsg}

Verify User is able to close settings Page
    [Tags]  SETTINGS_012    UnitTest_050    SurePassId_Web      Settings
    Click on Account Tab
    Navigate to Settings Tab
    Web.Click Element      ${CloseButton}
    Web.Element Should Contain     ${AccPageHeader}     Update Account
