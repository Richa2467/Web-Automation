*** Settings ***
Documentation   This is the resource file for ajio page.
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/UsersPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/LoginPageLocator.robot
Resource    ../locators/SystemAlertsLocator.robot

Library    Collections
Library    String
Library    DateTime

*** Keywords ***
Verify that System Alerts Panel Should Be Visible.
    Web.Element Should Be Visible       ${SystemAlertsPanel}        ${StandardTimeout}

Verify System Alerts Panel Should be in Grid Format
    Web.Element Should Be Visible       ${SysAltsGridFtm}       ${StandardTimeout}

Verify System Alerts Panel Should be in Bar Format
    Web.Element Should Be Visible       ${SysAltsBarFtm}           ${StandardTimeout}
    Web.Select From List by Value       ${SysAltsBarFtm}   4
    Web.Wait Until Element Is Visible    ${SysAltsBarFtmChart}    ${StandardTimeout}
    Web.Element Should Be Visible       ${SysAltsBarFtmChart}       ${StandardTimeout}

Verify System Alerts Panel Should be Visible in Three Parts
    Web.Wait Until Element Is Visible    ${SysAltsThisWeek}    ${StandardTimeout}
    Web.Element Should Be Visible       ${SysAltsThisWeek}      ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SysAltsLastWeek}    ${StandardTimeout}
    Web.Element Should Be Visible       ${SysAltsLastWeek}      ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SysAltsThisMonth}    ${StandardTimeout}
    Web.Element Should Be Visible       ${SysAltsThisMonth}     ${StandardTimeout}

Verify Three Types of info in This Week Section, 1.Actions Required 2.Severe 3.Warning
    Web.Wait Until Element Is Visible    ${ThisWeekActionReq}    ${StandardTimeout}
    Web.Element Should Be Visible       ${ThisWeekActionReq}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${ThisWeekSevere}    ${StandardTimeout}
    Web.Element Should Be Visible       ${ThisWeekSevere}       ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${ThisWeekWarning}    ${StandardTimeout}
    Web.Element Should Be Visible       ${ThisWeekWarning}      ${StandardTimeout}

Click on Action Required Value For ThisWeek
    Web.Wait Until Element Is Visible       ${ThisWeekActionReqValue}    ${StandardTimeout}
    Web.Click element       ${ThisWeekActionReqValue}

Click on Severe Value For ThisWeek
    Web.Wait Until Element Is Visible       ${ThisWeekSevereValue}    ${StandardTimeout}
    Web.Click element       ${ThisWeekSevereValue}

Click on Warning Value For ThisWeek
    Web.Wait Until Element Is Visible       ${ThisWeekWarningValue}    ${StandardTimeout}
    Web.Click element       ${ThisWeekWarningValue}

Click on Action Required Value For LastWeek
    Web.Wait Until Element Is Visible       ${LastWeekActionReqValue}    ${StandardTimeout}
    Web.Click element   ${LastWeekActionReqValue}

Click on Severe Value For LastWeek
    Web.Wait Until Element Is Visible       ${LastWeekSevereValue}    ${StandardTimeout}
    Web.Click element   ${LastWeekSevereValue}

Click on Warning Value For LastWeek
    Web.Wait Until Element Is Visible       ${LastWeekWarningValue}    ${StandardTimeout}
    Web.Click element   ${LastWeekWarningValue}

Click on Action Required Value For ThisMonth
    Web.Wait Until Element Is Visible       ${ThisMonthActionReqValue}    ${StandardTimeout}
    Web.Click element   ${ThisMonthActionReqValue}

Click on Severe Value For ThisMonth
    Web.Wait Until Element Is Visible       ${ThisMonthSevereValue}    ${StandardTimeout}
    Web.Click element   ${ThisMonthSevereValue}

Click on Warning Value For ThisMonth
    Web.Wait Until Element Is Visible       ${ThisMonthWarningValue}    ${StandardTimeout}
    Web.Click element   ${ThisMonthWarningValue}

Verify Audit Trail page
    ${response}     Web.get text        ${AuditTrailPage}
    should be equal as strings      ${response}     Audit Trail

Verify Audit Trail Page Not Existed      
    Element Should Not Be Visible       ${AuditTrailPage}

Get Severe Count For This Week
    ${OldSevereCountStr}      Web.get text       ${ThisWeekSevereValue}
    ${OldSevereCountThisWeek}      Convert to integer      ${OldSevereCountStr}  
    #Log to console      ${OldSevereCountThisWeek}
    Set Global Variable     ${OldSevereCountThisWeek}

Verify Severe New Count Should be Greater Than Old Count For This Week
    ${NewSevereStr}      Web.get text       ${ThisWeekSevereValue}
    ${NewSevereCountThisWeek}      Convert To Integer       ${NewSevereStr}
    #Log to console      ${NewSevereCountThisWeek}
    Should be True      ${NewSevereCountThisWeek}  > ${OldSevereCountThisWeek}

Get Severe Count For This Month
    ${OldSevereCountStr}      Web.get text       ${ThisMonthSevereValue}
    ${OldSevereCountThisMonth}      Convert to integer      ${OldSevereCountStr}  
    #Log to console      ${OldSevereCountThisMonth}
    Set Global Variable     ${OldSevereCountThisMonth}

Verify Severe New Count Should be Greater Than Old Count For This Month
    ${NewSevereStr}      Web.get text       ${ThisMonthSevereValue}
    ${NewSevereCountThisMonth}      Convert To Integer       ${NewSevereStr}
    #Log to console      ${NewSevereCountThisMonth}
    Should be True      ${NewSevereCountThisMonth} > ${OldSevereCountThisMonth}

Get Action Required Count For This Month
    ${OldActReqCountStr}      Web.get text       ${ThisMonthActionReqValue}
    ${OldActReqCountThisMonth}      Convert to integer      ${OldActReqCountStr}  
    #Log to console      ${OldActReqCountThisMonth}
    Set Global Variable     ${OldActReqCountThisMonth}

Verify Action Required New Count Should be Greater Than Old Count For This Month
    ${NewActreqStr}      Web.get text       ${ThisMonthActionReqValue}
    ${NewActReqCountThisMonth}      Convert To Integer       ${NewActreqStr}
    #Log to console      ${NewActReqCountThisMonth}
    Should be True      ${NewActReqCountThisMonth} > ${OldActReqCountThisMonth}

Get Action Required Count For This Week
    ${OldActReqCountStr}      Web.get text       ${ThisWeekActionReqValue}
    ${OldActReqCountThisWeek}      Convert to integer      ${OldActReqCountStr}  
    #Log to console      ${OldActReqCountThisWeek}
    Set Global Variable     ${OldActReqCountThisWeek}

Verify Action Required New Count Should be Greater Than Old Count For This Week
    ${NewActreqStr}      Web.get text       ${ThisMonthActionReqValue}
    ${NewActReqCountThisWeek}      Convert To Integer       ${NewActreqStr}
    #Log to console      ${NewActReqCountThisWeek}
    Should be True      ${NewActReqCountThisWeek} > ${OldActReqCountThisWeek}

Get Warning Count For This Week
    ${OldWarningCountStr}      Web.get text       ${ThisWeekWarningValue}
    ${OldWarningCountThisWeek}      Convert to integer      ${OldWarningCountStr}  
    #Log to console      ${OldWarningCountThisWeek}
    Set Global Variable     ${OldWarningCountThisWeek}

Verify Warning New Count Should be Greater Than Old Count For This Week
    ${NewWarningStr}      Web.get text       ${ThisWeekWarningValue}
    ${NewWarningCountThisWeek}      Convert To Integer       ${NewWarningStr} 
    #Log to console      ${NewWarningCountThisWeek}
    Should be True      ${NewWarningCountThisWeek} > ${OldWarningCountThisWeek}

Get Warning Count For This Month
    ${OldWarningCountStr}      Web.get text       ${ThisMonthWarningValue}
    ${OldWarningCountThisMonth}      Convert to integer      ${OldWarningCountStr}  
    #Log to console      ${OldWarningCountThisMonth}
    Set Global Variable     ${OldWarningCountThisMonth}

Verify Warning New Count Should be Greater Than Old Count For This Month
    ${NewWarningStr}      Web.get text       ${ThisMonthWarningValue}
    ${NewWarningCountThisMonth}      Convert To Integer       ${NewWarningStr} 
    #Log to console      ${NewWarningCountThisMonth}
    Should be True      ${NewWarningCountThisMonth} > ${OldWarningCountThisMonth}

Verify Login User Logs on Audit Trail page
    ${response}     Web.get text        ${LoginUsrLogs}
    should be equal as strings      ${response}     ${UserName}

Invalid First Login Page
    Web.Wait Until Element Is Enabled             ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Input Text       ${UserNameLocator}       ${UserName}
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text       ${PasswordLocator}       ${Password}
    Web.Click Element    ${SignInButton}
    Web.Input Text       ${OPTInputTxt}     123456
    Web.Click Element    ${OPTVerifyBtn}

Go To Add New Token Page
    Web.Click Element       ${AdminUsrLink}
    Web.Wait Until Element Is Visible    ${AddNewSoftToken}    ${StandardTimeout}
    Web.Scroll Element Into View    ${CopyrightSection}
    Wait Until the Update Icon Disappear
    Web.Click Element    ${AddNewSoftToken}

Add Disabled Token To The User Account
    [Arguments]    ${TokenType}=None    ${UserDefinedName}=None    ${AuthType}=None    ${OTPWindowSize}=None    ${OTPType}=None    ${TokenStatus}=None    ${OTPLen}=None
    Web.Wait Until Element Is Visible    ${UserDefinedNameField}    ${StandardTimeout}
    Run Keyword If    '${TokenType}' != 'None'    Run Keyword    Select Token Type    ${TokenType}
    Run Keyword If    '${UserDefinedName}' != 'None'    Web.Input Text    ${UserDefinedNameField}    ${UserDefinedName}
    Run Keyword If    '${AuthType}' != 'None'    Web.Select From List by Value    ${AuthUsageDropdown}    ${AuthType}
    Run Keyword If    '${OTPType}' != 'None'    Run Keywords        Web.Scroll Element Into View    ${CopyrightSection}
    ...                AND                         Web.Select From List by Value    ${OTPTypeDropdown}    ${OTPType}
    ...                AND                         Select Token PIN
    Run Keyword If     '${TokenStatus}' != 'None'     Run Keyword    Web.Select From List by Value    ${TokenStatusLocator}    ${TokenStatus}
    Web.Scroll Element Into View    ${CopyrightSection}
    Run Keyword If    '${OTPWindowSize}' != 'None'    Web.Input Text    ${OTPWindowSizeLocator}    ${OTPWindowSize}
    Run Keyword If    '${TokenType}' != '8'    Run Keyword     Check token type is not NymiBand     ${TokenType}
    Run Keyword If     '${OTPLen}' != 'None'    Run Keyword     Web.Select From List by Value       ${OTPLength}       10
    Web.Select From List by Value       ${StatusDrp}        1
    Web.Wait Until Element Is Visible    ${TokenAddButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenAddButton}

Check Welcome Msg for Help-Desk User
    ${response}     Web.get text        ${HomePageMsg}
    should be equal as strings      ${response}     Hello ${inputUserName2} ${inputUserName2}. Welcome Back

Select System Alerts option on Manage Dashboard to view on Home Page
    Web.Wait Until Element Is Enabled    ${MD_SystemAlerts}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_SystemAlerts}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_SystemAlerts}
