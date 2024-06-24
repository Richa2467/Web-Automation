*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/ManageDashboardResource.robot
Resource    ../resources/OpenSystemAlertResource.robot
Resource    ../resources/UsersPageResource.robot
Library    Collections

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
######################################## Admin User TCs #########################################
Verify that the Admin-User is able to see and access the hyperlink of Manage Dashboard on the home page.
    [Tags]  Manage_DB_001   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${MD_Authentications}    ${StandardTimeout}
    Page Should Contain     ${Authentications_Desc}

Verify that the Admin-User is able to see details regarding the dashboard under the manage dashboard items section.
    [Tags]  Manage_DB_003   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${MD_Authentications}    ${StandardTimeout}
    Page Should Contain     ${Authentications_Desc}
    Web.Wait Until Element Is Visible    ${MD_SystemAlerts}    ${StandardTimeout}
    Page Should Contain     ${SystemAlerts_Desc}
    Web.Wait Until Element Is Visible    ${MD_Tokens}    ${StandardTimeout}
    Page Should Contain     ${Tokens}
    Web.Wait Until Element Is Visible    ${MD_Users}    ${StandardTimeout}
    Page Should Contain     ${Users}

Verify that the user is able to sort dashboard related details in descending and ascending order under the Manage Dashboard Items section.
    [Tags]  Manage_DB_004   Manage_Dashboard    Admin_User     SurePassId_Web
    Web.Wait Until Element Is Enabled   ${AssendingnDesendingbtn}   ${StandardTimeout}
    Web.Click Element                   ${AssendingnDesendingbtn}
    Web.Wait Until Element Is Enabled   ${AssendingnDesendingbtn}   ${StandardTimeout}
    Web.Click Element                   ${AssendingnDesendingbtn}
    Web.Wait Until Element Is Enabled   ${AssendingnDesendingbtn}   ${StandardTimeout}
    Web.Click Element                   ${AssendingnDesendingbtn}
    Web.Wait Until Element Is Enabled   ${AssendingnDesendingbtn}   ${StandardTimeout}
    Web.Click Element                   ${AssendingnDesendingbtn}
    Web.Wait Until Element Is Enabled   ${AssendingnDesendingbtn}   ${StandardTimeout}
    Web.Click Element                   ${AssendingnDesendingbtn}

Verify that the admin-user is able to see only the "System Alerts" statistics section on the home page.
    [Tags]   Manage_DB_005    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}

Verify that the admin-user is able to see only the "Users" statistics section on the home page.
    [Tags]   Manage_DB_006    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}

Verify that the admin-user is able to see only the "Tokens" statistics section on the home page
    [Tags]   Manage_DB_007    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}

Verify that the admin-user is able to see only the "Authentications" statistics section on the home page.
    [Tags]   Manage_DB_008    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}

Verify that the admin-user is able to see all statistics section on the home page.
    [Tags]   Manage_DB_009    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Check All the Manage Dashboard Items
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}

Verify that the admin-user is able to see all statistics sections will be empty on the home page.
    [Tags]   Manage_DB_010    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Not Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Not Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Not Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Not Visible    ${SystemAlertsTitle}    ${StandardTimeout}

Verify that the admin-user is able to update the Manage Dashboard Items.
    [Tags]   Manage_DB_011    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Check All the Manage Dashboard Items
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}

Verify that the Admin-User is able to identify that name (Authentications) of manage dashboard items should be matched with the name of the Authentications statistics section on the home page.
    [Tags]   Manage_DB_012    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}

Verify that the Admin-User is able to identify that name (System Alerts) of manage dashboard items should be matched with the name of the System Alerts statistics section on the home page.
    [Tags]   Manage_DB_013    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}

Verify that Admin-User is able to identify that name (Tokens) manage dashboard items should matched with the name of the Tokens statistics section on the home page.
    [Tags]   Manage_DB_014    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}

Verify that the Admin-User is able to identify that name (Users) of manage dashboard items should be matched with the name of the Users statistics section on the home page.
    [Tags]   Manage_DB_015    Manage_Dashboard      Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}

Verify that the Admin-User is able to see the proper description for 'Authentications' under the "Manage Dashboard Items" section.
    [Tags]  Manage_DB_016   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${MD_Authentications}    ${StandardTimeout}
    Page Should Contain     ${Authentications_Desc}

Verify that the Admin-User is able to see the proper description for 'System Alerts' under the "Manage Dashboard Items" section.
    [Tags]  Manage_DB_017   Manage_Dashboard    Admin_User     SurePassId_Web
    Web.Wait Until Element Is Visible    ${MD_SystemAlerts}    ${StandardTimeout}
    Page Should Contain     ${SystemAlerts_Desc}

Verify that the Admin-User is able to see the proper description for 'Tokens' under the "Manage Dashboard Items" section.
    [Tags]  Manage_DB_018   Manage_Dashboard    Admin_User     SurePassId_Web
    Web.Wait Until Element Is Visible    ${MD_Tokens}    ${StandardTimeout}
    Page Should Contain     ${Tokens}

Verify that the Admin-User is able to see the proper description for 'Users' under the "Manage Dashboard Items" section.
    [Tags]  Manage_DB_019   Manage_Dashboard    Admin_User     SurePassId_Web
    Web.Wait Until Element Is Visible    ${MD_Users}    ${StandardTimeout}
    Page Should Contain     ${Users}

Verify that the Admin-User is able to navigate back to home page using close button.
    [Tags]  Manage_DB_020   Manage_Dashboard    Admin_User     SurePassId_Web
    Web.Wait Until Element Is Visible    ${CloseButton}    ${StandardTimeout}
    Web.Click Element    ${CloseButton}
    Web.Wait Until Element Is Visible    ${WelcomeMsgBar}    ${StandardTimeout}
    ${DescriptionData}     Web.Get Text	  ${WelcomeMsgBar}
    Should Contain     ${DescriptionData}      ${WelcomeBackMsg}

Verify that the Admin-User is able to see and access the hyperlink of Account on the home page.
    [Tags]  Manage_DB_021   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${EditAccountLink}    ${StandardTimeout}
    Web.Click Element    ${EditAccountLink}
    Web.Wait Until Element Is Visible    ${LoginCredentials}    ${StandardTimeout}

Verify that the Admin-User is able to see and access the hyperlink of About on the home page.
    [Tags]  Manage_DB_022   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${ClickOnAbout}    ${StandardTimeout}
    Web.Click Element    ${ClickOnAbout}
    Web.Wait Until Element Is Visible    ${AboutPageHeader}    ${StandardTimeout}

Verify that the Admin-User is able to see and access the hyperlink of Contact Support on the home page.
    [Tags]  Manage_DB_023   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${ClickOnContactSupport}    ${StandardTimeout}
    Web.Click Element    ${ClickOnAbout}
    Web.Wait Until Element Is Visible    ${ContactSupportHeading}    ${StandardTimeout}

Verify that the Admin-User is able to see and access the hyperlink of Get Started on the home page.
    [Tags]  Manage_DB_024   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${ClickOnGetStarted}    ${StandardTimeout}
    Web.Click Element    ${ClickOnGetStarted}
    Web.Wait Until Element Is Visible    ${GetStartedHeader}    ${StandardTimeout}

Verify that the Admin-User is able to identify the name (System Alerts) of manage dashboard items should be matched with the name of the System Alerts statistics section on the home page.
    [Tags]  Manage_DB_025   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}

Verify that the Admin-User is able to identify the name (Authentications) of manage dashboard items should be matched with the name of the Authentications statistics section on the home page.
    [Tags]  Manage_DB_026   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}

Verify that the Admin-User is able to identify the name (Tokens) of manage dashboard items should be matched with the name of the Tokens statistics section on the home page.
    [Tags]  Manage_DB_027   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}

Verify that the Admin-User is able to identify that name (Users) of manage dashboard items should be matched with the name of the Users statistics section on the home page
    [Tags]  Manage_DB_028   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}

Verify that the Admin-User is able to select Grid from Chart Type option for Tokens section.
    [Tags]  Manage_DB_029   Manage_Dashboard        Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Web.Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenChartTypes}/option[@value='${TokensGridChartType}']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${TokenChartTypes}        ${TokensGridChartType}
    Web.Wait Until Element Is Visible    ${MobileTokenStatistics}    ${StandardTimeout}

Verify that the Admin-User is able to select Bar & Pie Chart option from Chart Type option for Tokens section.
    [Tags]  Manage_DB_031   Manage_Dashboard        Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Web.Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenChartTypes}/option[@value='${TokensBar&PieChart}']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${TokenChartTypes}        ${TokensBar&PieChart}
    Web.Wait Until Element Is Visible    ${MobileTokenStatistics}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SecurityKeyPie}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${BarChart}    ${StandardTimeout}

Verify that the Admin-User is able to see the 'Chart Type' drop down over the Authentications section on the dashboard.
    [Tags]  Manage_DB_033   Manage_Dashboard        Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthChartTypes}    ${StandardTimeout}
    Web.Select From List by Value  ${AuthChartTypes}        ${AuthGridChartType}

Verify that the Admin-User is able to select Bar Chart from Chart Type option for Authentications section.
    [Tags]  Manage_DB_036   Manage_Dashboard        Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthChartTypes}    ${StandardTimeout}
    Web.Select From List by Value  ${AuthChartTypes}        ${AuthBar&PieChart}

Verify that the Admin-User is able to select Grid from Chart Type option for Authentications section.
    [Tags]  Manage_DB_038   Manage_Dashboard        Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthChartTypes}    ${StandardTimeout}
    Web.Select From List by Value  ${AuthChartTypes}        ${AuthGridChartType}

Verify that the Admin-User is able to see the 'Chart Type' drop down over the System Alerts section on the dashboard.
    [Tags]  Manage_DB_040   Manage_Dashboard        Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SystemAlertsChartTypes}    ${StandardTimeout}
    Web.Select From List by Value       ${SystemAlertsChartTypes}            ${SystemAlertsGridChartType}

Verify that the Admin-User is able to select Bar Chart from the Chart Type option for the System Alerts section.
    [Tags]  Manage_DB_043   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}
    Web.Select From List by Value       ${SystemAlertsChartTypes}            ${SystemAlertsBar&PieChart}

Verify that the Admin-User is able to select Grid from Chart Type option for the System Alerts section.
    [Tags]  Manage_DB_045   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}
    Web.Select From List by Value  ${SystemAlertsChartTypes}        ${SystemAlertsGridChartType}

Verify that the Admin-User is able to see the 'Chart Type' drop down over the User section on the dashboard.
    [Tags]  Manage_DB_047   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UsersChartType}    ${StandardTimeout}
    Web.Select From List by Value       ${UsersChartType}            ${UsersGridChartType}

Verify that the Admin-User is able to select Bar Chart from Chart Type option for User section.
    [Tags]  Manage_DB_050   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UsersChartType}    ${StandardTimeout}
    Web.Select From List by Value       ${UsersChartType}            ${UsersBar&PieChart}

Verify that the Admin-User is able to select Grid from Chart Type option for Users section.
    [Tags]  Manage_DB_052   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UsersChartType}    ${StandardTimeout}
    Web.Select From List by Value       ${UsersChartType}            ${UsersGridChartType}

Verify that the Admin-User is able to see the 'Chart Type' drop down over the Tokens section on the dashboard.
    [Tags]  Manage_DB_054   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Web.Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenChartTypes}/option[@value='${TokensBar&PieChart}']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${TokenChartTypes}        ${TokensBar&PieChart}
    Web.Wait Until Element Is Visible    ${MobileTokenStatistics}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SecurityKeyPie}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${BarChart}    ${StandardTimeout}

Verify that the Admin-User is able to see the proper description for AuthenticationsByDateRangeDaily under the "Manage Dashboard Items" section.
    [Tags]  Manage_DB_057   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${MD_AuthByDateRangeDaily}    ${StandardTimeout}
    Page Should Contain     ${AuthenticationsByDateRangeDaily_Desc}

Verify that the Admin-User is able to see the proper description for AuthenticationsByDateRangeMonthly under the "Manage Dashboard Items" section.
    [Tags]  Manage_DB_058   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${MD_AuthByDateRangeMonthly}    ${StandardTimeout}
    Page Should Contain     ${AuthenticationsByDateRangeMonthly_Desc}

Verify that the Admin-User is able to see the proper description for AuthenticationsByDateRangeWeekly under the "Manage Dashboard Items" section.
    [Tags]  Manage_DB_059   Manage_Dashboard    Admin-User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Web.Wait Until Element Is Visible    ${MD_AuthByDateRangeWeekly}    ${StandardTimeout}
    Page Should Contain     ${AuthenticationsByDateRangeWeekly_Desc}

Verify that the Admin-User is able to identify the name (Daily Authentications) of manage dashboard items should be matched with the name of the AuthenticationsByDateRangeDaily statistics section on the home page or not.
    [Tags]  Manage_DB_060   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthDailyHeaderTitle}    ${StandardTimeout}

Verify that the Admin-User is able to identify the name (Monthly Authentications) of manage dashboard items should be matched with the name of the AuthenticationsByDateRangeMonthly statistics section on the home page
    [Tags]  Manage_DB_061   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthMonthlyHeaderTitle}    ${StandardTimeout}

Verify that the Admin-User is able to identify that name (Weekly Authentications) of manage dashboard items should be matched with the name of the AuthenticationsByDateRangeWeekly statistics section on the home page or not.
    [Tags]  Manage_DB_062   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthWeeklyHeaderTitle}    ${StandardTimeout}

Verify that the admin-user is able to see only the "Daily Authentications" statistics section on the home page.
    [Tags]  Manage_DB_063   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthDailyHeaderTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthSuccessful}    ${StandardTimeout}

Verify that the admin-user is able to see only the "Monthly Authentications" statistics section on the home page.
    [Tags]  Manage_DB_064   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthMonthlyHeaderTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthSuccessful}    ${StandardTimeout}

Verify that the admin-user is able to see only the "Weekly Authentications" statistics section on the home page.
    [Tags]  Manage_DB_065   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthWeeklyHeaderTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthSuccessful}    ${StandardTimeout}

Verify that the Admin-User is able to identify the name (Daily Authentications) of manage dashboard items should be matched with the name of the AuthenticationsByDateRangeDaily statistics section on the home page.
    [Tags]  Manage_DB_066   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Check All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthDailyHeaderTitle}    ${StandardTimeout}

Verify that the Admin-User is able to identify the name (Monthly Authentications) of manage dashboard items should be matched with the name of the AuthenticationsByDateRangeMonthly statistics section on the home page.
    [Tags]  Manage_DB_067   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthMonthlyHeaderTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthSuccessful}    ${StandardTimeout}

Verify that the Admin-User is able to identify that name (Weekly Authentications) of manage dashboard items should be matched with the name of the AuthenticationsByDateRangeWeekly statistics section on the home page.
    [Tags]  Manage_DB_068   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthWeeklyHeaderTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthSuccessful}    ${StandardTimeout}

Verify that the Admin-User is able to identify Start Date and End Date under Daily Authentications Statistics.
    [Tags]  Manage_DB_069   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Check All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthDailyHeaderTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthDailyStartDate}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthDailyEndDate}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthStartDatePicker}    ${StandardTimeout}
    Web.Click Element    ${AuthStartDatePicker}
    Web.Wait Until Element Is Visible    ${AuthEndDatePicker}    ${StandardTimeout}
    Web.Click Element    ${AuthEndDatePicker}

Verify that the Admin-User is able to identify Start Date and End Date under Monthly Authentications Statistics.
    [Tags]  Manage_DB_070   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthMonthlyHeaderTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthSuccessful}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthMonthlyStartDate}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthMonthlyEndDate}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthMonthlyStartDatePicker}    ${StandardTimeout}
    Web.Click Element    ${AuthMonthlyStartDatePicker}
    Web.Wait Until Element Is Visible    ${AuthMonthlyEndDatePicker}    ${StandardTimeout}
    Web.Click Element    ${AuthMonthlyEndDatePicker}

Verify that the Admin-User is able to identify Start Date and End Date under Weekly Authentications Statistics.
    [Tags]  Manage_DB_071   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthWeeklyHeaderTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthSuccessful}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthWeeklyStartDate}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthWeeklyEndDate}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthWeeklyStartDatePicker}    ${StandardTimeout}
    Web.Click Element    ${AuthWeeklyStartDatePicker}
    Web.Wait Until Element Is Visible    ${AuthWeeklyEndDatePicker}    ${StandardTimeout}
    Web.Click Element    ${AuthWeeklyEndDatePicker}

Verify Daily Authentications statistics data for current year is viewed under Daily Statistics.
    [Tags]  Manage_DB_081   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthDaily}     ${StandardTimeout}
    Web.Input Text    ${inputStartDateAuthDaily}     01/01/2022
    Randome Click On Screen
    Sleep   ${Timeout60s}
    Web.Page Should Contain     200
    Web.Page Should Contain     400
    #Web.Wait Until Element Is Visible    ${Date1}     ${Timeout60s}
    #Web.Wait Until Element Is Visible    ${Date2}     ${Timeout60s}

Verify Weekly Authentications statistics data for current year is viewed under Weekly Statistics.
    [Tags]  Manage_DB_082   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthWeek}     ${StandardTimeout}
    Web.Input Text    ${inputStartDateAuthWeek}     01/01/2022
    Randome Click On Screen
    Web.Wait Until Element Is Visible    ${Week1}     ${Timeout60s}
    Web.Wait Until Element Is Visible    ${Week1}     ${Timeout60s}

Verify Monthly Authentications statistics data for current year is viewed under Monthly Statistics.
    [Tags]  Manage_DB_083   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthMonth}     ${StandardTimeout}
    Web.Clear Element Text      ${inputStartDateAuthMonth}
    Web.Input Text    ${inputStartDateAuthMonth}     01/01/2022
    Randome Click On Screen
    Sleep   ${Timeout60s}
    Web.Page Should Contain     December 2021
    Web.Page Should Contain     January 2022
    Web.Page Should Contain     February 2022
    Web.Page Should Contain     March 2022
    Web.Page Should Contain     April 2022

Verify only one date of Past date (date less than current date) in horizontal line under Daily Authentications statistics
    [Tags]  Manage_DB_084   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthDaily}     ${StandardTimeout}
    Web.Input Text    ${inputStartDateAuthDaily}     05/16/2022
    Randome Click On Screen
    Web.Page Should Contain     May 2022

Verify only one date of Past date (date less than current date) in horizontal line under Weekly Authentications statistics.
    [Tags]  Manage_DB_085   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthWeek}     ${StandardTimeout}
    Web.Input Text    ${inputStartDateAuthWeek}     05/16/2022
    Randome Click On Screen
    Web.Page Should Contain     May 2022

Verify only one date of Past date (date less than current date) in horizontal line under Monthly Authentications statistics.
    [Tags]  Manage_DB_086   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthMonth}     ${StandardTimeout}
    Web.Input Text    ${inputStartDateAuthMonth}    05/16/2022
    Randome Click On Screen
    Web.Page Should Contain     May 2022

Verify Range bound of statistics on x axis in increasing order of date for start date of specific month to end date as current date under Monthly Authentications statistics.
    [Tags]  Manage_DB_087   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthMonth}     ${StandardTimeout}
    Web.Input Text    ${inputStartDateAuthMonth}     01/01/2022
    Randome Click On Screen
    Web.Wait Until Element Is Visible    ${StartingZero}     ${Timeout60s}
    Web.Wait Until Element Is Not Visible    ${CheckNegativeValue}     ${Timeout60s}

Verify Range bound of statistics on x axis in decreasing order of date for start date of specific month to end date as current date under Weekly Authentications statistics.
    [Tags]  Manage_DB_088   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthWeek}     ${StandardTimeout}
    Web.Input Text    ${inputStartDateAuthWeek}     01/01/2022
    Randome Click On Screen
    Web.Wait Until Element Is Visible    ${StartingZero}     ${Timeout60s}
    Web.Wait Until Element Is Not Visible    ${CheckNegativeValue}     ${Timeout60s}

Verify Range bound of statistics on x axis in increasing order of date for start date of specific month to end date as current date under the Daily Authentications statistics.
    [Tags]  Manage_DB_089   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${inputStartDateAuthDaily}     ${StandardTimeout}
    Web.Input Text    ${inputStartDateAuthDaily}     01/01/2022
    Randome Click On Screen
    Web.Wait Until Element Is Visible    ${StartingZero}     ${Timeout60s}
    Web.Wait Until Element Is Not Visible    ${CheckNegativeValue}     ${Timeout60s}

Verify Range bound of statistics on x axis in decreasing order of date for start date of specific month to end date as current date under Daily Authentications statistics or not.
    [Tags]  Manage_DB_090   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Select Current Date From Start Date For Weekly Authentication Range
    Randome Click On Screen
    Verify Range Bound of Statistics on X Axis For Current Date of Weekly Authentication Range
    Select 2nd Randome Past Date From Start Date For Weekly Authentication Range
    Randome Click On Screen
    Verify Range Bound of Statistics on X Axis For Randome Date of Weekly Authentication Range

Verify Range bound of statistics on x axis in increasing order of date for start date of specific month to end date as current date under Daily Authentications statistics.
    [Tags]  Manage_DB_091   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Select Current Date From Start Date For Daily Authentication Range
    Randome Click On Screen
    Verify Range Bound of Statistics on X Axis For Current Date of Daily Authentication Range
    Select 2nd Randome Past Date From Start Date For Daily Authentication Range
    Verify Range Bound of Statistics on X Axis For Randome Date of Daily Authentication Range

Verify Range bound of statistics on x axis in decreasing order of date for start date of specific month to end date as current date under Daily Authentications statistics.
    [Tags]  Manage_DB_092   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Select Current Date From Start Date For Daily Authentication Range
    Randome Click On Screen
    Verify Range Bound of Statistics on X Axis For Current Date of Daily Authentication Range
    Select 2nd Randome Past Date From Start Date For Daily Authentication Range
    Verify Range Bound of Statistics on X Axis For Randome Date of Daily Authentication Range

Verify Daily Authentications statistics for more than 1 year(current year to future year).
    [Tags]  Manage_DB_093   Manage_Dashboard    Admin_User     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}
    Web.Wait Until Element Is Visible    ${ClickOnUpdate}    ${StandardTimeout}
    Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Change Start Date To 1st Date, Month And Year of Current Year For Daily Auth
    Change End Date To Last Date, Month And Year of Next Year For Daily Auth
    Verify Range Bound of Statistics on X Axis For Randome Date of Daily Authentication Range

############################# Help-desk User TCs ###################################
Verify that the Helpdesk-User is able to select Grid from Chart Type option for Tokens section.
    [Tags]  Manage_DB_030   Manage_Dashboard        Help-Desk     SurePassId_Web
    ${HelpdeskPw}  Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    Set Global variable   ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}       ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenChartTypes}/option[@value='${TokensGridChartType}']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${TokenChartTypes}        ${TokensGridChartType}
    Web.Wait Until Element Is Visible    ${MobileTokenStatistics}    ${StandardTimeout}

Verify that the Helpdesk-User is able to select Pie Chart option from Chart Type option for Tokens section.
    [Tags]  Manage_DB_032   Manage_Dashboard        Help-Desk     SurePassId_Web
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenChartTypes}/option[@value='${TokensBar&PieChart}']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${TokenChartTypes}        ${TokensBar&PieChart}
    Web.Wait Until Element Is Visible    ${MobileTokenStatistics}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SecurityKeyPie}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${BarChart}    ${StandardTimeout}

Verify that the Helpdesk-User is able to see the 'Chart Type' drop down over the Authentications section on the dashboard.
    [Tags]  Manage_DB_034   Manage_Dashboard        Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthChartTypes}    ${StandardTimeout}
    Web.Select From List by Value  ${AuthChartTypes}        ${AuthGridChartType}

Verify that the Helpdesk-User is able to select Bar Chart from Chart Type option for Authentications section.
    [Tags]  Manage_DB_037   Manage_Dashboard        Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthChartTypes}    ${StandardTimeout}
    Web.Select From List by Value  ${AuthChartTypes}        ${AuthBar&PieChart}

Verify that the Helpdesk-User is able to select Grid from Chart Type option for Authentications section.
    [Tags]  Manage_DB_039   Manage_Dashboard        Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${AuthChartTypes}    ${StandardTimeout}
    Web.Select From List by Value  ${AuthChartTypes}        ${AuthGridChartType}

Verify that the Helpdesk-User is able to see the 'Chart Type' drop down over the System Alerts section on the dashboard.
    [Tags]  Manage_DB_041   Manage_Dashboard        Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SystemAlertsChartTypes}    ${StandardTimeout}
    Web.Select From List by Value       ${SystemAlertsChartTypes}            ${SystemAlertsGridChartType}

Verify that the Helpdesk-User is able to select Bar Chart from Chart Type option for the System Alertss section.
    [Tags]  Manage_DB_044   Manage_Dashboard    Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}
    Web.Select From List by Value       ${SystemAlertsChartTypes}            ${SystemAlertsBar&PieChart}

Verify that the Helpdesk-User is able to select Grid from Chart Type option for the System Alerts section.
    [Tags]  Manage_DB_046   Manage_Dashboard    Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${SystemAlertsTitle}    ${StandardTimeout}
    Web.Select From List by Value  ${SystemAlertsChartTypes}        ${SystemAlertsGridChartType}

Verify that the Helpdesk-User is able to see the 'Chart Type' drop down over the User section on the dashboard.
    [Tags]  Manage_DB_048   Manage_Dashboard    Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UsersChartType}    ${StandardTimeout}
    Web.Select From List by Value       ${UsersChartType}            ${UsersGridChartType}

Verify that the Helpdesk-User is able to select Bar Chart from Chart Type option for User section.
    [Tags]  Manage_DB_051   Manage_Dashboard    Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UsersChartType}    ${StandardTimeout}
    Web.Select From List by Value       ${UsersChartType}            ${UsersBar&PieChart}

Verify that the Helpdesk-User is able to select Grid from Chart Type option for User section.
    [Tags]  Manage_DB_053   Manage_Dashboard    Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${UsersTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UsersChartType}    ${StandardTimeout}
    Web.Select From List by Value       ${UsersChartType}            ${UsersGridChartType}

Verify that the Helpdesk-User is able to see the 'Chart Type' drop down over the Tokens section on the dashboard.
    [Tags]  Manage_DB_055   Manage_Dashboard    Help-Desk     SurePassId_Web
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${TokensTitle}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenChartTypes}/option[@value='${TokensBar&PieChart}']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${TokenChartTypes}        ${TokensBar&PieChart}
    Web.Wait Until Element Is Visible    ${MobileTokenStatistics}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SecurityKeyPie}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${BarChart}    ${StandardTimeout}
    [Teardown]      Web.Close All Browsers

############################# No-Portal Access TCs ###################################
Verify that the No portal access-User is able to see and access the hyperlink of Manage Dashboard on the home page.
    [Tags]  Manage_DB_002   Manage_Dashboard    No-Portal     SurePassId_Web
    [Setup]    Run Keywords     Open SurePass On Browser
               ...          AND                Submit 2FA Page Using Email OTP    6
    ${NoPortal_PIN}    Get the User No Portal Access PIN
    log to console       ${NoPortal_PIN}
    Set Global variable   ${NoPortal_PIN}
    Open SurePass On Browser
    Provide No Portal Access Credentials for First Login Page   ${inputUserName2}   ${NoPortal_PIN}
    Web.Wait Until Element Is Visible    ${NoPortalLoginError}    ${StandardTimeout}
    ${ErrorMsg}     Web.Get Text    ${NoPortalLoginError}
    Should Be Equal     ${ErrorMsg}     ${NoPortalLoginErrorMsg}
    [Teardown]      Web.Close All Browsers

Verify that the No portal access-User is able to see the 'Chart Type' drop down over the Authentications section on the dashboard.
    [Tags]  Manage_DB_035   Manage_Dashboard    No-Portal     SurePassId_Web
    [Setup]    Run Keywords     Open SurePass On Browser
    Provide No Portal Access Credentials for First Login Page   ${inputUserName2}   ${NoPortal_PIN}
    Web.Wait Until Element Is Visible    ${NoPortalLoginError}    ${StandardTimeout}
    ${ErrorMsg}     Web.Get Text    ${NoPortalLoginError}
    Should Be Equal     ${ErrorMsg}     ${NoPortalLoginErrorMsg}
    [Teardown]      Web.Close All Browsers

Verify that the No portal access-User is able to see the 'Chart Type' drop down over the System Alerts section on the dashboard.
    [Tags]  Manage_DB_042   Manage_Dashboard    No-Portal     SurePassId_Web
    [Setup]    Run Keywords     Open SurePass On Browser
    Provide No Portal Access Credentials for First Login Page   ${inputUserName2}   ${NoPortal_PIN}
    Web.Wait Until Element Is Visible    ${NoPortalLoginError}    ${StandardTimeout}
    ${ErrorMsg}     Web.Get Text    ${NoPortalLoginError}
    Should Be Equal     ${ErrorMsg}     ${NoPortalLoginErrorMsg}
    [Teardown]      Web.Close All Browsers

Verify that the No portal access-User is able to see the 'Chart Type' drop down over the User section on the dashboard.
    [Tags]  Manage_DB_049   Manage_Dashboard    No-Portal     SurePassId_Web
    [Setup]    Run Keywords     Open SurePass On Browser
    Provide No Portal Access Credentials for First Login Page   ${inputUserName2}   ${NoPortal_PIN}
    Web.Wait Until Element Is Visible    ${NoPortalLoginError}    ${StandardTimeout}
    ${ErrorMsg}     Web.Get Text    ${NoPortalLoginError}
    Should Be Equal     ${ErrorMsg}     ${NoPortalLoginErrorMsg}
    [Teardown]      Web.Close All Browsers

Verify that the No portal access-User is able to see the 'Chart Type' drop down over the Tokens section on the dashboard.
    [Tags]  Manage_DB_056   Manage_Dashboard    No-Portal     SurePassId_Web
    [Setup]    Run Keywords     Open SurePass On Browser
    Provide No Portal Access Credentials for First Login Page   ${inputUserName2}   ${NoPortal_PIN}
    Web.Wait Until Element Is Visible    ${NoPortalLoginError}    ${StandardTimeout}
    ${ErrorMsg}     Web.Get Text    ${NoPortalLoginError}
    Should Be Equal     ${ErrorMsg}     ${NoPortalLoginErrorMsg}
    [Teardown]      Web.Close All Browsers