*** Settings ***
Library      OperatingSystem
Resource    ../resources/LoginPageResource.robot
Resource    ../labels/UsersPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/SuperAdminResource.robot
Resource    ../locators/SuperAdminLocators.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../locators/ManageDashboardLocator.robot
Resource    ../labels/SuperAdminLabels.robot

*** Keywords ***
Search Company
    [Arguments]       ${CompanyName}
    #Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled        ${SuperAccountLnk}     ${StandardTimeout}
    Web.Click Element                        ${SuperAccountLnk}
    Web.Wait Until Element Is Enabled        ${SearchCmpnyTxtField}    ${StandardTimeout}
    Web.Input Text                           ${SearchCmpnyTxtField}     ${CompanyName}
    Web.Click Element                        ${MagnifyIcon}
    Wait Until the Update Icon Disappear

Edit Company
    [Arguments]      ${CompanyName}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Enabled        ${EditCmpnyBtn}      ${StandardTimeout}
    Web.Click Element                        ${EditCmpnyBtn}
    Web.Wait Until Element Is Enabled        ${UpdateCmpnyBtn}    ${StandardTimeout}
    Web.Click Element                        ${UpdateCmpnyBtn}

Verify Account updated Success Message receive or not
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Account has been updated successfully

Create new account
    [Arguments]       ${NewCompanyName}        ${ValidEmailAccount}        ${CredentialType}=None
    #Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled        ${SuperAccountLnk}     ${StandardTimeout}
    Web.Click Element                        ${SuperAccountLnk}
    Web.Wait Until Element Is Enabled            ${NewAccBtn}               ${StandardTimeout}
    Web.Click Element                        ${NewAccBtn}
    Web.Wait Until Element Is Enabled            ${AccNameTxtField}             ${StandardTimeout}
    Web.Input Text                           ${AccNameTxtField}             ${NewCompanyName}
    Web.Wait Until Element Is Enabled            ${CmpnyNameTxtField}           ${StandardTimeout}
    Web.Input Text                           ${CmpnyNameTxtField}           ${NewCompanyName}
    Web.Wait Until Element Is Enabled            ${AccLoginTxtField}               ${StandardTimeout}
    Web.Input Text                           ${AccLoginTxtField}            ${NewCompanyName}
    Web.Input Text                           ${FNNewAccAdminTxtField}            ${NewCompanyName}
    Web.Input Text                           ${LNNewAccAdminTxtField}            ${NewCompanyName}
    Web.Wait Until Element Is Enabled            ${EmailLoginTxtField}         ${StandardTimeout}
    Web.Input Text                           ${EmailLoginTxtField}          ${ValidEmailAccount}
    Web.Wait Until Element Is Enabled            ${KeyNameTxtField}             ${StandardTimeout}
    Web.Input Text                           ${KeyNameTxtField}             Test_Account@test
    Run Keyword If     '${CredentialType}' != 'None'    Run Keyword     Web.Select From List by Value       ${CredTypeDrpdwn}      ${CredentialType}
    Web.Click Element                        ${AddAccBtn}
    #Verify Account added Success Message receive or not

Create New Account from Edit Pate
    [Arguments]       ${NewCompanyName}        ${ValidEmailAccount}        ${CredentialType}=None
    Web.Wait Until Element Is Enabled            ${AccNameTxtField}             ${StandardTimeout}
    Web.Input Text                           ${AccNameTxtField}             ${NewCompanyName}
    Web.Wait Until Element Is Enabled            ${CmpnyNameTxtField}           ${StandardTimeout}
    Web.Input Text                           ${CmpnyNameTxtField}           ${NewCompanyName}
    Run Keyword If     '${CredentialType}' != 'None'    Run Keyword     Web.Select From List by Value       ${CredTypeDrpdwn}      ${CredentialType}
    Web.Click Element                        ${AddAccBtn}
    #Verify Account added Success Message receive or not

Verify Account added Success Message receive or not
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible       ${SuperToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Company ${NewCompanyName} has been added successfully

Delete Company If Existed
    [Arguments]     ${NewCompanyName}
    Web.Reload Page
    Go to Account
    Search Company      ${NewCompanyName}
    set global variable     ${NewCompanyName}
    Wait Until the Update Icon Disappear
    # Web.Wait Until Element Is Enabled           ${DeleteCmpny}    ${StandardTimeout}
    ${Count} =  Web.Get Element Count       xpath://*[text()= "${NewCompanyName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
    log to console  ${Count}
    Run Keyword If  ${Count} > 0  Delete Company  ${Count}

Delete Company
    [Arguments]     ${Count}
    FOR     ${i}  IN RANGE      ${Count}
           Web.Wait Until Element Is Visible    xpath://*[text()= "${NewCompanyName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]   ${StandardTimeout}
           Web.Click Element	                xpath://*[text()= "${NewCompanyName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
           Click on Confirm button
    END

Verify Account deleted Success Message receive or not
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible    ${SuperToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Account(s) have been deleted successfully.

Broadcast Message
    [Arguments]         ${MsgFromat}
    Web.Wait Until Element Is Visible        ${WelcomeMsg}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled        ${SuperAccountLnk}     ${StandardTimeout}
    Web.Click Element                        ${SuperAccountLnk}
    Web.Wait Until Element Is Enabled        ${BroadcastMsg}     ${StandardTimeout}
    Web.Click Element                        ${BroadcastMsg}
    Web.Select From List By Value            ${MsgFormatDrpdwn}       ${MsgFromat}
    Web.Input Text                           ${BroadDescTxtField}      Test_Message
    Web.Clear Element Text                   ${BroadDLTxtField}
    Web.Input Text                           ${BroadDLTxtField}     ${superemailidfield}
    Web.Wait Until Element Is Enabled        ${BroadOkBtn}     ${StandardTimeout}
    Web.Click Element                        ${BroadOkBtn}
    Web.Wait Until Element Is Visible        ${BroadSuccessLbl}

Go to Account
    Web.Wait Until Element Is Enabled        ${AccountLnk}     ${StandardTimeout}
    Web.Click Element                        ${AccountLnk}

Verify Account Email Sent Success Message receive or not
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible    ${SuperToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Email sent to ${SuperEmailIDField}.

Check Sent Mail on New Account Creation
    Open Mailbox    host=${GmailHost}    user=${SuperGmailId}    password=${SuperGmailPassword}
    ${LATEST1} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${AccMailContent} =    Get Email Body    ${LATEST1}
    ${Result}=    Get Lines Matching Pattern    ${AccMailContent}    Test_Mail
    log to console      ${Result}
    Should Be Equal As Strings       ${Result}        Test_Mail
    Delete Email         ${LATEST1}

Verify Edit Email saved Success Message receive or not
    Scroll Page To Location     0       0
    #Web.Wait Until Element Is Visible    ${SuperToastPopUpMsg}
    Web.Element Text Should Be          ${ToastSuccess}     Success

Go to License Acknowledgments
    Web.Wait Until Element Is Enabled        ${LAlnk}     ${StandardTimeout}
    Web.Click Element                        ${LAlnk}
    Web.Wait Until Element Is Visible        ${LAlbl}     ${StandardTimeout}

Go to Edit Terms of Use
    Web.Wait Until Element Is Enabled        ${EditTermsLnk}     ${StandardTimeout}
    Web.Click Element                        ${EditTermsLnk}
    Web.Wait Until Element Is Visible        ${EditTermsLbl}     ${StandardTimeout}

Verify Error Msg appear for no changes done
    Scroll Page To Location     0       0
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     No changes were detected.

Verify system Alerts,users,tokens and authentication statistics on DashBoard
    Web.Wait Until Element Is Visible    ${AuthenticationsUser}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${Tokens}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${Users}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SystemAlerts}    ${StandardTimeout}

Change Account Name
    [Arguments]    ${AccountNametest}           
    Web.Wait Until Element Is Visible    ${AccountDropdown}    ${StandardTimeout}
    Web.Select From List By Label       ${AccountDropdown}      ${AccountNametest}

Verify Permission Template List
    @{expected_result}=     Create list     @{ListOfPermissionTempList1}
    ${elements}=    Web.Get WebElements    ${PermissionTempList}
    @{actual_result}=   Create list

    FOR    ${element}  IN      @{elements}
        ${get_text}=     Web.Get text    ${element}
        Append To List     ${actual_result}     ${get_text}

    END
    lists should be equal    ${expected_result}     ${actual_result}

Select Option from Permission DropDown
    [Arguments]     ${PermissonValue}
    Web.Wait Until Element Is Enabled       ${ListOfPermissionTempList}    ${StandardTimeout}
    Web.Select From List by Value       ${ListOfPermissionTempList}     ${PermissonValue}

Verify Enabled API for SurePassId ADFS
    Checkbox Should Be Selected     ${FindUsercheckbox}                     
    Checkbox Should Be Selected     ${GetVerifyMethodscheckbox}            
    Checkbox Should Be Selected     ${SendOtpEmailcheckbox}                 
    Checkbox Should Be Selected     ${SendOtpSmscheckbox}                  
    Checkbox Should Be Selected     ${SendOtpVoicecheckbox}                 
    Checkbox Should Be Selected     ${SendPushAppcheckbox}             
    Checkbox Should Be Selected     ${SendPushU2FAppcheckbox}              
    Checkbox Should Be Selected     ${SendPushVoicecheckbox}              
    Checkbox Should Be Selected     ${ValidateOtpcheckbox}                 
    Checkbox Should Be Selected     ${ValidateOtpPincheckbox}               
    Checkbox Should Be Selected     ${ValidateUserPincheckbox}  

Verify Enabled API for Directory Sync
    Checkbox Should Be Selected     ${DirectorySyncCheckbox}

Verify Enabled API for EventLogSync
    Checkbox Should Be Selected     ${EventLogSyncCheckbox}

Verify Enabled API for SurePassId PAM
    Checkbox Should Be Selected     ${FindUsercheckbox}                     
    Checkbox Should Be Selected     ${GetVerifyMethodscheckbox}            
    Checkbox Should Be Selected     ${SendOtpEmailcheckbox}                 
    Checkbox Should Be Selected     ${SendOtpSmscheckbox}                  
    Checkbox Should Be Selected     ${SendOtpVoicecheckbox}                 
    Checkbox Should Be Selected     ${SendPushAppcheckbox}             
    Checkbox Should Be Selected     ${SendPushU2FAppcheckbox}              
    Checkbox Should Be Selected     ${SendPushVoicecheckbox}              
    Checkbox Should Be Selected     ${ValidateOtpcheckbox}                 
    Checkbox Should Be Selected     ${ValidateOtpPincheckbox}               
    Checkbox Should Be Selected     ${ValidateUserPincheckbox}

Verify Enabled API for SurePassId RADIUS
    Checkbox Should Be Selected     ${FindUsercheckbox}                     
    Checkbox Should Be Selected     ${GetVerifyMethodscheckbox}            
    Checkbox Should Be Selected     ${SendOtpEmailcheckbox}                 
    Checkbox Should Be Selected     ${SendOtpSmscheckbox}                  
    Checkbox Should Be Selected     ${SendOtpVoicecheckbox}                 
    Checkbox Should Be Selected     ${SendPushAppcheckbox}             
    Checkbox Should Be Selected     ${SendPushU2FAppcheckbox}              
    Checkbox Should Be Selected     ${SendPushVoicecheckbox}              
    Checkbox Should Be Selected     ${ValidateOtpcheckbox}                 
    Checkbox Should Be Selected     ${ValidateOtpPincheckbox}               
    Checkbox Should Be Selected     ${ValidateUserPincheckbox}

Verify Enabled API for SurePassId ServicePass
    Checkbox Should Be Selected     ${AddOathDevicecheckbox}            
    Checkbox Should Be Selected     ${AddU2FDevicecheckbox}                 
    Checkbox Should Be Selected     ${ChangeUserPasswordcheckbox}                  
    Checkbox Should Be Selected     ${DeviceActivationcheckbox}                 
    Checkbox Should Be Selected     ${DeviceAssignmentcheckbox}             
    Checkbox Should Be Selected     ${DeviceStatuscheckbox}              
    Checkbox Should Be Selected     ${FidoU2FDeletecheckbox}              
    Checkbox Should Be Selected     ${FidoU2FEnrollcheckbox}                 
    Checkbox Should Be Selected     ${FidoU2FSigncheckbox}               
    Checkbox Should Be Selected     ${ProvisionTokenOtacheckbox} 
    Checkbox Should Be Selected     ${ProvisionTokenQrcheckbox}
    Checkbox Should Be Selected     ${SendPasswordRecoverycheckbox} 
    Checkbox Should Be Selected     ${UpdateUsercheckbox} 
    Checkbox Should Be Selected     ${SyncOtpcheckbox} 

Verify Enabled API for SurePassId No Fido
    Checkbox Should Be Selected     ${AddOathDevicecheckbox}            
    Checkbox Should Be Selected     ${AddU2FDevicecheckbox}                 
    Checkbox Should Be Selected     ${ChangeUserPasswordcheckbox}                  
    Checkbox Should Be Selected     ${DeviceActivationcheckbox}                 
    Checkbox Should Be Selected     ${DeviceAssignmentcheckbox}             
    Checkbox Should Be Selected     ${DeviceStatuscheckbox}                             
    Checkbox Should Be Selected     ${ProvisionTokenOtacheckbox} 
    Checkbox Should Be Selected     ${ProvisionTokenQrcheckbox}
    Checkbox Should Be Selected     ${SendPasswordRecoverycheckbox} 
    Checkbox Should Be Selected     ${UpdateUsercheckbox} 
    Checkbox Should Be Selected     ${SyncOtpcheckbox} 

Verify Enabled API for SurePass No QR Code
    Checkbox Should Be Selected     ${AddOathDevicecheckbox}
    Checkbox Should Be Selected     ${AddU2FDevicecheckbox}                 
    Checkbox Should Be Selected     ${ChangeUserPasswordcheckbox}                  
    Checkbox Should Be Selected     ${DeviceActivationcheckbox}                 
    Checkbox Should Be Selected     ${DeviceAssignmentcheckbox}             
    Checkbox Should Be Selected     ${DeviceStatuscheckbox}              
    Checkbox Should Be Selected     ${FidoU2FDeletecheckbox}              
    Checkbox Should Be Selected     ${FidoU2FEnrollcheckbox}                 
    Checkbox Should Be Selected     ${FidoU2FSigncheckbox}               
    Checkbox Should Be Selected     ${SendPasswordRecoverycheckbox} 
    Checkbox Should Be Selected     ${UpdateUsercheckbox} 
    Checkbox Should Be Selected     ${SyncOtpcheckbox} 

Verify Enabled API for SurePass Windows Login Manager
    Checkbox Should Be Selected     ${FindUsercheckbox}                     
    Checkbox Should Be Selected     ${GetVerifyMethodscheckbox}            
    Checkbox Should Be Selected     ${SendOtpEmailcheckbox}                 
    Checkbox Should Be Selected     ${SendOtpSmscheckbox}                  
    Checkbox Should Be Selected     ${SendOtpVoicecheckbox}                 
    Checkbox Should Be Selected     ${SendPushAppcheckbox}             
    Checkbox Should Be Selected     ${SendPushU2FAppcheckbox}              
    Checkbox Should Be Selected     ${SendPushVoicecheckbox}              
    Checkbox Should Be Selected     ${ValidateOtpcheckbox}                 
    Checkbox Should Be Selected     ${ValidateOtpPincheckbox}               
    Checkbox Should Be Selected     ${ValidateUserPincheckbox}









                      

