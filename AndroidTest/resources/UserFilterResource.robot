*** Settings ***
Resource    ../locators/UsersFilterLocator.robot
Resource    ../locators/UserGroupLocator.robot
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot

*** Keywords ***
Click On Search Icon
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${SearchIcon}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${SearchIcon}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over     ${SearchIcon}
    Wait Until the Update Icon Disappear
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SearchIcon}

Select User Role Filter All Users
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99

Select User Role Filter Administrator
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='Y']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  Y

Select User Role Filter Helpdesk
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='3']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  3

Select User Role Filter User No portal access
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='N']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  N

Select User Filter All
    Web.Wait Until Element Is Visible       ${UserNameFilter}     ${StandardTimeout}
    Web.Select From List By Label    ${UserNameFilter}        All

Select User Filter Contains
    Web.Wait Until Element Is Visible    ${UserFilterDropDown}      ${StandardTimeout}
    Web.Select From List By Label    ${UserFilterDropDown}      Contains

Select User Filter Is
    Web.Wait Until Element Is Visible    ${UserFilterDropDown}      ${StandardTimeout}
    Web.Select From List By Label    ${UserFilterDropDown}      Is

Select User Filter Begins with
    Web.Wait Until Element Is Visible    ${UserFilterDropDown}      ${StandardTimeout}
    Web.Select From List By Label    ${UserFilterDropDown}      Begins with

Search User from the User list Page
    [Arguments]     ${UserNameToSearch}     ${UserFilter}
    #Web.Select From List by Value       ${RowsFilter}            200
    #Web.Select From List by Value       ${UserNameFilter}         ${UserFilter}
    #sleep    ${SleepDelay10s}
    #Web.Input Text                      ${UserNameTextFilter}    ${UserNameToSearch}
    #Wait Until the Update Icon Disappear
    #sleep    ${SleepDelay10s}
    #Web.Click Element                   ${UserSearchBtn}
    #sleep    ${SleepDelay10s}
    #Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    #Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99
    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}        200
    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='${UserFilter}']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}    ${UserFilter}
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}  10s
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}  ${UserNameToSearch}
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}


Select All Rows To Display
    Web.page should contain element     ${RowToDisplay}      ${StandardTimeout}
    Web.select from list by value       ${RowToDisplay}     200
