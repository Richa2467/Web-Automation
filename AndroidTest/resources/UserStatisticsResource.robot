
*** Settings ***
Library     OperatingSystem
Resource    ../resources/LoginPageResource.robot
Resource    ../locators/UserStatisticsLocator.robot

*** Keywords ***
Get Total Users Statistics
    ${GetTotalUsersCount}    Web.Get Text     ${TotalUsersCounter}
    ${TotalUsers}    Convert To Integer    ${GetTotalUsersCount}
    ${GetThisWeekCounter}       Web.Get Text        ${NewUsersThisWeekCounter}
    ${TotalThisWeekCounter}     Convert To Integer      ${GetThisWeekCounter}
    ${GetThisMonthCounter}       Web.Get Text        ${NewUsersThisMonthCounter}
    ${TotalThisMonthCounter}     Convert To Integer      ${GetThisMonthCounter}
    ${L1}=    Create List
    Append To List    ${L1}     ${TotalUsers}       ${TotalThisWeekCounter}       ${TotalThisMonthCounter}
    RETURN    ${L1}

Get Total Disabled Users Statistics
    ${GetTotalDisCounter}       Web.Get Text        ${TotalDisabledUsersCounter}
    ${TotalDisCounter}     Convert To Integer      ${GetTotalDisCounter}
    ${GetDisThisWeekCounter}       Web.Get Text        ${DisUsersThisWeekCounter}
    ${TotalDisThisWeekCounter}     Convert To Integer      ${GetDisThisWeekCounter}
    ${GetDisThisMonthCounter}       Web.Get Text        ${DisUsersThisMonthCounter}
    ${TotalDisThisMonthCounter}     Convert To Integer      ${GetDisThisMonthCounter}
    ${L2}=    Create List
    Append To List    ${L2}     ${TotalDisCounter}       ${TotalDisThisWeekCounter}       ${TotalDisThisMonthCounter}
    RETURN    ${L2}

Get Total Users Statistics Count
    ${GetThisWeekCounter}       Web.Get Text        ${NewUsersThisWeekCounter}
    ${TotalThisWeekCounter}     Convert To Integer      ${GetThisWeekCounter}
    Should Be True      ${TotalThisWeekCounter} >= 0
    ${GetLastWeekCounter}       Web.Get Text        ${NewUsersLastWeekCounter}
    ${TotalLastWeekCounter}     Convert To Integer      ${GetLastWeekCounter}
    Should Be True      ${TotalLastWeekCounter} >= 0
    ${GetThisMonthCounter}       Web.Get Text        ${NewUsersThisMonthCounter}
    ${TotalThisMonthCounter}     Convert To Integer      ${GetThisMonthCounter}
    Should Be True      ${TotalThisMonthCounter} >= 0

Get Total Disabled Users Statistics Count
    ${GetDisThisWeekCounter}       Web.Get Text        ${DisUsersThisWeekCounter}
    ${TotalDisThisWeekCounter}     Convert To Integer      ${GetDisThisWeekCounter}
    Should Be True      ${TotalDisThisWeekCounter} >= 0
    ${GetDisLastWeekCounter}       Web.Get Text        ${DisUsersLastWeekCounter}
    ${TotalDisLastWeekCounter}     Convert To Integer      ${GetDisLastWeekCounter}
    Should Be True      ${TotalDisLastWeekCounter} >= 0
    ${GetDisThisMonthCounter}       Web.Get Text        ${DisUsersThisMonthCounter}
    ${TotalDisThisMonthCounter}     Convert To Integer      ${GetDisThisMonthCounter}
    Should Be True      ${TotalDisThisMonthCounter} >= 0

Get Total Users Count
    ${GetTotalUsersCount}    Web.Get Text     ${TotalUsersCounter}
    ${TotalUsers}    Convert To Integer    ${GetTotalUsersCount}
    Should Be True    ${TotalUsers} >= 0