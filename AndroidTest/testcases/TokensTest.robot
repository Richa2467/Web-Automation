*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../resources/CustomizeEmailMsgResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/CustomizeMobileMSGResource.robot
Resource    ../resources/TokensResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/SystemAlertsResource.robot
Resource    ../resources/OpenSystemAlertResource.robot
Resource    ../resources/UserStatisticsResource.robot
Resource    ../labels/TokensLabel.robot
Resource    ../resources/ManageDashboardResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND               Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify that Admin User should be visible Tokens title in Home Dashboard.
    [Tags]  Token_Statistics_001   SurePassID_M3    SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
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
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Check Tokens Title on Home Dash Board

Verify that when Admin user add token in the system then "Enable Token" and "Mobile Token" statistics should be incremented.    
    [Tags]  Token_Statistics_002   SurePassID_M3    SurePassId_Web
    Get Enabled Token Count
    Get Mobile Token Count
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}
    Navigate To Home Page
    Verify For Enabled Token New Count Should be Greater Than Old Token Count
    Verify For Mobile Token New Count Should be Greater Than Old Token Count

Verify that Help Desk User should be visible increment result of "Enable Token".
    [Tags]  Token_Statistics_003   SurePassID_M3    SurePassId_Web
    ${HelpdeskPw}      Add New Helpdesk User with SurePassId Authentication Token
    Set Global variable   ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Verify For Enabled Token New Count Should be Greater Than Old Token Count
    [Teardown]    Run Keyword    Web.Close Browser

Verify that when Admin user delete token in the system then "Enabled Token" and "Mobile Token" statistics should be decremented
    [Tags]  Token_Statistics_004   SurePassID_M3    SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Get Enabled Token Count
    Get Mobile Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Verify For Enabled Token New Count Should be Less Than Old Token Count
    Verify For Mobile Token New Count Should be Less Than Old Token Count

Verify that Help Desk User Should be Visible Decremented Result for "Enable Token"
    [Tags]  Token_Statistics_005  SurePassID_M3    SurePassId_Web
    ${HelpdeskPw}      Add New Helpdesk User with SurePassId Authentication Token
    Set Global variable   ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Verify For Enabled Token New Count Should be Less Than Old Token Count
    [Teardown]    Run Keyword    Web.Close Browser

Verify that when Admin user add "Disabled Token" in the system then "Disabled Token" and "Mobile Token" statistics should be incremented
    [Tags]  Token_Statistics_006   SurePassID_M3    SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Get Disabled Token Count
    Get Mobile Token Count
    Go To Add New Token Page 
    Add New Token To The User Account       TokenStatus=${TokenStatus_Disable}       UserDefinedName=${UDNTokenName}
    Navigate To Home Page
    Verify For Disabled Token New Count Should be Greater Than Old Token Count
    Verify For Mobile Token New Count Should be Greater Than Old Token Count

Verify that Help Desk User should be Visible Incremented Result of "Disable Token".
    [Tags]  Token_Statistics_007   SurePassID_M3    SurePassId_Web
    ${HelpdeskPw}      Add New Helpdesk User with SurePassId Authentication Token
    Set Global variable   ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Verify For Disabled Token New Count Should be Greater Than Old Token Count
    [Teardown]    Run Keyword    Web.Close Browser

Verify that when Admin user delete "Disabled Token" in the system then "Disabled Token" and "Mobile Token" statistics should be decremented
    [Tags]  Token_Statistics_008   SurePassID_M3    SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Get Disabled Token Count
    Get Mobile Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Verify For Disabled Token New Count Should be less Than Old Token Count
    Verify For Mobile Token New Count Should be Less Than Old Token Count

Verify that Help Desk User Should be Visible Decremented Result of "Disable Token"
    [Tags]  Token_Statistics_009   SurePassID_M3    SurePassId_Web
    ${HelpdeskPw}      Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    Set Global variable   ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Verify For Disabled Token New Count Should be less Than Old Token Count
    [Teardown]    Run Keyword    Web.Close Browser

Verify that when Admin user add New token in the system then "New Token" and "Mobile Token" statistics should be incremented
    [Tags]  Token_Statistics_010   SurePassID_M3    SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Get New Token Count
    Get Mobile Token Count
    Go To Add New Token Page
    Add New Token To The User Account       UserDefinedName=${UDNTokenName}       TokenStatus=${TokenStatus_New}
    Navigate To Home Page
    Verify For New Token New Count Should be Greater Than Old Token Count
    Verify For Mobile Token New Count Should be Greater Than Old Token Count

Verify that Help Desk User should be visible increment result of "New Token".
    [Tags]  Token_Statistics_011   SurePassID_M3    SurePassId_Web
    ${HelpdeskPw}      Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    Set Global variable   ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Verify For New Token New Count Should be Greater Than Old Token Count
    [Teardown]    Run Keyword    Web.Close Browser

Verify that when Admin user delete New token in the system then 'New Token' and "Mobile Token" statistics should be decremented
    [Tags]  Token_Statistics_012   SurePassID_M3    SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Get New Token Count
    Get Mobile Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Verify For New Token New Count Should be less Than Old Token Count
    Verify For Mobile Token New Count Should be Less Than Old Token Count

Verify that Help Desk User Should be Visible Decremented Result of "New Token"
    [Tags]  Token_Statistics_013   SurePassID_M3    SurePassId_Web
    ${HelpdeskPw}      Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    Set Global variable   ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Verify For New Token New Count Should be less Than Old Token Count
    [Teardown]    Run Keyword    Web.Close Browser

Verify that when Admin user should change token status "Enable" to "Disable" then Enable Token count should be decremented and Disable Token count should be Incremented.
    [Tags]  Token_Statistics_014   SurePassID_M3    SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}     TokenStatus=${TokenStatus_Enable}
    Navigate To Home Page
    Get Enabled Token Count
    Get Disabled Token Count
    Edit Token Status       TokenName=${UDNTokenName}       TokenStatus=${TokenStatus_Disable}
    Navigate To Home Page
    Verify For Enabled Token New Count Should be Less Than Old Token Count
    Verify For Disabled Token New Count Should be Greater Than Old Token Count
    [TearDown]  Run Keyword        Delete Token If Existing        TokenName=${UDNTokenName}

Verify that when Admin user should change token status "Enable" to "New" then Enable Token count should be decremented and New Token count should be Incremented
    [Tags]  Token_Statistics_015   SurePassID_M3    SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}     TokenStatus=${TokenStatus_Enable}
    Navigate To Home Page
    Get Enabled Token Count
    Get New Token Count
    Edit Token Status       TokenName=${UDNTokenName}       TokenStatus=${TokenStatus_New}
    Navigate To Home Page
    Verify For Enabled Token New Count Should be Less Than Old Token Count
    Verify For New Token New Count Should be Greater Than Old Token Count
    [TearDown]  Run Keyword        Delete Token If Existing        TokenName=${UDNTokenName}

Verify that when Admin user should change token status "Disable" to "New" then Disable Token count should be decremented and New Token count should be Incremented 
    [Tags]  Token_Statistics_016  SurePassID_M3    SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}        TokenStatus=${TokenStatus_Disable}
    Navigate To Home Page
    Get Disabled Token Count
    Get New Token Count
    Edit Token Status       TokenName=${UDNTokenName}       TokenStatus=${TokenStatus_New}
    Navigate To Home Page
    Verify For Disabled Token New Count Should be less Than Old Token Count
    Verify For New Token New Count Should be Greater Than Old Token Count
    [TearDown]  Run Keyword        Delete Token If Existing        TokenName=${UDNTokenName}

Verify that when Admin user should change token status "Disable" to "Enable" then Disable Token count should be decremented and Enable Token count should be Incremented
    [Tags]  Token_Statistics_017   SurePassID_M3    SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}     TokenStatus=${TokenStatus_Disable}
    Navigate To Home Page
    Get Disabled Token Count
    Get Enabled Token Count
    Edit Token Status       TokenName=${UDNTokenName}      TokenStatus=${TokenStatus_Enable}
    Navigate To Home Page
    Verify For Disabled Token New Count Should be less Than Old Token Count
    Verify For Enabled Token New Count Should be Greater Than Old Token Count

Verify that when Admin user should change token status "New" to "Enable" then New Token count should be decremented and Enable Token count should be Incremented
    [Tags]  Token_Statistics_018   SurePassID_M3    SurePassId_Web
    Delete Token If Existing        TokenName=${UDNTokenName}
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}     TokenStatus=${TokenStatus_New}
    Navigate To Home Page
    Get Enabled Token Count
    Get New Token Count
    Edit Token Status       TokenName=${UDNTokenName}       TokenStatus=${TokenStatus_Enable}
    Navigate To Home Page
    Verify For New Token New Count Should be less Than Old Token Count
    Verify For Enabled Token New Count Should be Greater Than Old Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}

Verify that when Admin user should change token status "New" to "Disable" then New Token count should be decremented and Disable Token count should be Incremented
    [Tags]  Token_Statistics_019   SurePassID_M3    SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}     TokenStatus=${TokenStatus_New}
    Navigate To Home Page
    Get Disabled Token Count
    Get New Token Count
    Edit Token Status       TokenName=${UDNTokenName}       TokenStatus=${TokenStatus_Disable}
    Navigate To Home Page
    Verify For New Token New Count Should be less Than Old Token Count
    Verify For Disabled Token New Count Should be Greater Than Old Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}

Verify that when Admin user add desktop token in the system with "Enable" Status then desktop and Enabled Token should be increased
    [Tags]  Token_Statistics_020   SurePassID_M3    SurePassId_Web
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Get Enabled Token Count
    Get Desktop Token Count
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}      TokenType=1        TokenStatus=${TokenStatus_Enable}
    Navigate To Home Page
    Verify For Enabled Token New Count Should be Greater Than Old Token Count
    Verify For Desktop Token New Count Should be Greater Than Old Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}

Verify that when Admin user delete desktop token in the system with "Enable" Status then desktop and Enabled Token should be decreased
    [Tags]  Token_Statistics_021   SurePassID_M3    SurePassId_Web
    Go To Add New Token Page
    Add Token To The User Account       UserDefinedName=${UDNTokenName}      TokenType=1        TokenStatus=${TokenStatus_Enable}
    Navigate To Home Page
    Get Enabled Token Count
    Get Desktop Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Verify For Enabled Token New Count Should be Less Than Old Token Count
    Verify For Desktop Token New Count Should be Less Than Old Token Count

Verify that when Admin user add desktop token in the system with "Disable" Status then desktop and Disable Token should be increased
    [Tags]  Token_Statistics_022   SurePassID_M3    SurePassId_Web
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Get Disabled Token Count
    Get Desktop Token Count
    Go To Add New Token Page
    Add Token To The User Account       TokenStatus=${TokenStatus_Disable}      UserDefinedName=${UDNTokenName}     TokenType=1
    Navigate To Home Page
    Verify For Disabled Token New Count Should be Greater Than Old Token Count
    Verify For Desktop Token New Count Should be Greater Than Old Token Count

Verify that when Admin user delete desktop token in the system with "Disable" Status then desktop and Disable Token should be decreased
    [Tags]  Token_Statistics_023   SurePassID_M3    SurePassId_Web
    Navigate To Home Page
    Get Disabled Token Count
    Get Desktop Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Verify For Disabled Token New Count Should be less Than Old Token Count
    Verify For Desktop Token New Count Should be Less Than Old Token Count

Verify that when Admin user add desktop token in the system with "New" Status then desktop and New Token should be increased
    [Tags]  Token_Statistics_024   SurePassID_M3    SurePassId_Web
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Get New Token Count
    Get Desktop Token Count
    Go To Add New Token Page
    Add Token To The User Account       TokenStatus=${TokenStatus_New}      UserDefinedName=${UDNTokenName}     TokenType=1
    Navigate To Home Page
    Verify For New Token New Count Should be Greater Than Old Token Count
    Verify For Desktop Token New Count Should be Greater Than Old Token Count

Verify that when Admin user delete desktop token in the system with "New" Status then desktop and New Token should be decreased
    [Tags]  Token_Statistics_025   SurePassID_M3    SurePassId_Web
    Navigate To Home Page
    Get New Token Count
    Get Desktop Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Verify For New Token New Count Should be less Than Old Token Count
    Verify For Desktop Token New Count Should be Less Than Old Token Count

Verify that when Admin user add Security token in the system with "Enable" Status then Security and Enable Token should be increased
    [Tags]  Token_Statistics_026   SurePassID_M3    SurePassId_Web
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Get Enabled Token Count
    Get Security Token Count
    Go To Add New Token Page
    Add New FIDO Token To The User Account      TokenStatus=${TokenStatus_Enable}      UserDefinedName=${UDNTokenName}     TokenType=12
    Navigate To Home Page
    Verify For Enabled Token New Count Should be Greater Than Old Token Count
    Verify For Security Token New Count Should be Greater Than Old Token Count

Verify that when Admin user delete Security token in the system with "Enabled" Status then Security and Enabled Token should be decreased
    [Tags]  Token_Statistics_027   SurePassID_M3    SurePassId_Web
    Navigate To Home Page
    Get Enabled Token Count
    Get Security Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Verify For Enabled Token New Count Should be Less Than Old Token Count
    Verify For Security Token New Count Should be Less Than Old Token Count

Verify that when Admin user add Security token in the system with "Disable" Status then Security and Disable Token should be increased
    [Tags]  Token_Statistics_028   SurePassID_M3    SurePassId_Web
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Get Disabled Token Count
    Get Security Token Count
    Go To Add New Token Page
    Add New FIDO Token To The User Account       TokenStatus=${TokenStatus_Disable}       UserDefinedName=${UDNTokenName}     TokenType=12
    Navigate To Home Page
    Verify For Disabled Token New Count Should be Greater Than Old Token Count
    Verify For Security Token New Count Should be Greater Than Old Token Count

Verify that when Admin user delete Security token in the system with "Disable" Status then Security and Disable Token should be decreased
    [Tags]  Token_Statistics_029   SurePassID_M3    SurePassId_Web
    Navigate To Home Page
    Get Disabled Token Count
    Get Security Token Count
    Delete Token If Existing        TokenName=${UDNTokenName}
    Navigate To Home Page
    Verify For Disabled Token New Count Should be less Than Old Token Count
    Verify For Security Token New Count Should be Less Than Old Token Count




