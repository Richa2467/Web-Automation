*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot


Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
#***************************************************** Create_Add_User_01 *******************************************************#
Verify PIN is generated successfully or Not.
    [Tags]  CRT_NEW_USR_001   SurePassID_M2     SurePassId_Web      Create_User
    Navigate to Users Folder
    Click on New Option
    Click On PIN icon button
    Verify Success Message for PIN/Password Generation

Verify Time Zone is working properly.
    [Tags]  CRT_NEW_USR_003   SurePassID_M2     SurePassId_Web      Create_User
    Click on Time Zone and Try to select different time zones

Verify 'Super Administrator' user role is disabled.
    [Tags]  CRT_NEW_USR_004   SurePassID_M2     SurePassId_Web      Create_User
    Navigate to Users Folder
    Click on New Option
    Select SuperAdmin User option
    Web.Page Should Contain Element     ${disabledSAdmin}       ${StandardTimeout}

Verify default user role is 'User-No portal access'.
    [Tags]  CRT_NEW_USR_005   SurePassID_M2     SurePassId_Web      Create_User
    Web.Page Should Contain Element     ${checkedUserPortalUsr}       ${StandardTimeout}

Verify Admin User should be able to select all other User Roles except for Super Administrator.
    [Tags]  CRT_NEW_USR_006   SurePassID_M2     SurePassId_Web      Create_User
    Navigate to Users Folder
    Click on New Option
    Try to select User Role option

Verify PIN field under 'Login Credentials' should be turned in to Password field when select user role as an Administrator.
    [Tags]  CRT_NEW_USR_007   SurePassID_M2     SurePassId_Web      Create_User
    Navigate to Users Folder
    Click on New Option
    Select Admin option
    Sleep   2s  #Wait to display the proper message.
    Verify strong password msg on current page

Verify When the user role selected as 'User-No portal access' then Password field under Login Credentials should be turned in to PIN field.
    [Tags]  CRT_NEW_USR_008   SurePassID_M2     SurePassId_Web      Create_User
    Navigate to Users Folder
    Click on New Option
    Select Admin option
    Select User - No portal access option
    Verify PIN msg on current page

Verify If Administrator role selected for user then User should not be able to create new user If Email is already used.
    [Tags]  CRT_NEW_USR_009   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing      ${inputUserName}
    Wait Until the Update Icon Disappear
    Click on New Option
    Provide required details for the new user
    Select Administrator User role
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Web.Page Should Contain Element     ${clickOndeleteAction}
    sleep   ${SleepDelay5s}
    Navigate to Users Folder
    Click on New Option
    Provide required user details with alredy existing Email
    Select Admin option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Click on Add button
    Verify the Error Toast Message
    Delete User form the User List if existing      ${inputUserName}

Verify Admin User is able to create new user with 'Administrator' user role.
    [Tags]  CRT_NEW_USR_010   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Click on Add button
    Verify User added Success Message receive or not

Verify After clicking on Add button, 'Mobile Activation Code', 'SSO Identity' details should be automatically filled.
    [Tags]  CRT_NEW_USR_011   SurePassID_M2     SurePassId_Web     Create_User
    Get text from Mobile Activation Code field and verify it's not empty
    Get text from SSO Identity field and verify it's not empty

Verify Admin User is able to create new user with 'Helpdesk' user role.
    [Tags]  CRT_NEW_USR_012   SurePassID_M2     SurePassId_Web      Create_User
    Navigate to Users Folder
    Delete User form the User List if existing  ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Select Helpdesk User role
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter for Helpdesk User Role
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOndeleteAction}

Verify Admin User is able to create a new user with default User role (User-No portal access).
    [Tags]  CRT_NEW_USR_013   SurePassID_M2     SurePassId_Web      Create_User
    Navigate to Users Folder
    Delete User form the User List if existing  ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Select User - No portal access option
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOndeleteAction}

Verify user status should be disabled if the selected status of user 'Disabled' during creating a new user as an Administrator.
    [Tags]  CRT_NEW_USR_014   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Select Disabled Status
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Verify User Status

Verify user status should be disabled if the selected status of user 'Disabled' during creating a new user as a 'Helpdesk'.
    [Tags]  CRT_NEW_USR_015   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Helpdesk User Option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Select Disabled Status
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter for Helpdesk User Role
    Verify User Status

Verify user status should be disabled if the selected status of user 'Disabled' during creating a new user as a 'User-No portal access'.
    [Tags]  CRT_NEW_USR_016   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select User - No portal access option
    Select Disabled Status
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Verify User Status

Verify user should not be able to use the same Username for creating a new user when username already in existing.
    [Tags]  CRT_NEW_USR_017   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Navigate to Users Folder
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Verify Error Msg if UserName alredy exist

Verify error message should appear when forgot to fill email field while creating an Administrator user.
    [Tags]  CRT_NEW_USR_018   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing     ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Provide user details except email detail
    Select Admin option
    Click on Add button
    Wait Until the Update Icon Disappear
    Verify Email Error Msg if EmailId not provided      This user role requires an email.

Verify user should be able to select enable/disable status.
    [Tags]  CRT_NEW_USR_019   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Scroll Page To Location     1   1000
    Select Disabled Status
    Sleep   ${SleepDelay2s}
    Select Enabled Status

Verify Close link is working properly.
    [Tags]  CRT_NEW_USR_020   SurePassID_M2     SurePassId_Web      Create_User
    Click On Close link
    Sleep   ${SleepDelay5s}
    Web.Page Should Contain Element    ${UserDetailPageHeader}   ${StandardTimeout}

Verify error message should appear when forgot to fill the email field while creating a Helpdesk user.
    [Tags]  CRT_NEW_USR_021   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing     ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Provide user details except email detail
    Select Helpdesk User option
    Click on Add button
    Wait Until the Update Icon Disappear
    Verify Email Error Msg if EmailId not provided      This user role requires an email.

Verify the User is able to select BypassMFA checkbox option and update the user.
    [Tags]  CRT_NEW_USR_022   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select User - No portal access option
    Provide required details for the new user
    Select BypassMFA Option
    Click on Add button
    Verify User added Success Message receive or not

Verify the User is able to select VIP checkbox option and update the user.
    [Tags]  CRT_NEW_USR_023   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Provide required details for the new user
    Select Administrator User role
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Select VIP Option
    Click on Add button
    Verify User added Success Message receive or not

Verify the User is able to uncheck BypassMFA checkbox option and update the user.
    [Tags]  CRT_NEW_USR_024   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select User - No portal access option
    Provide required details for the new user
    Wait Until the Update Icon Disappear
    Select BypassMFA Option
    Click on Add button
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Click on Edit action for the User
    Select BypassMFA Option
    Click on Add button
    Verify User saved Success Message receive or not

Verify the User is able to uncheck VIP checkbox option and update the user.
    [Tags]  CRT_NEW_USR_025   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Provide required details for the new user
    Select Administrator User role
    Wait Until the Update Icon Disappear
    Select VIP Option
    Click on Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Click on Edit action for the User
    Select VIP Option
    Click on Add button
    Verify User saved Success Message receive or not

Verify the User is able to select VIP and BypassMFA both checkbox option and update the user.
    [Tags]  CRT_NEW_USR_026   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select User - No portal access option
    Provide required details for the new user
    Select BypassMFA Option
    Select VIP Option
    Click on Add button
    Verify User added Success Message receive or not

Verify the User is able to uncheck VIP and BypassMFA both checkbox option and update the user.
    [Tags]  CRT_NEW_USR_027   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select User - No portal access option
    Provide required details for the new user
    Select BypassMFA Option
    Select VIP Option
    Click on Add button
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Click on Edit action for the User
    Select BypassMFA Option
    Select VIP Option
    Click on Add button
    Verify User updated Success Message receive or not

Verify the user as a VIP then user listing page in user name with VIP icon should be indicate
    [Tags]  CRT_NEW_USR_028   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select User - No portal access option
    Provide required details for the new user
    Select VIP Option
    Click on Add button
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Verfify VIP Icon Idication

Verify the success toast message notification when the user has selected the VIP checkbox option and update the profile.
    [Tags]  CRT_NEW_USR_030   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Provide required details for the new user
    Select Administrator User role
    Wait Until the Update Icon Disappear
    Select VIP Option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Web.Wait Until Element Is Not Visible    //*[@class="jq-toast-single jq-has-icon jq-icon-warning"]   ${StandardTimeout}
    Click on Add button
    Verify User added Success Message receive or not

Verify the success toast message notification when the user has selected the BypassMFA checkbox option and update the profile.
    [Tags]  CRT_NEW_USR_031   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select User - No portal access option
    Provide required details for the new user
    Select BypassMFA Option
    Click on Add button
    Verify User added Success Message receive or not

Verify the success toast message notification when the user has selected the VIP and BypassMFA both checkbox option and update the profile.
    [Tags]  CRT_NEW_USR_032   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select User - No portal access option
    Provide required details for the new user
    Select BypassMFA Option
    Select VIP Option
    Click on Add button
    Verify User added Success Message receive or not

Verify the Show only VIPs filter checkbox in user filter section in user listing page
    [Tags]  CRT_NEW_USR_033   SurePassID_M2     SurePassId_Web      Create_User
    Navigate to Users Folder
    Web.Page Should Contain Element     ${ShowOnlyVIP}

Verify the only listing VIP users when checked Show only VIPs filter checkbox in user filter section in user listing page.
    [Tags]  CRT_NEW_USR_034  SurePassID_M2     SurePassId_Web       Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select User - No portal access option
    Sleep  5s
    Provide required details for the new user
    Select VIP Option
    Click on Add button
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Wait Until the Update Icon Disappear
    Click on Show Only VIP Option
    Wait Until the Update Icon Disappear
    Verfify VIP Icon Idication

#Verify the BypassMFA user should be login in SSP without 2FA Page (Direct login with user name and password)
#    [Tags]  CRT_NEW_USR_035   SurePassID_M2     SurePassId_Web     Create_User

Verify When we create a new user then we keep his user type Administrator then ByPassMFA option should see disabled to user
    [Tags]  CRT_NEW_USR_036   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select Administrator User role
    Provide required details for the new user
    Click on Add button
    Web.Element Should Be Disabled      ${BypassMFA}

Verify When we create a new user then we keep his user type Help desk then ByPassMFA option should see disabled to user
    [Tags]  CRT_NEW_USR_037   SurePassID_M2     SurePassId_Web      Create_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Select Helpdesk User option
    Provide Required Details For The New User2
    Click on Add button
    Web.Element Should Be Disabled      ${BypassMFA}

#*********************************************************** Edit_User ************************************************#
Verify New option is working properly.
    [Tags]  EDIT_USR_001   SurePassID_M2    SurePassId_Web  Edit_User
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Click on New Option from Edit User
    Web.Wait Until Element Is Visible    ${UserDetailPageHeader}    ${StandardTimeout}
    Web.Page Should Contain Element     ${UserDetailPageHeader}       ${StandardTimeout}

Verify Admin user should be able to change user role for 'Helpdesk' user.
    [Tags]  EDIT_USR_002   SurePassID_M2    SurePassId_Web  Edit_User
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Select Helpdesk User role
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter for Helpdesk User Role
    Web.Page Should Contain Element     ${clickOndeleteAction}
    Click on Edit action for the User
    Select Administrator User role
    Scroll Page To Location     1   1000
    Click on Update button
    Verify User updated Success Message receive or not

Verify the Email message should be received, while the admin user changes the user role of another admin user's from administrator to Helpdesk.
    [Tags]  EDIT_USR_003   SurePassID_M2    SurePassId_Web  Edit_User
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Select Helpdesk User option
    Click on Update button
    Verify User updated Success Message receive or not
    Check Email received or not

Verify the Email message should be received, while the admin user changes the user role of another helpdesk user's from helpdesk to an administrator.
    [Tags]  EDIT_USR_004   SurePassID_M2    SurePassId_Web  Edit_User
    Delete User form the User List if existing  ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Provide required details for the new user
    Select Helpdesk User option
    Click on Add button
    Navigate to Users Folder
    Select Filter for Helpdesk User Role
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Select Admin option
    Click on Update button
    Verify User updated Success Message receive or not
    Check Email received or not

Verify Admin user should be able to generate a new password for his/her account.
    [Tags]  EDIT_USR_005   SurePassID_M2    SurePassId_Web  Edit_User
    Go To User Details Page    ${UserName}
    Click On PIN icon button
    Web.Wait Until Element Is Visible    ${SuccessMSGPIN}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text   ${SuccessMSGPIN}
    Should Be Equal     ${SuccessMsg}      New password/PIN has been created. Update the account to save it.

Verify Admin user should not be able to generate a new password for other admin user.
    [Tags]  EDIT_USR_006   SurePassID_M2    SurePassId_Web  Edit_User
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Search User from the User list      ${inputUserName}
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Web.Page Should Not Contain Element     ${clickOnPIN}       ${StandardTimeout}

Verify Admin user should be able to change user role (For his/her account).
    [Tags]  EDIT_USR_007   SurePassID_M2    SurePassId_Web  Edit_User
    Select Helpdesk User option
    Select User - No portal access option
    Select Administrator User role

Verify Admin user should be able to change user role for 'User-No portal access' user.
    [Tags]  EDIT_USR_008   SurePassID_M2    SurePassId_Web  Edit_User
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select User - No portal access option
    Click on Add button
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Select Helpdesk User option
    Select Administrator User role
    Select User - No portal access option

Verify 'Test SMS' option is working properly or Not.
    [Tags]  EDIT_USR_009   SurePassID_M2    SurePassId_Web  Edit_User
    Click on Test SMS option
    Verify Success Message for sent test SMS successfully on the mobile number

Verify 'Test Call' option is working properly or Not.
    [Tags]  EDIT_USR_010   SurePassID_M2    SurePassId_Web  Edit_User
    Click on Test Call option
    Verify Success Message Bar for sent test Call successfully on the mobile number

Verify admin user should be able to enable/disable the status of helpdesk user
    [Tags]  EDIT_USR_011   SurePassID_M2    SurePassId_Web  Edit_User
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Select Helpdesk User role
    Click on Add button
    Navigate to Users Folder
    Select Filter for Helpdesk User Role
    Search User from the User list      ${inputUserName}
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Scroll Page To Location     1   1000
    Select Disabled Status
    Click on Update button
    Get Disabled information from Disabled field
    Select Enabled Status
    Click on Update button
    Wait Until the Update Icon Disappear
    Verify disabled field does not exist on the current page

Verify admin user should be able to enable/disable the status of 'User-No portal access' user.
    [Tags]  EDIT_USR_012   SurePassID_M2    SurePassId_Web      Edit_User
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Scroll Page To Location     1   1000
    Select Disabled Status
    Click on Update button
    Get Disabled information from Disabled field
    Select Enabled Status
    Click on Update button
    Wait Until the Update Icon Disappear
    Verify disabled field does not exist on the current page

Verify If mobile number is not in valid formate then should be alert message.
    [Tags]  EDIT_USR_013   SurePassID_M2    SurePassId_Web  Edit_User
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Search User from the User list      ${inputUserName}
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Change mobile number formate from valid to invalid
    Click on Update button
    Verify Invalid mobile number error message

Verify mobile validation format should work for all valid mobile numbers.
    [Tags]  EDIT_USR_014   SurePassID_M2    SurePassId_Web  Edit_User
    Go To User Details Page    ${UserName}
    Web.Wait Until Element Is Enabled    ${CellPhoneField}    ${StandardTimeout}
    Web.Input Text    ${CellPhoneField}    ${validCellPhoneNo}
    Click on Test SMS option
    sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${successMsgGreenbar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGreenbar}
    Should Not Contain      ${SuccessMsg}     Invalid mobile number.

Verify 'Email Login Info' option is working properly.
    [Tags]  EMAIL_LGN_INFO_001   SurePassID_M2  SurePassId_Web
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Administrator User role
    Click on Add button
    Navigate to Users Folder
    Select Filter for Administrator User Role
    Search User from the User list      ${inputUserName}
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Click On Email Login Info
    Verify Email Login Info Success message

Verify Password/PIN Reset option is working properly (for user created with administrator role).
    [Tags]  PW_PIN_RESET_001   SurePassID_M2    SurePassId_Web      PW_PIN_RESET
    Click On Password/PIN Reset option
    Verify Error Msg for Password/PIN Reset

Verify Password/PIN Reset option is working properly (for user created with Helpdesk user role).
    [Tags]  PW_PIN_RESET_002   SurePassID_M2    SurePassId_Web      PW_PIN_RESET
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Select Helpdesk User role
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter for Helpdesk User Role
    Search User from the User list      ${inputUserName}
    Web.Page Should Contain Element     ${clickOndeleteAction}
    Click on Edit action for the User
    Click On Password/PIN Reset option
    Verify Msg for Password/PIN Reset

Verify Password/PIN Reset option is working properly (for user created with 'User-No portal access' user role).
    [Tags]  PW_PIN_RESET_003   SurePassID_M2    SurePassId_Web      PW_PIN_RESET
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Search User from the User list      ${inputUserName}
    Web.Page Should Contain Element     ${clickOnEditAction}
    Click on Edit action for the User
    Click On Password/PIN Reset option
    Verify Msg for Password/PIN Reset

Verify After clicking on 'Password/PIN Reset' option PIN field should remain disabled(for user created without administrator role).
    [Tags]  PW_PIN_RESET_004   SurePassID_M2    SurePassId_Web      PW_PIN_RESET
    Web.Page Should Contain Element     ${disabledPINField}       ${StandardTimeout}

#********************************************* Improt_User ************************************************************#
Verify admin user should be able to import the user.
    [Tags]  IMPRT_USR_001   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${inputUserName}
    Delete Import Users if existing
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Click on Import button
    Verify Import User added Success Message receive or not     ${ImportSuccessMsg}
    Verify Import Summary and Import Logs visible or not
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}  10s
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}  DemoUN
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Wait Until the Update Icon Disappear
    Verify the Imported User got listed on the user list or not

Verify After successfully importing the user,able to receive a success message while clicking first time on the Update button
    [Tags]  IMPRT_USR_002   SurePassID_M2   SurePassId_Web      Improt_User
    Click on Edit action for imported user
    Click on Update button

Verify If not any file chosen to browse then the user should be able to see an error message.
    [Tags]  IMPRT_USR_003   SurePassID_M2   SurePassId_Web      Improt_User
    Navigate to Users Folder
    Select Import User
    Click on Next button
    Verify Error Msg if import file doesn't select or browse

Verify If not mapping columns under 'Map Import Data' with columns under 'User Import Preview' then there should be error message.
    [Tags]  IMPRT_USR_004   SurePassID_M2   SurePassId_Web      Improt_User
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Click on Next button
    Verify Page should not navigate to import user's next step

Verify If there is not correct mapping columns under 'Map Import Data' with columns under 'User Import Preview' then there should be error message.
    [Tags]  IMPRT_USR_005       SurePassID_M2   SurePassId_Web      Improt_User
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl0"]   0
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl1"]   1
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl2"]   2
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl3"]   5
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl4"]   4
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl5"]   3
    Click on Next button
    Click on Import button
    Verify Import User added Warning Message receive or not     ${WarningMsg}

Verify If mapping columns with same data then should consider only one column,other column should be displayed with red color.
    [Tags]  IMPRT_USR_006       SurePassID_M2   SurePassId_Web      Improt_User
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select same data for coloumn 1 and 2
    Click on Next button
    Web.Page Should Contain Element     ${column2RedColor}       ${StandardTimeout}

Verify After selecting correct option for column should change it's color from 'Red' to 'Black'
    [Tags]  IMPRT_USR_007   SurePassID_M2   SurePassId_Web      Improt_User
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddl1"]   1
    Click on Next button
    Web.Page Should Not Contain Element     ${column2RedColor}       ${StandardTimeout}

Verify 'Merge existing users' option working properly or Not
    [Tags]  IMPRT_USR_008   SurePassID_M21   SurePassId_Web     Improt_User
    Delete User form the User List if existing     ${inputUserName}
    Delete Import Users if existing
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddlDevice_TypeData"]       -1
    Web.Wait Until Element Is Visible    ${MergeIfExitUsr}   ${StandardTimeout}
    Web.Click Element	  ${MergeIfExitUsr}
    Click on Import button
    Verify Import User added Success Message receive or not     ${ImportSuccessMsg}
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Web.Select From List by Value   xpath://*[@id="ctl00_ContentPlaceHolder1_ddlDevice_TypeData"]       -1
    Web.Wait Until Element Is Visible    ${MergeIfExitUsr}   ${StandardTimeout}
    Web.Click Element	  ${MergeIfExitUsr}
    Click on Import button
    Verify Import User added Success Message receive or not     ${ImportMergeSMsg}

Verify 'Import the good records even if some records have errors' option working properly or Not
    [Tags]  IMPRT_USR_009   SurePassID_M2   SurePassId_Web      Improt_User
    Navigate to Users Folder
    Select Import User
    Browse multiple import Users record File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Web.Wait Until Element Is Visible    ${ImportGoodRcrd}   ${StandardTimeout}
    Web.Click Element	  ${ImportGoodRcrd}
    Click on Import button
    Page Should Contain     1 of 3 user records were processed. There were some errors!

Verify User is able to receive mail with subject 'Important Information' and 'Requested Information' on given email address in user records
    [Tags]  IMPRT_USR_010   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Web.Wait Until Element Is Visible    ${SendNotiChkeckBox}   ${StandardTimeout}
    Web.Click Element	  ${SendNotiChkeckBox}
    Web.Wait Until Element Is Visible    ${SendUsrAccountInfo}   ${StandardTimeout}
    Web.Click Element	  ${SendUsrAccountInfo}
    Web.Wait Until Element Is Visible    ${SendDeviceActivationInfo}   ${StandardTimeout}
    Web.Click Element	  ${SendDeviceActivationInfo}
    Click on Import button
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}   timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    #Should Contain  ${HTML}     Your authentication device is ready
    Should Contain  ${HTML}     Your account is ready

Verify There should be validation/verification for Mobile Phone and Email Address
    [Tags]  IMPRT_USR_011   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse File which contain invalid mobile number
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Web.Wait Until Element Is Visible    ${SendNotiChkeckBox}   ${StandardTimeout}
    Web.Click Element	  ${SendNotiChkeckBox}
    Web.Wait Until Element Is Visible    ${SendUsrAccountInfo}   ${StandardTimeout}
    Web.Click Element	  ${SendUsrAccountInfo}
    Web.Wait Until Element Is Visible    ${SendDeviceActivationInfo}   ${StandardTimeout}
    Web.Click Element	  ${SendDeviceActivationInfo}
    Click on Import button
    ${invalidMobileMsg}   Web.Get Text     ${MobileNotification}
    Should Contain  ${invalidMobileMsg}     Invalid mobile number

Verify There should be a notification message if not valid format email address imported for user.
    [Tags]  IMPRT_USR_012   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse invalidEmailAddress File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Web.Wait Until Element Is Visible    ${SendNotiChkeckBox}   ${StandardTimeout}
    Web.Click Element	  ${SendNotiChkeckBox}
    Web.Wait Until Element Is Visible    ${SendUsrAccountInfo}   ${StandardTimeout}
    Web.Click Element	  ${SendUsrAccountInfo}
    Web.Wait Until Element Is Visible    ${SendDeviceActivationInfo}   ${StandardTimeout}
    Web.Click Element	  ${SendDeviceActivationInfo}
    Click on Import button
    Web.Page Should Contain     The email address provided is invalid. Field in error = parth.jani+6538volansyscom

Verify 'Merge existing users' option should be disabled, after changing the token type
    [Tags]  IMPRT_USR_013   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Web.Select From List by Value   ${selectTokenType}   1
    Sleep  5s
    Web.Page Should Contain Element     ${MergeIfExitUsrDisabled}

Verify 'Merge existing users' option not disabled, for 'None-just import the users for now' token type
    [Tags]  IMPRT_USR_014   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Select Token Type In Import User    ${NoneToenType}
    Web.Reload Page
    Web.Page Should Contain Element     ${MergeIfExitUsr}
    Web.Page Should Not Contain Element     ${MergeIfExitUsrDisabled}

Verify After selecting 'Ignore first record in the import file' option, user records from the .csv/.txt file should ignore the first record
    [Tags]  IMPRT_USR_015   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Click on Import button
    Verify Import User added Success Message receive or not     ${ImportSuccessMsg}
    Verify Import Summary and Import Logs visible or not

Verify If token type 'None-just Import the users for now' selected then 'User Group' and 'Create Group' only field enabled
    [Tags]  IMPRT_USR_016   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Select Token Type In Import User    ${NoneToenType}
    Web.Reload Page
    Web.Wait Until Element Is Visible    ${UserGroupEnable}   ${StandardTimeout}
    Web.Click Element	  ${UserGroupEnable}
    Web.Wait Until Element Is Visible    ${CreateGroupCB}   ${StandardTimeout}
    Web.Click Element	  ${CreateGroupCB}
    Web.Wait Until Element Is Enabled             ${GroupNameEnable}    ${StandardTimeout}
    Web.Input Text       ${GroupNameEnable}    ${GroupName}

Verify the user can be added to the already existing group during importing user
    [Tags]  IMPRT_USR_017   SurePassID_M2   SurePassId_Web      Improt_User
    Navigate to Users Folder
    Delete Group if existing
    Navigate to Users Folder
    Navigate to Users Group
    Click On New Link to create User Group
    Provide Required details to create new group
    Select multiple checkbox option to add users in group
    Click on Users group Add button
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Select From List By Label	${UserGroupDropDown}    TestGroup
    Click on Import button
    Verify Import User added Success Message receive or not     ${ImportSuccessMsg}

Verify the soft token created successfully for the user through import user.
    [Tags]  IMPRT_USR_018   SurePassID_M2   SurePassId_Web      Improt_User
    Delete User form the User List if existing     ${ImprtUserName}
    Navigate to Users Folder
    Select Import User
    Browse File
    Click on Next button
    Select Ignore first record in the import file
    Map Import Data
    Click on Next button
    Select Token Type In Import User   ${SurePassAuthToken}
    Click on Import button
    Verify Import User added Success Message receive or not     ${ImportSuccessMsg}
    Verify Import Summary and Import Logs visible or not
    Get Token Serial Number
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Web.Wait Until Element Is Enabled  ${UserNameTextFilter}  10s
    Wait Until Keyword Succeeds  5x  1s  Web.Input Text  ${UserNameTextFilter}  DemoUN
    Web.Wait Until Element Is Enabled  ${UserSearchBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Wait Until the Update Icon Disappear
    Click on Edit action to check serial number
    Verify Serial Token Number from imported user

Verify User is able to delete single users from the user's list.
    [Tags]  DELETE_USR_001      SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Verify User added Success Message receive or not
    Navigate to Users Folder
    Select Filter Users-No Portal access Role
    Wait Until the Update Icon Disappear
    Sleep   ${SleepDelay2s}
    Web.Page Should Contain Element     ${clickOndeleteAction}

Verify User is able to delete multiple users from the user's list.
    [Tags]  DELETE_USR_002      SurePassID_M2   SurePassId_Web
    Add three new Users
    Navigate to Users Folder
    Search User from the User list      ${UserNamePreFix}
    Select Mutli select Checkboxe option
    Select on delete button
    Verify Delete Success Message receive or not

Verify cancel option is working properly.
    [Tags]  DELETE_USR_003      SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Delete User form the User List if existing     ${inputUserName}
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Navigate to Users Folder
    Search User from the User list      ${inputUserName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    //*[text()= "${inputUserName}"]/parent::div//parent::div//*[input]   ${StandardTimeout}
    Web.Click Element    //*[text()= "${inputUserName}"]/parent::div//parent::div//*[input]
    Web.Wait Until Element Is Visible    ${deleteCheckedItems}   ${StandardTimeout}
    Web.Click Element    ${deleteCheckedItems}
    Web.Wait Until Element Is Visible    ${Cancel}   ${StandardTimeout}
    Web.Click Element    ${Cancel}

Verify User should not be abel to delete itself from user's list page.
    [Tags]  DELETE_USR_004      SurePassID_M2   SurePassId_Web      05
    Navigate to Users Folder
    Search User from the User list      ${UserName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    //*[text()= "${UserName}"]/parent::div//parent::div//*[input]   ${StandardTimeout}
    Web.Click Element    //*[text()= "${UserName}"]/parent::div//parent::div//*[input]
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${deleteCheckedItems}   ${StandardTimeout}
    Web.Click Element    ${deleteCheckedItems}
    Sleep  ${SleepDelay2s}
    Web.Element Text Should Be    ${successMsgGreenbar}        You are not permitted to delete yourself while you are logged on.

Verify Helpdesk User is only able to view Home and Users folder.
    [Tags]  HELPDESK_USR_001    SurePassID_M2   SurePassId_Web
     ${HelpdeskPw}  Add New Helpdesk User with SurePassId Authentication Token
     log to console       ${HelpdeskPw}
     Web.Click Element       ${LogOut}
     Open SurePass On Browser
     Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
     Select the Checkbox if Terms of Use Page is visible
     Verify Home Page

Verify Helpdesk user should be able to view all the users and other Helpdesk users
    [Tags]  HELPDESK_USR_002    SurePassID_M2   SurePassId_Web
     Navigate to Users Folder
     Verify Users Page

Verify Helpdesk User not able to Edit user,only have view option for users.
    [Tags]  HELPDESK_USR_003    SurePassID_M2   SurePassId_Web
     Search User from the User list      ${inputUserName2}
     Verify Edit action not available for helpdesk user
     Wait Until the Update Icon Disappear
     Click on View option

Verify Helpdesk should allow Users to update the Password
    [Tags]  HELPDESK_USR_004    SurePassID_M2   SurePassId_Web
    Navigate to Users Folder
    Select Filter for Helpdesk User Role
    Search User from the User list      ${inputUserName2}
    Wait Until the Update Icon Disappear
    Click on View option
    Click On PIN icon button
    Sleep    ${SleepDelay10s}       #Sleep required to display Message Popup
    Web.Element Should Be Visible      ${successMsgGreenbar}     ${StandardTimeout}
    Web.Element Text Should Be    ${successMsgGreenbar}         New password/PIN has been created. Update the account to save it.