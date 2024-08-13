*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/SSOResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify the user should be able to enable and disable 'SSO Login Support' field.
    [Tags]  SSO_SETTINGS_001   SurePassID_SSO     SurePassId_Web
    Navigate to SSO tab
    Web.Select From List by Value       ${SSOLoginSupport}            ${SSODisabled}
    Web.Select From List by Value       ${SSOLoginSupport}            ${SSOEnabled}

Verify the user should be able to enable and disable 'User without a credential can login with only username and password' field.
    [Tags]  SSO_SETTINGS_002   SurePassID_SSO     SurePassId_Web
    Web.Select From List by Value       ${AllowSingleFactor}            ${SSOEnabled}
    Web.Select From List by Value       ${AllowSingleFactor}            ${SSODisabled}

Verify the user should be able to enable and disable 'Users can change their password' field.
    [Tags]  SSO_SETTINGS_003   SurePassID_SSO     SurePassId_Web
    Web.Select From List by Value       ${AllowChangePassword}            ${SSOEnabled}
    Web.Select From List by Value       ${AllowChangePassword}            ${SSODisabled}

Verify the user should be able to see SSO Public Certificate.
    [Tags]  SSO_SETTINGS_004   SurePassID_SSO     SurePassId_Web
    Web.Wait Until Element Is Visible    ${ShowCertBtn}    ${StandardTimeout}
    Web.Click Element	  ${ShowCertBtn}
    Web.Wait Until Element Is Visible    ${ThumbPrint}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${TextCert}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${CpyBtn}    ${StandardTimeout}

Verify the user should be able to see popup after click on copy button.
    [Tags]  SSO_SETTINGS_005   SurePassID_SSO     SurePassId_Web
    Web.Wait Until Element Is Visible    ${CpyBtn}    ${StandardTimeout}
    #Web.Click Element    ${CpyBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${CpyBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CpyBtn}
    Web.Wait Until Element Is Visible    ${Copied}    ${StandardTimeout}
    #Web.Page Should Contain     ${Copied}
    #Handle Alert

Verify the user should be able to hide the SSO Public Certificate.
    [Tags]  SSO_SETTINGS_006   SurePassID_SSO     SurePassId_Web
    Web.Wait Until Element Is Visible    ${ShowCertBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${ShowCertBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${ShowCertBtn}
    #Web.Click Element	  ${ShowCertBtn}
    Web.Page Should Not Contain     ${ThumbPrint}   ${StandardTimeout}

Verify the user should be able to download the SSO Public Certificate.
    [Tags]  SSO_SETTINGS_007   SurePassID_SSO     SurePassId_Web
    Web.Wait Until Element Is Visible    ${DwnldCertBtn}    ${StandardTimeout}
    #Web.Click Element	  ${DwnldCertBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${DwnldCertBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${DwnldCertBtn}
    Web.Wait Until Element Is Visible    ${DwnldSuccessPopUp}    ${StandardTimeout}
    Web.Page Should Contain     ${OpeningDwnlWindow}

Verify the user should be able to select any option for the 'Secure Authentication Server' field from the available list
    [Tags]  SSO_SETTINGS_008   SurePassID_SSO     SurePassId_Web
    Web.Select From List by Value       ${UserAuthType}            ${Verisign_VIP_1}
    Web.Select From List by Value       ${UserAuthType}            ${Entrust_4}
    Web.Select From List by Value       ${UserAuthType}            ${RSA_5}
    Web.Select From List by Value       ${UserAuthType}            ${Vasco_6}
    Web.Select From List by Value       ${UserAuthType}            ${Radius_7}
    Web.Select From List by Value       ${UserAuthType}            ${SurePassID_0}

Verify the user should be able to click on 'New SAML2 App' link
    [Tags]  SSO_SETTINGS_009   SurePassID_SSO     SurePassId_Web
    Web.Wait Until Element Is Visible    ${NewCustomApp}    ${StandardTimeout}
    #Web.Click Element	  ${NewCustomApp}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${NewCustomApp}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${NewCustomApp}
    Web.Wait Until Element Is Visible    ${SAML2Settings}    ${StandardTimeout}

Verify the user should be able to click on 'New Webform App' link
    [Tags]  SSO_SETTINGS_010   SurePassID_SSO     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${NewWebFormApp}    ${StandardTimeout}
    #Web.Click Element	  ${NewWebFormApp}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${NewWebFormApp}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${NewWebFormApp}
    Web.Wait Until Element Is Visible    ${WebFormLoginSettings}    ${StandardTimeout}

Verify the system gives an error message if the user forgot to give the role name.
    [Tags]  SSO_ADD_ROLE_001   SurePassID_SSO1     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_RoleTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_RoleTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SSO_RoleTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_RoleTab}
    Delete Role form the Role(s) List if existing   ${RoleName}
    Web.Wait Until Element Is Visible    ${NewRolelink}    ${StandardTimeout}
    #Web.Click Element	  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${NewRolelink}
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    #Web.Click Element	  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${noRoleName}     ${StandardTimeout}
    ${NoRoleErrorMsgBar}    Web.Get Text     ${noRoleName}
    Should Be Equal      ${NoRoleErrorMsgBar}   ${NoRoleErrorMsg}

Verify user should be able to add SSO Role.
    [Tags]  SSO_ADD_ROLE_002   SurePassID_SSO1     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_RoleTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_RoleTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SSO_RoleTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_RoleTab}
    Web.Wait Until Element Is Visible    ${NewRolelink}    ${StandardTimeout}
    #Web.Click Element	  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${NewRolelink}
    Web.Wait Until Element Is Visible    ${InputRoleName}    ${StandardTimeout}
    Web.Input Text	  ${InputRoleName}      ${RoleName}
    Web.Wait Until Element Is Visible    ${InputRoleDesc}    ${StandardTimeout}
    Web.Input Text	  ${InputRoleDesc}      ${RoleDesc}
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    #Web.Click Element	  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${Role_SuccessPop}    ${StandardTimeout}
    Page Should Contain     ${SuccessRolePopUp}

Verify user should be able to update the already added role.
    [Tags]  SSO_ADD_ROLE_003   SurePassID_SSO1     SurePassId_Web
    #Sleep   2s
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    #Web.Click Element	  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${Role_SuccessPop}    ${StandardTimeout}
    Page Should Contain     ${SuccessRolePopUp}

Verify user should be able to copy the already added role.
    [Tags]  SSO_ADD_ROLE_004   SurePassID_SSO1     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_RoleTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_RoleTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SSO_RoleTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_RoleTab}
    Web.Wait Until Element Is Visible    ${CopyRolelink}    ${StandardTimeout}
    #Web.Click Element	  ${CopyRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${CopyRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CopyRolelink}
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    #Web.Click Element	  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${Role_SuccessPop}    ${StandardTimeout}
    Page Should Contain     ${SuccessRolePopUp}

Verify user should be able to delete the SSO role.
    [Tags]  SSO_DEL_ROLE_001   SurePassID_SSO1     SurePassId_Web
    Delete Role form the Role(s) List if existing   ${RoleName}

Verify displayed delete confirmation message, while deleting the SSO role.
    [Tags]  SSO_DEL_ROLE_002   SurePassID_SSO1     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_RoleTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_RoleTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SSO_RoleTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_RoleTab}
    Web.Wait Until Element Is Visible    ${NewRolelink}    ${StandardTimeout}
    #Web.Click Element	  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${NewRolelink}
    Web.Wait Until Element Is Visible    ${InputRoleName}    ${StandardTimeout}
    Web.Input Text	  ${InputRoleName}      ${RoleName}
    Web.Wait Until Element Is Visible    ${InputRoleDesc}    ${StandardTimeout}
    Web.Input Text	  ${InputRoleDesc}      ${RoleDesc}
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    #Web.Click Element	  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${Role_SuccessPop}    ${StandardTimeout}
    Page Should Contain     ${SuccessRolePopUp}
    Delete Role form the Role(s) List if existing   ${RoleName}

Verify the system gives an error message if the user forgot to give the Policy Name.
    [Tags]  SSO_ADD_POLICY_001   SurePassID_SSO2     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_PolicyTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_PolicyTab}
    Web.Wait Until Element Is Visible    ${NewRolelink}    ${StandardTimeout}
    #Web.Click Element	  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${NewRolelink}
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    #Web.Click Element	  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${noRoleName}     ${StandardTimeout}
    ${NoRoleErrorMsgBar}    Web.Get Text     ${noRoleName}
    Should Be Equal      ${NoRoleErrorMsgBar}   ${NoPolicyErrMsg}

Verify user should be able to add SSO Policy with default information.
    [Tags]  SSO_ADD_POLICY_002   SurePassID_SSO2     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_PolicyTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_PolicyTab}
    Web.Wait Until Element Is Visible    ${NewRolelink}    ${StandardTimeout}
    #Web.Click Element	  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${NewRolelink}
    Web.Wait Until Element Is Visible    ${InputPolicyName}    ${StandardTimeout}
    Web.Input Text	  ${InputPolicyName}      ${PolicyName}
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    #Web.Click Element	  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${Role_SuccessPop}    ${StandardTimeout}
    Page Should Contain     ${SuccessPolicyPopUp}

Verify user should be able to update the already added SSO Policy.
    [Tags]  SSO_ADD_POLICY_003   SurePassID_SSO2     SurePassId_Web
    #Sleep   2s
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    #Web.Click Element	  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${Role_SuccessPop}    ${StandardTimeout}
    Page Should Contain     ${SuccessPolicyUpdate}

Verify user should be able to copy the already added policy.
    [Tags]  SSO_ADD_POLICY_004   SurePassID_SSO2     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_PolicyTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_PolicyTab}
    Web.Wait Until Element Is Visible    ${CopyPolicylink}    ${StandardTimeout}
    #Web.Click Element	  ${CopyPolicylink}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${CopyPolicylink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CopyPolicylink}
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    #Web.Click Element	  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${addRoleBtn}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${Role_SuccessPop}    ${StandardTimeout}
    Page Should Contain     ${SuccessPolicyPopUp}

Verify user should be able to delete the SSO Policy.
    [Tags]  SSO_DEL_POLICY_001   SurePassID_SSO222     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_PolicyTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_PolicyTab}
    #Sleep   10s
    Delete Policy form the Policy(ies) List if existing     ${PolicyName}
#    Web.Wait Until Element Is Visible    ${DeletePolicylink}   ${StandardTimeout}
#    Web.Click Element   ${DeletePolicylink}
#    Click on Confirm button
#    Verify Policy(s) Delete Success Message receive or not

Verify displayed delete confirmation message, while deleting the SSO Policy.
    [Tags]  SSO_DEL_POLICY_002   SurePassID_SSO222     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_PolicyTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_PolicyTab}
    Web.Wait Until Element Is Visible    ${NewRolelink}    ${StandardTimeout}
    #Web.Click Element	  ${NewRolelink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${NewRolelink}
    Web.Wait Until Element Is Visible    ${InputPolicyName}    ${StandardTimeout}
    Web.Input Text	  ${InputPolicyName}      ${PolicyName}
    Web.Wait Until Element Is Visible    ${addRoleBtn}    ${StandardTimeout}
    Web.Click Element	  ${addRoleBtn}
    Web.Wait Until Element Is Visible    ${Role_SuccessPop}    ${StandardTimeout}
    Page Should Contain     ${SuccessPolicyPopUp}
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_PolicyTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_PolicyTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SSO_PolicyTab}
    Web.Wait Until Element Is Visible    ${DeletePolicylink}   ${StandardTimeout}
    Web.Click Element   ${DeletePolicylink}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${DeletePolicylink}
    Click on Confirm button
    Verify Policy(s) Delete Success Message receive or not

Verify user should be able to configure SSO apps from 'SSO Applications Available'
    [Tags]  SSO_APP_CONFIG_001   SurePassID_SSO21     SurePassId_Web
    Navigate to SSO tab
    #Web.Wait Until Element Is Visible    ${SSO_PolicyTab}    ${StandardTimeout}
    #Web.Click Element	  ${SSO_PolicyTab}
    Uncheck GMail Application and click on the Update button
    Select GMail Application and click on the Update button

Verify user should not be able to add custom SAML2 SSO App with default data.
    [Tags]  SSO_ADD_CSTM_APP_001   SurePassID_SSO21     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${NewCustomApp}    ${StandardTimeout}
    Web.Click Element	  ${NewCustomApp}
    Web.Wait Until Element Is Visible    ${SAML2Settings}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SSOAppUpdate}    ${StandardTimeout}
    Web.Click Element	  ${SSOAppUpdate}
    Web.Wait Until Element Is Visible    ${SSORedBar1stErrMsg}    ${StandardTimeout}
    ${Get1stErrMsg}     Web.Get Text    ${SSORedBar1stErrMsg}
    Should Be Equal     ${Get1stErrMsg}      Please enter an Assertion Consumer Service URL.
    #Web.Wait Until Element Is Visible    ${SSORedBar2ndErrMsg}    ${StandardTimeout}
    #${Get2ndErrMsg}     Web.Get Text    ${SSORedBar2ndErrMsg}
    #Should Be Equal     ${Get2ndErrMsg}      Please enter an IdP Issuer.

Verify user should not be able to add webform SSO App with default data.
    [Tags]  SSO_ADD_WEBFRM_APP_001   SurePassID_SSO21     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${NewWebFormApp}    ${StandardTimeout}
    Web.Click Element	  ${NewWebFormApp}
    Web.Wait Until Element Is Visible    ${WebFormLoginSettings}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SSOAppUpdate}    ${StandardTimeout}
    Web.Click Element	  ${SSOAppUpdate}
    Web.Wait Until Element Is Visible    ${SSORedBar1stErrMsg}    ${StandardTimeout}
    ${Get1stErrMsg}     Web.Get Text    ${SSORedBar1stErrMsg}
    Should Be Equal     ${Get1stErrMsg}      Please enter an name for this application.
    Web.Wait Until Element Is Visible    ${SSORedBar2ndErrMsg}    ${StandardTimeout}
    ${Get2ndErrMsg}     Web.Get Text    ${SSORedBar2ndErrMsg}
    Should Be Equal     ${Get2ndErrMsg}      No Login Web Form URL.

Verify user should be able to globally turn SSO support off.
    [Tags]  Cloud_App_Login_001   SurePassID_SSO21     SurePassId_Web
    Navigate to SSO tab
    Web.Select From List by Value       ${SSOLoginSupport}            ${SSODisabled}
    Web.Select From List by Value       ${SSOLoginSupport}            ${SSOEnabled}
    Web.Wait Until Element Is Visible    ${IdentityProviderURL}    ${StandardTimeout}
    Web.Click Element	  ${IdentityProviderURL}

Verify user should be able to globally turn SSO support on.
    [Tags]  Cloud_App_Login_002   SurePassID_SSO21     SurePassId_Web
    Navigate to SSO tab
    Web.Select From List by Value       ${SSOLoginSupport}            ${SSODisabled}
    Web.Select From List by Value       ${SSOLoginSupport}            ${SSOEnabled}
    Web.Wait Until Element Is Visible    ${IdentityProviderURL}    ${StandardTimeout}
    Web.Click Element	  ${IdentityProviderURL}

Verify role name's list should be arranged in ascending and descending order when clicking on the 'Role Name' textbox.
    [Tags]  SSO_ROLE_001   SurePassID_SSO21     SurePassId_Web
    Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSO_RoleTab}    ${StandardTimeout}
    Web.Click Element	  ${SSO_RoleTab}
    Web.Wait Until Element Is Visible    ${RoleNameAcending}    ${StandardTimeout}
    Web.Click Element	  ${RoleNameAcending}
































