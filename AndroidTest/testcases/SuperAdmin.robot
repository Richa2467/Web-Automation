*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/SuperAdminResource.robot
Resource    ../locators/SuperAdminLocators.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../locators/ManageDashboardLocator.robot
Resource    ../locators/AuditTrailLocator.robot
Resource    ../locators/SSOLocator.robot
Resource    ../locators/UsersFilterLocator.robot
Resource    ../labels/SuperAdminLabels.robot
Resource    ../labels/TokenGroupLabel.robot
Resource    ../resources/OpenSystemAlertResource.robot
Resource    ../resources/SystemAlertsResource.robot
Resource    ../resources/TokenGroupResource.robot
Resource    ../Locators/TokenGroupLocator.robot
Resource    ../locators/LoginPageLocator.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/MFAOptionsPortalLoginResource.robot
Resource    ../resources/OpenSystemAlertResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../Resources/TokenGroupResource.robot
Resource    ../resources/TokensResource.robot
Resource    ../resources/ManageDashboardResource.robot


Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP for Super Admin    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify as the super-admin user is identified on the right side where active login is shown as FirstName LastName(Super).
    [Tags]  Super_Admin_001     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element is Visible               ${SuperUserNameLbl}     ${StandardTimeout}

Verify the super-admin user can successfully update the own profile.
    [Tags]  Super_Admin_002     SurePassId_Web
    Web.Wait Until Element is Visible               ${SuperUserNameLbl}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SuperUserNameLbl}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UpdateSuperUserBtn}
    Verify User updated Success Message receive or not

Verify the super-admin user is been able to create a Super Administrator user.
    [Tags]  Super_Admin_003     SurePassId_Web
    Navigate to Users Folder
    Click on New Option
    Provide required details for the super admin
    Select Super Admin access Role
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Click on Add button
    Verify User added Success Message receive or not
    [Teardown]    Delete User form the User List if existing            ${inputSuperAdminName}

Verify the super-admin user is been able to create an Administrator user
    [Tags]  Super_Admin_004     SurePassId_Web
    Navigate to Users Folder
    Click on New Option
    Provide required details for the super admin
    Select Admin option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Click on Add button
    Verify User added Success Message receive or not
    [Teardown]    Delete User form the User List if existing            ${inputSuperAdminName}

Verify the super-admin user is able to create a Help desk user.
    [Tags]  Super_Admin_005     SurePassId_Web
    Navigate to Users Folder
    Click on New Option
    Provide required details for the super admin
    Select Helpdesk User option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Click on Add button
    Verify User added Success Message receive or not
    [Teardown]    Delete User form the User List if existing            ${inputSuperAdminName}

Verify the super-admin user is able to create a User - No portal access user
    [Tags]  Super_Admin_006     SurePassId_Web
    Navigate to Users Folder
    Click on New Option
    Provide required details for the super admin
    Select User - No portal access option
    Click on Add button
    Verify User added Success Message receive or not
    [Teardown]    Delete User form the User List if existing            ${inputSuperAdminName}

Verify the super-admin user is able to see a drop-down of account on the home page
    [Tags]  Super_Admin_007     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Enabled      ${AccountDrdwn}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AccountDrdwn}

Verify the super-admin user is able to see a System Alerts section on home page
    [Tags]  Super_Admin_008     SurePassId_Web
    Navigate To Home Page
    Navigate to Super Admin User Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
    Web.Wait Until Element Is Visible    ${ClickOnUpdateOption}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnUpdateOption}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible       ${SystemAlertsLbl}    ${StandardTimeout}

Verify the super-admin user is able to see a Users section on home page
    [Tags]  Super_Admin_009     SurePassId_Web
    Navigate to Super Admin User Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}
    Web.Wait Until Element Is Visible    ${ClickOnUpdateOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnUpdateOption}
    #Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate to Home Page
    Web.Wait Until Element Is Visible       ${UsersLbl}     ${StandardTimeout}

Verify the super-admin user is able to see a Tokens section on home page
    [Tags]  Super_Admin_010     SurePassId_Web
    Navigate To Home Page
    Navigate to Super Admin User Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}
    Scroll Page To Location     1   1000
    Web.Wait Until Element Is Visible    ${ClickOnUpdateOption}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnUpdateOption}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible       ${TokenLbl}     ${StandardTimeout}

Verify the super-admin user is able to see a Authentications section on home page
    [Tags]  Super_Admin_011     SurePassId_Web
    Navigate To Home Page
    Navigate to Super Admin User Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}
    Scroll Page To Location     0       2000
    Web.Wait Until Element Is Visible    ${ClickOnUpdateOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnUpdateOption}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible       ${AuthenticationsLbl}     ${StandardTimeout}

Verify the super-admin user is able to see a welcome back message with own first and last name
    [Tags]  Super_Admin_012     SurePassId_Web
    Web.Wait Until Element Is Visible       ${WelcomeMsg}     ${StandardTimeout}
    Web.Element Should contain              ${WelcomeMsg}      Welcome Back

Verify the super-admin user is able to see a Home folder in the navigation bar.
    [Tags]  Super_Admin_013     SurePassId_Web
    Web.Wait Until Element Is Visible       ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${HomeTab}

Verify the super-admin user is able to see a Accounts folder in the navigation bar.
    [Tags]  Super_Admin_014     SurePassId_Web
    Web.Wait Until Element Is Visible       ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AboutLnk}
    Web.Wait Until Element Is visible         ${SA_About}     ${StandardTimeout}

Verify the super-admin user is able to see a Users folder in the navigation bar.
    [Tags]  Super_Admin_015     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UsersTab}
    Web.Wait Until Element Is visible        ${UsersTitle_1}      ${StandardTimeout}

Verify the super-admin user is able to see a Tokens folder in the navigation bar.
    [Tags]  Super_Admin_016     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokensTab}
    Web.Wait Until Element Is visible        ${TokenPageHeader}     ${StandardTimeout}

Verify the super-admin user is able to see a Audit Trail folder in the navigation bar.
    [Tags]  Super_Admin_017     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${auditTrailTab}
    Web.Wait Until Element Is visible        ${AuditTrailTtl_1}       ${StandardTimeout}

Verify the super-admin user is able to see a SSO folder in the navigation bar.
    [Tags]  Super_Admin_018     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSOTab}
    Web.Wait Until Element Is visible        ${SSOTitle_1}         ${StandardTimeout}

Verify the super-admin user is able to click on a hyper link of About under the home folder navigation bar and verify current product version details.
    [Tags]  Super_Admin_019     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AboutLnk}
    Web.Wait Until Element Is Visible        ${BuildLbl}       ${StandardTimeout}

Verify the super-admin user is able to click on a hyper link of About under the home folder navigation bar and verify current site license details.
    [Tags]  Super_Admin_020     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AboutLnk}
    Web.Wait Until Element Is Visible        ${LicenseLbl}       ${StandardTimeout}

Verify the super-admin user is able to click on a hyper link of Contact Support under the Home folder navigation bar and verify Contact Support section is shown
    [Tags]  Super_Admin_021     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnContactSupport}
    Web.Wait Until Element Is Visible        ${ContactSupportHeading}       ${StandardTimeout}

Verify the super-admin user is able to select option of "How To" from problem area drop down under the open ticket section
    [Tags]     Super_Admin_022      SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnContactSupport}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ProblemAreaDrpdwn}
    ${labels}      Web.Get List Items                       ${ProblemAreaDrpdwn}
    log to console      ${labels}
    #${listval}          Convert To List       ${ProblemArea}
    should be equal as strings   ${labels}          ${ProblemArea}
    Web.Wait Until Element Is Visible        ${ContactSupportHeading}       ${StandardTimeout}

Verify the super-admin user is able to create a ticket of the problem and verify the acknowledgment notification message "Your question is received and will be responded to ASAP." in the green color notification bar.
    [Tags]      Super_Admin_023     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnContactSupport}
    Web.Input Text                           ${PhoneCustSuppTxtField}              ${inputCellPhoneNo}
    Web.Input Text                           ${EmailCustSuppTxtField}              ${inputEmailId}
    Web.Input Text                           ${DescriptionCustSupp}                Testing Customer Support
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${OkCustSuppBtn}
    Web.Wait Until Element Is Visible        ${SuccessMsgCustSuppLbl}

Verify proper Validation message appears when Phone number or Email is missing from Customer Support form.
    [Tags]      Super_Admin_024     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnContactSupport}
    Web.Clear Element Text                   ${PhoneCustSuppTxtField}
    Web.Clear Element Text                   ${EmailCustSuppTxtField}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${OkCustSuppBtn}

Verify the super-admin user is able to click on a hyperlink of Contact Support under the Home folder navigation bar and then click on Support Portal/Knowledge Base hyperlink under the Support Links section and verify the open a support web page in another tab of surepassid website in the browser
    [Tags]      Super_Admin_025     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnContactSupport}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SupportPortalLnk}
    Web.Switch Window                        SurePassID, Corp. | Sign In
    Web.Wait Until Element Is Visible        ${SPCorpTitle}
    [Teardown]      Run Keyword     Web.Close All Browsers

Verify the super-admin user is able to click on a hyperlink of Get Started under the Home folder navigation bar.
    [Tags]    Super_Admin_026       SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP for Super Admin    6
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnGetStarted}
    Web.Wait Until Element Is Visible        ${GetStartedHeader}     ${StandardTimeout}

Verify the super-admin user is able to navigate on hyperlik of Accounts tab.
    [Tags]    Super_Admin_027       SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled        ${SuperAccountLnk}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SuperAccountLnk}
    Web.Wait Until Element Is Visible        ${SuperAccTitleLbl}     ${StandardTimeout}

Verify the super-admin user is able to Search for companies/accounts.
    [Tags]    Super_Admin_028       SurePassId_Web
    Search Company   ${CompanyName}

Verify the super-admin user is able to Edit for companies/accounts details.
    [Tags]    Super_Admin_029       SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Edit Company     ${CompanyName}
    Wait Until the Update Icon Disappear
    Web.Input Text      ${SerialNoTextBox}      777
    Page Should Contain     Account has been updated successfully

Verify the super-admin user is able to Delete companies/accounts details and verified successfully deleted item message.
    [Tags]    Super_Admin_030       SurePassId_Web
    Create new account    NewCompanyName = ${NewCompanyName}        EmailAccount=${SuperEmailIDField}
    #Verify Account added Success Message receive or not
    Web.Wait Until Element Is Enabled              ${CloseAccBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CloseAccBtn}
    Delete Company If Existed         ${NewCompanyName}
    Wait Until the Update Icon Disappear
    Verify Account deleted Success Message receive or not

Verify the super-admin user is able to navigate to the user folder.
     [Tags]    Super_Admin_031      SurePassId_Web
     Navigate To Home Page
     Web.Wait Until Element Is Enabled      ${clickOnUsers}    ${StandardTimeout}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnUsers}
     Web.Wait Until Element Is Enabled      ${UsersTitle_1}       ${StandardTimeout}

Verify the super-admin user is able to send Broadcast Message To all Administrators.
    [Tags]    Super_Admin_032   SurePassId_Web
    Navigate To Home Page
    Broadcast Message     0

Verify the super-admin user is able to change message format as HTML and after send Broadcast Message To all Administrators.
    [Tags]    Super_Admin_033   SurePassId_Web
    Navigate To Home Page
    Broadcast Message     1

Verify the super-admin user is able to navigate New Account Wizard and add new account details.
    [Tags]    Super_Admin_034     SurePassId_Web
    Navigate To Home Page
    Create new account    ${NewCompanyName}       ${SuperEmailIDField}
    Web.Wait Until Element Is Enabled              ${CloseAccBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CloseAccBtn}
    [Teardown]      Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

Verify the super-admin user is unable to add new account details with invalid email address.
    [Tags]    Super_Admin_035       SurePassId_Web
    Navigate To Home Page
    Create new account    ${NewCompanyName}        ${InvalidSuperEmailIDField}
    Web.Wait Until Element Is Visible          ${InvalidMailErrMsg}     ${StandardTimeout}

After successfully created company account then Verify the super-admin user is able to seen Email Preview section.
    [Tags]    Super_Admin_036   SurePassId_Web
    Navigate To Home Page
    Create new account    ${NewCompanyName}        ${SuperEmailIDField}
    Web.Wait Until Element Is Visible              ${EmailPreviewLbl}              ${StandardTimeout}
    Web.Wait Until Element Is Enabled              ${CloseAccBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CloseAccBtn}
    [Teardown]      Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

After successfully created company account then Verify the super-admin user is able to send Email.
    [Tags]    Super_Admin_037   SurePassId_Web
    Navigate To Home Page
    Create new account    ${NewCompanyName}        ${SuperEmailIDField}
    Web.Input Text        ${EmailPreviewTxtField}         Test_Mail
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AccSendMailBtn}
    Verify Account Email Sent Success Message receive or not
    Check Sent Mail on New Account Creation
    [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

After successfully created company account then Verify the super-admin user is able to Edit email template.
     [Tags]    Super_Admin_038     SurePassId_Web
     Navigate To Home Page
     Create new account       ${NewCompanyName}        ${SuperEmailIDField}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${EditEmailTmplBtn}
     Web.Wait Until Element Is Visible      ${EditEmailLbl}          ${StandardTimeout}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SaveBtn}
     Verify Edit Email saved Success Message receive or not
     [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

Verify the super-admin user is able to edit and update the company License Type.
     [Tags]    Super_Admin_039      SurePassId_Web
     Navigate To Home Page
     Create new account       ${NewCompanyName}        ${SuperEmailIDField}
     Web.Wait Until Element Is Enabled              ${CloseAccBtn}    ${StandardTimeout}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CloseAccBtn}
     Search Company            ${NewCompanyName}
     Web.Wait Until Element Is Enabled        ${EditNewCmpnyBtn}      ${StandardTimeout}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${EditNewCmpnyBtn}
     Web.Wait Until Element Is Enabled        ${LicenseDrpdwn}         ${StandardTimeout}
     Web.Input Text                           ${PrefixDataTxtField}    test123
     Web.Select From List By Value                  ${LicenseDrpdwn}      1
     Web.Wait Until Element Is Enabled        ${UpdateCmpnyBtn}    ${StandardTimeout}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element     ${UpdateCmpnyBtn}
     Wait Until Keyword Succeeds    3x      200s      Verify Account updated Success Message receive or not
     [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed      ${NewCompanyName}

Verify the super-admin user is able to close the account setup wizard page and return to the account page.
    [Tags]    Super_Admin_040       SurePassId_Web
     Navigate To Home Page
     Create new account         ${NewCompanyName}        ${SuperEmailIDField}
     Web.Wait Until Element Is Enabled              ${CloseAccBtn}           ${StandardTimeout}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CloseAccBtn}
     Web.Wait Until Element Is Enabled              ${SuperAccTitleLbl}      ${StandardTimeout}
     [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

Verify the super-admin user is able to close account Edit Email Template page and return to Account Setup Wizard page.
    [Tags]    Super_Admin_041       SurePassId_Web
    Navigate To Home Page
    Create new account       ${NewCompanyName}        ${SuperEmailIDField}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditEmailTmplBtn}
    Web.Wait Until Element Is Visible                  ${EditEmailLbl}          ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditEmailCloseBtn}
    [Teardown]    Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

Verify the super-admin user is unable to add new account details with invalid mobile number.
    [Tags]    Super_Admin_042      SurePassId_Web
    Navigate To Home Page
    Create new account    ${NewCompanyName}        ${SuperEmailIDField}
    Web.Input Text          ${AccMobileTxtField}      123456789
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${AddAccBtn}
    Web.Wait Until Element Is Visible          ${InvalidMobileErrMsg}      ${StandardTimeout}
    Web.Wait Until Element Is Visible          ${InvalidMobileErrMsg}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${CloseAccBtn}
    Web.Wait Until Element Is Enabled              ${SuperAccTitleLbl}      ${StandardTimeout}
    [Teardown]         Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

Verify the super-admin user is able to see the account name in the drop-down option on the user page.
     [Tags]    Super_Admin_043      SurePassId_Web
     Navigate To Home Page
     Create new account         ${NewCompanyName}        ${SuperEmailIDField}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${CloseAccBtn}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${HomeTab}
     Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
     Web.Select From List By Label        ${ClientDrdwn}      ${NewCompanyName}
     Wait Until the Update Icon Disappear
     Go to Account
     [Teardown]         Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

Verify the super-admin user is able to send Broadcast Message To Administrators with an empty Distribution List.
    [Tags]    Super_Admin_044       SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled        ${SuperAccountLnk}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${SuperAccountLnk}
    Web.Wait Until Element Is Enabled        ${BroadcastMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${BroadcastMsg}
    Web.Input Text                           ${BroadDescTxtField}      Test_Message
    Web.Clear Element Text                   ${BroadDLTxtField}
    Web.Wait Until Element Is Enabled        ${BroadOkBtn}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${BroadOkBtn}
    Web.Wait Until Element Is Visible        ${NoAdminsErrMsg}      ${StandardTimeout}

Verify the super-admin user is able to send Broadcast Message To Administrators with empty Message Body.
    [Tags]    Super_Admin_045       SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled        ${SuperAccountLnk}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${SuperAccountLnk}
    Web.Wait Until Element Is Enabled        ${BroadcastMsg}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${BroadcastMsg}
    Web.Clear Element Text                   ${BroadDLTxtField}
    Web.Input Text                           ${BroadDLTxtField}     ${superemailidfield}
    Web.Wait Until Element Is Enabled        ${BroadOkBtn}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${BroadOkBtn}
    Web.Wait Until Element Is Visible        ${NoMailErrMsg}

When the super-admin user is creating a new Administrator Account for the company with Credential Type set as SurePassID Authenticator Token
    [Tags]    Super_Admin_046       SurePassId_Web
    Navigate To Home Page
    Create new account         ${NewCompanyName}        ${SuperEmailIDField}        9
    Web.Wait Until Element Is Visible                 ${MobileUsgDrpwn}            ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CloseAccBtn}
    [Teardown]         Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

When the super-admin user is creating a new Administrator Account for the company with Credential Type set as Desktop Token
    [Tags]    Super_Admin_047          SurePassId_Web
    Create new account         ${NewCompanyName}        ${SuperEmailIDField}        1
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${CloseAccBtn}
    Web.Wait Until Element Is Enabled    ${SAUsersTab}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${SAUsersTab}
    Web.Wait Until Element Is Enabled    ${UsersTab_ACDropDown}    ${StandardTimeout}
    Select From List By Label    ${UsersTab_ACDropDown}     ${NewCompanyName}
    Go To User Details Page     ${NewCompanyName}
    Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

When the super-admin user is creating a new Administrator Account for the company with Credential Type set as U2F (Fido).
    [Tags]    Super_Admin_048       SurePassId_Web
    Create new account         ${NewCompanyName}        ${SuperEmailIDField}        12
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${CloseAccBtn}
    Web.Wait Until Element Is Enabled    ${SAUsersTab}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${SAUsersTab}
    Web.Wait Until Element Is Enabled    ${UsersTab_ACDropDown}    ${StandardTimeout}
    Select From List By Label    ${UsersTab_ACDropDown}     ${NewCompanyName}
    Go To User Details Page     ${NewCompanyName}
    [Teardown]         Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

When the super-admin user is creating a new Administrator Account for the company with Credential Type set as Google Authenticator Compliant.
    [Tags]  Super_Admin_049          SurePassId_Web
    Create new account         ${NewCompanyName}        ${SuperEmailIDField}        8
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${CloseAccBtn}
    Web.Wait Until Element Is Enabled    ${SAUsersTab}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${SAUsersTab}
    Web.Wait Until Element Is Enabled    ${UsersTab_ACDropDown}    ${StandardTimeout}
    Select From List By Label    ${UsersTab_ACDropDown}     ${NewCompanyName}
    Go To User Details Page     ${NewCompanyName}
    [Teardown]         Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

When the super-admin user is creating a new Administrator Account for the company with Credential Type set as Nymi Band
    [Tags]  Super_Admin_050         SurePassId_Web
    Create new account         ${NewCompanyName}        ${SuperEmailIDField}        13
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${CloseAccBtn}
    Web.Wait Until Element Is Enabled    ${SAUsersTab}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${SAUsersTab}
    Web.Wait Until Element Is Enabled    ${UsersTab_ACDropDown}    ${StandardTimeout}
    Select From List By Label    ${UsersTab_ACDropDown}     ${NewCompanyName}
    Go To User Details Page     ${NewCompanyName}
    [Teardown]         Wait Until Keyword Succeeds    3 times    10 sec    Delete Company If Existed         ${NewCompanyName}

Verify the super-admin user is able to navigate to license acknowledgments page
   [Tags]  Super_Admin_051      SurePassId_Web
   Navigate To Home Page
   Go to Account
   Go to License Acknowledgments

Verify the super-admin user is able seen drop down of Account on License Acknowledgments page
    [Tags]  Super_Admin_052     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to License Acknowledgments
    Web.Wait Until Element Is Visible        ${AccountDrdwn}   ${StandardTimeout}

Verify the super-admin user is able seen drop down of Filter Users on License Acknowledgments page
    [Tags]  Super_Admin_053     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to License Acknowledgments
    Web.Wait Until Element Is Visible        ${UserFilterDropDown}      ${StandardTimeout}

Verify the super-admin user is able seen drop down of Page Size on License Acknowledgments page
     [Tags]  Super_Admin_054    SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to License Acknowledgments
    Web.Wait Until Element Is Visible        ${RowsToDisplayDropDown}      ${StandardTimeout}

Verify the super-admin user is able to search company details with the use of the User filter set as "All"
     [Tags]  Super_Admin_054        SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to License Acknowledgments
    Web.Wait Until Element Is Visible        ${RowsToDisplayDropDown}      ${StandardTimeout}

Verify the super-admin user is able to navigate Edit Terms of Use page.
    [Tags]  Super_Admin_062     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to Edit Terms of Use

Verify the super-admin user is able to seen Terms of Use Preview which available in down side of page.
    [Tags]  Super_Admin_063     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to Edit Terms of Use
    Web.Wait Until Element Is Enabled        ${PreviewBtn}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${PreviewBtn}
    Web.Wait Until Element Is Visible           ${PreviewLbl}     ${StandardTimeout}

Verify the super-admin user is close preview of Terms of Use Preview
    [Tags]  Super_Admin_064     SurePassId_Web
    Web.Wait Until Element Is Enabled        ${ClosePreview}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClosePreview}

Verify the super-admin user is download the Terms of Use contetnt in .txt file.
    [Tags]  Super_Admin_065     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to Edit Terms of Use
    Web.Wait Until Element Is Enabled        ${DownloadBtn}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${DownloadBtn}
    ${home_dir}         Get Environment Variable          USERPROFILE
    ${download_dir}     Join Path   ${home_dir}           Downloads\\terms_of_use.txt
    ${result}           Run Keyword And Return Status     File Should Exist   ${download_dir}

Verify the super-admin user is able to edit Terms of Use.
     [Tags]  Super_Admin_066    SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to Edit Terms of Use
    Web.Wait Until Element Is Enabled        ${SaveBtn}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SaveBtn}
    Wait Until Keyword Succeeds    3x      200s      Verify Error Msg appear for no changes done

Verify the super-admin user is able press cancel button and return to accounts page
    [Tags]  Super_Admin_070     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Go to Edit Terms of Use
    Web.Wait Until Element Is Enabled        ${EditEmailCloseBtn}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  xpath://*[@id="ctl00_ContentPlaceHolder1_btnCancel"]
    #Web.Wait Until Element Is Visible        ${SuperAccTitleLbl}        ${StandardTimeout}

Verify the super-admin user is able to select/deselect All company details in Accounts Page.
    [Tags]  Super_Admin_071     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Web.Wait Until Element Is Enabled         ${AccCheckAll}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AccCheckAll}
    FOR     ${i}  IN RANGE   19
        Web.Element Attribute Value Should Be     //*[@onclick="EO21318.f.abpt(event, 'ctl00_ContentPlaceHolder1_Grid1', '_Check', [${i}, 0]);"]          checked         true
    END

Verify Pagination is working on Account listing page.
    [Tags]  Super_Admin_072     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Scroll Element Into View                  ${CopyrightSection}
    Web.Wait Until Element Is Enabled         ${LastPgLnk}    ${StandardTimeout}
    Web.Click Element                         ${LastPgLnk}
    Web.Wait Until Element Is Enabled         ${FirstPgLnk}     ${StandardTimeout}
    Web.Click Element                         ${FirstPgLnk}
    Web.Wait Until Element Is Enabled         ${LastPgLnk}     ${StandardTimeout}

Verify the super-admin user is able to add empty details in Account Setup Wizard.
    [Tags]  Super_Admin_073     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Web.Wait Until Element Is Enabled            ${NewAccBtn}               ${StandardTimeout}
    Web.Click Element                        ${NewAccBtn}
    Web.Click Element                        ${AddAccBtn}
    Web.Wait Until Element Is Visible        ${EnterAccErrMsg}               ${StandardTimeout}

Verify the super-admin user is able to see the License Acknowledgement hyperlink under the sub-navigation bar in the Accounts tab.
    [Tags]  Super_Admin_074     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Web.Wait Until Element Is Enabled            ${LAlnk}               ${StandardTimeout}

Verify the super-admin user is able to see the Edit Terms of Use hyperlink under the sub-navigation bar in the Accounts tab.
    [Tags]  Super_Admin_075     SurePassId_Web
    Navigate To Home Page
    Go to Account
    Web.Wait Until Element Is Enabled            ${EditTermsLnk}               ${StandardTimeout}

Verify the super-admin user is able to see the hyperlink of Settings under the sub-navigation bar in the client detail or update account page.
    [Tags]  Super_Admin_076     SurePassId_Web
    Go to Account
    Create new account       ${NewCompanyName}        ${SuperEmailIDField}
    Web.Wait Until Element Is Enabled              ${CloseAccBtn}    ${StandardTimeout}
    Web.Click Element         ${CloseAccBtn}
    Search Company            ${NewCompanyName}
    Web.Wait Until Element Is Enabled        ${EditNewCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${EditNewCmpnyBtn}
    Web.Wait Until Element Is Visible        ${SettingsLnk}         ${StandardTimeout}

Verify the super-admin user is able to see the hyperlink of File Configuration under the sub-navigation bar in the client detail or update account page.
    [Tags]  Super_Admin_077     SurePassId_Web
    Search Company            ${NewCompanyName}
    Web.Wait Until Element Is Enabled        ${EditNewCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${EditNewCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${FileConfigTitle}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${FileConfigTitle}
    Web.Element Should Be Visible            ${FileConfigTitle}

Verify the super-admin user is able to see the hyperlink of Customize Email Messages under the sub-navigation bar in the client detail or update account page.
    [Tags]  Super_Admin_078     SurePassId_Web
    Search Company            ${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled        ${EditNewCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditNewCmpnyBtn}
    Web.Wait Until Element Is Visible        ${CustMailLink}         ${StandardTimeout}

Verify the super-admin user is able to see the hyperlink of Customize Mobile Messages under the sub-navigation bar in the client detail or update account page.
     [Tags]  Super_Admin_079        SurePassId_Web
    Search Company            ${NewCompanyName}
    Web.Wait Until Element Is Enabled        ${EditNewCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${EditNewCmpnyBtn}
    Web.Wait Until Element Is Visible        ${CustomizeMSGLink}         ${StandardTimeout}

Verify that the super-admin user is able to see the user of different account.
    [Tags]  Super_Admin_084     SurePassId_Web
    Delete Company If Existed         ${NewCompanyName}
    Create new account      ${NewCompanyName}        ${SuperEmailIDField}
    Web.Wait Until Element Is Enabled              ${CloseAccBtn}    ${StandardTimeout}
    Web.Click Element         ${CloseAccBtn}
    Navigate To Home Page
    Wait Until the Update Icon Disappear
    Go To User Details Page For SuperAdmin     UserName=${NewCompanyName}        AccountNameVal=${NewCompanyName}

Verify that the super-admin user is able to edit the user details of different account.
    [Tags]  Super_Admin_085     SurePassId_Web
    Navigate To Home Page
    Wait Until the Update Icon Disappear
    Go To User Details Page For SuperAdmin     UserName=${NewCompanyName}        AccountNameVal=${NewCompanyName}
    Select Helpdesk User option
    Click on Update button
    Wait Until the Update Icon Disappear
    Verify User updated Success Message receive or not

Verify that the super-admin user is able to delete the user of different account.
    [Tags]  Super_Admin_086     SurePassId_Web
    Navigate To Home Page
    Wait Until the Update Icon Disappear
    Go To User Details Page For SuperAdmin     UserName=${NewCompanyName}        AccountNameVal=${NewCompanyName}
    Delete User form the User List if existing      inputTexttoDelete=${NewCompanyName}

Verify that the SurePassID Authenticator Token is listed on the token page after the super-admin user has created it.
    [Tags]  Super_Admin_089     SurePassId_Web
    Delete Company If Existed         ${NewCompanyName}
    Create new account      ${NewCompanyName}        ${SuperEmailIDField}
    Web.Wait Until Element Is Enabled              ${CloseAccBtn}    ${StandardTimeout}
    Web.Click Element         ${CloseAccBtn}
    Navigate To Home Page
    Wait Until the Update Icon Disappear
    Go To Token Page And Search Token For SuperAdmin       TokenName=111_00000000       AccountNametest=${NewCompanyName}

Verify that the super-admin user is able to add Desktop Token for own profile
    [Tags]  Super_Admin_090     SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=Test_DeskTop       TokenType=1        TokenStatus=0

Verify that the super-admin user is able to add Fido Token for own profile
    [Tags]  Super_Admin_091     SurePassId_Web
    Go To Add New Token Page
    Add New FIDO Token To The User Account      TokenStatus=0       UserDefinedName=FidoToken       TokenType=12

Verify that the super-admin user is able to add Google Authenticator Compliant Token for own profile
    [Tags]  Super_Admin_092     SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=GoogleAuth      TokenType=8        TokenStatus=0

Verify that the super-admin user is able to add Nymi Band Token for own profile
    [Tags]  Super_Admin_093     SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=GoogleAuth      TokenType=13        TokenStatus=0

Verify that the super-admin user is able to add SMS Token for own profile
    [Tags]  Super_Admin_094
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=SMSToken      TokenType=7        TokenStatus=0

Verify that the super-admin user is able to add Voice Message OTP Token for own profile
    [Tags]  Super_Admin_095     SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=VoiceOTP      TokenType=10        TokenStatus=0

Verify the super-admin user is able to see system Alerts,users,tokens and authentication statistics for different account
    [Tags]  Super_Admin_096     SurePassId_Web  0012
    Navigate To Home Page
    Navigate to Super Admin User Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Check All the Manage Dashboard Items
    Scroll Page To Location     1   1000
    Web.Wait Until Element Is Visible    ${ClickOnUpdateOption}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnUpdateOption}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Navigate to Home Page
    Change Account Name     AccountNametest=${NewCompanyName}
    Verify system Alerts,users,tokens and authentication statistics on DashBoard

#The super-admin user is able to see the hyperlink of "NEW" on the Update Account page
#    [Tags]  Super_Admin_105     SurePassId_Web      1234
#    Search Company      CompanyName=${NewCompanyName}
##    Sleep  10s
#    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
#    Web.Click Element                          ${EditCmpnyBtn}
##    Sleep  5s
#    Web.Element Should Be Visible            ${EditPageNEWLink}

The super-admin user is able to see the hyperlink of "NEW API KEY" on the Update Account page
    [Tags]  Super_Admin_106     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}

The super-admin user is able to see the hyperlink of "UPDATE" on the Update Account page
    [Tags]  Super_Admin_107     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageUpdate}

The super-admin user is able to see the hyperlink of "CLOSE" on the Update Account page
    [Tags]  Super_Admin_108     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageClose}

#The super-admin user is able to create a new account with use of hyperlink of "NEW" on the Update Account page
#    [Tags]  Super_Admin_109     SurePassId_Web      1234
#    Search Company      CompanyName=${NewCompanyName}
##    Sleep  10s
#    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
#    Web.Click Element                        ${EditCmpnyBtn}
##    Sleep  5s
#    Wait Until the Update Icon Disappear
#    Web.Element Should Be Visible            ${EditPageNEWLink}
#    Web.Click Element                        ${EditPageNEWLink}
#    Create New Account from Edit Pate      ${NewCompanyName}        ${SuperEmailIDField}

The super-admin user is able to verify that the hyperlink of "Close" is working
    [Tags]  Super_Admin_117     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageClose}
    Web.Click Element                        ${EditPageClose}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            xpath://span[.='Accounts']

The super-admin user is able to verify contents of Permission Templates dropdown.
    [Tags]  Super_Admin_118     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Verify Permission Template List

The super-admin user is able to verify that the column of ACTION under the "API Access Control Keys" section
    [Tags]  Super_Admin_119     Super_Admin_120     Super_Admin_121     Super_Admin_122     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${AppKeyIdeClm}
    Web.Element Should Be Visible            ${AppKeyNameClm}
    Web.Element Should Be Visible            ${AppLastUsedClm}
    Web.Element Should Be Visible            ${AppActionClm}

The super-admin user is able to verify when creation of new account that time "data protection" option by default set as "SurePassID Local"
    [Tags]  Super_Admin_124     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    ${DataProtValue}      Web.get text       ${DataProtValue}
    ${DataProtValue}      Convert To String       ${DataProtValue}
    Log To Console      ${DataProtValue.strip()}
    Should Be Equal      ${DataProtValue.strip()}      SurePassID Local

Verify the super-admin user is able to check a checkbox of "White List (allow access only to) these IP addresses" under the Authenticate Calling IP Address section
    [Tags]  Super_Admin_125     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Web.Wait Until Element Is Enabled    ${WhiteListCheBox}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${WhiteListCheBox}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${WhiteListCheBox}

Verify the super-admin user is able to see only those icon(s) on the Second-factor authentication SurePassID Login Portal page that are selected under the "MFA Options For Portal Login" section.
    [Tags]  Super_Admin_126     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Uncheck All MFA Options For Portal Login Under Account Section
    Select Send Sms OTP Option
    Select Send Email Otp
    Click on Settings Update Button Under Account Section
    Click On Logout Link
    Open SurePass On Browser
    Submit First Login Page for Super Admin
    Second Factor Login Contain Send SMS OTP to my Phone Option
    Web.Close All Browsers
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP for Super Admin    6
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Check All MFA Options For Portal Login Under Account Section

Verify selected APIs from API Access Control List should be reflected and accessible in tenant account when logged in.
    [Tags]  Super_Admin_127     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${ApplicationList01}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${ApplicationList01}
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP for Super Admin    6
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    ${Status}   Run Keyword and return status   Checkbox Should Be Not Selected     ${ApplicationList01}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${ApplicationList01}

Verify that certain access rights are automatically seen selected when super-admin is select a "SurePassID ADFS adapter" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_128     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option from Permission DropDown      PermissonValue=Adfs
    Wait Until the Update Icon Disappear
    Verify Enabled API for SurePassId ADFS

Verify that certain access rights are automatically seen selected when super-admin is select a "Directory Sync" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_129     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option From Permission DropDown      PermissonValue=DirectorySync
    Wait Until the Update Icon Disappear
    Verify Enabled API for Directory Sync

Verify that certain access rights are automatically seen selected when super-admin is select a "Event Log Sync" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_130     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option from Permission DropDown      PermissonValue=EventLogSync
    Wait Until the Update Icon Disappear
    Verify Enabled API for EventLogSync

Verify that certain access rights are automatically seen selected when super-admin is select a "SurePassID Programable Access Module (PAM)" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_131     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option from Permission DropDown      PermissonValue=Pam
    Wait Until the Update Icon Disappear
    Verify Enabled API for SurePassId PAM

Verify that certain access rights are automatically seen selected when super-admin is select a "SurePassID RADIUS and FreeRADIUS" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_132     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option from Permission DropDown      PermissonValue=Radius
    Wait Until the Update Icon Disappear
    Verify Enabled API for SurePassId RADIUS

Verify that certain access rights are automatically seen selected when super-admin is select a "SurePassID ServicePass" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_133     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option from Permission DropDown      PermissonValue=ServicePass
    Wait Until the Update Icon Disappear
    Verify Enabled API for SurePassId ServicePass

Verify that certain access rights are automatically seen selected when super-admin is select a "ServicePass - No Fido" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_134     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option from Permission DropDown      PermissonValue=ServicePassNoFido
    Wait Until the Update Icon Disappear
    Verify Enabled API for SurePassId No Fido

Verify that certain access rights are automatically seen selected when super-admin is select a "ServicePass - No Mobile Provisioning (No QR codes)" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_135     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option from Permission DropDown      PermissonValue=ServicePassNoMobile
    Wait Until the Update Icon Disappear
    Verify Enabled API for SurePass No QR Code

Verify that certain access rights are automatically seen selected when super-admin is select a "SurePassID Windows Login Manager" option from the drop-down of the permission templates.
    [Tags]  Super_Admin_136     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Select Option from Permission DropDown      PermissonValue=Wlm
    Wait Until the Update Icon Disappear
    Verify Enabled API for SurePass Windows Login Manager

The super-admin user is able to have "Api Key Status Information" details added without fill any information.
    [Tags]  Super_Admin_110     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}
    Web.Click Element                        ${EditPageNEWAPIKey}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${APIKeyAddBtn}
    Web.Click Element                        ${APIKeyAddBtn}
    Wait Until the Update Icon Disappear
    ${AddBtnValidation}      Web.get text       ${APIKeyAddBtnValidation}
    ${AddBtnValidation}      Convert To String       ${AddBtnValidation}
    Log To Console      ${AddBtnValidation.strip()}
    Should Be Equal      ${AddBtnValidation.strip()}      You must enter a descriptive name for this key.

The super-admin user is able to "Api Key Status Information" details added with key name.
    [Tags]  Super_Admin_111     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditPageNEWAPIKey}
    Wait Until the Update Icon Disappear
    Web.Input Text      ${APIKeyNamefield}      ${APIKeyName}
    Web.Element Should Be Visible            ${APIKeyAddBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${APIKeyAddBtn}
    Wait Until the Update Icon Disappear
    Page Should Contain     Application Key added successfully.

The super-admin user is able to update API Key details
    [Tags]  Super_Admin_115     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditAPIKey}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditAPIKey}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible       ${APIKeyNamefield}
    Web.Input Text      ${APIKeyNamefield}      ${UpdateAPIKeyName}
    Web.Element Should Be Visible            ${APIKeyAddBtn}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${APIKeyAddBtn}
    Wait Until the Update Icon Disappear
    Page Should Contain     Application Key saved successfully.

The super-admin user is able to delete API Key details
    [Tags]  Super_Admin_116     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${DeleteAPIKey}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${DeleteAPIKey}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${ConfirmDeleteAPIKey}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${ConfirmDeleteAPIKey}

The super-admin user is able to copy Key Identifier and Key Token
    [Tags]  Super_Admin_113     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditPageNEWAPIKey}
    Wait Until the Update Icon Disappear
    ${OldKeyValue}      Web.get value       ${KeyValue}
    ${OldKeyValue}      Convert To String       ${OldKeyValue}
    Log To Console      ${OldKeyValue.strip()}
    Web.Element Should Be Visible            ${NewKeyValue}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${NewKeyValue}
    Wait Until the Update Icon Disappear
    ${NewKeyValue1}      Web.get value      ${KeyValue}
    ${NewKeyValue1}      Convert To String       ${NewKeyValue1}
    Log To Console      ${NewKeyValue1.strip()}
    Should Not Be Equal      ${OldKeyValue}     ${NewKeyValue1}

Verify the super-admin user is able to see the hyperlink of Account under the sub-navigation bar in the client detail or update account page.
    [Tags]  Super_Admin_082     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${ACInfoTitle}     ${StandardTimeout}
    Web.Element Should Be Visible            ${AppKeyTitle}     ${StandardTimeout}

Verify that the super-admin user is able to navigate to the File Configuration option from the sub-navigation bar
    [Tags]  Super_Admin_083     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Sleep  5s
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${FileConfigTitle}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${FileConfigTitle}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${FileConfigTitle}     ${StandardTimeout}

Verify that the super-admin user is able to add SurePassID Authenticator Token for own profile
    [Tags]  Super_Admin_087     SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account
    Wait Until the Update Icon Disappear

Verify that the super-admin user is able to add SurePassID Authenticator Token for different profile
    [Tags]  Super_Admin_088     SurePassId_Web
    Go To Tokens Page
    Web.Element Should Be Visible            ${TokenPageNew}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${TokenPageNew}
    Web.Wait Until Element Is Enabled    ${NewTokenActDropDown}    ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Web.Select From List By Label    ${NewTokenActDropDown}     ${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Input Text     ${AssignToName}    ${NewCompanyName}
    Web.Wait Until Element Is Visible    xpath://*[text()="${NewCompanyName}"]    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      xpath://*[text()="${NewCompanyName}"]
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${TokenAddButton}

The super-admin user is able to verify that the KEY-NAME and Key Identifier of Api Key Status Information should be matched with the column of KEY-NAME under the "API Access Control Keys" section on the update account page
    [Tags]  Super_Admin_123     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible        ${EditCmpnyBtn}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditCmpnyBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditPageNEWAPIKey}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditPageNEWAPIKey}
    Wait Until the Update Icon Disappear
    Web.Input Text      ${APIKeyNamefield}      ${APIKeyName}
    Wait Until the Update Icon Disappear
    ${KeyValue1}      Web.get value       ${KeyIdeValue}
    ${KeyValue1}      Convert To String       ${KeyValue1}
    Web.Element Should Be Visible            ${APIKeyAddBtn}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${APIKeyAddBtn}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${NewKeyClose}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${NewKeyClose}
    Wait Until the Update Icon Disappear
    Page Should Contain     ${KeyValue1}
    Page Should Contain     ${APIKeyName}

Verify the super-admin user is able to save Terms of Use without edit.
    [Tags]  Super_Admin_067     SurePassId_Web
    Search Company      CompanyName=${NewCompanyName}
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible            ${EditTermsUse}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditTermsUse}
    Web.Element Should Be Visible            ${EditTermsUseSave}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditTermsUseSave}
    Page Should Contain     No changes were detected.
    