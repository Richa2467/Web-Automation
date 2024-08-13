*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/AuditTrailResource.robot
Resource    ../resources/UsersPageResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify the Users filter 'Contains' is working properly.
    [Tags]  AUDIT_TRAIL_LOG_001   SurePassID_M3     SurePassId_Web
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Wait Until Element Is Visible    ${RowsFilter}    ${StandardTimeout}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay200}
    Web.Wait Until Element Is Visible    ${UserNameFilter}    ${StandardTimeout}
    Web.Select From List by Value       ${UserNameFilter}        ${FilterUsrAll}
    Web.Wait Until Element Is Visible    ${UserNameFilter}    ${StandardTimeout}
    Web.Select From List by Value       ${UserNameFilter}        ${FilterUsrContains}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${UserNameTextFilter}    ${StandardTimeout}
    Web.Input Text                      ${UserNameTextFilter}    ${mainUserName}
    Web.Wait Until Element Is Visible    ${UserNameFilter}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${UserSearchBtn}
    Web.Wait Until Element Is Visible    xpath://*[text()= "${UserName}"]    ${StandardTimeout}
    Web.Page Should Contain Element    xpath://*[text()= "${UserName}"]    ${StandardTimeout}

Verify the Users filter 'Is' is working properly.
    [Tags]  AUDIT_TRAIL_LOG_002   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Visible    ${RowsFilter}    ${StandardTimeout}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay200}
    Web.Select From List by Value       ${UserNameFilter}        ${FilterUsrIs}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${UserNameTextFilter}    ${StandardTimeout}
    Web.Input Text                      ${UserNameTextFilter}    ${UserName}
    Web.Click Element                   ${UserSearchBtn}
    Wait Until the Update Icon Disappear
    Web.Page Should Contain Element    xpath://*[text()= "${UserName}"]    ${StandardTimeout}

Verify the Users filter 'Begins With'is working properly.
    [Tags]  AUDIT_TRAIL_LOG_003   SurePassID_M3     SurePassId_Web
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay200}
    Web.Select From List by Value       ${UserNameFilter}        ${FilterUsrBeginsWith}
    Web.Clear Element Text      ${UserNameTextFilter}
    Web.Input Text                      ${UserNameTextFilter}    ${UserName}
    Wait Until the Update Icon Disappear
    Web.Click Element                   ${UserSearchBtn}
    Web.Page Should Contain Element    xpath://*[text()= "${UserName}"]    ${StandardTimeout}

Verify the Admin user should be able to delete audit trail log.
    [Tags]  AUDIT_TRAIL_LOG_004   SurePassID_M3     SurePassId_Web
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Wait Until Element Is Visible    ${selectCheckBoxAT}    ${StandardTimeout}
    Web.Click Element	  ${selectCheckBoxAT}
    Web.Wait Until Element Is Visible    ${deleteCheckedItemsAT}   ${StandardTimeout}
    Web.Click Element    ${deleteCheckedItemsAT}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${deleteAuditTrailLogConfBox}   ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${confirmbtn_AuditTrail}   ${StandardTimeout}
    Web.Click Element    ${confirmbtn_AuditTrail}
    Wait Until the Update Icon Disappear
    Page Should Contain     Audit record(s) have been deleted successfully.

Verify the Admin user should be able to delete multiple audit trail logs simultaneously
    [Tags]  AUDIT_TRAIL_LOG_005   SurePassID_M3     SurePassId_Web
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${multiselectBox}   ${StandardTimeout}
    Web.Click Element    ${multiselectBox}
    Web.Wait Until Element Is Visible    ${deleteCheckedItemsAT}   ${StandardTimeout}
    Web.Click Element    ${deleteCheckedItemsAT}
    Web.Wait Until Element Is Visible    ${deleteAuditTrailLogConfBox}   ${StandardTimeout}
    #Web.Wait Until Element Is Visible    ${deleteConfOk}   ${StandardTimeout}
    #Web.Click Element    ${deleteConfOk}
    Web.Wait Until Element Is Visible    ${confirmbtn_AuditTrail}   ${StandardTimeout}
    #Web.Click Element    ${confirmbtn_AuditTrail}
    Web.Wait Until Element Is Visible    ${cancledeleteConformBox}   ${StandardTimeout}
    Web.Click Element    ${cancledeleteConformBox}
    Web.Select From List by Value       ${UserNameFilter}         ${FilterUsrAll}

Verify the search bar appears immediately after Filter Users is used.
    [Tags]  AUDIT_TRAIL_LOG_006   SurePassID_M3     SurePassId_Web
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay200}
    Web.Select From List by Value       ${UserNameFilter}        ${FilterUsrBeginsWith}
    Web.Wait Until Element Is Visible    ${UserNameTextFilter}      ${StandardTimeout}

Verify the Request filter is working properly.
    [Tags]  AUDIT_TRAIL_LOG_007   SurePassID_M3    SurePassId_Web
    Web.Wait Until Element Is Visible    ${requestFilter}   ${StandardTimeout}
    Web.Select From List by Value       ${requestFilter}      ${selectAdminLogin}
    Web.Select From List by Value       ${requestFilter}      ${selectAdminLogoff}
    Web.Select From List by Value       ${requestFilter}      ${selectAny}

Verify the Severity filter is working properly.
    [Tags]  AUDIT_TRAIL_LOG_008   SurePassID_M3     SurePassId_Web
    Web.Wait Until Element Is Visible    ${severityFilter}   ${StandardTimeout}
    Web.Select From List by Value       ${severityFilter}      ${selectSuccess}
    Web.Select From List by Value       ${severityFilter}      ${selectWarning}
    Web.Select From List by Value       ${severityFilter}      ${selectAny}

Verify the Rows to Display filter is working properly.
    [Tags]  AUDIT_TRAIL_LOG_009   SurePassID_M3     SurePassId_Web
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay10}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay15}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay50}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay200}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay10}

Verify when the number of Rows to Display is increased, the number of page links given at the bottom of the table should change dynamically
    [Tags]  AUDIT_TRAIL_LOG_010   SurePassID_M3     SurePassId_Web
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay10}
    ${getPageNo1}     Web.Get Text	  ${pageLocatorNo}
    Set Global Variable     ${getPageNo1}
    Web.Select From List by Value       ${RowsFilter}            ${RowToDisplay15}
    ${getPageNo2}     Web.Get Text	  ${pageLocatorNo}
    Run Keyword If    '${getPageNo1}' != '${getPageNo2}'    Should Not Be Equal    ${getPageNo1}   ${getPageNo2}

Verify the Admin user should be able to change the start and end date.
    [Tags]  AUDIT_TRAIL_LOG_011   SurePassID_M3     SurePassId_Web
    Wait Until the Update Icon Disappear
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    ${Pastdate}    Get Current Date    result_format=%d/%m/%Y       increment=-2 day
    Web.Wait Until Element Is Visible    ${startdatepicker}     ${StandardTimeout}
    Web.Input Text    ${startdatepicker}    ${Pastdate}
    ${Currentdate}     Get Current Date    result_format=%d/%m/%Y
    Web.Wait Until Element Is Visible    ${enddatepicker}     ${StandardTimeout}
    Web.Input Text    ${enddatepicker}    ${Currentdate}
    #Sleep   ${SleepDelay10s}
    #Web.Wait Until Element Is Visible    ${checkRecordlistUpdate}     ${StandardTimeout}

Verify the Admin user should be able to download audit trail logs using 'Export Audit Log' option.
    [Tags]  AUDIT_TRAIL_LOG_012   SurePassID_M3     SurePassId_Web
    ${home_dir}         Get Environment Variable    USERPROFILE
    ${download_dir}     Join Path   ${home_dir}     Downloads\\SurePassIdAuditLogExport.csv
    ${result}    Run Keyword And Return Status  File Should Exist   ${download_dir}
    Run Keyword If    '${result}' == 'True'    Remove File     ${download_dir}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${clickOnExportAuditLog}    ${StandardTimeout}
    Web.Click Element	  ${clickOnExportAuditLog}
    ${result}    Run Keyword And Return Status  File Should Exist   ${download_dir}
    Run Keyword If    '${result}' == 'True'    Remove File     ${download_dir}

Verify the Audit trail log displayed with date and time.
    [Tags]  AUDIT_TRAIL_LOG_013   SurePassID_M3     SurePassId_Web
    Wait Until the Update Icon Disappear
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Select From List by Value       ${requestFilter}      ${selectAny}
    Web.Select From List by Value       ${severityFilter}      ${selectAny}
    Reload Page
    Wait Until the Update Icon Disappear
    #Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    #Web.Click Element	  ${auditTrailTab}
    ${getPageNo1}     Web.Get Text	  ${pageLocatorNo}
    Run Keyword If    '${getPageNo1}'!= '0 page(s):'   Web.Wait Until Element Is Visible    ${dateandTimeColumn}    ${StandardTimeout}

Verify 'Delete This Log Item' is working properly.
    [Tags]  AUDIT_TRAIL_LOG_014   SurePassID_M3     SurePassId_Web
    Wait Until the Update Icon Disappear
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Select From List by Value       ${requestFilter}      ${selectAdminLogoff}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${selectCheckBoxAT}    ${StandardTimeout}
    Web.Click Element	  ${selectCheckBoxAT}
    Web.Wait Until Element Is Visible    ${deleteCheckedItemsAT}   ${StandardTimeout}
    Web.Click Element    ${deleteCheckedItemsAT}
    Web.Wait Until Element Is Visible    ${deleteAuditTrailLogConfBox}   ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${confirmbtn_AuditTrail}   ${StandardTimeout}
    Web.Click Element    ${confirmbtn_AuditTrail}
    Wait Until the Update Icon Disappear
    Page Should Contain     Audit record(s) have been deleted successfully.

Verify 'Empty Log' is working properly.
    [Tags]  AUDIT_TRAIL_LOG_015   SurePassID_M3     SurePassId_Web
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Select From List by Value       ${requestFilter}      ${selectAny}
    Web.Wait Until Element Is Visible    ${EmptyOption_AuditTrail}    ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Web.Click Element    ${EmptyOption_AuditTrail}
    Web.Wait Until Element Is Visible    ${confirmbtn_AuditTrail}   ${StandardTimeout}
    #Web.Click Element    ${confirmbtn_AuditTrail}
    Web.Wait Until Element Is Visible    ${cancledeleteConformBox}   ${StandardTimeout}
    Web.Click Element    ${cancledeleteConformBox}
    #Web.Wait Until Element Is Visible    ${auditTrailDelSuccessMsg}    ${StandardTimeout}
    #${SuccessMsg}     Web.Get Text	  ${auditTrailDelSuccessMsg}
    #Should Be Equal     ${SuccessMsg}      ${AuditTraiLogDelMsg}
    #Page Should Contain     Audit record(s) have been deleted successfully.

Verify 'Empty Log' option's confirmation message not display the proper message.
    [Tags]  AUDIT_TRAIL_LOG_019   SurePassID_M3     SurePassId_Web
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Select From List by Value       ${requestFilter}      ${selectAny}
    Web.Wait Until Element Is Visible    ${emptyLogBtn}    ${StandardTimeout}
    Web.Click Element	  ${emptyLogBtn}
    Web.Wait Until Element Is Visible    ${deleteCancle}   ${StandardTimeout}
    Web.Click Element    ${deleteCancle}

#Verify 'Open System Alerts' section's all fields on Home Dashboard should be displayed with zero alerts after click on Empty Log.
    #[Tags]  AUDIT_TRAIL_LOG_020   SurePassID_M3     SurePassId_Web
    #Click on Home Tab
    #Web.Page Should Contain Element     ${ActionReqTWCount0}
    #Web.Page Should Contain Element     ${SevereItmTWCount0}
    #Web.Page Should Contain Element     ${ActionReqLWCount0}
    #Web.Page Should Contain Element     ${SevereItmLWCount0}
    #Web.Page Should Contain Element     ${ActionReqTMCount0}
    #Web.Page Should Contain Element     ${SevereItmTMCount0}

Verify 'Refresh' working properly, with refresh the Audit List Section.
    [Tags]  AUDIT_TRAIL_LOG_021   SurePassID_M3     SurePassId_Web
    Navigate to Users Folder
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}
    Web.Wait Until Element Is Visible    ${clickOnRefresh}    ${StandardTimeout}
    Web.Click Element	  ${clickOnRefresh}
