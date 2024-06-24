*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../resources/CustomizeEmailMsgResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/CustomizeMobileMSGResource.robot
Resource    ../resources/SystemAlertsResource.robot
Resource    ../resources/OpenSystemAlertResource.robot
Resource    ../resources/ManageDashboardResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify Admin user should be able to visible system alerts on Home Dashboard
    [Tags]  Sys_Alt_Statistics_001   SurePassID_M3    SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
    Web.Wait Until Element Is Visible    ${ClickOnUpdateOption}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnUpdateOption}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}
    Verify that System Alerts Panel Should Be Visible.

Verify Admin User Should be Visible System Alert Statistics in Grid Format
    [Tags]  Sys_Alt_Statistics_002   SurePassID_M3    SurePassId_Web
    Verify System Alerts Panel Should be in Grid Format

Verify Admin User Should be Visible System Alert Statistics in Bar Format
    [Tags]  Sys_Alt_Statistics_003   SurePassID_M3    SurePassId_Web
    Verify System Alerts Panel Should be in Bar Format
    Navigate To Home Page

Verify that Admin user is redirected to "Audit Trail" Tab When Click on Actions Required Value for This Week, last week and This month.
    [Tags]  Sys_Alt_Statistics_004   SurePassID_M3    SurePassId_Web
    Click on Action Required Value For ThisWeek
    Verify Audit Trail page
    Navigate To Home Page
    Click on Action Required Value For LastWeek
    Verify Audit Trail page
    Navigate To Home Page
    Click on Action Required Value For ThisMonth
    Verify Audit Trail page
    Navigate To Home Page

Verify that Admin user is redirected to "Audit Trail" Tab When Click on Severe Value for This Week , Last Week and This month.
    [Tags]  Sys_Alt_Statistics_005   SurePassID_M3    SurePassId_Web
    Click on Severe Value For ThisWeek 
    Verify Audit Trail page
    Navigate To Home Page
    Click on Severe Value For LastWeek
    Verify Audit Trail page
    Navigate To Home Page
    Click on Severe Value For ThisMonth
    Verify Audit Trail page
    Navigate To Home Page

Verify that Admin user is redirected to "Audit Trail" Tab When Click on Warning Value for This Week , Last week and This month.
    [Tags]  Sys_Alt_Statistics_006   SurePassID_M3    SurePassId_Web
    Click on Warning Value For ThisWeek
    Verify Audit Trail page
    Navigate To Home Page
    Click on Warning Value For LastWeek
    Verify Audit Trail page
    Navigate To Home Page
    Click on Warning Value For ThisMonth
    Verify Audit Trail page
    Navigate To Home Page

Verify that Helpdesk user should unable to redirect to "Audit Trail" Tab When Click on Actions Required Value for This Week, last week and This month.
    [Tags]  Sys_Alt_Statistics_007   SurePassID_M3    SurePassId_Web
    ${HelpdeskPw}  Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    Set Global variable   ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}       ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Click on Action Required Value For ThisWeek
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page
    Click on Action Required Value For LastWeek
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page
    Click on Action Required Value For ThisMonth
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page

Verify that Helpdesk user should be unable to redirect to the "Audit Trail" Tab When Click on Severe Value for This Week , Last Week and This month.
    [Tags]  Sys_Alt_Statistics_008   SurePassID_M3    SurePassId_Web
    #Open SurePass On Browser
    #Submit First Login Page for Helpdesk User   ${inputUserName2}       ${HelpdeskPw}
    #Select the Checkbox if Terms of Use Page is visible
    Click on Severe Value For ThisWeek 
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page
    Click on Severe Value For LastWeek
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page
    Click on Severe Value For ThisMonth
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page

Verify that Helpdesk user should be unable to redirect to "Audit Trail" Tab When Click on Warning Value for This Week , Last week and This month.
    [Tags]  Sys_Alt_Statistics_009   SurePassID_M3    SurePassId_Web
    #Open SurePass On Browser
    #Submit First Login Page for Helpdesk User   ${inputUserName2}       ${HelpdeskPw}
    #Select the Checkbox if Terms of Use Page is visible
    Click on Warning Value For ThisWeek
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page
    Click on Warning Value For LastWeek
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page
    Click on Warning Value For ThisMonth
    Verify Audit Trail Page Not Existed      
    Navigate To Home Page

Verify that Help Desk User Should be Visible System Alert Statistics in Grid Format 
    [Tags]  Sys_Alt_Statistics_010   SurePassID_M3    SurePassId_Web
    #Open SurePass On Browser
    #Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    #Select the Checkbox if Terms of Use Page is visible
    Verify System Alerts Panel Should be in Grid Format

Verify that Help Desk User Should be Visible System Alert Statistics in Bar Format
    [Tags]  Sys_Alt_Statistics_011  SurePassID_M3    SurePassId_Web
    #Open SurePass On Browser
    #Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    #Select the Checkbox if Terms of Use Page is visible
    Verify System Alerts Panel Should be in Bar Format
    Navigate To Home Page
    [Teardown]     Web.Close All Browsers

Verify Action Required "This Week" , "Last Week" and "This Month" numbers status increased or not.
    [Tags]  Sys_Alt_Statistics_012   SurePassID_M3    SurePassId_Web
    [Setup]     Run Keywords     Open SurePass On Browser
    ...          AND                Submit 2FA Page Using Email OTP    6
    Go To Add New Token Page
    Add Disabled Token To The User Account      TokenType=9    UserDefinedName=ABCD
    Navigate To Home Page
    Get Action Required Count For This Month
    Get Action Required Count For This Week
    Click On Logout Link
    Invalid First Login Page
    Web.Close All Browsers
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Verify Action Required New Count Should be Greater Than Old Count For This Month
    Verify Action Required New Count Should be Greater Than Old Count For This Week

Verify Severe "This Week" , "Last Week" and "This Month" numbers status increased or not.
    [Tags]  Sys_Alt_Statistics_013   SurePassID_M3    SurePassId_Web
    Go To Add New Token Page
    Navigate To Home Page
    Get Severe Count For This Week
    Get Severe Count For This Month
    Click On Logout Link
    Invalid First Login Page
    Web.Close All Browsers
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Verify Severe New Count Should be Greater Than Old Count For This Week
    Verify Severe New Count Should be Greater Than Old Count For This Month

Verify Warning "This Week", "Last Week" and "This Month" numbers status increased or not.
    [Tags]  Sys_Alt_Statistics_014   SurePassID_M3    SurePassId_Web
    Go To Add New Token Page
    Navigate To Home Page
    Get Warning Count For This Week
    Get Warning Count For This Month
    Click On Logout Link
    Invalid First Login Page
    Web.Close All Browsers
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Verify Warning New Count Should be Greater Than Old Count For This Week
    Verify Warning New Count Should be Greater Than Old Count For This Month
    Delete Token If Existing        ABCD
