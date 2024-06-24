*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/SSPResource.robot
Resource    ../locators/LoginPageLocator.robot

Suite Setup    Run Keyword    Open ServicePass On Browser
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify User is able to Login successfully with an account of the same Tenant.
    [Tags]  SSP_001    POC
    Submit First SSP Login Page
    Submit SSP 2FA
    Web.Wait Until Element Is Visible    ${SSPAddNewMobileToken}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${SSPAddNewMobileToken}     ${StandardTimeout}

Verify User is able to add Mobile Token.
    [Tags]   SSP_003    POC
    Web.Click Element     ${SSPAddNewMobileToken}
    ${SSPTokenName}    Web.Get Text    ${SSPTokenLabel}
    set global variable    ${SSPTokenName}

User should be able to delete token successfully.
    [Tags]    SSP_004    POC
    Web.Wait Until Element Is Visible    //a[contains(text(), "${SSPTokenName}")]     ${StandardTimeout}
    Web.Click Element     //a[contains(text(), "${SSPTokenName}")]
    Web.Wait Until Element Is Visible    ${SSPDeleteToken}     ${StandardTimeout}
    Web.Click Element     ${SSPDeleteToken}
    Web.Wait Until Page Contains    Token ${SSPTokenName} has been deleted from your account.


