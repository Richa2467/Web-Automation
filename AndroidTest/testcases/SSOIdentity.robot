*** Settings ***
Library    String
Library    Collections
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/SSOIdentityResource.robot

Library     ../lib/ApiTesting.py    ${SandboxApiUrl}    ${AccountId}    ${AccountToken}

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify that User should be able to see the SSO Identity name and Username of user should be same.
    [Tags]  SSOIdentity_001     SurePassID_M1   SurePassId_Web
    Delete User form the User List if existing  ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Sleep   ${SleepDelay5s}      #Need 5s sleep to disappear the Warning popup
    Click on Add button
    Verify User added Success Message receive or not
    Web.Wait Until Element Is Visible    ${ssoIdentity}    ${StandardTimeout}
    ${ssoIdentitytext}     Web.Get Value   ${ssoIdentity}
    Should Not Be Empty     ${ssoIdentitytext}
    Should Be Equal     ${inputUserName}    ${ssoIdentitytext}

Verify that User should be able to add User and validate the SSOIdentity name same as Username name.
    [Tags]  SSOIdentity_002     SurePassID_M1   SurePassId_Web
    ${statusCode}    find_user_detail    ${apiDeleteUser}     ${AccountId}    ${AccountToken}
    Run Keyword If      '${statusCode}' == '0'      Delete User from the System     ${apiDeleteUser}
    ${returnString}   add user      ${apiDeleteUser}    ${apiFirstName}      ${apiDeleteEmail}
    Should be Equal as Strings      ${returnString}    0
    Go To User Details Page    ${apiDeleteUser}
    Web.Wait Until Element Is Visible    ${ssoIdentity}    ${StandardTimeout}
    ${ssoIdentitytext}     Web.Get Value   ${ssoIdentity}
    Should Not Be Empty     ${ssoIdentitytext}
    Log to Console      ${ssoIdentitytext}
    Should Be Equal     ${apiDeleteUser}    ${ssoIdentitytext}
