*** Settings ***
Documentation    Users Page related resources including this file.
Library     OperatingSystem
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../locators/UsersPageLocator.robot
Resource    ../locators/UserGroupLocator.robot
Resource    ../locators/UsersFilterLocator.robot

*** Keywords ***
Edit User form the User List if existing
    Navigate to Users Folder
    Web.Select From List by Value       ${UserNameFilter}         3
    Wait until Element Is Visible   ${UserFilterText}   ${StandardTimeout}
    Web.Input Text      ${UserFilterText}       ${inputUserName}
    Wait until Element Is Visible   ${UserSearchBtn}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserSearchBtn}
    Wait until Element Is Visible   xpath://*[text()= "${inputUserName}"]/parent::div//parent::div//*[text()="Edit"]    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    xpath://*[text()= "${inputUserName}"]/parent::div//parent::div//*[text()="Edit"]

Navigate to Member Of Group
    Navigate to Users Folder
    Web.Select From List by Value       ${UserNameFilter}         3
    Wait until Element Is Visible   ${UserFilterText}   ${StandardTimeout}
    Web.Input Text      ${UserFilterText}       ${inputUserName}
    Wait until Element Is Visible   ${UserSearchBtn}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserSearchBtn}
    Wait until Element Is Visible   xpath://*[text()= "${inputUserName}"]/parent::div//parent::div//*[text()="Edit"]   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    xpath://*[text()= "${inputUserName}"]/parent::div//parent::div//*[text()="Edit"]
    Web.Wait Until Element Is Visible       ${MemberOfGroup}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${MemberOfGroup}

Verify Members Of This Group Filter
    [Arguments]      ${User_Group_Select}       ${User_Group_Select_Name}
    Web.Wait Until Element Is Visible       ${FilterMemberDropDown}     ${StandardTimeout}
    Web.select from list by value    ${FilterMemberDropDown}        ${User_Group_Select}
    Web.Wait Until Element Is Visible       ${FilterMemberSearchBar}     ${StandardTimeout}
    Web.Input Text        ${FilterMemberSearchBar}    ${User_Group_Select_Name}
    Web.Wait Until Element Is Visible       ${FilterMemberSearchBar}       ${StandardTimeout}
    Web.Input Text    ${FilterMemberSearchBar}        ${User_Group_Select_Name}
    Web.Wait Until Element Is Visible       ${FilterMemberSearchIcon}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${FilterMemberSearchIcon}

Up And Down Arrow Should Be Visible
    Web.Wait Until Element Is Visible       ${ClickOnGroupNameColumn}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${ClickOnGroupNameColumn}
    Web.Wait Until Element Is Visible       ${GroupNameColumnArrow}     ${StandardTimeout}
    Web.Page Should Contain Element     ${GroupNameColumnArrow}
    Web.Wait Until Element Is Visible       ${ClickOnDescriptionColumn}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${ClickOnDescriptionColumn}
    Web.Wait Until Element Is Visible       ${DescriptionColumnArrow}     ${StandardTimeout}
    Web.Page Should Contain Element     ${DescriptionColumnArrow}
    Web.Wait Until Element Is Visible       ${ClickOnUserInGroupColumn}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${ClickOnUserInGroupColumn}
    Web.Wait Until Element Is Visible       ${UserInGroupColumnArrow}     ${StandardTimeout}
    Web.Page Should Contain Element     ${UserInGroupColumnArrow}

Click On Filter Member Search Icon
    Web.Wait Until Element Is Visible       ${FilterMemberSearchIcon}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${FilterMemberSearchIcon}

Click On Member Of Group
    Web.Wait Until Element Is Visible       ${MemberOfGroup}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${MemberOfGroup}

Navigate to Update Group Action
    Web.Wait Until Element Is Visible       ${EditGroupAction}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditGroupAction}
    Web.Wait Until Element Is Visible       ${OnlyShowGroupMember}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${OnlyShowGroupMember}
    Select multiple checkbox option to add users in group
    Web.Wait Until Element Is Visible       ${UpdateButton}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${UpdateButton}
