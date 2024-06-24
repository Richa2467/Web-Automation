*** Settings ***
Documentation   Manage dashboard related resources including this file.
Resource    ../locators/ManageDashboardLocator.robot
Resource    ../labels/CommonLabels.robot
Resource    ../labels/ManageDashboardLabel.robot

*** Keywords ***
Navigate to Manage Dashboard Page
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible   ${ManageDashboard}  ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element   ${ManageDashboard}
    Wait Until the Update Icon Disappear

Navigate to Super Admin User Manage Dashboard Page
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible   xpath://*[@href="managedashboard.aspx"]  ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  xpath://*[@href="managedashboard.aspx"]
    Wait Until the Update Icon Disappear

Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}

    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}

    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}

    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}

    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}

    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}

    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}

Check All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}

    Web.Wait Until Element Is Enabled    ${MD_AuthDaily}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthDaily}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthDaily}

    Web.Wait Until Element Is Enabled    ${MD_AuthMonthly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthMonthly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthMonthly}

    Web.Wait Until Element Is Enabled    ${MD_AuthWeekly}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_AuthWeekly}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_AuthWeekly}

    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}

    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}

    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}

Provide No Portal Access Credentials for First Login Page
    [Arguments]     ${NoPortalUName}   ${NoPortalPIN}
    Web.Wait Until Element Is Enabled    ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text                       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled    ${UserNameLocator}    ${StandardTimeout}
    Web.Input Text                       ${UserNameLocator}    ${NoPortalUName}
    Web.Wait Until Element Is Enabled    ${PasswordLocator}    ${StandardTimeout}
    Web.Input Text                       ${PasswordLocator}    ${NoPortalPIN}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SignInButton}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SignInButton}

Randome Click On Screen
    Web.Wait Until Element Is Visible       ${RandomeClick}     ${StandardTimeout}
    Web.Click Element       ${RandomeClick}

Select Current Date From Start Date For Weekly Authentication Range
    ${x}        Get Value       ${EndDateCalendarWeekly}
    Web.Wait Until Element Is Visible    ${StartDateCalendarWeekly}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarWeekly}     ${x}
    Web.Wait Until Element Is Visible    ${StartDateCalendarWeekly}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarWeekly}     ${x}
    Sleep  30s

Verify Range Bound of Statistics on X Axis For Current Date of Weekly Authentication Range
    Web.Page Should Contain     0
    Web.Page Should Contain     200
    Web.Page Should Contain     400
    Web.Page Should Contain     600
    Web.Page Should Contain     800
    Web.Page Should Contain     1,000

Select 2nd Randome Past Date From Start Date For Weekly Authentication Range
    Web.Wait Until Element Is Visible    ${StartDateCalendarWeekly}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarWeekly}     05/01/2022
    Web.Wait Until Element Is Visible    ${StartDateCalendarWeekly}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarWeekly}     05/01/2022
    Sleep  30s

Verify Range Bound of Statistics on X Axis For Randome Date of Weekly Authentication Range
    Web.Page Should Contain     0
    Web.Page Should Contain     1,000
    Web.Page Should Contain     2,000
    Web.Page Should Contain     3,000
    Web.Page Should Contain     4,000

Select Current Date From Start Date For Daily Authentication Range
    ${x}        Get Value       ${EndDateCalendarDaily}
    Web.Wait Until Element Is Visible    ${StartDateCalendarDaily}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarDaily}     ${x}
    Web.Wait Until Element Is Visible    ${StartDateCalendarDaily}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarDaily}     ${x}
    Sleep  30s

Verify Range Bound of Statistics on X Axis For Current Date of Daily Authentication Range
    Web.Page Should Contain     0
    Web.Page Should Contain     100
    Web.Page Should Contain     200
    Web.Page Should Contain     300
    Web.Page Should Contain     400

Select 2nd Randome Past Date From Start Date For Daily Authentication Range
    Web.Wait Until Element Is Visible    ${StartDateCalendarDaily}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarDaily}     05/01/2022
    Web.Wait Until Element Is Visible    ${StartDateCalendarDaily}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarDaily}     05/01/2022
    Sleep  30s

Verify Range Bound of Statistics on X Axis For Randome Date of Daily Authentication Range
    Web.Page Should Contain     0
    Web.Page Should Contain     100
    Web.Page Should Contain     200
    Web.Page Should Contain     300
    Web.Page Should Contain     400

Change Start Date To 1st Date, Month And Year of Current Year For Daily Auth
    Web.Wait Until Element Is Visible    ${StartDateCalendarDaily}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarDaily}     01/01/2022
    Sleep  30s

Change End Date To Last Date, Month And Year of Next Year For Daily Auth
    Web.Wait Until Element Is Visible    ${EndDateCalendarDaily}     ${StandardTimeout}
    Web.Input Text    ${EndDateCalendarDaily}     12/31/2023
    Sleep  30s

Change Start Date To 1st Date, Month And Year of Current Year For Weekly Auth
    Web.Wait Until Element Is Visible    ${StartDateCalendarWeekly}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarWeekly}     01/01/2022
    Sleep  30s

Change End Date To Last Date, Month And Year of Next Year For Weekly Auth
    Web.Wait Until Element Is Visible    ${EndDateCalendarWeekly}     ${StandardTimeout}
    Web.Input Text    ${EndDateCalendarWeekly}     12/31/2023
    Web.Wait Until Element Is Visible    ${EndDateCalendarWeekly}     ${StandardTimeout}
    Web.Input Text    ${EndDateCalendarWeekly}     12/31/2023
    Sleep  30s

Verify Range Bound of Statistics on Y Axis For Randome Date of Weekly Authentication Range For Next Year
    Web.Page Should Contain     Week of 07/25/2022
    Web.Page Should Contain     Week of 10/03/2022
    Web.Page Should Contain     Week of 12/12/2022
    Web.Page Should Contain     Week of 07/10/2023
    Web.Page Should Contain     Week of 09/18/2023

Change Start Date To 1st Date, Month And Year of Current Year For Monthly Auth
    Web.Wait Until Element Is Visible    ${StartDateCalendarMonthly}     ${StandardTimeout}
    Web.Input Text    ${StartDateCalendarMonthly}     01/01/2022
    Sleep  30s

Change End Date To Last Date, Month And Year of Next Year For Monthly Auth
    Web.Wait Until Element Is Visible    ${EndDateCalendarMonthly}     ${StandardTimeout}
    Web.Input Text    ${EndDateCalendarMonthly}     12/31/2023
    Web.Wait Until Element Is Visible    ${EndDateCalendarMonthly}     ${StandardTimeout}
    Web.Input Text    ${EndDateCalendarMonthly}     12/31/2023
    Sleep  30s

Verify Range Bound of Statistics on Y Axis For Randome Date of Monthly Authentication Range For Next Year
    Web.Page Should Contain     April 2022
    Web.Page Should Contain     June 2022
    Web.Page Should Contain     August 2022
    Web.Page Should Contain     April 2023
    Web.Page Should Contain     June 2023
