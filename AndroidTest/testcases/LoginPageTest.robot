*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/AndroidResource.robot
Resource    ../resources/SettingsPageResource.robot

Suite Setup    Run Keywords    Open SurePass On Browser    AND
...           Submit 2FA Page Using Email OTP    6
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify that 6 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 6 and a user-defined name which is linked with the app using instant activation link
    [Tags]  USR_NEW_TKN_039    POC
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePass6
    Web.Click Element    ${InstantActivationIcon}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open Test Application
    Open Browser With Activation Link    ${TokenActivationLink}
    sleep   ${SleepDelay2s}
    Press Enter Key
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}

Verify User should be able to login using linked token.
    [Tags]    Android_Auth_011    POC
    [Setup]    Click On Logout option
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Open Test Application
    Wait Until Keyword Succeeds    3 times    10 sec    Get OTP From Mobile APP And Enter It
    [Teardown]    Run Keywords    Delete SurePassToken
    ...           AND    Wait Until Keyword Succeeds    3 times    10 sec    Go To Token Page And Delete Token    SurePass6

