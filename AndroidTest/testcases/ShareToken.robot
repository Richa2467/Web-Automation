*** Settings ***
Library     DateTime
Library     String
Library     Collections
Library     ImapLibrary2
Library     ApplicationLibrary.DesktopLibrary     WITH NAME       Windows
#Library     ../lib/pyResource.py
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/DesktopAuthenticatorResource.robot
Resource    ../resources/SSPResource.robot
Resource    ../resources/AndroidResource.robot
Resource    ../locators/AndroidLocator.robot
Resource    ../locators/AddNewSoftTokenLocator.robot
Resource    ../locators/SettingsPageLocator.robot

Suite Setup    Run Keywords
...    Open SurePass On Browser
...    AND
...    Submit First Login Page
...    AND
...    Get OTP From Mobile APP And Enter It
#Suite Teardown    Close All Browsers

*** Test Cases ***
Verify Create Temporary Passcode functionality for desktop token
    [Tags]  SHR_SYNC_TKN_007        SurePassID_M2      Web_Check_OTP              SurePassId_Web
    Create Temporary Password and Check OTP for Alpha      1
    [Teardown]      Web.Close All Browsers

Verify Create Temporary Passcode functionality for Google Authenticator token
     [Tags]  SHR_SYNC_TKN_008       SurePassID_M2     Web_Check_OTP               SurePassId_Web
    Open SurePass On Browser
#    Submit 2FA Page Using Email OTP    6
    Submit First Login Page
    Get OTP From Mobile APP And Enter It
    Create Temporary Password and Check OTP       8
    [Teardown]      Web.Close All Browsers

Verify Create Temporary Passcode functionality for SMS token
     [Tags]  SHR_SYNC_TKN_009       SurePassID_M2         Web_Check_OTP             SurePassId_Web
    Open SurePass On Browser
#    Submit 2FA Page Using Email OTP    6
    Submit First Login Page
    Get OTP From Mobile APP And Enter It
    Create Temporary Password and Check OTP       7
    [Teardown]      Web.Close All Browsers

Verify Create Temporary Passcode functionality for SurePassId Authentication token
    [Tags]  SHR_SYNC_TKN_010        SurePassID_M2        Web_Check_OTP              SurePassId_WeMobile
    Open SurePass On Browser
#    Submit 2FA Page Using Email OTP    6
    Submit First Login Page
    Get OTP From Mobile APP And Enter It
    Create Temporary Password and Check OTP for Alpha      9
    [Teardown]      Web.Close All Browsers

Verify Create Temporary Passcode functionality for Voice Message OTP token
     [Tags]  SHR_SYNC_TKN_011       SurePassID_M2         Web_Check_OTP              SurePassId_Web
    Open SurePass On Browser
#    Submit 2FA Page Using Email OTP    6
    Submit First Login Page
    Get OTP From Mobile APP And Enter It
    Create Temporary Password and Check OTP       10
    [Teardown]      Web.Close All Browsers

Verify Create Temporary Passcode functionality for Nymi Band token
     [Tags]  SHR_SYNC_TKN_012       SurePassID_M2            Web_Check_OTP            SurePassId_Web
    Open SurePass On Browser
#    Submit 2FA Page Using Email OTP    6
    Submit First Login Page
    Get OTP From Mobile APP And Enter It
    Create Temporary Password and Check OTP       13
    [Teardown]      Web.Close All Browsers

Verify that a warning message is visible on the tokens without any user defined name
    [Tags]     SHR_SYNC_TKN_034     SurePassID_M2          Web_Check_OTP      SurePassId_Web
    Open SurePass On Browser
#    Submit 2FA Page Using Email OTP    6
    Submit First Login Page
    Get OTP From Mobile APP And Enter It
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Add User and retrieve login details
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=8
    Web.Element Text Should Be      ${UDTNMessagebox}        ${MessageforTokewithNoUserDefName}

##################################################################SMS Token###########################################################################################################

Verify that a non-admin user is able to login to ServicePass portal using a shared SMS token
    [Tags]   SHR_SYNC_TKN_015       SurePassID_M2        SMS_Token
#    [Setup]   Run Keywords       Close All Browsers
#    ...  AND                     Open SurePass On Browser
##    ...  AND                     Submit 2FA Page Using Email OTP    6
#     [Setup]    Run Keywords
#      ...    Open SurePass On Browser
#      ...    AND
#      ...    Submit First Login Page
#      ...    AND
#      ...    Get OTP From Mobile APP And Enter It

    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Delete User form the User List if existing      ${inputUserName2}
    Delete SMS From Mobile if already existing for SSP
    Add User2 and retreive login detials
    Add User and retrieve login details
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=7    UserDefinedName=${TokenDefName}      TokenStatus=0
    Web.Click Element    ${ShareTokenLocator}
    sleep    20s
    Share Token with User      ${userFullName2}
    Web. Close All Browsers
    Open ServicePass On Browser
    Submit First SSP Login Page      UserName2=${UserValue2}    Password2=${Passwordvalue2}
    Web.Click Element    ${SendOTPLocator}
    Sleep    ${SleepDelay5s}
    Extract OTP from SMS
    Web.Input Text        ${OTPTextLocator}    ${OTPPasscode}
    Web.Click Element    ${SignInButton}
    Web.Wait Until Page Contains Element        ${SSPLogout}     ${StandardTimeout}
    Sleep    ${SleepDelay5s}
    Web. Close All Browsers
#    Open SurePass On Browser
#    Submit 2FA Page Using Email OTP    6

Verify that an admin user is able to login to ServicePass portal using a shared SMS token
    [Tags]   SHR_SYNC_TKN_022       SurePassID_M2                  SMS_Token
#    [Setup]   Run Keywords       Close All Browsers
#    ...  AND                     Open SurePass On Browser
#    ...  AND                     Submit 2FA Page Using Email OTP    6
#      [Setup]    Run Keywords
#      ...    Open SurePass On Browser
#      ...    AND
#      ...    Submit First Login Page
#      ...    AND
#      ...    Get OTP From Mobile APP And Enter It
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Delete User form the User List if existing      ${inputUserName2}
    Delete SMS From Mobile if already existing for SSP
    Add Admin User2 and retreive login detials
    Add User and retrieve login details
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=7    UserDefinedName=${TokenDefName}      TokenStatus=0
    Web.Click Element    ${ShareTokenLocator}
    sleep    20s
    Share Token with User      ${userFullName2}
    Web. Close All Browsers
    Open ServicePass On Browser
    Submit First SSP Login Page      UserName2=${UserValue2}    Password2=${Passwordvalue2}
    Web.Click Element    ${SendOTPLocator}
    Sleep    ${SleepDelay5s}
    Extract OTP from SMS
    Web.Input Text        ${OTPTextLocator}    ${OTPPasscode}
    Web.Click Element    ${SignInButton}
    Web.Wait Until Page Contains Element        ${SSPLogout}    ${StandardTimeout}
    Sleep    ${SleepDelay5s}
    Web. Close All Browsers
#    Open SurePass On Browser
#    Submit 2FA Page Using Email OTP    6



#########################################################Google Authentication Token################################################################################################

Verify Check OTP functionality with Google Authentication Token
    [Tags]   SHR_SYNC_TKN_002       SurePassID_M2        Google_authenticator
    Add New User with Google Authentication Token
    Add Token in Google Authenticator and extract OTP
    Go To Token Page And Search Token      ${TokenDefName}
    Sleep      ${SleepDelay5s}
    Web.Click Element       xpath://*[text()="${TokenDefName}"]/parent::div/parent::div//*[@src="images/icons-mini/check.png"]
    Open Google Authenticator Application
    ${PinValue}     Mobile.Get Text     ${PinValue}
    log to console   ${PinValue}
    ${Result}=    Remove String    ${PinValue}    ${SPACE}
    Set Global Variable      ${Result}
    Check OTP From Tokens Page for Google Authenticator    ${Result}

Verify the Synchronize Token functionality for Google Authentication token
   [Tags]     SHR_SYNC_TKN_028      SurePassID_M2             Google_authenticator
    Add New User with Google Authentication Token
    Add Token in Google Authenticator and extract OTP
    Verify Token Synchronization with Time Window

###################################################################################AddNewSoftToken############################################################################################
Verify that 6 digit token is displayed on Google Authenticator app when a Google Authenticator Token is created with OTP length 6 which is linked with the app using mobile activation method
     [Tags]     USR_NEW_TKN_043     SurePassID_M2               Google_authenticator
     Add New User with Google Authentication Token
     Add Token in Google Authenticator and extract OTP
     Open Google Authenticator Application
     ${PinValue}     Mobile.Get Text     ${PinValue}
     log to console   ${PinValue}
     ${OTPValue}=    Remove String    ${PinValue}    ${SPACE}
     set global variable      ${OTPValue}
     log to console     ${OTPValue}
     ${appOTPLengthFigure}    Get Length    ${OTPValue}
     log to console        ${appOTPLengthFigure}
     Should Be Equal As Strings          ${appOTPLengthFigure}          6

Verify that a Google Authentication token created with maximum uses as 1 does not allow to be used more than once
     [Tags]     USR_NEW_TKN_049     SurePassID_M2               Google_authenticator
     Add New Admin with Google Authentication Token
     Add Token in Google Authenticator and extract OTP
     Sleep   ${SleepDelay5s}
     Web.Input Text        ${maxUsesDataEditField}       1
     Web.Wait Until Element Is Visible          ${TokenAddButton}        ${StandardTimeout}
     Web.Click Element           ${TokenAddButton}
     Web.Click Element    ${logoutlocator}
     Open SurePass On Browser
     Submit First Login Page for Dummy User
     Open Google Authenticator Application
     Sleep      ${SleepDelay10s}
     ${PinValue1}     Mobile.Get Text     ${PinValue}
     log to console   ${PinValue1}
     ${OTPValue2}=    Remove String    ${PinValue1}    ${SPACE}
     set global variable      ${OTPValue2}
     Web.Wait Until Element Is Visible      ${OtpTextBox}     ${StandardTimeout}
     #Sleep    ${SleepDelay5s}
     Web.Input Text       ${OtpTextBox}       ${OTPValue2}
     Web.Click Element    ${VerifyOtpButton}
     Sleep     ${SleepDelay2s}
     Web.Click Element     ${ClickOnLogout}   #${logoutlocator}
     Mobile.Close Application
     Sleep    20s
     Open Google Authenticator Application
     ${PinValue2}     Mobile.Get Text      ${PinValue}
     log to console   ${PinValue}
     ${OTPValue3}=    Remove String    ${PinValue2}    ${SPACE}
     log to console         ${OTPValue3}
     Submit First Login Page
     Web.Wait Until Element Is Visible      ${OtpTextBox}     ${StandardTimeout}
     Web.Input Text       ${OtpTextBox}      ${OTPValue3}
     Web.Click Element    ${VerifyOtpButton}

#############################################################################SurePass Authenticator Token#############################################################
Verify the Synchronize Token functionality for SurePassID Authentication token
    [Tags]     SHR_SYNC_TKN_030     SurePassID_M2   SurePassId_authenticator    SurePassId_Mobile
    Add New User with SurePassId Authentication Token
    Delete SurePassToken
    Get Token Activation Link And Add It To SurePass Auth App
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    Get SurePassId Token OTP
    Verify Token Synchronization with Time Window

Verify Check OTP functionality with SurePassID Authentication Token
    [Tags]   SHR_SYNC_TKN_004       SurePassID_M2   SurePassId_authenticator    SurePassId_Mobile
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Delete SurePassToken
    Mobile.Close Application
    Add User and retrieve login details
    Go To User Details Page    ${inputUserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha     TokenType=9    UserDefinedName=${TokenDefName}      TokenStatus=0
    Get Token Activation Link And Add It To SurePass Auth App
    Sleep    ${SleepDelay5s}
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    set global variable     ${OTP_Text}
    log to console     ${OTP_Text}
    Go To Token Page And Search Token      ${TokenDefName}
    Web.Click Element       xpath://*[text()="${TokenDefName}"]/parent::div/parent::div//*[@src="images/icons-mini/edit.png"]
    ${Result}=    Remove String    ${OTP_Text}    ${SPACE}
    Check OTP From Tokens Page for AppOTP   ${Result}


###############################################################################DateandTime###########################################################################################

#Verify the Synchronize Token functionality for SurePassID Authentication token of Time OTP Type when time of the phone is set to 5 mins backwards
#    [Tags]     SHR_SYNC_TKN_035        SurePassID_M2
#    Add New User with SurePassId Authentication Token
#    Delete SurePassToken
#    Get Token Activation Link And Add It To SurePass Auth App
#    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
#    Get SurePassId Token OTP
#    Open DateTime Application and Update Time behind an hour
#    Verify Token Synchronization with Time Window        120
#    Repeat Keyword    2 times     Navigate Back
#
#Verify the Synchronize Token functionality for SurePassID Authentication token of Time OTP Type when time of the phone is set to 5 mins backwards
#    [Tags]     SHR_SYNC_TKN_036        SurePassID_M2
#    Reset Current DateTime
#    Add New User with SurePassId Authentication Token
#    Delete SurePassToken
#    Get Token Activation Link And Add It To SurePass Auth App
#    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
#    Get SurePassId Token OTP
#    Open DateTime Application and Update Time ahead an hour
#    Verify Token Synchronization with Time Window        120
#    Repeat Keyword    2 times     Navigate Back
#
#Verify the Synchronize Token functionality for Google Authentication token of Time OTP Type when time of the phone is set to 5 mins backwards
#    [Tags]     SHR_SYNC_TKN_037        SurePassID_M2
#    Reset Current DateTime
#    Add New User with Google Authentication Token
#    Add Token in Google Authenticator and extract OTP
#    Open DateTime Application and Update Time behind an hour
#    Verify Token Synchronization with Time Window        120
#    Repeat Keyword    2 times     Navigate Back
#
#Verify the Synchronize Token functionality for Google Authentication token of Time OTP Type when time of the phone is set to 5 mins forward
#    [Tags]     SHR_SYNC_TKN_038        SurePassID_M2
#    Reset Current DateTime
#    Add New User with Google Authentication Token
#    Add Token in Google Authenticator and extract OTP
#    Open DateTime Application and Update Time ahead an hour
#    Verify Token Synchronization with Time Window        120
#    Repeat Keyword    2 times     Navigate Back
#    Reset Current DateTime
#

################################################Desktop Token#############################################################################################

Verify Check OTP functionality with Desktop Token
    [Tags]  SHR_SYNC_TKN_001        SurePassID_M2
    Add New User with Desktop Token
    Web.Click Element    ${ShareTokenLocator}
    Add Token to Desktop Authenticator and Get OTP
    Go To Tokens Page
    Compare Serial Number Filter with Is     ${TokenDefName}
    Sleep   ${SleepDelay5s}
    Web.Click Element      ${TokenPageEditAction}
    Check OTP From Tokens Page    ${OTPValue}

Verify that a non-admin user is able to login to ServicePass portal using a shared Desktop token
    [Tags]   SHR_SYNC_TKN_013       SurePassID_M2
    [Setup]   Run Keywords       Close All Browsers
    ...  AND                     Open SurePass On Browser
    ...  AND                     Submit 2FA Page Using Email OTP    6
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Delete User form the User List if existing      ${inputUserName2}
    Add User2 and retreive login detials
    Add User and retrieve login details
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName}      TokenStatus=0
    ${IdValue}    Web.Get Value    ${TokenID}
    set global variable      ${IdValue}
    Web.Click Element    ${ShareTokenLocator}
    Share Token with User      ${userFullName2}
    Web. Close All Browsers
    sleep    20s
    Add Token to Desktop Authenticator and Get OTP
    Open ServicePass On Browser
    Submit First SSP Login Page   ${UserValue2}          ${Passwordvalue2}
    Web.Input Text                ${OTPTextLocator}     ${OTPValue}
    Web.Click Element             ${SignInButton}
    Web. Close All Browsers
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6

Verify the Synchronize Token functionality for desktop token
   [Tags]     SHR_SYNC_TKN_027      SurePassID_M2
   Add New User with Desktop Token
   Add Token to Desktop Authenticator and Get OTP
   Verify Token Synchronization with Time Window

Verify that an admin user is able to login to ServicePass portal using a shared Desktop token
    [Tags]     SHR_SYNC_TKN_020     SurePassID_M2
    [Setup]   Run Keywords       Close All Browsers
    ...  AND                     Open SurePass On Browser
    ...  AND                     Submit 2FA Page Using Email OTP    6
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Delete User form the User List if existing      ${inputUserName2}
    Add Admin User2 and retreive login detials
    Add User and retrieve login details
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName}      TokenStatus=0
    ${IdValue}    Web.Get Value    ${TokenID}
    set global variable      ${IdValue}
    Web.Click Element    ${ShareTokenLocator}
    Share Token with User      ${userFullName2}
    Web.Close Window
    sleep    20s
    Add Token to Desktop Authenticator and Get OTP
    Open ServicePass On Browser
    Submit First SSP Login Page   ${UserValue2}          ${Passwordvalue2}
    Web.Input Text                ${OTPTextLocator}     ${OTPValue}
    Web.Click Element             ${SignInButton}
    Close Window
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6









