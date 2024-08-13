*** Settings ***
Library     OperatingSystem
Resource    ../locators/AuthenticationsLocator.robot
Resource    ../resources/LoginPageResource.robot

*** Keywords ***
Submit Invalid OTP
    Open SurePass On Browser
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Web.Click Element    ${EmailIcon}
    Web.Input Text       ${OtpTextBox}    123ABC
    Web.Click Element    ${VerifyOtpButton}

Get Total Authentication Statistics This Week
    ${GetTotalReqThisWeek}    Web.Get Text     ${TotalReqThisWeek}
    ${TotalReqTW}    Convert To Integer    ${GetTotalReqThisWeek}
    ${GetSuccessReqThisWeek}       Web.Get Text        ${SuccessReqThisWeek}
    ${TotalSuccessReqTW}     Convert To Integer      ${GetSuccessReqThisWeek}
    ${GetFailedReqThisWeek}       Web.Get Text        ${FailedReqThisWeek}
    ${TotalFailedReqTW}     Convert To Integer      ${GetFailedReqThisWeek}
    ${L1}=    Create List
    Append To List    ${L1}     ${TotalReqTW}       ${TotalSuccessReqTW}       ${TotalFailedReqTW}
    RETURN    ${L1}

Get Total Authentication Statistics This Month
    ${GetTotalReqThisMonth}    Web.Get Text     ${TotalReqThisMonth}
    ${TotalReqTM}    Convert To Integer    ${GetTotalReqThisMonth}
    ${GetSuccessReqThisMonth}       Web.Get Text        ${SuccessReqThisMonth}
    ${TotalSuccessReqTM}     Convert To Integer      ${GetSuccessReqThisMonth}
    ${GetFailedReqThisMonth}       Web.Get Text        ${FailedReqThisMonth}
    ${TotalFailedReqTM}     Convert To Integer      ${GetFailedReqThisMonth}
    ${L2}=    Create List
    Append To List    ${L2}     ${TotalReqTM}       ${TotalSuccessReqTM}       ${TotalFailedReqTM}
    RETURN    ${L2}