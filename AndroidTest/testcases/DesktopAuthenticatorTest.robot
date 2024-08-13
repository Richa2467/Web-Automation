*** Settings ***
Library    String
Library    Collections
Library    ImapLibrary2
Library    ApplicationLibrary.DesktopLibrary     WITH NAME       Windows
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/DesktopAuthenticatorResource.robot
Resource    ../locators/SSPLocator.robot


Library     Collections
Library     String

Suite Setup    Run Keywords    Open SurePass On Browser
...            AND             Submit 2FA Page Using Email OTP    6

Suite Teardown    Close All Browsers


*** Test Cases ***
Verify User can add Desktop Token to SPDA manually.
    [Tags]    SPDA_002                  Desktop_token
    Add New User with Desktop Token
    Add Token to Desktop Authenticator and Get OTP
    Close Desktop Authenticator

#    Windows.Click Element        ${DeskCopyButton}
#    log to console    ${TokenIDValue}
#    [Teardown]    Delete Desktop Token

Verify User is able to add Token with PIN.
    [Tags]     SPDA_003                   DesktopToken_withPIN
    Add New User with Desktop Token with PIN
    Add PIN type Token to Desktop Authenticator and Get OTP
#    Delete Token with PIN
#    Open Desktop Authenticator
#     Sleep   3s
#     Windows.Click Element      ${DeskAuthDelete}
#     Windows.Input Text        ${PINTxtField}      1234
#     Sleep   ${SleepDelay2s}
#     Windows.Click Element     ${OKButton}
     Windows.Click Element      ${DeskAuthDelete}
     ${element}  	Windows.Get Webelement	    name=${ConfirmDelete}
     Windows.Click Element        ${DeskCloseYesButton}
     Close Desktop Authenticator

Verify User should receive proper error message if any of the fields is left blank.
    [Tags]     SPDA_004                     Desktop_token
    Open Desktop Authenticator
    Windows.Click Element        ${DeskAddToken}
    Sleep   ${SleepDelay10s}
    Windows.Click Element        ${ActivateToken}
    sleep   ${SleepDelay10s}
    Windows.Page Should Contain Element         ${ErrorMsg}
    Sleep    3s
    Windows.Click ELement            ${OKButton}
    Sleep    3s
    Windows.Click Element            ${Cross}
    Close Desktop Authenticator

Verify Friendly name cannot be duplicate
   [Tags]     SPDA_005                       Desktop_token
    Add New User with Desktop Token
    Add Token to Desktop Authenticator and Get OTP
    Open Desktop Authenticator
    Add Desktop Token          FriendlyNameValue=ShareToken2     Id=abc
    Windows.Page Should Contain Text       This Friendly Name (ShareToken2) is already being used
    Sleep    3s
    Windows.Click ELement            ${OKButton}
    Sleep    3s
    Windows.Click Element            ${Cross}
    Close Desktop Authenticator

Verify User should receive proper error message if FIDO token is added.
    [Tags]     SPDA_006                        Desktop_token
    Add New User with Token with Token Id       12
    log to console     ${IdValue}
    Add Invalid Token to Desktop Authenticator and Verify Error Message
    Close Desktop Authenticator after error

Verify User should receive proper error message if SurePassID Authenticator token is added.
    [Tags]     SPDA_007                      Desktop_token
    Add New User with Token with Token Id       8
    log to console      ${IdValue}
    Add Invalid Token to Desktop Authenticator and Verify Error Message
    Close Desktop Authenticator after error

Verify User should receive proper error message if Nymi band token is added.
    [Tags]     SPDA_008                          Desktop_token
    Add New User with Token with Token Id       13
    log to console      ${IdValue}
    Add Invalid Token to Desktop Authenticator and Verify Error Message
    Close Desktop Authenticator after error

Verify Device Status , Authorization of server URL and OTP settings should be in sync with SurePassID account.
     [Tags]     SPDA_009                        Desktop_token
    Add New User with Desktop Token
    ${TokenSrNo}     Web.Get Text         ${TokenEditSrNoField}
    set global variable       ${TokenSrNo}
    log to console            ${TokenSrNo}
    Add Token to Desktop Authenticator and Get OTP
    Windows.Click Element        ${EditButton}
    Windows.Page Should Contain Element       //Text[@Name=\"${TokenSrNo}\"]
    ${AuthURL}   Windows.Get Element Attribute    ${AuthServerURL}   Name
    log to console         ${AuthURL}
    Sleep     3s
    Windows.Click Element         ${CancelSetting}
    Close Desktop Authenticator

#Verify SPDA should start in System Tray if check in Settings is selected.
#    [Tags]     SPDA_017                               Desktop_token
#    Open Desktop Authenticator
#    Sleep    ${SleepDelay5s}
#    Windows.Click Element        ${EditButton}
#    Windows.Wait Until Element Is Visible             ${StartSysTrayCheckBox}    ${StandardTimeout}
#    Windows.Click Element        ${StartSysTrayCheckBox}
#    Windows.Wait Until Element Is Visible             ${OkSetttings}    ${StandardTimeout}
#    Windows.Click Element        ${OkSetttings}
#    Close Desktop Authenticator
#    Open Desktop Authenticator
#    Sleep      3s
#    Windows.Click Element         ${WinSysTray}
#    Windows.Wait Until Element Is Visible             ${SDPA_Icon}           ${StandardTimeout}
#    Windows.Click Element         ${SDPA_Icon}
#    Close Desktop Authenticator

Verify User should be able to authenticate with assigned Token using SPDA application.
    [Tags]     SPDA_019                   Desktop_token
    Add New Admin with Desktop Token
    Add Token to Desktop Authenticator and Get OTP
    Close Desktop Authenticator
    Open SurePass On Browser
    Login SurePassId Account with Desktop Token

Verify User should not be able to login with expired or incorrect OTP.
    [Tags]     SPDA_020                 Desktop_token
    [Setup]   Run Keywords             Close All Browsers
     ...       AND                     Open SurePass On Browser
     ...       AND                     Submit 2FA Page Using Email OTP    6
    Add New Admin with Desktop Token
    Add Token to Desktop Authenticator and Get OTP
    Web.Clear Element Text              //*[@id="ctl00_ContentPlaceHolder1_tbxTimeDrift"]
    Web.Input Text                      //*[@id="ctl00_ContentPlaceHolder1_tbxTimeDrift"]        0
    Close Desktop Authenticator
    Open SurePass On Browser
    Sleep    40s
    Web.Wait Until Element Is Enabled             ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Input Text       ${UserNameLocator}       ${UserValue2}
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text       ${PasswordLocator}       ${Passwordvalue2}
    Web.Click Element    ${SignInButton}
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Input Text       ${OtpTextBox}    ${OTPValue}
    Sleep      160s
    Web.Click Element    ${VerifyOtpButton}
    Web.Wait Until Element Is Visible     ${2FAErrorMsgLocator}    ${StandardTimeout}
    Web.Element Should Contain         ${2FAErrorMsgLocator}            Login Failed. OTP Invalid.

Verify digits of OTP should be same as mentioned while creating the same.
    [Tags]    SPDA_024                       Desktop_token
    [Setup]   Run Keywords             Close All Browsers
     ...       AND                     Open SurePass On Browser
     ...       AND                     Submit 2FA Page Using Email OTP    6
    Add New User with Desktop Token with 10 Digits
    Add Token to Desktop Authenticator and Get OTP
    Close Desktop Authenticator

Verify Delete token feature.
    [Tags]    SPDA_026                       Desktop_token
    [Setup]   Run Keywords             Close All Browsers
     ...       AND                     Open SurePass On Browser
     ...       AND                     Submit 2FA Page Using Email OTP    6
    Add New User with Desktop Token with 10 Digits
    Add Token to Desktop Authenticator and Get OTP
    Open Desktop Authenticator
    Delete Desktop Token

After successful deletion of token user should be able to re-add the token.
    [Tags]    SPDA_027                       Desktop_token
    [Setup]   Run Keywords             Close All Browsers
     ...       AND                     Open SurePass On Browser
     ...       AND                     Submit 2FA Page Using Email OTP    6
    Add New User with Desktop Token with 10 Digits
    Add Token to Desktop Authenticator and Get OTP
    Open Desktop Authenticator
    Delete Desktop Token
    Add Token to Desktop Authenticator and Get OTP
    Close Desktop Authenticator

Verify User should be able to login successfully with Token having Oauth and PIN authentication.
   [Tags]     SPDA_021                   DesktopToken_withPIN
   [Setup]   Run Keywords             Close All Browsers
     ...       AND                     Open SurePass On Browser
     ...       AND                     Submit 2FA Page Using Email OTP    6
   Add New Admin User with Desktop Token with PIN
   Add PIN type Token to Desktop Authenticator and Get OTP
   Windows.Click Element      ${DeskAuthDelete}
   ${element}  	Windows.Get Webelement	    name=${ConfirmDelete}
   Windows.Click Element        ${DeskCloseYesButton}
   Close Desktop Authenticator
   Open SurePass On Browser
   Login SurePassId Account with Desktop Token

Verify User should not able to login successfully if PIN authentication fails.
   [Tags]     SPDA_022                     DesktopToken_withPIN
    [Setup]   Run Keywords             Close All Browsers
     ...       AND                     Open SurePass On Browser
     ...       AND                     Submit 2FA Page Using Email OTP    6
    Add New Admin User with Desktop Token with PIN
    Add PIN type Token to Desktop Authenticator and Get OTP with incorrect PIN
    Windows.Click Element      ${DeskAuthDelete}
    ${element}  	Windows.Get Webelement	    name=${ConfirmDelete}
    Windows.Click Element        ${DeskCloseYesButton}
    Close Desktop Authenticator
    Open SurePass On Browser
    Login SurePassId Account with Desktop Token with incorrect PIN
