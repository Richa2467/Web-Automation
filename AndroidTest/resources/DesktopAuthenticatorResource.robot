*** Settings ***
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../labels/DesktopAuthenticatorLabel.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/DesktopAuthenticatorLocator.robot
Resource    ../locators/TokenPageLocator.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../locators/SSPLocator.robot


*** Keywords ***
Open Desktop Authenticator
    Windows.Open Application        ${ServerURL}     platformName=${Windows}    deviceName=${DeviceName}   app=${DesktopAuthPath}

Add Desktop Token
    [Arguments]    ${FriendlyNameValue}=None     ${Id}=None
    Windows.Click Element        ${DeskAddToken}
    Sleep   ${SleepDelay10s}
    Windows.Input Text           ${FriendlyName}       ${FriendlyNameValue}
    Sleep   ${SleepDelay10s}
    Windows.Input Text           ${DeskTokenId}         ${Id}
    Sleep   ${SleepDelay10s}
    Windows.Click Element        ${ActivateToken}
    sleep   ${SleepDelay10s}


Delete Desktop Token
    Sleep   3s
    Windows.Click Element      ${DeskAuthDelete}
    ${element}  	Windows.Get Webelement	    name=${ConfirmDelete}
    Windows.Click Element        ${DeskCloseYesButton}
    Close Desktop Authenticator


Close Desktop Authenticator
    Windows.Quit Application
    Sleep   ${SleepDelay2s}
    ${element}  	Windows.Get Webelement	    name=${ConfirmExit}
    Windows.Click Element        ${DeskCloseYesButton}

Add Token to Desktop Authenticator and Get OTP
   Open Desktop Authenticator
   Delete Desktop Token
   Open Desktop Authenticator
   sleep    ${SleepDelay5s}
   Add Desktop Token          FriendlyNameValue=ShareToken2     Id=${IdValue}
   Windows.Click Element         ${OTPLabel}
   ${OTPValue}   Windows.Get Element Attribute    ${OTPLabel}   Name
   set global variable     ${OTPValue}
   log to console     ${OTPValue}
   #Close Desktop Authenticator

Add New User with Desktop Token with PIN
   Delete Token If Existing           ${TokenDefName}
   Delete User form the User List if existing      ${inputUserName}
   Add User an To d retrieve login details
   Go To Add New Soft Token Page From User Details Page
   Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName}     TokenStatus=0    OTPType=2
   ${IdValue}    Web.Get Value    ${TokenID}
   set global variable      ${IdValue}

Add New Admin User with Desktop Token with PIN
   Delete Token If Existing           ${TokenDefName}
   Delete User form the User List if existing      ${inputUserName2}
   Add Admin User2 and retreive login detials
   Go To Add New Soft Token Page From User Details Page
   Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName}     TokenStatus=0    OTPType=2
   ${IdValue}    Web.Get Value    ${TokenID}
   set global variable      ${IdValue}
   Web.Clear Element Text              ${TimeDrift}
    Web.Input Text                     ${TimeDrift}             260
    Sleep    ${SleepDelay5s}
    Web.Click Element          ${TokenAddButton}

Add PIN type Token to Desktop Authenticator and Get OTP
   Open Desktop Authenticator
   Delete Desktop Token
   Open Desktop Authenticator
   sleep    ${SleepDelay5s}
   Add Desktop Token          FriendlyNameValue=ShareToken2     Id=${IdValue}
   Windows.Click Element         ${OTPLabel}
   Sleep    3s
   Windows.Click Element     ${PINTxtField}
   Windows.Input Text        ${PINTxtField}      1234
   Sleep   ${SleepDelay2s}
   Windows.Click Element     ${OKButton}
   Sleep    30s
   ${OTPValue}   Windows.Get Element Attribute    ${OTPLabel}   Name
   set global variable     ${OTPValue}
   log to console     ${OTPValue}
#   Close Desktop Authenticator

Add PIN type Token to Desktop Authenticator and Get OTP with incorrect PIN
   Open Desktop Authenticator
   Delete Desktop Token
   Open Desktop Authenticator
   sleep    ${SleepDelay5s}
   Add Desktop Token          FriendlyNameValue=ShareToken2     Id=${IdValue}
   Windows.Click Element         ${OTPLabel}
   Sleep    3s
   Windows.Click Element     ${PINTxtField}
   Windows.Input Text        ${PINTxtField}      1233
   Sleep   ${SleepDelay2s}
   Windows.Click Element     ${OKButton}
   ${OTPValue}   Windows.Get Element Attribute    ${OTPLabel}   Name
   set global variable     ${OTPValue}
   log to console     ${OTPValue}

Add New User with 2 Desktop Tokens
   Delete Token If Existing           ${TokenDefName}
   Delete Token If Existing           ${TokenDefName2}
   Delete User form the User List if existing      ${inputUserName}
   Add User and retrieve login details
   Go To Add New Soft Token Page From User Details Page
   Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName}      TokenStatus=0
   ${IdValue}    Web.Get Value    ${TokenID}
   set global variable      ${IdValue}
   Web.Click Element            ${CloseTempPwd}
   Go To Add New Soft Token Page From User Details Page
   Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName2}      TokenStatus=0
   ${IdValue2}    Web.Get Value    ${TokenID}
   set global variable      ${IdValue2}

Add Invalid Token to Desktop Authenticator and Verify Error Message
    Open Desktop Authenticator
    Delete Desktop Token
    Open Desktop Authenticator
    sleep    ${SleepDelay5s}
    Add Desktop Token          FriendlyNameValue=ShareToken2     Id=${IdValue}
    Windows.Page Should Contain Text       Error activating this device.

Close Desktop Authenticator after error
    Sleep    3s
    Windows.Click ELement            ${OKButton}
    Sleep    3s
    Windows.Click Element            ${Cross}
    Close Desktop Authenticator

Add New User with Token with Token Id
    [Arguments]      ${Tokentypevalue}=${Empty}
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Add User and retrieve login details
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=${Tokentypevalue}    UserDefinedName=${TokenDefName}      TokenStatus=0
    ${IdValue}    Web.Get Value    ${TokenID}
    set global variable      ${IdValue}

Login SurePassId Account with Desktop Token with incorrect PIN
    Web.Wait Until Element Is Enabled             ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Input Text       ${UserNameLocator}       ${UserValue2}
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text       ${PasswordLocator}       ${Passwordvalue2}
    Web.Click Element    ${SignInButton}
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Input Text       ${OtpTextBox}    ${OTPValue}
    Web.Click Element    ${VerifyOtpButton}
    Web.Wait Until Element Is Enabled     ${2FAErrorMsgLocator}    ${StandardTimeout}

Login SurePassId Account with Desktop Token
    Web.Wait Until Element Is Enabled             ${AccountNameLocator}    ${StandardTimeout}
    Web.Input Text       ${AccountNameLocator}    ${AccountName}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Input Text       ${UserNameLocator}       ${UserValue2}
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text       ${PasswordLocator}       ${Passwordvalue2}
    Web.Click Element    ${SignInButton}
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Input Text       ${OtpTextBox}    ${OTPValue}
    Web.Click Element    ${VerifyOtpButton}
    Web.Wait Until Element Is Enabled     ${HomeTab}    ${StandardTimeout}
