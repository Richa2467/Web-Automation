*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenGroupResource.robot
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../locators/UserGroupLocator.robot
Resource    ../resources/UserGroupResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    Run keyword   Web.Close All Browsers

*** Test Cases ***
Verify Users Group created successfully or Not
    [Tags]  USR_GRP_001     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Select multiple checkbox option to add users in group
    Click on Users group Add button
    Verify User Group added Success Message receive or not

Verify From import user option, able to create new group
    [Tags]  USR_GRP_002     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Delete Group if existing
    ${NormalizedPath}    Normalize Path    ${UserImportFile}
    Go To Import User Page And Upload File      ${NormalizedPath}
    TokenGroupResource.Click On Import Button
    Web.Wait Until Element Is Visible       ${IgnoreFirstRecord}        ${StandardTimeout}
    Web.Select Checkbox    ${IgnoreFirstRecord}
    Map Data With Coloumn
    Web.Wait Until Element Is Visible    ${NextButton}      ${StandardTimeout}
    Web.Click Element    ${NextButton}
    Web.Wait Until Element Is Visible    ${TokenType}       ${StandardTimeout}
    Web.Select From List By Value    ${TokenType}       -1
    Web.Wait Until Element Is Visible   ${SelectCreateGroupCheckbox}    ${StandardTimeout}
    Web.select checkbox    ${SelectCreateGroupCheckbox}
    Web.Wait Until Element Is Visible    ${GroupNameTextBox}   ${StandardTimeout}
    Web.Input Text    ${GroupNameTextBox}      ${inputGroupName}
    TokenGroupResource.Click On Import Button
    Verified Success Message For Records Were Added
    Navigate to Users Group
    Web.Page Should Contain    ${inputGroupName}
    Navigate to Users Folder
    Delete Group if existing

Verify Edit link is working properly
    [Tags]  USR_GRP_003     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Select multiple checkbox option to add users in group
    Click on Users group Add button
    Navigate to Users Folder
    Navigate to Users Group
    Web.Wait Until Element Is Visible    ${EditGroupAction}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${EditGroupAction}

    Web.Wait Until Element Is Visible       ${FilterMemberDropDown}     ${StandardTimeout}

Verify Delete link is working properly
    [Tags]  USR_GRP_004     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Navigate to Users Group
    Web.Wait Until Element Is Visible    ${DeleteGroupAction}     ${StandardTimeout}
    Web.Click Element    ${DeleteGroupAction}
    Web.Wait Until Element Is Visible    ${DeleteButton}    ${StandardTimeout}
    Web.Click Element   ${DeleteButton}
    Verify Group delete Message

Verify New link is working properly
    [Tags]  USR_GRP_005     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Web.Page Should Contain    Add User Group

Verify Delete User Group box message should display with a proper and appropriate message
    [Tags]  USR_GRP_006     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Select multiple checkbox option to add users in group
    Click on Users group Add button
    Verify User Group added Success Message receive or not
    Navigate to Users Folder
    Navigate to Users Group
    Web.Page Should Contain Element     ${ClickOnUserGroupDeleteAction}
    Web.Click Element    ${ClickOnUserGroupDeleteAction}
    Web.Page Should Contain Element     ${GetUserGroupMsg}
    Web.Wait Until Element Is Visible       ${CancleDeleteMSg}        ${StandardTimeout}
    Web.Click Element      ${CancleDeleteMSg}

Verify 'Up' and 'Down' arrow should be visible after clicking on Group Name,Discription and User in Group
    [Tags]  USR_GRP_007     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Navigate to Users Group
    Up And Down Arrow Should Be Visible

Verify the filter members 'Contains' is working properly
    [Tags]  USR_GRP_009     SurePassID_M2   SurePassId_Web
    Delete User form the User List if existing      ${inputUserName}
    Wait Until the Update Icon Disappear
    Click on New Option
    Provide required details for the new user
    Select Administrator User role
    Click on Add button
    Wait Until the Update Icon Disappear
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Web.Page Should Contain Element     ${clickOndeleteAction}
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Verify Members Of This Group Filter    1       ${inputFirstName}${SPACE}${inputLastName}[0:2]
    Web.Wait Until Element Is Visible    ${GroupMemberName}      ${StandardTimeout}
    Web.Page Should Contain Element    ${GroupMemberName}

Verify the Users filter 'Is' is working properly
    [Tags]  USR_GRP_010     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Verify Members Of This Group Filter    3       ${inputFirstName}
    Web.Wait Until Element Is Visible    ${GroupMemberName}      ${StandardTimeout}
    Web.Page Should Contain Element    ${GroupMemberName}

Verify the Users filter 'Begins With'is working properly
    [Tags]  USR_GRP_011     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Verify Members Of This Group Filter    2       ${inputFirstName}
    Web.Wait Until Element Is Visible    ${GroupMemberName}      ${StandardTimeout}
    Web.Page Should Contain Element    ${GroupMemberName}

Verify If forgot to give the name of the Group then the system gives an error/alert message
    [Tags]  USR_GRP_012     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Click on Users group Add button
    Web.Wait Until Element Is Visible    ${GroupMsgBox}      ${StandardTimeout}
    ${GetGroupMsg}     Web.Get Text   ${GroupMsgBox}
    Should Contain      ${GetGroupMsg}    ${UsrGroupEmptyGroupNameMsg}

Verify After creating the group successfully, the group name should be displayed in the 'Member of Group' list
    [Tags]  USR_GRP_013     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Wait Until the Update Icon Disappear
    Click on Add button
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Click on Users group Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Web.Wait Until Element Is Visible    ${clickOnEditAction}   ${StandardTimeout}
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Click On Member Of Group
    Web.Page Should Contain    ${inputGroupName}
    Web.Page Should Contain    ${inputGrpDisDetail}

Verify If the user's added in the group then that group should be displayed with selected checkbox in the Group Name
    [Tags]  USR_GRP_014     SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Click on Users group Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Click On Member Of Group
    Web.Page Should Contain    ${inputGroupName}
    Web.Page Should Contain    ${inputGrpDisDetail}

Verify User can be added to the group from 'Member of Group'
    [Tags]  USR_GRP_015     SurePassID_M2      SurePassId_Web
    Go To User Details Page    ${inputUserName}
    Click On Member Of Group
    Select multiple checkbox option to add users in group
    Web.Wait Until Element Is Visible       ${UpdateButton}        ${StandardTimeout}
    Web.Click Element       ${UpdateButton}
    Web.Checkbox Should Be Selected    ${SelectGroupForUser}

Verify User can be added to the multiple groups from 'Member of Group'
    [Tags]  USR_GRP_016     SurePassID_M2   SurePassId_Web      123
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Click on Users group Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Click On Member Of Group
    Web.Wait Until Element Is Visible       ${SelectAllMemberOfGroup}        ${StandardTimeout}
    Web.Click Element       ${SelectAllMemberOfGroup}
    Web.Wait Until Element Is Visible       ${UpdateButton}        ${StandardTimeout}
    Web.Click Element       ${UpdateButton}
    Web.Checkbox Should Be Selected    ${IdetifyCheckboxChecked}

Verify the number of users in the group list should be increased when we add a new user to the group
    [Tags]  USR_GRP_017     SurePassID_M2   SurePassId_Web      123
    Delete User form the User List if existing      ${inputUserName}
    Navigate to Users Folder
    Navigate to Users Group
    Navigate to Update Group Action
    Navigate to Users Folder
    Navigate to Users Group
    Web.Wait Until Element Is Visible       ${UserInGroupCounter}        ${StandardTimeout}
    ${GetDataFromUserInGroup}       Web.get text    ${UserInGroupCounter}
    Navigate to Users Folder
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Click on Users group Add button
    Navigate to Users Folder
    Navigate to Users Group
    Navigate to Update Group Action
    Navigate to Users Folder
    Navigate to Users Group
    Web.Wait Until Element Is Visible       ${UserInGroupCounter}        ${StandardTimeout}
    ${UpdateGetDataFromUserInGroup}       Web.get text    ${UserInGroupCounter}
    Should Be True    ${UpdateGetDataFromUserInGroup} > ${GetDataFromUserInGroup}

Verify the user can be removed from a group by using 'Member of Group'
    [Tags]  USR_GRP_018     SurePassID_M2   SurePassId_We       1234
    Go To User Details Page    ${inputUserName}
    Click On Member Of Group
    Web.Wait Until Element Is Visible       ${SelectGroupForUser}        ${StandardTimeout}
    Web.Click Element       ${SelectGroupForUser}
    Web.Wait Until Element Is Visible       ${UpdateButton}        ${StandardTimeout}
    Web.Click Element       ${UpdateButton}
    Navigate to Users Folder
    Navigate to Users Group
    Web.Wait Until Element Is Visible       ${EditGroupAction}        ${StandardTimeout}
    Web.Click Element      ${EditGroupAction}
    Web.Wait Until Element Is Visible       ${OnlyShowGroupMember}        ${StandardTimeout}
    Web.Click Element      ${OnlyShowGroupMember}
    Web.Wait Until Element Is Visible       ${FilterMemberDropDown}     ${StandardTimeout}
    Web.Select From List By Value    ${FilterMemberDropDown}        3
    Web.Wait Until Element Is Visible       ${FilterMemberSearchBar}       ${StandardTimeout}
    Web.Input Text    ${FilterMemberSearchBar}        ${inputUserName}
    Click On Filter Member Search Icon
    Web.Wait Until Element Is Visible    ${MembersGroupCheckBoxUser}        ${StandardTimeout}
    Web.Checkbox Should Be Selected    ${MembersGroupCheckBoxUser}
