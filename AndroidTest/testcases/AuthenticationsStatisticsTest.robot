*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../resources/CustomizeEmailMsgResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/CustomizeMobileMSGResource.robot
Resource    ../resources/SystemAlertsResource.robot
Resource    ../resources/OpenSystemAlertResource.robot
Resource    ../locators/AuthenticationsStatisticsLocator.robot
Resource    ../resources/ManageDashboardResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify that Admin user should be able to visible Authentication title on the Home Dashboard.
    [Tags]  Auth_Statistics_001      SurePassID_M2      SurePassId_Web
    Navigate To Home Page
    Navigate to Manage Dashboard Page
    Uncheck All the Manage Dashboard Items
    Web.Wait Until Element Is Enabled    ${MD_Authentications}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Authentications}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Authentications}
    Scroll Page To Location     0       2000
    Web.Wait Until Element Is Visible    ${ClickOnUpdateOption}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ClickOnUpdateOption}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     ${MD_SuccessUpdateMSG}
    Navigate To Home Page
    Web.Wait Until Element Is Visible    ${AuthenticationsTitle}    ${StandardTimeout}
    Web.Element Should be visible       ${AuthTitle}    ${StandardTimeout}

Verify that Admin user should be able to visible the This Week,This Month and Last Week sections under the Authentications section.
    [Tags]  Auth_Statistics_002      SurePassID_M2      SurePassId_Web                             
    Web.Element Should be visible       ${AuthPanelThisWeek}
    Web.Element Should be visible       ${AuthPanelLastWeek}
    Web.Element Should be visible       ${AuthPanelThisMonth}

Verify that the user should be able to visible the incremented count under the "This Week" and "This Month" section for the successful option(symbol).
    [Tags]  Auth_Statistics_003     Auth_Statistics_007      SurePassID_M2      SurePassId_Web                                   
    ${OldAuthCountThisWeek}    Web.Get Text    ${AuthPassValueThisWeek}  
    ${OldAuthCountThisWeek}   convert to integer  ${OldAuthCountThisWeek}
    Log to console      ${OldAuthCountThisWeek}
    ${OldAuthCountThisMonth}    Web.Get Text    ${AuthPassValueThisMonth} 
    ${OldAuthCountThisMonth}   convert to integer  ${OldAuthCountThisMonth}
    Log to console      ${OldAuthCountThisMonth}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    ${NewAuthCountThisWeek}     Web.Get Text 	  ${AuthPassValueThisWeek} 
    ${NewAuthCountThisWeek}    convert to integer      ${NewAuthCountThisWeek} 
    Should be True    ${NewAuthCountThisWeek} > ${OldAuthCountThisWeek}
    ${NewAuthCountThisMonth}     Web.Get Text 	  ${AuthPassValueThisMonth} 
    ${NewAuthCountThisMonth}    convert to integer      ${NewAuthCountThisMonth} 
    Should be True    ${NewAuthCountThisMonth} > ${OldAuthCountThisMonth}

Verify that the user should be able to visible the incremented count under the "This Week" and "This Month" section for the Failed option(symbol).
    [Tags]  Auth_Statistics_004     Auth_Statistics_008      SurePassID_M2      SurePassId_Web      666                             
    ${OldAuthCountThisWeek}    Web.Get Text    ${AuthFailValueThisWeek} 
    ${OldAuthCountThisWeek}   convert to integer  ${OldAuthCountThisWeek}
    ${OldAuthCountThisMonth}    Web.Get Text    ${AuthFailValueThisMonth} 
    ${OldAuthCountThisMonth}   convert to integer  ${OldAuthCountThisMonth}
    Web.Click Element       ${LogOut}
    Open SurePass On Browser
    Submit 2FA For Invalid OTP    4
    Web.Close All Browsers
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    ${NewAuthCountThisWeek}     Web.Get Text 	  ${AuthFailValueThisMonth} 
    ${NewAuthCountThisWeek}    convert to integer      ${NewAuthCountThisWeek} 
    Should be True    ${NewAuthCountThisWeek}  > ${OldAuthCountThisWeek}
    ${NewAuthCountThisMonth}     Web.Get Text 	  ${AuthFailValueThisMonth} 
    ${NewAuthCountThisMonth}    convert to integer      ${NewAuthCountThisMonth} 
    Should be True    ${NewAuthCountThisMonth}  > ${OldAuthCountThisMonth}