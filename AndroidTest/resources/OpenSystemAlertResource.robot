*** Settings ***
Library     OperatingSystem
Resource    ../resources/LoginPageResource.robot
Resource    ../locators/OpenSystemAlertLocator.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/OpenSystemAlertLocator.robot

*** Keywords ***
Navigate To Home Page
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible       ${HomeTab}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${HomeTab}

Identify Audit Trail Page
    Wait Until Keyword Succeeds  5x  1s     Web.Page Should Contain     Audit Trail

Click On Account Link
    Web.Wait Until Element Is Visible       ${Account}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.click element       ${Account}

Click On Customize Mobile Messages Link
    Web.Wait Until Element Is Visible       ${CustomizeMobileMsg}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.click element       ${CustomizeMobileMsg}

Click On Update Buttons
    Web.Wait Until Element Is Visible       ${UpdateBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.click element       ${UpdateBtn}

Click On Logout Link
    Web.Wait Until Element Is Visible       ${ClickOnLogout}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.click element       ${ClickOnLogout}

Click On SMS OTP Icon
    Web.Wait Until Element Is Visible       ${SmsOtp}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.click element       ${SmsOtp}

Get Total System Alerts Statistics This Week
    Web.Wait Until Element Is Visible       ${OpenSevereItems}     ${StandardTimeout}
    ${ItmReqActThisWeekCount}    Web.Get Text    ${OpenSevereItems}
    ${GetItmReqActThisWeekCount}     Convert To Integer      ${ItmReqActThisWeekCount}
    Web.Wait Until Element Is Visible       ${ItmReqActThisWeek}     ${StandardTimeout}
    ${SevereIssuesThisWeekCount}    Web.Get Text    ${ItmReqActThisWeek}
    ${GetSevereIssuesThisWeekCount}     Convert To Integer      ${SevereIssuesThisWeekCount}
    ${L1}=    Create List
    Append To List    ${L1}     ${GetItmReqActThisWeekCount}       ${GetSevereIssuesThisWeekCount}
    RETURN    ${L1}

Get Total System Alerts Statistics This Month
    Web.Wait Until Element Is Visible       ${ItmReqActThisMonth}     ${StandardTimeout}
    ${ItmReqActThisMonthCount}    Web.Get Text    ${ItmReqActThisMonth}
    ${GetItmReqActThisMonthCount}     Convert To Integer      ${ItmReqActThisMonthCount}
    Web.Wait Until Element Is Visible       ${SevereIssuesLastMonth}     ${StandardTimeout}
    ${SevereIssuesLastMonthCount}    Web.Get Text    ${SevereIssuesLastMonth}
    ${GetSevereIssuesLastMonthCount}     Convert To Integer      ${SevereIssuesLastMonthCount}
    ${L2}=    Create List
    Append To List    ${L2}     ${GetItmReqActThisMonthCount}       ${GetSevereIssuesLastMonthCount}
    RETURN    ${L2}

Get Number Statistics for System Alerts
    [Arguments]     ${SystemAlertStatistics}
    Web.Wait Until Element Is Visible       ${SystemAlertStatistics}     ${StandardTimeout}
    ${ItmReqActThisWeekCount}    Web.Get Text    ${SystemAlertStatistics}
    ${GetItmReqActThisWeekCount}     Convert To Integer      ${ItmReqActThisWeekCount}
    RETURN    ${GetItmReqActThisWeekCount}

Get System Alerts Action Require Statistics for This Week
    [Arguments]     ${StatisticLocator}
    ${Value1}        Get Number Statistics for System Alerts     ${StatisticLocator}
    Set Global Variable     ${Value1}

Get System Alerts Severe Statistics for This Week
    [Arguments]     ${StatisticLocator}
    ${Value2}        Get Number Statistics for System Alerts     ${StatisticLocator}
    Set Global Variable     ${Value2}

Get Action Require Statistics for This Week After Increase Statistics Number
    [Arguments]     ${StatisticLocator}
    ${Value5}        Get Number Statistics for System Alerts     ${StatisticLocator}
    Set Global Variable     ${Value5}

Get Severe Statistics for This Week After Increase Statistics Number
    [Arguments]     ${StatisticLocator}
    ${Value6}        Get Number Statistics for System Alerts     ${StatisticLocator}
    Set Global Variable     ${Value6}

Get System Alerts Action Requires Statistics for This Month
    [Arguments]     ${StatisticLocator}
    ${Value3}        Get Number Statistics for System Alerts     ${StatisticLocator}
    Set Global Variable     ${Value3}

Get System Alerts Severe Statistics for This Month
    [Arguments]     ${StatisticLocator}
    ${Value4}        Get Number Statistics for System Alerts     ${StatisticLocator}
    Set Global Variable     ${Value4}

Get Action Requires Statistics for This Month After Increase Statistics Number
    [Arguments]     ${StatisticLocator}
    ${Value7}        Get Number Statistics for System Alerts     ${StatisticLocator}
    Set Global Variable     ${Value7}

Get Severe Statistics for This Month After Increase Statistics Number
    [Arguments]     ${StatisticLocator}
    ${Value8}        Get Number Statistics for System Alerts     ${StatisticLocator}
    Set Global Variable     ${Value8}

Verify Error on ServicePass Portal
    sleep    ${SleepDelay10s}
    Web.Wait Until Element Is Visible    ${SurePassPortalErrMsgBox}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${SurePassPortalErrMsgBox}
    Should Contain      ${SuccessMsg}     Error sending passcode.

Check Initial Statistics
    ${SevereCountTW}=    Web.Get Element Count   ${OpenSevereItems}
    Run Keyword If  ${SevereCountTW} > 0       Run Keyword    Get System Alerts Action Require Statistics for This Week   ${OpenSevereItems}
    ${SevereCountTW}=    Web.Get Element Count   ${ItmReqActThisWeek}
    Run Keyword If  ${SevereCountTW} > 0       Run Keyword    Get System Alerts Severe Statistics for This Week   ${ItmReqActThisWeek}
    ${SevereCountTM}=    Web.Get Element Count   ${ItmReqActThisMonth}
    Run Keyword If  ${SevereCountTM} > 0       Run Keyword    Get System Alerts Action Requires Statistics for This Month  ${ItmReqActThisMonth}
    ${SevereCountTM}=    Web.Get Element Count   ${SevereIssuesLastMonth}
    Run Keyword If  ${SevereCountTM} > 0       Run Keyword    Get System Alerts Severe Statistics for This Month   ${SevereIssuesLastMonth}
    ${SevereCountTW}=    Web.Get Element Count   ${ActionReqTWLBH}
    Run Keyword If  ${SevereCountTW} > 0        Run Keyword    Get System Alerts Action Require Statistics for This Week   ${ActionReqTWLBH}
    ${SevereCountTW}=    Web.Get Element Count   ${SevereItemsTWLink}
    Run Keyword If  ${SevereCountTW} > 0        Run Keyword    Get System Alerts Severe Statistics for This Week   ${SevereItemsTWLink}
    ${SevereCountTM}=    Web.Get Element Count   ${ActionReqTMLBH}
    Run Keyword If  ${SevereCountTM} > 0        Run Keyword    Get System Alerts Action Requires Statistics for This Month   ${ActionReqTMLBH}
    ${SevereCountTM}=    Web.Get Element Count   ${SevereItemsTMLink}
    Run Keyword If  ${SevereCountTM} > 0        Run Keyword    Get System Alerts Severe Statistics for This Month  ${SevereItemsTMLink}

Check Statistics After Increment
    ${SevereCountTW}=    Web.Get Element Count   ${OpenSevereItems}
    Run Keyword If  ${SevereCountTW} > 0       Run Keyword    Get Action Require Statistics for This Week After Increase Statistics Number   ${OpenSevereItems}
    ${SevereCountTW}=    Web.Get Element Count   ${ItmReqActThisWeek}
    Run Keyword If  ${SevereCountTW} > 0       Run Keyword    Get Severe Statistics for This Week After Increase Statistics Number   ${ItmReqActThisWeek}
    ${SevereCountTM}=    Web.Get Element Count   ${ItmReqActThisMonth}
    Run Keyword If  ${SevereCountTM} > 0       Run Keyword    Get Action Requires Statistics for This Month After Increase Statistics Number  ${ItmReqActThisMonth}
    ${SevereCountTM}=    Web.Get Element Count   ${SevereIssuesLastMonth}
    Run Keyword If  ${SevereCountTM} > 0       Run Keyword    Get Severe Statistics for This Month After Increase Statistics Number   ${SevereIssuesLastMonth}
    ${SevereCountTW}=    Web.Get Element Count   ${ActionReqTWLBH}
    Run Keyword If  ${SevereCountTW} > 0        Run Keyword    Get Action Require Statistics for This Week After Increase Statistics Number   ${ActionReqTWLBH}
    ${SevereCountTW}=    Web.Get Element Count   ${SevereItemsTWLink}
    Run Keyword If  ${SevereCountTW} > 0        Run Keyword    Get Severe Statistics for This Week After Increase Statistics Number   ${SevereItemsTWLink}
    ${SevereCountTM}=    Web.Get Element Count   ${ActionReqTMLBH}
    Run Keyword If  ${SevereCountTM} > 0        Run Keyword    Get Action Requires Statistics for This Month After Increase Statistics Number   ${ActionReqTMLBH}
    ${SevereCountTM}=    Web.Get Element Count   ${SevereItemsTMLink}
    Run Keyword If  ${SevereCountTM} > 0        Run Keyword    Get Severe Statistics for This Month After Increase Statistics Number  ${SevereItemsTMLink}

Check System Alerts Statistics
    [Arguments]     ${LWStatisticLocator}
    Web.Wait Until Element Is Visible       ${LWStatisticLocator}     ${StandardTimeout}
    Web.Click Element       ${LWStatisticLocator}
    Identify Audit Trail Page

Check Get text and System Statistics
    [Arguments]     ${ElementToGetText}
    ${ActionReqCountLW}=    Web.Get Text   ${ElementToGetText}
    Run Keyword If  ${ActionReqCountLW} > 0       Run Keyword    Check System Alerts Statistics     ${ElementToGetText}
