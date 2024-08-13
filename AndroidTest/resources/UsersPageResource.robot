*** Settings ***
Documentation    Users Page related resources including this file.
Library     OperatingSystem
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../labels/UsersPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../locators/UsersPageLocator.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/TokenPageLocator.robot

*** Keywords ***
Go To User Details Page
    [Arguments]    ${UserName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled    ${UsersTab}    ${StandardTimeout}
    Web.Click Element    ${UsersTab}
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}        200
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}    3
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}      ${UserName}
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Web.Wait Until Element Is Visible    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
    Web.Wait Until Element Is Visible    ${UserDetailPageHeader}    ${StandardTimeout}















#Go To User Details Page
#    [Arguments]    ${UserName}
#    Wait Until the Update Icon Disappear
#    Web.Wait Until Element Is Enabled    ${UsersTab}    ${StandardTimeout}
#    Web.Click Element    ${UsersTab}
#    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  Y
#    Wait Until the Update Icon Disappear
#    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='Y']
#    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}   50
#    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='50']
#    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}   3
#    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
#    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}     ${StandardTimeout}
#    Wait Until Keyword Succeeds  5x  1s  Web.Input Text     ${UserNameTextFilter}     ${UserName}
#    Wait Until the Update Icon Disappear
#    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
#    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
#    Wait Until the Update Icon Disappear
#    Web.Wait Until Element Is Visible    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]    ${StandardTimeout}
#    Web.Wait Until Element Is Enabled    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]    ${StandardTimeout}
#    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
#    Wait Until the Update Icon Disappear
#    Web.Wait Until Element Is Visible    ${UserDetailPageHeader}    ${StandardTimeout}




#    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
#    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}    200
##    Web.Click Element    ${UsernameFilter}
#
#    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
#    Wait Until Keyword Succeeds  5x   1s  Web.Select From List by Value  ${UserNameFilter}    3
#    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
#

#    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}     ${StandardTimeout}
#    Wait Until Keyword Succeeds  5x  1s  Web.Input Text     ${UserNameTextFilter}     ${UserName}
#    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
#    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
#    Web.Wait Until Element Is Visible    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]    ${StandardTimeout}
#    Web.Wait Until Element Is Enabled    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]    ${StandardTimeout}
#    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
#    Web.Wait Until Element Is Visible    ${UserDetailPageHeader}    ${StandardTimeout}

Go To User Delete Option
    [Arguments]    ${UserName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled    ${UsersTab}    ${StandardTimeout}
    Web.Click Element    ${UsersTab}
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99
    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}        200
    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}    3
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}  10s
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}      ${UserName}
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Web.Wait Until Element Is Visible    //*[text()= "${UserName}"]/parent::div//parent::div//*[text()="Delete"]    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    //*[text()= "${UserName}"]/parent::div//parent::div//*[text()="Delete"]    ${StandardTimeout}
    Web.Click Element    //*[text()= "${UserName}"]/parent::div//parent::div//*[text()="Delete"]

View User Details Page
    [Arguments]    ${UserName}=None
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled    ${UsersTab}    ${StandardTimeout}
    Web.Click Element    ${UsersTab}
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99
    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}        200
    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}    3
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}  10s
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}      ${UserName}
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Web.Wait Until Element Is Visible    xpath://*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/view_black_white.png"]    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    xpath://*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/view_black_white.png"]    ${StandardTimeout}
    Web.Click Element    xpath://*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/view_black_white.png"]
    Web.Wait Until Element Is Visible    ${UserDetailPageHeader}    ${StandardTimeout}

Go To Add New Soft Token Page From User Details Page
    Scroll Page To Location     0       2000
    Web.Wait Until Element Is Visible    ${AddNewSoftToken}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${AddNewSoftToken}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AddNewSoftToken}
    Web.Wait Until Element Is Visible    ${TokenPageHeader}    ${StandardTimeout}

Login to SurePass MFA server via Email OTP option for Helpdesk User
    Submit First Login Page for Helpdesk User
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element    ${EmailIcon}
    sleep    ${SleepDelay5s}        # waiting for receive Email
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    Delete Email    ${LATEST}
    Web.Input Text    //*[@id="tbxOTP"]    ${otpText}
    Web.Click Element    //*[@id="btnVerifyOtp"]

Check Email received or not
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    Delete Email         ${LATEST}
    Should Contain  ${HTML}     your password has just been changed

Navigate to Users Folder
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${clickOnUsers}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over     ${clickOnUsers}
    Wait Until the Update Icon Disappear
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnUsers}

Click on New Option
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${clickOnNewOption}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${clickOnNewOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over     ${clickOnNewOption}
    Wait Until the Update Icon Disappear
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnNewOption}

Provide required details for the new user
    Web.Wait Until Element Is Visible    ${UserNameField}    ${StandardTimeout}
    Web.Input Text    ${UserNameField}    ${inputUserName}
    Web.Wait Until Element Is Visible    ${FirstNameField}    ${StandardTimeout}
    Web.Input Text    ${FirstNameField}    ${inputFirstName}
    Web.Wait Until Element Is Visible    ${LastNameField}    ${StandardTimeout}
    Web.Input Text    ${LastNameField}    ${inputLastName}
    Web.Wait Until Element Is Visible    ${EmailIDField}    ${StandardTimeout}
    Web.Input Text    ${EmailIDField}    ${inputEmailId}
    Web.Wait Until Element Is Visible    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${inputCellPhoneNo}

Provide required details for the super admin
    Web.Wait Until Element Is Visible    ${UserNameField}    ${StandardTimeout}
    Web.Input Text    ${UserNameField}    ${inputSuperAdminName}
    Web.Wait Until Element Is Visible    ${FirstNameField}    ${StandardTimeout}
    Web.Input Text    ${FirstNameField}    ${inputSuperAdminName}
    Web.Wait Until Element Is Visible    ${LastNameField}    ${StandardTimeout}
    Web.Input Text    ${LastNameField}    ${inputSuperAdminName}
    Web.Wait Until Element Is Visible    ${EmailIDField}    ${StandardTimeout}
    Web.Input Text    ${EmailIDField}    ${SuperEmailIDField}
    Web.Wait Until Element Is Visible    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${inputCellPhoneNo}

Provide required details for the new user2
    Web.Wait Until Element Is Enabled    ${UserNameField}    ${StandardTimeout}
    Web.Input Text    ${UserNameField}    ${inputUserName2}
    Web.Wait Until Element Is Enabled    ${FirstNameField}    ${StandardTimeout}
    Web.Input Text    ${FirstNameField}    ${inputFirstName2}
    Web.Wait Until Element Is Enabled    ${LastNameField}    ${StandardTimeout}
    Web.Input Text    ${LastNameField}    ${inputLastName2}
    Web.Wait Until Element Is Enabled    ${EmailIDField}    ${StandardTimeout}
    Web.Input Text    ${EmailIDField}    ${inputEmailId2}
    Web.Wait Until Element Is Enabled    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${inputCellPhoneNo}

Provide required details for the new Admin user
    Web.Wait Until Element Is Enabled    ${UserNameField}    ${StandardTimeout}
    Web.Input Text    ${UserNameField}    ${inputUserName}
    Web.Wait Until Element Is Enabled    ${FirstNameField}    ${StandardTimeout}
    Web.Input Text    ${FirstNameField}    ${inputFirstName}
    Web.Wait Until Element Is Enabled    ${LastNameField}    ${StandardTimeout}
    Web.Input Text    ${LastNameField}    ${inputLastName}
    Web.Wait Until Element Is Enabled    ${EmailIDField}    ${StandardTimeout}
    Web.Input Text    ${EmailIDField}    ${inputEmailIdforHDUsr}
    Web.Wait Until Element Is Enabled    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${inputCellPhoneNo}

Click on Add button
    Web.Wait Until Element Is Enabled  ${AddBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${AddBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AddBtn}

Select Filter Users-No Portal access Role
    Web.Wait Until Element Is Visible    ${selectUserFilter}    ${StandardTimeout}
    Web.Click Element	  ${selectUserFilter}
    Web.Wait Until Element Is Enabled  //*[@name="ctl00$ContentPlaceHolder1$ddlRoleFilter"]/option[@value='N']
    Web.Select From List by Value  //*[@name="ctl00$ContentPlaceHolder1$ddlRoleFilter"]  N

Select Filter for Helpdesk User Role
    Web.Wait Until Element Is Visible  ${selectUserFilter}    ${StandardTimeout}
    Web.Click Element  ${selectUserFilter}
    Web.Wait Until Element Is Enabled  //*[@name="ctl00$ContentPlaceHolder1$ddlRoleFilter"]/option[@value='3']
    Web.Select From List by Value  //*[@name="ctl00$ContentPlaceHolder1$ddlRoleFilter"]  3

Select Filter for Administrator User Role
    Web.Wait Until Element Is Visible  ${selectUserFilter}  ${StandardTimeout}
    Web.Click Element  ${selectUserFilter}
    Web.Wait Until Element Is Enabled  //*[@name="ctl00$ContentPlaceHolder1$ddlRoleFilter"]/option[@value='Y']
    Web.Select From List by Value	 //*[@name="ctl00$ContentPlaceHolder1$ddlRoleFilter"]  Y

Select Super Admin access Role
    Web.Wait Until Element Is Visible    ${selectSuperAdmin}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element	  ${selectSuperAdmin}

Click on Edit action for the User
    Web.Wait Until Element Is Visible    ${clickOnEditAction}   ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${clickOnEditAction}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnEditAction}

Select Enabled Status
    Web.Wait Until Element Is Visible    ${selectStatus}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element	  ${selectStatus}
    Web.Select From List by Value	  ${selectStatus}    Enabled

Select Disabled Status
    Web.Wait Until Element Is Visible    ${selectStatus}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element	  ${selectStatus}
    Web.Select From List by Value	  ${selectStatus}        Disabled

Get Disabled information from Disabled field
    Web.Wait Until Element Is Visible    ${DisabledInfo}   ${StandardTimeout}
    ${DisableInformation}     Web.Get Value    ${DisabledInfo}
    Should Not Be Empty     ${DisableInformation}

Verify disabled field does not exist on the current page
    Web.Page Should Not Contain Element     ${DisabledInfo}       ${StandardTimeout}

Disabled field should be empty
    Should Be Empty     ${DisabledInfo}

Click on Update button
    Web.Wait Until Element Is Visible    ${clickonUpdate}   ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${clickonUpdate}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${clickonUpdate}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickonUpdate}

Click on Confirm button
    Web.Wait Until Element Is Visible    ${deleteConfirmMsg}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s     Web.Click Element	  ${deleteConfirmMsg}

Delete User form the User List if existing
    [Arguments]     ${inputTexttoDelete}
    set global variable   ${inputTexttoDelete}
    Navigate to Users Folder
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99
    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}        200
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}    3
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}  ${inputTexttoDelete}
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Wait Until the Update Icon Disappear
    ${Count} =  Web.Get Element Count  xpath://*[text()= "${inputTexttoDelete}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
    Run Keyword If  ${Count} > 0  Delete Users  ${Count}

Delete Users
    [Arguments]     ${Count}
    FOR  ${i}  IN RANGE  ${Count}
      Web.Wait Until Element Is Visible  xpath://*[text()= "${inputTexttoDelete}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]  ${StandardTimeout}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element	 xpath://*[text()= "${inputTexttoDelete}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
      Click on Confirm button
      Verify Delete Success Message receive or not
    END

Verify Delete Success Message receive or not
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     User(s) have been deleted successfully.

Verify User added Success Message receive or not
    Scroll Page To Location     0       0
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     User has been added successfully.

Verify User saved Success Message receive or not
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     User has been saved successfully.

Verify User Group added Success Message receive or not
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Group has been added successfully.

Verify User Group deleted Success Message receive or not
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Group has been deleted successfully.

Verify Device/Token added Success Message receive or not
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Device has been added successfully.

Verify User Success Toast Message
    Wait Until Keyword Succeeds  5x  1s     Web.Element Text Should Be          ${ToastSuccess}     Success

Verified Success Message For Token
    [Arguments]     ${ActualMsg}
    Web.Wait Until Element Is Visible    ${successMsgGroup}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGroup}
    Should Be Equal     ${SuccessMsg}      ${ActualMsg}

Verified Success Message For Token Assigning
    [Arguments]     ${ActualMsg}
    Web.Wait Until Element Is Visible    ${successMsgGroup}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGroup}
    Should Be Equal     ${SuccessMsg}      ${ActualMsg}

Verified Error Message For Token Activation
    [Arguments]     ${ActualMsg}
    Web.Wait Until Element Is Visible    ${successMsgGroup}    ${StandardTimeout}
    ${ErrorMsgTkn}     Web.Get Text	  ${successMsgGroup}
    Should Be Equal     ${ErrorMsgTkn}      ${ActualMsg}

Verify User updated Success Message receive or not
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     User has been saved successfully.

Verify Import User added Success Message receive or not
    [Arguments]     ${importMsg}
    Web.Wait Until Element Is Visible       ${successImportMsgbar}        ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successImportMsgbar}
    Should Be Equal     ${SuccessMsg}      ${importMsg}

Verify Import User added Warning Message receive or not
    [Arguments]     ${expectedimportWarningMsg}
    Web.Wait Until Element Is Visible       ${warningImportMsgbar}        ${StandardTimeout}
    ${actualwarningMsg}     Web.Get Text	  ${warningImportMsgbar}
    Should Be Equal     ${actualwarningMsg}      ${expectedimportWarningMsg}

Verify Import Summary and Import Logs visible or not
    Web.Wait Until Element Is Visible    ${textImportSummary}    ${StandardTimeout}
    ${textImportSummary}      Web.Get Text	  ${textImportSummary}
    Should Be Equal     ${textImportSummary}      Import Summary
    Web.Wait Until Element Is Visible    ${textImportLog}    ${StandardTimeout}
    ${textImportLog}      Web.Get Text	  ${textImportLog}
    Should Be Equal     ${textImportLog}      Import Log
    Sleep  ${SleepDelay2s}

Verify the Imported User got listed on the user list or not
    Web.Page Should Contain Element     ${editActionforImportUsr}       ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${editActionforImportUsr}    ${StandardTimeout}

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Try to select User Role option
    Scroll Page To Location     1   1000
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${selectHelpdeskUsr}   ${StandardTimeout}
    Web.Click Element	  ${selectHelpdeskUsr}
    Sleep   ${SleepDelay5s}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${selectAdminUsr}   ${StandardTimeout}
    Web.Click Element	  ${selectAdminUsr}
    Sleep   ${SleepDelay5s}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${selectUserNPAccess}   ${StandardTimeout}
    Web.Click Element	  ${selectUserNPAccess}
    Sleep   ${SleepDelay5s}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${selectSuperAdmin}   ${StandardTimeout}
    Web.Click Element	  ${selectSuperAdmin}
    Sleep   ${SleepDelay2s}

Select Admin option
    Web.Wait Until Element Is Enabled  ${selectHelpdeskUsr}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${selectAdminUsr}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${selectAdminUsr}

Select Helpdesk User option
    Web.Wait Until Element Is Enabled  ${selectHelpdeskUsr}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${selectHelpdeskUsr}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${selectHelpdeskUsr}

Select Helpdesk User role
    Web.Wait Until Element Is Visible    ${selectHelpdeskUsr}   ${StandardTimeout}
    Web.Click Element	  ${selectHelpdeskUsr}
    Sleep   10s
    Web.Wait Until Element Is Visible    ${getPassword}   ${StandardTimeout}
    ${HelpDeskPW}     Web.Get Value    ${getPassword}
    Set Global Variable     ${HelpDeskPW}

Select Administrator User role
    Web.Wait Until Element Is Enabled  ${selectAdminUsr}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${selectAdminUsr}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${selectAdminUsr}

Select BypassMFA Option
    Web.Wait Until Element Is Visible    ${BypassMFA}    ${StandardTimeout}
    Web.Click Element	  ${BypassMFA}

Select VIP Option
    Web.Wait Until Element Is Visible    ${VIP_Member}    ${StandardTimeout}
    Web.Click Element	  ${VIP_Member}

Verfify VIP Icon Idication
    Web.Wait Until Element Is Visible    ${VIP_UserIcon}    ${StandardTimeout}
    Web.Element Should Be Visible         ${VIP_UserIcon}      ${VIP_UserIcon}

Click on Show Only VIP Option
    Web.Wait Until Element Is Visible    ${ShowOnlyVIP}    ${StandardTimeout}
    Web.Click Element       ${ShowOnlyVIP}

Check Pin field turn into Password field
    Scroll Page To Location     1000   1
    Web.Wait Until Element Is Visible   ${PasswordFieldTitle}    ${StandardTimeout}
    ${Password}  Web.Get Text    ${PasswordFieldTitle}
    Should Be Equal  ${Password}  Password:

Select Import User
    Sleep   3s
    Web.Wait Until Element Is Visible    ${selectImportUsr}   ${StandardTimeout}
    Web.Mouse Over     ${selectImportUsr}
    Web.Click Element	  ${selectImportUsr}

Browse File
    ${NormalizedPath}    Normalize Path    ${CURDIR}\\..\\appData\\iusr.txt
    Choose File     ${fileBrowse}      ${NormalizedPath}

Browse invalidEmailAddress File
    ${NormalizedPath}    Normalize Path    ${CURDIR}\\..\\appData\\invalidEmailAddress.txt
    Choose File     ${fileBrowse}      ${NormalizedPath}

Browse multiple import Users record File
    ${NormalizedPath}    Normalize Path    ${CURDIR}\\..\\appData\\importMultipleUsr.txt
    Choose File     ${fileBrowse}      ${NormalizedPath}

Browse File which contain invalid mobile number
    ${NormalizedPath}    Normalize Path    ${CURDIR}\\..\\appData\\invalidMobileNo.txt
    Choose File     ${fileBrowse}      ${NormalizedPath}

Click on Next button
    Web.Wait Until Element Is Visible    ${clickOnNextBtn}   ${StandardTimeout}
    Web.Click Element	  ${clickOnNextBtn}

Click on Import button
    Web.Wait Until Element Is Visible    ${clickOnImportBtn}   ${StandardTimeout}
    Web.Click Element	  ${clickOnImportBtn}

Select Ignore first record in the import file
    Web.Wait Until Element Is Visible    ${selectIgnrFirstOpt}   ${StandardTimeout}
    Web.Click Element	  ${selectIgnrFirstOpt}

Map Import Data
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl0"]   0
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl1"]   1
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl2"]   2
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl3"]   4
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl4"]   5
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl5"]   3

Delete Import Users if existing
    Navigate to Users Folder
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99
    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}        200
    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}    3
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}  ${SleepDelay10s}
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}  DemoLoginN
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Wait Until the Update Icon Disappear
    ${Count}=    Get Element Count   ${clickOnImrtdeleteAction}
    Run Keyword If  ${Count} > 0        Delete Imported Users       ${Count}

Delete Imported Users
    [Arguments]     ${Count}
    FOR     ${i}  IN RANGE      ${Count}
           Web.Wait Until Element Is Visible    ${clickOnImrtdeleteAction}   ${StandardTimeout}
           Web.Click Element	  ${clickOnImrtdeleteAction}
           Click on Confirm button
           Verify Delete Success Message receive or not
    END

Select Token Type In Import User
    [Arguments]     ${ImportTokenType}
    Web.Select From List by Value   ${selectTokenType}   ${ImportTokenType}

Get Token Serial Number
    ${TokenSN}      Web.Get Text    ${selectTKNserialNo}
    Set Global Variable     ${TokenSN}

Verify Serial Token Number from imported user
    Scroll Page To Location     1   5000
    #Scroll Page To Location     5000   1
    Web.Wait Until Element Is Visible    xpath://*[text()= "${TokenSN}"]   ${StandardTimeout}
    Web.Page Should Contain Element     xpath://*[text()= "${TokenSN}"]       ${StandardTimeout}

Click on Edit action to check serial number
    Web.Wait Until Element Is Visible    ${clickOnEditActionForTKNSR}   ${StandardTimeout}
    #Web.Click Element	  ${clickOnEditActionForTKNSR}
    Web.Wait Until Element Is Enabled  ${clickOnEditActionForTKNSR}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${clickOnEditActionForTKNSR}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnEditActionForTKNSR}

Get Token Serial number from User
    ${usrTokenSN}      Web.Get Text    ${userSRTKNo}
    Set Global Variable     ${usrTokenSN}

Verify Token Serial Number
    Should Be Equal     ${TokenSN}      ${usrTokenSN}

Navigate to Users Group
    Web.Wait Until Element Is Enabled    ${selectUsersGrp}    ${StandardTimeout}
    Web.Mouse Over     ${selectUsersGrp}
    Web.Click Element    ${selectUsersGrp}

Click On New Link to create User Group
    Web.Wait Until Element Is Visible    ${selectGrpNewLink}   ${StandardTimeout}
    Web.Click Element	  ${selectGrpNewLink}

Provide Required details to create new group
    Web.Wait Until Element Is Enabled    ${inputGrpName}    ${StandardTimeout}
    Web.Input Text    ${inputGrpName}    ${inputGroupName}
    Web.Wait Until Element Is Enabled    ${inputGrpDiscription}    ${StandardTimeout}
    Web.Input Text    ${inputGrpDiscription}    ${inputGrpDisDetail}

Select multiple checkbox option to add users in group
    Web.Wait Until Element Is Visible    ${selectMulticheckboxOpt}   ${StandardTimeout}
    Web.Click Element	  ${selectMulticheckboxOpt}

Click on Users group Add button
    Web.Wait Until Element Is Visible    ${clickOnUserAddBtn}   ${StandardTimeout}
    Web.Click Element	  ${clickOnUserAddBtn}

Delete Group if existing
    Navigate to Users Group
    ${Count}=    Web.Get Element Count   ${clickOnGroupDeleteAction}
    Run Keyword If  ${Count} > 0        Delete Users Group      ${Count}

Delete Users Group
    [Arguments]     ${Count}
    Sleep   ${SleepDelay2s}
    FOR     ${i}  IN RANGE      ${Count}
        Web.Wait Until Element Is Visible    ${clickOnGroupDeleteAction}   ${StandardTimeout}
        Web.Click Element	  ${clickOnGroupDeleteAction}
        Web.Wait Until Element Is Visible    ${clickOnDeleteOkBtn}   ${StandardTimeout}
        Web.Click Element	  ${clickOnDeleteOkBtn}
        Verify User Group deleted Success Message receive or not
    END

Verify Group delete Message
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Web.Page Should Contain     Group has been deleted successfully.

Verify Home Page
    Web.Wait Until Element Is Visible    ${HomePageWelcomeMsg}    ${StandardTimeout}
    Web.Page Should Contain Element     ${HomePageWelcomeMsg}       ${StandardTimeout}
    Web.Page Should Contain     Welcome Back

Verify Users Page
    Web.Wait Until Element Is Visible    ${titleofUsersPage}    ${StandardTimeout}
    Web.Page Should Contain Element     ${titleofUsersPage}       ${StandardTimeout}

Verify Edit action not available for helpdesk user
    Web.Page Should Not Contain Element     ${editOptionHelpdesk}       ${StandardTimeout}

Click on View option
    Web.Page Should Contain Element     ${viewOptionHelpdesk}       ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${viewOptionHelpdesk}    ${StandardTimeout}
    Web.Click Element	  ${viewOptionHelpdesk}

Click on Home Tab
    Scroll Page To Location   0   -1000
    Web.Page Should Contain Element     ${clickOnHome}       ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${clickOnHome}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${clickOnHome}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${clickOnHome}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnHome}

Generate User Name with Random Number
    ${RandomNo}     Generate random string    length=5  chars=0123456789
    ${nameProject}      Set Variable     ${UserNamePreFix}${RandomNo}
    RETURN    ${nameProject}

Provide User's details
    Web.Wait Until Element Is Visible    ${UserNameField}    ${StandardTimeout}
    ${MultiUserName}  Generate User Name with Random Number
    set global variable  ${MultiUserName}
    Web.Input Text    ${UserNameField}    ${MultiUserName}
    Web.Wait Until Element Is Enabled    ${FirstNameField}    ${StandardTimeout}
    Web.Input Text    ${FirstNameField}    ${inputFirstName}
    Web.Wait Until Element Is Enabled    ${LastNameField}    ${StandardTimeout}
    Web.Input Text    ${LastNameField}    ${inputLastName}
    Web.Wait Until Element Is Enabled    ${EmailIDField}    ${StandardTimeout}
    Web.Input Text    ${EmailIDField}    ${inputEmailIdforHDUsr}
    Web.Wait Until Element Is Enabled    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${inputCellPhoneNo}
    RETURN    ${MultiUserName}

Add three new Users
    @{UserDetailList}    Create List
    FOR     ${i}  IN RANGE      3
       Navigate to Users Folder
       Click on New Option
       ${UserDetail}    Provide User's details
       Append To List    ${UserDetailList}    ${UserDetail}
       Click on Add button
    END
    set global variable  @{UserDetailList}

Select Mutli select Checkboxes option
    Web.Wait Until Element Is Visible    //*[text()= "${UserDetailList}[0]"]/parent::div//parent::div//*[input]   ${StandardTimeout}
    Web.Click Element    //*[text()= "${UserDetailList}[0]"]/parent::div//parent::div//*[input]
    Web.Wait Until Element Is Visible    //*[text()= "${UserDetailList}[1]"]/parent::div//parent::div//*[input]   ${StandardTimeout}
    Web.Click Element    //*[text()= "${UserDetailList}[1]"]/parent::div//parent::div//*[input]
    Web.Wait Until Element Is Visible    //*[text()= "${UserDetailList}[2]"]/parent::div//parent::div//*[input]   ${StandardTimeout}
    Web.Click Element    //*[text()= "${UserDetailList}[2]"]/parent::div//parent::div//*[input]
    Web.Wait Until Element Is Visible    ${deleteCheckedItems}   ${StandardTimeout}
    Web.Click Element    ${deleteCheckedItems}

Select on delete button
    Web.Wait Until Element Is Visible    ${deleteOKBtn}   ${StandardTimeout}
    Web.Click Element	  ${deleteOKBtn}

Verify Delete Success Message for multiple users
    [Arguments]     ${ActualMsg}
    Web.Wait Until Element Is Visible    ${successMsgGroup}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGroup}
    Should Be Equal     ${SuccessMsg}      ${ActualMsg}

Add User and retrieve login details
     Navigate to Users Folder
     Click on New Option
     Provide required details for the new user
     ${Passwordvalue}    Web.Get Value      ${getPassword}
     set global variable    ${Passwordvalue}
     Web.Wait Until Element Is Enabled    ${userRoles}    ${StandardTimeout}
     Web.Click Element    ${selectHelpdeskUsr}
     Sleep    ${SleepDelay10s}
     ${Passwordvalue}    Web.Get Value      ${getPassword}
     set global variable    ${Passwordvalue}
     Click on Add button
     ${UserValue}    Web.Get Value    ${UserNameField}
     set global variable    ${UserValue}

Add Administrator User
     Navigate to Users Folder
     Click on New Option
     Sleep  5s
     Web.Wait Until Element Is Visible    ${UserNameField}    ${StandardTimeout}
     Web.Input Text    ${UserNameField}    ${inputUserName}
     Web.Wait Until Element Is Visible    ${FirstNameField}    ${StandardTimeout}
     Web.Input Text    ${FirstNameField}    ${inputFirstName}
     Web.Wait Until Element Is Visible    ${LastNameField}    ${StandardTimeout}
     Web.Input Text    ${LastNameField}    ${inputLastName}
     Web.Wait Until Element Is Visible    ${EmailIDField}    ${StandardTimeout}
     Web.Input Text    ${EmailIDField}    ${inputEmailId}
     Web.Wait Until Element Is Visible    ${CellPhoneField}    ${StandardTimeout}
     Web.Input Text    ${CellPhoneField}    ${inputCellPhoneNo}
     Sleep  5s
     Click on Add button

Click On PIN icon button
    Sleep   3s
    Web.Wait Until Element Is Visible    ${clickOnPIN}   ${StandardTimeout}
    Web.Click Element	  ${clickOnPIN}

Verify Success Message for PIN/Password Generation
    sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${SuccessMSGPIN}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text   ${SuccessMSGPIN}
    Should Be Equal     ${SuccessMsg}      New password/PIN has been created. Add account to save it.

Select SuperAdmin User option
    Web.Wait Until Element Is Visible    ${selectSuperAdmin}   ${StandardTimeout}
    Web.Click Element	  ${selectSuperAdmin}
    Sleep   ${SleepDelay2s}

Click on Time Zone and Try to select different time zones
    Web.Wait Until Element Is Visible    ${clickOnselectTimeZone}   ${StandardTimeout}
    Web.Click Element	  ${clickOnselectTimeZone}
    Web.Select From List by Value	  //*[@name="ctl00$ContentPlaceHolder1$ddlTimeZone"]   GMT Standard Time
    Sleep   1s
    Web.Select From List by Value	  //*[@name="ctl00$ContentPlaceHolder1$ddlTimeZone"]   Argentina Standard Time

Verify strong password msg on current page
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Be Equal     ${SuccessMsg}      Now that the users role has changed the PIN has been reset to a strong password. Please take note of the new password.

Select User - No portal access option
    #Web.Wait Until Element Is Visible    ${selectUserNPAccess}   ${StandardTimeout}
    #Web.Click Element	  ${selectUserNPAccess}
    Web.Wait Until Element Is Enabled  ${selectUserNPAccess}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${selectUserNPAccess}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${selectUserNPAccess}

Check Password field turn into PIN field
    Scroll Page To Location     1000   1
    Web.Wait Until Element Is Visible   ${PasswordFieldTitle}    ${StandardTimeout}
    ${PIN}  Web.Get Text    ${PasswordFieldTitle}
    Should Be Equal  ${PIN}  PIN:

Verify PIN msg on current page
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Be Equal     ${SuccessMsg}       ${UserRoleChangePWMsg}

Get text from Mobile Activation Code field and verify it's not empty
    Web.Wait Until Element Is Visible    ${mobileActvCode}    ${StandardTimeout}
    ${mobileActCodetext}     Web.Get Value   ${mobileActvCode}
    Should Not Be Empty     ${mobileActCodetext}

Get text from SSO Identity field and verify it's not empty
    Web.Wait Until Element Is Visible    ${ssoIdentity}    ${StandardTimeout}
    ${ssoIdentitytext}     Web.Get Value   ${ssoIdentity}
    Should Not Be Empty     ${ssoIdentitytext}
    Should Be Equal     ${inputUserName}    ${ssoIdentitytext}

Verify That Email is already used Msg
    sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${EmailErrorMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Be Equal     ${EmailErrorMsg}       That Email is already used.

Verify the Error Toast Message
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Unable to add user.  Please contact an administrator.

Verify User Status
    Web.Wait Until Element Is Visible    ${checkUsrstatusDisabled}    ${StandardTimeout}
    Web.Page Should Contain Element     ${checkUsrstatusDisabled}       ${StandardTimeout}

Verify Error Msg if UserName alredy exist
    sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${EmailErrorMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Contain    ${EmailErrorMsg}       Please use different User Name.

Provide user details except email detail
    Web.Wait Until Element Is Enabled    ${UserNameField}    ${StandardTimeout}
    Web.Input Text    ${UserNameField}    ${inputUserName}
    Web.Wait Until Element Is Enabled    ${FirstNameField}    ${StandardTimeout}
    Web.Input Text    ${FirstNameField}    ${inputFirstName}
    Web.Wait Until Element Is Enabled    ${LastNameField}    ${StandardTimeout}
    Web.Input Text    ${LastNameField}    ${inputLastName}
    Web.Wait Until Element Is Enabled    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${inputCellPhoneNo}

Verify Email Error Msg if EmailId not provided
    [Arguments]     ${MsgFromBar}
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${EmailErrorMsg}     Web.Get Text	  ${successMsgGreenbar}
    Web.Page Should Contain    ${EmailErrorMsg}       ${MsgFromBar}

Click On Close link
    Web.Wait Until Element Is Visible    ${clickOnCloseLink}    ${StandardTimeout}
    Web.Click Element       ${clickOnCloseLink}

Click on New Option from Edit User

    Web.Wait Until Element Is Enabled    ${clickOnNewLink}    ${StandardTimeout}
    Web.Mouse Over     ${clickOnNewLink}
    Web.Click Element    ${clickOnNewLink}

Click on Edit action for the Admin User
    Web.Wait Until Element Is Visible    ${adminEditUsr}   ${StandardTimeout}
    Web.Click Element	  ${adminEditUsr}
    Sleep   ${SleepDelay5s}

Click on Test SMS option
    #Web.Wait Until Element Is Visible    ${editTestSms}   ${StandardTimeout}
    #Web.Click Element	  ${editTestSms}
    Web.Wait Until Element Is Enabled  ${editTestSms}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${editTestSms}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${editTestSms}

Click on Test Call option
    #Web.Wait Until Element Is Visible    ${clickOnTestCall}   ${StandardTimeout}
    #Web.Click Element	  ${clickOnTestCall}
    Web.Wait Until Element Is Enabled  ${clickOnTestCall}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${clickOnTestCall}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnTestCall}

Verify Success Message Bar for sent test Call successfully on the mobile number
    Sleep   ${SleepDelay5s}                             #Need Sleep to change the Message Bar
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Contain      ${SuccessMsg}     The test call you sent to
    Should Contain      ${SuccessMsg}     was sent successfully.

Verify Success Message for sent test SMS successfully on the mobile number
    Sleep   ${SleepDelay5s}                             #Need Sleep to change the Message Bar
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Contain      ${SuccessMsg}     The test sms message you sent to
    Should Contain      ${SuccessMsg}     was sent successfully.

Verify Success Message for sent test call successfully on the mobile number
    sleep   ${SleepDelay5s}                             #Need Sleep to change the Message Bar
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Contain      ${SuccessMsg}     The test call you sent to
    Should Contain      ${SuccessMsg}     was sent successfully.

Change mobile number formate from valid to invalid
    Web.Wait Until Element Is Visible    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${invalidMobileNoFrmt}

Verify Invalid mobile number error message
    sleep   ${SleepDelay2s}
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Contain      ${SuccessMsg}     Invalid mobile number. The format is: +aaa(bbb)cccccccc where aaa is country code , bbb is area code and cccccccc is the local number. For example. US: +1(800)200-8411 UK: +44(0)20 1234 5678.

Click On Email Login Info
    Web.Wait Until Element Is Visible    ${clickOnEmailLgnInfo}   ${StandardTimeout}
    Web.Click Element	  ${clickOnEmailLgnInfo}

Verify Email Login Info Success message
    sleep   ${SleepDelay2s}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Email sent to ${inputEmailIdforHDUsr}

Click On Password/PIN Reset option
    Web.Wait Until Element Is Visible    ${clickOnPinPassWord}   ${StandardTimeout}
    Web.Click Element	  ${clickOnPinPassWord}

Verify Error Msg for Password/PIN Reset
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Be Equal      ${SuccessMsg}     You cannot reset an admin account. Admins must reset their password through the portal.

Verify Msg for Password/PIN Reset
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Be Equal      ${SuccessMsg}     The user can reset their password/PIN via VPN/ADFS.

Verify Error Msg if import file doesn't select or browse
    Web.Wait Until Element Is Visible    ${deleteGrpsuccessMsg}    ${StandardTimeout}
    ${ImportErrorMsg}     Web.Get Text	  ${deleteGrpsuccessMsg}
    Should Be Equal     ${ImportErrorMsg}      I cannot import users if you do not choose an import file. Please choose a file to import.

Verify Page should not navigate to import user's next step
    Web.Page Should Contain Element     ${titleforImportUsrStep2}       ${StandardTimeout}
    ${pageTitleMsg}     Web.Get Text	  ${titleforImportUsrStep2}
    Should Be Equal     ${pageTitleMsg}      Import Users (Step 2 - Map Fields)
    Web.Page Should Not Contain     Import Users (Step 3 - Select Options)

Select Mutli select Checkboxe option
    Web.Wait Until Element Is Visible    //*[text()= "${UserDetailList}[0]"]/parent::div//parent::div//*[input]   ${StandardTimeout}
    Web.Click Element    //*[text()= "${UserDetailList}[0]"]/parent::div//parent::div//*[input]
    Web.Wait Until Element Is Visible    //*[text()= "${UserDetailList}[1]"]/parent::div//parent::div//*[input]   ${StandardTimeout}
    Web.Click Element    //*[text()= "${UserDetailList}[1]"]/parent::div//parent::div//*[input]
    Web.Wait Until Element Is Visible    //*[text()= "${UserDetailList}[2]"]/parent::div//parent::div//*[input]   ${StandardTimeout}
    Web.Click Element    //*[text()= "${UserDetailList}[2]"]/parent::div//parent::div//*[input]
    Web.Wait Until Element Is Visible    ${deleteCheckedItems}   ${StandardTimeout}
    Web.Click Element    ${deleteCheckedItems}

Click on Edit action for imported user
    Web.Wait Until Element Is Visible    ${clickOnImportUsrEditAction}   ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${clickOnImportUsrEditAction}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${clickOnImportUsrEditAction}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${clickOnImportUsrEditAction}

Add User2 and retreive login detials
     Navigate to Users Folder
     Click on New Option
     Provide required details for the new user2
     Web.Wait Until Element Is Enabled    ${userRoles}    ${StandardTimeout}
     Web.Click Element    ${selectHelpdeskUsr}
     Sleep      ${SleepDelay10s}
     ${Passwordvalue2}    Web.Get Value      ${getPassword}
     set global variable    ${Passwordvalue2}
     Click on Add button
     ${UserValue2}    Web.Get Value    ${UserNameField}
     set global variable    ${UserValue2}

Add Admin User2 and retreive login detials
     Navigate to Users Folder
     Click on New Option
     Provide required details for the new user2
     Select Admin option
     Sleep      ${SleepDelay10s}            # Wait for change the PIN field to Password field.
     ${Passwordvalue2}    Web.Get Value      ${getPassword}
     set global variable    ${Passwordvalue2}
     log to console         ${Passwordvalue2}
     Click on Add button
     ${UserValue2}    Web.Get Value    ${UserNameField}
     set global variable    ${UserValue2}

Select same data for coloumn 1 and 2
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl0"]   0
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl1"]   0

Provide required user details with alredy existing Email
    Web.Wait Until Element Is Enabled    ${UserNameField}    ${StandardTimeout}
    Web.Input Text    ${UserNameField}    ${UserNameTest}
    Web.Wait Until Element Is Enabled    ${EmailIDField}    ${StandardTimeout}
    Web.Input Text    ${EmailIDField}    ${inputEmailId}

Search User from the User list
    [Arguments]     ${UserNameToSearch}
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99
    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}        200
    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='1']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}    1
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}  ${SleepDelay10s}
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}  ${UserNameToSearch}
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Wait Until the Update Icon Disappear

Add Helpdesk User
    Navigate to Users Folder
    Click on New Option
    Provide Required Details For The New User2
    Select Helpdesk User role
    ${Passwordvalue3}    Web.Get Value      ${getPassword}
    set global variable       ${Passwordvalue3}
    log to console            ${Passwordvalue3}
    Click on Add button
    RETURN    ${Passwordvalue3}

Add No-Portal User
    Navigate to Users Folder
    Click on New Option
    Provide Required Details For The New User2
    #Select Helpdesk User role
    ${PIN_value}    Web.Get Value      ${getPassword}
    set global variable       ${PIN_value}
    log to console            ${PIN_value}
    Click on Add button
    RETURN    ${PIN_value}

Add New Helpdesk User with SurePassId Authentication Token
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName2}
    ${HelpdeskPw}   Add Helpdesk User
    Click on Home Tab
    Go To User Details Page     ${inputUserName2}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=9    UserDefinedName=${TokenDefName}      TokenStatus=0
    RETURN    ${HelpdeskPw}

Get the User No Portal Access PIN
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName2}
    ${No_PortalPin}     Add No-Portal User
    RETURN    ${No_PortalPin}

Add Administrator user with Disable Status
    Navigate to Users Folder
    Click on New Option
    Sleep  ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${UserNameField}    ${StandardTimeout}
    Web.Input Text    ${UserNameField}    ${inputUserName}
    Web.Wait Until Element Is Visible    ${FirstNameField}    ${StandardTimeout}
    Web.Input Text    ${FirstNameField}    ${inputFirstName}
    Web.Wait Until Element Is Visible    ${LastNameField}    ${StandardTimeout}
    Web.Input Text    ${LastNameField}    ${inputLastName}
    Web.Wait Until Element Is Visible    ${EmailIDField}    ${StandardTimeout}
    Web.Input Text    ${EmailIDField}    ${inputEmailId}
    Web.Wait Until Element Is Visible    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${inputCellPhoneNo}
    Sleep  ${StandardTimeout}
    Web.Select From List By Value   ${selectStatus}    Disabled
    Click on Add button
    Sleep   ${StandardTimeout}

Select bar format for data statistics
    Web.Wait Until Element Is Visible   ${UsrPanelBar}      ${StandardTimeout}
    Web.Select From List By Label       ${UsrPanelBar}     Bar

Select Grid Format For Data Statistics
    Web.Select From List By Label       ${UsrPanelBar}   Grid

Go To User Details Page For SuperAdmin
    [Arguments]    ${UserName}      ${AccountNameVal}=None
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled    ${UsersTab}    ${StandardTimeout}
    Web.Click Element    ${UsersTab}
    Run Keyword If     '${AccountNameVal}' != 'None'    Run Keyword     Web.Select From List by Label       ${AccountDrdwn}       ${NewCompanyName}
    Web.Wait Until Element Is Enabled  ${selectUserFilter}/option[@value='99']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${selectUserFilter}  99
    Web.Wait Until Element Is Enabled  ${RowsFilter}/option[@value='200']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${RowsFilter}        200
    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']
    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}    3
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}  10s
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}      ${UserName}
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Web.Wait Until Element Is Visible    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]    ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Web.Click Element    //*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
    Web.Wait Until Element Is Visible    ${UserDetailPageHeader}    ${StandardTimeout}
