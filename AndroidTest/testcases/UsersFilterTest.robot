*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/UserFilterResource.robot
Resource    ../labels/UsersPageLabel.robot
Resource    ../locators/UsersPageLocator.robot
Resource    ../locators/UsersFilterLocator.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify when the number of Rows to Display is increased, the number of page links given at the bottom of the table should change dynamically
    [Tags]    USR_ROW_DISPLY_001    SurePassID_M2     SurePassId_Web        1234
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${RowsToDisplayDropDown}       ${StandardTimeout}
    Web.select from list by label    ${RowsToDisplayDropDown}       20
    Wait Until the Update Icon Disappear
    ${PageCountText20}     Web.Get Text       ${UserPagesCount}
    ${PageCount20}    Get Regexp Matches      ${PageCountText20}        \\d+
    ${PageCount20}    Convert To Integer    ${PageCount20}[0]
    Set Global Variable    ${PageCount20}
    Web.Select From List by Value    ${RowsToDisplayDropDown}        100
    Wait Until the Update Icon Disappear
    Web.Scroll Element Into View    ${CopyrightSection}
    ${PageCountText100}     Web.Get Text       ${UserPagesCount}
    ${PageCount100}    Get Regexp Matches      ${PageCountText100}        \\d+
    ${PageCount100}    Convert To Integer    ${PageCount100}[0]
    Should be True      ${PageCount20} > ${PageCount100}

Verify the Users filter 'Contains' is working properly
    [Tags]  USR_FLTR_LST_001    SurePassID_M2     SurePassId_Web        023     123
    Delete User form the User List if existing      ${inputUserName}
    Wait Until the Update Icon Disappear
    Navigate to Users Folder
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Navigate to Users Folder
    Select User Role Filter All Users
    Search User from the User list Page     ${inputFirstName}       1
    Web.Wait Until Element Is Visible    ${UserFilterName}      ${StandardTimeout}
    Web.page should contain element    ${UserFilterName}

Verify the Users filter 'Is' is working properly
    [Tags]  USR_FLTR_LST_002    SurePassID_M2     SurePassId_Web        123
    Navigate to Users Folder
    Select User Role Filter All Users
    Search User from the User list Page     ${inputFirstName}       3
    Web.Wait Until Element Is Visible    ${UserFilterName}      ${StandardTimeout}
    Web.Page Should Contain Element    ${UserFilterName}

Verify the Users filter 'Begins With'is working properly
    [Tags]  USR_FLTR_LST_003    SurePassID_M2     SurePassId_Web        1234
    Navigate to Users Folder
    Select User Role Filter All Users
    Search User from the User list Page     ${inputFirstName}       2
    Web.Wait Until Element Is Visible    ${UserFilterName}      ${StandardTimeout}
    Web.Page Should Contain Element   ${UserFilterName}

Verify the User Role filter's default selected option should be 'All Users'.
    [Tags]    USR_ROLE_FLTR_002     SurePassID_M2     SurePassId_Web        123
    Navigate to Users Folder
    Select User Role Filter Helpdesk
    Navigate to Users Folder
    Web.Page Should Contain Element    xpath://*[@selected="selected" and text()="Help desk "]

Verify the User should be able to click on Name, Login Name, Status, and Disabled On.
     [Tags]    USR_LST_001      SurePassID_M2     SurePassId_Web        123
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${StatusHeaderLocator}     ${StandardTimeout}
    Web.Click Element    ${StatusHeaderLocator}
    ${Elements}      Web.Get WebElements    xpath://*[text()="Edit"]/parent::div//parent::div//parent::div//*[4]//*[1]
    ${ElementLength}      Get Length      ${Elements}
    ${SortListResult}=    Create List
    FOR    ${i}    IN RANGE    ${ElementLength}
           ${UserNameText}      Web.Get Text    xpath://*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c3"]/*

           Append To List    ${SortListResult}      ${UserNameText}
    END
    ${SortedList1}      Copy List      ${SortListResult}
    ${ListLength}     get length    ${SortedList1}
    ${ListLengthAdj}    Evaluate    ${ListLength}-${1}
    FOR    ${j}    IN RANGE     ${ListLengthAdj}
            ${NewIndex}      Evaluate      ${j}+${1}
            ${ZerothIndexUpper}     Convert To Upper Case     ${SortedList1}[${j}]
            ${FirstIndexUpper}     Convert To Upper Case     ${SortedList1}[${NewIndex}]
            Should Be True     '${FirstIndexUpper}[${0}]' >= '${ZerothIndexUpper}[${0}]'
    END

Verify the User Role filter is working properly
    [Tags]    USR_ROLE_FLTR_001     SurePassID_M2     SurePassId_Web        123
    Navigate to Users Folder
    Select User Role Filter Administrator
    Select User Filter All
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible       ${UserRoleAdmin}        ${StandardTimeout}
    Web.Page Should Contain Element    ${UserRoleAdmin}
    Select User Role Filter Helpdesk
    Web.Wait Until Element Is Visible       ${UserRoleHelpdesk}     ${StandardTimeout}
    Web.Page Should Contain Element    ${UserRoleHelpdesk}
    Select User Role Filter User No portal access
    Web.Page Should Not Contain   ${UserRoleAdmin}
    Web.Page Should Not Contain   ${UserRoleHelpdesk}
    Select User Role Filter All Users
    Select All Rows To Display
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element   ${UserRoleAdmin}
    Web.Page Should Contain Element   ${UserRoleHelpdesk}

Verify the User Role filter's default selected option should be 'Administartor'.
    [Tags]    USR_ROLE_FLTR_002     SurePassID_M2     SurePassId_Web        1234
    Navigate to Users Folder
    Select User Role Filter Helpdesk
    Navigate to Users Folder
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element    ${UserRoleAdmin}

Verify the User should able to delete User account
    [Tags]  DEL_USR_FRMLST_001  SurePassID_M2     SurePassId_Web        1234
    Delete User form the User List if existing      ${inputUserName}