*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../locators/UserStatisticsLocator.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/OpenSystemAlertResource.robot
Resource    ../resources/ManageDashboardResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify that Users section should appear on Dashboard with following details : "This Week" "Last Week" "This Month ","All Time".
    [Tags]    USR_Statistics_001        SurePassID_M2     SurePassId_Web
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Users}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Users}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Users}
    Web.Wait Until Element Is Visible    ${ClickOnUpdateOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnUpdateOption}
    #Web.Click Element    ${ClickOnUpdate}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate to Home Page
    Web.Element Should Be Visible       ${UserPanelThisWeek}
    Web.Element Should Be Visible       ${UserPanelLastWeek}
    Web.Element Should Be Visible       ${UserPanelThisMonth}
    Web.Element Should Be Visible       ${UserPanelTotalCount}

Verify that whenever Admin user add New User in the system then "This Week", "This Month", and "All Time" user statistics should be increment by one
    [Tags]  USR_Statistics_002      USR_Statistics_004      USR_Statistics_005        SurePassID_M2     SurePassId_Web
    Delete User form the User List if existing      ${inputUserName}
    Navigate To Home Page
    ${OldUsrCountThisWeek}    Web.Get Text 	 ${NewUserThisWeek}
    ${OldUsrCountThisWeek}    convert to integer     ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}    Web.Get Text 	 ${NewUserThisMonth}
    ${OldUsrCountThisMonth}   convert to integer      ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}   Web.Get Text 	 ${NewUserAlltime}
    ${OldUsrCountAllTime}    convert to integer     ${OldUsrCountAllTime}
    Add Administrator User
    Navigate To Home Page
    ${NewUsrCountThisWeek}     Web.Get Text 	 ${NewUserThisWeek}
    ${NewUsrCountThisWeek}    convert to integer      ${NewUsrCountThisWeek}
    Should be True    ${NewUsrCountThisWeek} > ${OldUsrCountThisWeek}
    ${NewUsrCountThisMonth}     Web.Get Text 	  ${NewUserThisMonth}
    ${NewUsrCountThisMonth}    convert to integer      ${NewUsrCountThisMonth}
    Should be True    ${NewUsrCountThisMonth} > ${OldUsrCountThisMonth}
    ${NewUsrCountThisMonth}      Web.Get Text 	  ${NewUserAlltime}
    ${NewUsrCountThisMonth}   convert to integer      ${NewUsrCountThisMonth}
    Should be True    ${NewUsrCountThisMonth} > ${OldUsrCountAllTime}
    [Teardown]      Run Keyword     Web.Close All Browsers

Verify that Helpdesk user should be visible increment counts for "This Week","This Month", and "All Time" for Enable section.
    [Tags]  USR_Statistics_022      USR_Statistics_024      USR_Statistics_025   SurePassID_M2   SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Delete User form the User List if existing      ${inputUserName}
    ${HelpdeskPw}  Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    Navigate To Home Page
    ${OldUsrCountThisWeek}    Web.Get Text 	 ${NewUserThisWeek}
    ${OldUsrCountThisWeek}    convert to integer     ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}    Web.Get Text 	 ${NewUserThisMonth}
    ${OldUsrCountThisMonth}   convert to integer      ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}   Web.Get Text 	 ${NewUserAlltime}
    ${OldUsrCountAllTime}    convert to integer     ${OldUsrCountAllTime}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Add Administrator User
    Navigate To Home Page
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User       ${inputUserName2}       ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    ${NewUsrCountThisWeek}     Web.Get Text 	 ${NewUserThisWeek}
    ${NewUsrCountThisWeek}    convert to integer      ${NewUsrCountThisWeek}
    Should be True    ${NewUsrCountThisWeek} > ${OldUsrCountThisWeek}
    ${NewUsrCountThisMonth}     Web.Get Text 	  ${NewUserThisMonth}
    ${NewUsrCountThisMonth}    convert to integer      ${NewUsrCountThisMonth}
    Should be True    ${NewUsrCountThisMonth} > ${OldUsrCountThisMonth}
    ${NewUsrCountThisMonth}      Web.Get Text 	  ${NewUserAlltime}
    ${NewUsrCountThisMonth}   convert to integer      ${NewUsrCountThisMonth}
    Should be True    ${NewUsrCountThisMonth} > ${OldUsrCountAllTime}
    [Teardown]      Run Keyword     Web.Close All Browsers

Verify that when Admin user add New User in the system with Disabled status then "This Week", "This Month", and "All Time" user statistics should be incremental by one in Disabled user.
    [Tags]  USR_Statistics_006      USR_Statistics_008      USR_Statistics_009        SurePassID_M2     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Delete User form the User List if existing  ${inputUserName}
    Navigate To Home Page
    ${OldUsrCountThisWeek}    Web.Get Text    ${DisableThisWeek}
    ${OldUsrCountThisWeek}   convert to integer  ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}    Web.Get Text    ${DisableThismonth}
    ${OldUsrCountThisMonth}   convert to integer  ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}    Web.Get text    ${DisableAllTime}
    ${OldUsrCountAllTime}   convert to integer  ${OldUsrCountAllTime}
    Add Administrator user with Disable Status
    Navigate To Home Page
    ${NewUsrCountThisWeek}     Web.Get Text 	  ${DisableThisWeek}
    ${NewUsrCountThisWeek}    convert to integer     ${NewUsrCountThisWeek}
    Should be True    ${NewUsrCountThisWeek} > ${OldUsrCountThisWeek}
    ${NewUsrCountThisMonth}     Web.Get Text 	  ${DisableThismonth}
    ${NewUsrCountThisMonth}    convert to integer      ${NewUsrCountThisMonth}
    Should be True    ${NewUsrCountThisMonth} > ${OldUsrCountThisMonth}
    ${NewUsrCountAllTime}     Web.Get Text 	  ${DisableAllTime}
    ${NewUsrCountAllTime1}    convert to integer      ${NewUsrCountAllTime}
    Should be True    ${NewUsrCountAllTime} > ${OldUsrCountAllTime}

Verify that Helpdesk user should be visible increment result of "This Week", "This Month", and "All Time" for Disabled section.
    [Tags]  USR_Statistics_030      USR_Statistics_032      USR_Statistics_033        SurePassID_M2     SurePassId_Web
    ${HelpdeskPw}  Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    ${OldUsrCountThisWeek}    Web.Get Text    ${DisableThisWeek}
    ${OldUsrCountThisWeek}   convert to integer  ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}    Web.Get Text    ${DisableThismonth}
    ${OldUsrCountThisMonth}   convert to integer  ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}    Web.Get text    ${DisableAllTime}
    ${OldUsrCountAllTime}   convert to integer  ${OldUsrCountAllTime}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Add Administrator user with Disable Status
    Navigate To Home Page
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Navigate To Home Page
    ${NewUsrCountThisWeek}     Web.Get Text 	  ${DisableThisWeek}
    ${NewUsrCountThisWeek}    convert to integer     ${NewUsrCountThisWeek}
    Should be True    ${NewUsrCountThisWeek} > ${OldUsrCountThisWeek}
    ${NewUsrCountThisMonth}     Web.Get Text 	  ${DisableThismonth}
    ${NewUsrCountThisMonth}    convert to integer      ${NewUsrCountThisMonth}
    Should be True    ${NewUsrCountThisMonth} > ${OldUsrCountThisMonth}
    ${NewUsrCountAllTime}     Web.Get Text 	  ${DisableAllTime}
    ${NewUsrCountAllTime1}    convert to integer      ${NewUsrCountAllTime}
    Should be True    ${NewUsrCountAllTime} > ${OldUsrCountAllTime}
    [Teardown]      Run Keyword     Web.Close All Browsers

Verify that when Admin user delete user from the available user list then user statistics should be decremented by one for "This Week","This Month", and "All Time" from Enable Section .
    [Tags]  USR_Statistics_010      USR_Statistics_012      USR_Statistics_013          SurePassID_M2     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Delete User form the User List if existing  ${inputUserName}
    Add Administrator User
    Navigate To Home Page
    ${OldUsrCountThisWeek}    Web.Get Text 	 ${NewUserThisWeek}
    ${OldUsrCountThisWeek}    convert to integer     ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}  Web.Get Text 	 ${NewUserThisMonth}
    ${OldUsrCountThisMonth}    convert to integer     ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}    Web.Get Text 	 ${NewUserAlltime}
    ${OldUsrCountAllTime}    convert to integer     ${OldUsrCountAllTime}
    Delete User form the User List if existing  ${inputUserName}
    Navigate To Home Page
    ${NewUsrCountStrThisWeek}     Web.Get Text 	 ${NewUserThisWeek}
    ${NewUsrCountStrThisWeek}    convert to integer      ${NewUsrCountStrThisWeek}
    Should be True    ${NewUsrCountStrThisWeek} < ${OldUsrCountThisWeek}
    ${NewUsrCountStrThisMonth}     Web.Get Text 	 ${NewUserThisMonth}
    ${NewUsrCountStrThisMonth}    convert to integer      ${NewUsrCountStrThisMonth}
    Should be True  ${NewUsrCountStrThisMonth} < ${OldUsrCountThisMonth}
    ${NewUsrCountStrAllTime}     Web.Get Text 	 ${NewUserAlltime}
    ${NewUsrCountStrAllTime}    convert to integer      ${NewUsrCountStrAllTime}
    Should be True  ${NewUsrCountStrAllTime} < ${OldUsrCountAllTime}

Verify that Helpdesk user should be visible decremented result for "This Week", "This Month", and "All Time" for Enable section.
    [Tags]  USR_Statistics_026      USR_Statistics_028      USR_Statistics_029         SurePassID_M2     SurePassId_Web
    ${HelpdeskPw}  Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Add Administrator User
    Navigate To Home Page
    ${OldUsrCountThisWeek}    Web.Get Text 	 ${NewUserThisWeek}
    ${OldUsrCountThisWeek}    convert to integer     ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}  Web.Get Text 	 ${NewUserThisMonth}
    ${OldUsrCountThisMonth}    convert to integer     ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}    Web.Get Text 	 ${NewUserAlltime}
    ${OldUsrCountAllTime}    convert to integer     ${OldUsrCountAllTime}
    Delete User form the User List if existing  ${inputUserName}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Navigate To Home Page
    ${NewUsrCountStrThisWeek}     Web.Get Text 	 ${NewUserThisWeek}
    ${NewUsrCountStrThisWeek}    convert to integer      ${NewUsrCountStrThisWeek}
    Should be True    ${NewUsrCountStrThisWeek} < ${OldUsrCountThisWeek}
    ${NewUsrCountStrThisMonth}     Web.Get Text 	 ${NewUserThisMonth}
    ${NewUsrCountStrThisMonth}    convert to integer      ${NewUsrCountStrThisMonth}
    Should be True  ${NewUsrCountStrThisMonth} < ${OldUsrCountThisMonth}
    ${NewUsrCountStrAllTime}     Web.Get Text 	 ${NewUserAlltime}
    ${NewUsrCountStrAllTime}    convert to integer      ${NewUsrCountStrAllTime}
    Should be True  ${NewUsrCountStrAllTime} < ${OldUsrCountAllTime}
    [Teardown]      Run Keyword     Web.Close All Browsers

Verify that when Admin user delete user from the available user list with disabled Status then user statistics should be decremented by one for "This Week", "This Month", and "All Time" from Disable Section
    [Tags]  USR_Statistics_014     USR_Statistics_016      USR_Statistics_017              SurePassID_M2     SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Delete User form the User List if existing  ${inputUserName}
    Add Administrator user with Disable Status
    Navigate To Home Page
    Reload Page
    ${OldUsrCountThisWeek}    Web.Get Text 	 ${DisableThisWeek}
    ${OldUsrCountThisWeek}    convert to integer     ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}  Web.Get Text 	 ${DisableThismonth}
    ${OldUsrCountThisMonth}    convert to integer     ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}    Web.Get Text 	 ${DisableAllTime}
    ${OldUsrCountAllTime}    convert to integer     ${OldUsrCountAllTime}
    Delete User form the User List if existing  ${inputUserName}
    Navigate To Home Page
    Reload Page
    ${NewUsrCountStrThisWeek}     Web.Get Text 	 ${DisableThisWeek}
    ${NewUsrCountStrThisWeek}    convert to integer      ${NewUsrCountStrThisWeek}
    Should be True    ${NewUsrCountStrThisWeek} < ${OldUsrCountThisWeek}
    ${NewUsrCountStrThisMonth}     Web.Get Text 	 ${DisableThismonth}
    ${NewUsrCountStrThisMonth}    convert to integer      ${NewUsrCountStrThisMonth}
    Should be True  ${NewUsrCountStrThisMonth} < ${OldUsrCountThisMonth}
    ${NewUsrCountStrAllTime}     Web.Get Text 	 ${DisableAllTime}
    ${NewUsrCountStrAllTime}    convert to integer      ${NewUsrCountStrAllTime}
    Should be True  ${NewUsrCountStrAllTime} < ${OldUsrCountAllTime}

Verify that Helpdesk user should be visible decremented count for "This Week", "This Month", and "All Time" for Disabled section.
    [Tags]  USR_Statistics_034     USR_Statistics_036      USR_Statistics_037   SurePassID_M2     SurePassId_Web    001
    ${HelpdeskPw}  Add New Helpdesk User with SurePassId Authentication Token
    log to console       ${HelpdeskPw}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Add Administrator user with Disable Status
    Navigate To Home Page
    ${OldUsrCountThisWeek}    Web.Get Text 	 ${DisableThisWeek}
    ${OldUsrCountThisWeek}    convert to integer     ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}  Web.Get Text 	 ${DisableThismonth}
    ${OldUsrCountThisMonth}    convert to integer     ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}    Web.Get Text 	 ${DisableAllTime}
    ${OldUsrCountAllTime}    convert to integer     ${OldUsrCountAllTime}
    Delete User form the User List if existing  ${inputUserName}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User   ${inputUserName2}   ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Navigate To Home Page
    ${NewUsrCountStrThisWeek}     Web.Get Text 	 ${DisableThisWeek}
    ${NewUsrCountStrThisWeek}    convert to integer      ${NewUsrCountStrThisWeek}
    Should be True    ${NewUsrCountStrThisWeek} < ${OldUsrCountThisWeek}
    ${NewUsrCountStrThisMonth}     Web.Get Text 	 ${DisableThismonth}
    ${NewUsrCountStrThisMonth}    convert to integer      ${NewUsrCountStrThisMonth}
    Should be True  ${NewUsrCountStrThisMonth} < ${OldUsrCountThisMonth}
    ${NewUsrCountStrAllTime}     Web.Get Text 	 ${DisableAllTime}
    ${NewUsrCountStrAllTime}    convert to integer      ${NewUsrCountStrAllTime}
    Should be True  ${NewUsrCountStrAllTime} < ${OldUsrCountAllTime}
    [Teardown]      Run Keyword     Web.Close All Browsers

Verify that if Admin User adding new user by using the Import user option then statistics under the User section should be increase for the 'This Week' 'This Month' and 'All Time'.
    [Tags]  USR_Statistics_038      USR_Statistics_040      USR_Statistics_041    SurePassID_M2   SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Delete User form the User List if existing     ${inputUserName}
    Delete Import Users if existing
    Navigate To Home Page
    ${OldUsrCountThisWeek}    Web.Get Text 	 ${NewUserThisWeek}
    ${OldUsrCountThisWeek}    convert to integer     ${OldUsrCountThisWeek}
    ${OldUsrCountThisMonth}    Web.Get Text 	 ${NewUserThisMonth}
    ${OldUsrCountThisMonth}   convert to integer      ${OldUsrCountThisMonth}
    ${OldUsrCountAllTime}   Web.Get Text 	 ${NewUserAlltime}
    ${OldUsrCountAllTime}    convert to integer     ${OldUsrCountAllTime}
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
    Navigate To Home Page
    ${NewUsrCountThisWeek}     Web.Get Text 	  ${NewUserThisWeek}
    ${NewUsrCountThisWeek}    convert to integer     ${NewUsrCountThisWeek}
    Should be True    ${NewUsrCountThisWeek} > ${OldUsrCountThisWeek}
    ${NewUsrCountThisMonth}     Web.Get Text 	  ${NewUserThisMonth}
    ${NewUsrCountThisMonth}    convert to integer      ${NewUsrCountThisMonth}
    Should be True    ${NewUsrCountThisMonth} > ${OldUsrCountThisMonth}
    ${NewUsrCountAllTime}     Web.Get Text 	  ${NewUserAlltime}
    ${NewUsrCountAllTime1}    convert to integer      ${NewUsrCountAllTime}
    Should be True    ${NewUsrCountAllTime} > ${OldUsrCountAllTime}

Verify that Admin User should visible User statistics in Grid Format.
    [Tags]  USR_Statistics_018  SurePassID_M2   SurePassId_Web
    #Open SurePass On Browser
    #Submit 2FA Page Using Email OTP    6
    Navigate To Home Page
    Select Grid Format For Data Statistics
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible       ${UserPanelGridFormat}      ${StandardTimeout}

Verify that Admin User should visible User statistics in Bar Format.
     [Tags]  USR_Statistics_019  SurePassID_M2   SurePassId_Web
     Select Bar format for data statistics
     Wait Until the Update Icon Disappear
     Web.Element Should Be Visible       ${UserPanelBarFormat}      ${StandardTimeout}
     Select From List By Label       ${UsrPanelBar}   Grid

Verify that the tooltip should be correctly appear for Enable users.
     [Tags]  USR_Statistics_042  SurePassID_M2   SurePassId_Web
     Navigate To Home Page
     Select Grid Format For Data Statistics
     Wait Until the Update Icon Disappear
     Web.Mouse Over  ${NewUserThisWeek}
     Web.Wait Until Element Is Visible      ${NewUserThisWeek}      ${StandardTimeout}

Verify that the tooltip should be correctly appear for Disable users.
     [Tags]  USR_Statistics_043  SurePassID_M2   SurePassId_Web
     Web.Mouse Over  ${DisableThisWeek}
     Web.Wait Until Element Is Visible      ${DisableThisWeek}      ${StandardTimeout}

Verify that HelpDesk User should visible User statistics in Grid Format .
    [Tags]  USR_Statistics_020  SurePassID_M2   SurePassId_Web      Helpdesk
    ${HelpdeskPw}  Add New Helpdesk User with SurePassId Authentication Token
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit First Login Page for Helpdesk User      ${inputUserName2}       ${HelpdeskPw}
    Select the Checkbox if Terms of Use Page is visible
    Select Grid Format For Data Statistics
    Wait Until the Update Icon Disappear
    Web.Element Should Be Visible       ${UserPanelGridFormat}      ${StandardTimeout}

Verify that HelpDesk User should visible User statistics in Bar Format.
     [Tags]  USR_Statistics_021  SurePassID_M2   SurePassId_Web      HelpDesk
     Select Bar format for data statistics
     Wait Until the Update Icon Disappear
     Web.Element Should Be Visible       ${UserPanelBarFormat}      ${StandardTimeout}
     #Select From List By Label       ${UsrPanelBar}   Grid
