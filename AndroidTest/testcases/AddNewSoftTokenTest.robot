*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/AddNewSoftTokenResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/AndroidResource.robot
Resource    ../resources/DesktopAuthenticatorResource.robot

Library    ApplicationLibrary.DesktopLibrary     WITH NAME       Windows

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword   Web.Close All Browsers

*** Test Cases ***
Verify User should not be able to edit Printed Serial Number and Internal Serial Number when Desktop Token is selected.
    [Tags]  USR_NEW_TKN_001     SurePassID_M1   SurePassId_Web
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${DesktopToken}
    Try to edit Printed Serial and Internal Serial Number Field

Verify User should not be able to edit Initial Counter field when Desktop Token is selected.
    [Tags]  USR_NEW_TKN_002     SurePassID_M1   SurePassId_Web
    Select OTP Type  ${EventOath}
    Check Inital Counter Edit Field

Verify User should not be able to edit Starting Time [T0] (secs.) field when Desktop Token is selected and OTP Type is Time (Oath)
    [Tags]  USR_NEW_TKN_005     SurePassID_M1   SurePassId_Web
    Select OTP Type  ${selectTimeOath}
    Check Starting Time Edit Field

Verify User should not be able to edit Starting Time [T0] (secs.) field when Desktop Token is selected and should be able to edit PIN field and OTP type is Time + PIN (Oath)
    [Tags]  USR_NEW_TKN_008     SurePassID_M1   SurePassId_Web
    Wait Until the Update Icon Disappear
    Select OTP Type  ${selectTimePINOath}
    Check Starting Time Edit Field

Verify User is able to create a desktop token with default values of the form
    [Tags]  USR_NEW_TKN_010     SurePassID_M1   SurePassId_Web
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${DesktopToken}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a desktop token with a user-defined token name
    [Tags]  USR_NEW_TKN_011     SurePassID_M1   SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker6
    [Teardown]    Delete Token If Existing    Tinker6

Verify User is able to create a Fido token with default values of the form
    [Tags]  USR_NEW_TKN_012     SurePassID_M1   SurePassId_Web      123
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectFidoToken}
    Click on Add button
    Verify Device/Token added Success Message receive or not
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Fido token with a user-defined token name
    [Tags]  USR_NEW_TKN_013     SurePassID_M1   SurePassId_Web      123
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectFidoToken}
    Enter User Define Name    TestGoogleAuthTknName
    Wait Until the Update Icon Disappear
    Click on Add button
    Verify Device/Token added Success Message receive or not
    #Add Token To The User Account    TokenType=${selectFidoToken}    UserDefinedName=TestFidoAuthTknName
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Google Authentication token with default values of the form
    [Tags]  USR_NEW_TKN_014     SurePassID_M1   SurePassId_Web
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectGoogleAuthToken}
    Wait Until the Update Icon Disappear
    Click on Add button
    Verify Device/Token added Success Message receive or not
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Google Authentication token with a user-defined token name
    [Tags]  USR_NEW_TKN_015     SurePassID_M1   SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectGoogleAuthToken}    UserDefinedName=TestGoogleAuthTknName
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Nymi Band token with default values of the form
    [Tags]  USR_NEW_TKN_016     SurePassID_M1   SurePassId_Web
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectNymiBand}
    Wait Until the Update Icon Disappear
    Click on Add button
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Nymi Band token with a user-defined token name
    [Tags]  USR_NEW_TKN_017     SurePassID_M1   SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectNymiBand}    UserDefinedName=TestNymiBandTknName
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a SMS token with default values of the form
    [Tags]  USR_NEW_TKN_018     SurePassID_M1   SurePassId_Web
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectSMSToken}
    Wait Until the Update Icon Disappear
    Click on Add button
    Verify Device/Token added Success Message receive or not
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a SMS token with a user-defined token name
    [Tags]  USR_NEW_TKN_019     SurePassID_M1   SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSMSToken}    UserDefinedName=TestSMSTknName
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a SurePassID Authentication token with default values of the form
    [Tags]  USR_NEW_TKN_020     SurePassID_M1   SurePassId_Web
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectSurePassIDAuthToken}
    Wait Until the Update Icon Disappear
    Click on Add button
    Verify Device/Token added Success Message receive or not
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a SurePassID Authentication token with a user-defined token name
    [Tags]  USR_NEW_TKN_021     SurePassID_M1   SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectSurePassIDAuthToken}    UserDefinedName=TestSPIDAuthTknName
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Voice Message OTP token with default values of the form
    [Tags]  USR_NEW_TKN_022     SurePassID_M1   SurePassId_Web
    Click on Home Tab
    Go To User Details Page     ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${selectVoiceMessageOTP}
    Wait Until the Update Icon Disappear
    Click on Add button
    Verify Device/Token added Success Message receive or not
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

Verify User is able to create a Voice Mesage OTP token with a user-defined token name
    [Tags]  USR_NEW_TKN_023     SurePassID_M1   SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${selectVoiceMessageOTP}    UserDefinedName=TVoiceMsgOTPTknName
    #Verified Success Message For Token      ${SuccessMessageToken}
    ${TokenSerialNumber}    Get Printed Serial Number
    Delete Token If Existing    ${TokenSerialNumber}

#****************************************************** Instant Activation Link TCs ***********************************************#

Verify that 3 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 3 and a user-defined name which is linked with the app using instant activation link
    [Tags]  USR_NEW_TKN_037     SurePassID_M1   SurePassId_Mobile
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select OTP length   ${3DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePass3
    Web.Click Element    ${InstantActivationIcon}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open Test Application
    sleep    ${SleepDelay5s}
    Open Browser With Activation Link       ${TokenActivationLink}
    sleep   ${SleepDelay5s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePass3

Verify that 4 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 4 and a user-defined name which is linked with the app using instant activation link
    [Tags]  USR_NEW_TKN_038     SurePassID_M1   SurePassId_Mobile
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select OTP length   ${4DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePass4
    Web.Click Element    ${InstantActivationIcon}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open Test Application
    sleep    ${SleepDelay2s}
    Open Browser With Activation Link    ${TokenActivationLink}
    sleep   ${SleepDelay2s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePass4

Verify that 6 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 6 and a user-defined name which is linked with the app using instant activation link
    [Tags]  USR_NEW_TKN_039     SurePassID_M1   SurePassId_Mobile
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select OTP length   ${6DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePass6
    Web.Click Element    ${InstantActivationIcon}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open Test Application
    sleep    ${SleepDelay2s}
    Open Browser With Activation Link    ${TokenActivationLink}
    sleep   ${SleepDelay2s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePass6

Verify that 8 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 8 and a user-defined name which is linked with the app using instant activation link
    [Tags]  USR_NEW_TKN_040     SurePassID_M1   SurePassId_Mobile
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select OTP length   ${8DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePass8
    Web.Click Element    ${InstantActivationIcon}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open Test Application
    sleep    ${SleepDelay2s}
    Open Browser With Activation Link    ${TokenActivationLink}
    sleep   ${SleepDelay2s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePass8

Verify that 10 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 10 and a user-defined name which is linked with the app using instant activation link
    [Tags]  USR_NEW_TKN_041     SurePassID_M1   SurePassId_Mobile
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select OTP length   ${10DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePass10
    Web.Click Element    ${InstantActivationIcon}
    Web.Wait Until Element Is Visible    ${ActivationText}    ${StandardTimeout}
    ${TokenActivationLink}    Web.Get Text    ${ActivationText}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open Test Application
    sleep    ${SleepDelay2s}
    Open Browser With Activation Link    ${TokenActivationLink}
    sleep   ${SleepDelay2s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePass10

##******************************** This TC use Desktop Auth Application for login purpose ******************************#
Verify that a Desktop token created with maximum uses as 1 does not allow to be used more than once
    [Tags]  USR_NEW_TKN_047     SurePassID_M10   SurePassId_Desktop
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Sleep   ${SleepDelay5s}
    Select Token Type on Add Token Page     ${DesktopToken}
    Edit Maximum Uses Field     1
    Click on Add button
    Verify User added Success Message receive or not
    ${TokenIDValue}      Web.Get Value      ${TokenID}
    Open Desktop Authenticator
    sleep    ${SleepDelay5s}
    Windows.Click Element        ${DeskAddToken}
    Windows.Input Text           ${FriendlyName}       Desktop Token 1
    Windows.Input Text           ${DeskTokenId}         ${TokenIdValue}
    Windows.Click Element        ${ActivateToken}
    Windows.Click Element        ${DeskCopyButton}
    ${status}    Run Keyword And Return Status      Login through Desktop Authenticator Application     ${NoofLogin}
    Should Be Equal     '${status}'       'False'
    [Teardown]    Delete Desktop Token

##****************************** This TC use SurePassId mobile App for login purpose  **********************************#
Verify that desktop token ID is received when sent using Email
    [Tags]  USR_NEW_TKN_051     SurePassID_M10   SurePassId_Desktop
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Select Token Type on Add Token Page     ${DesktopToken}
    Click on Add button
    ${TokenID}  Get Token ID
    Click on Email Icon beside Token ID
    Check Received Email Message    ${TokenID}

##*************************************************** Token Activation SMS on Mobile TCs *****************************************#

Verify that 3 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 3 which is linked with the app using mobile activation method
    [Tags]  USR_NEW_TKN_032     SurePassID_M1_SMS
    Delete User form the User List if existing      ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Click on Add button
    Verify User added Success Message receive or not
    Go To User Details Page    ${inputUserName}
    Go To Add New Soft Token Page From User Details Page
    Sleep   ${SleepDelay5s}
    Select OTP length   ${3DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePassSMS3
    Web.Click Element    ${smsToPhoneOptn}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open SMS Application
    sleep    ${SleepDelay2s}
    Mobile.Wait Until Element Is Visible    ${SMSTitleVMSURJTQ}
    Mobile.Click Element    ${SMSTitleVMSURJTQ}
    Mobile.Wait Until Element Is Visible    ${getTextFromSMS}
    ${textFromSMS}      Mobile.Get Text    ${getTextFromSMS}
    ${SMSActivationLink}    Remove String	    ${textFromSMS}      The token activation code for your account is:
    Delete SMS From Mobile
    Open Test Application
    sleep    ${SleepDelay5s}
    Open Browser With Activation Link       ${SMSActivationLink}
    sleep   ${SleepDelay5s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePassSMS3

Verify that 4 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 4 which is linked with the app using mobile activation method
    [Tags]  USR_NEW_TKN_033     SurePassID_M1_SMS
    Delete User form the User List if existing      ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Click on Add button
    Verify User added Success Message receive or not
    Go To User Details Page    ${inputUserName}
    Go To Add New Soft Token Page From User Details Page
    Sleep   ${SleepDelay5s}
    Select OTP length   ${4DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePassSMS4
    Web.Click Element    ${smsToPhoneOptn}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open SMS Application
    sleep    ${SleepDelay2s}
    Mobile.Wait Until Element Is Visible    ${SMSTitleVMSURJTQ}
    Mobile.Click Element    ${SMSTitleVMSURJTQ}
    Mobile.Wait Until Element Is Visible    ${getTextFromSMS}
    ${textFromSMS}      Mobile.Get Text    ${getTextFromSMS}
    ${SMSActivationLink}    Remove String	    ${textFromSMS}      The token activation code for your account is:
    Delete SMS From Mobile
    Open Test Application
    sleep    ${SleepDelay5s}
    Open Browser With Activation Link       ${SMSActivationLink}
    sleep   ${SleepDelay5s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePassSMS4

Verify that 6 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 6 which is linked with the app using mobile activation method
    [Tags]  USR_NEW_TKN_034     SurePassID_M1_SMS
    Delete User form the User List if existing      ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Click on Add button
    Verify User added Success Message receive or not
    Go To User Details Page    ${inputUserName}
    Go To Add New Soft Token Page From User Details Page
    Sleep   ${SleepDelay5s}
    Select OTP length   ${6DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePassSMS6
    Web.Click Element    ${smsToPhoneOptn}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open SMS Application
    sleep    ${SleepDelay2s}
    Mobile.Wait Until Element Is Visible    ${SMSTitleVMSURJTQ}
    Mobile.Click Element    ${SMSTitleVMSURJTQ}
    Mobile.Wait Until Element Is Visible    ${getTextFromSMS}
    ${textFromSMS}      Mobile.Get Text    ${getTextFromSMS}
    ${SMSActivationLink}    Remove String	    ${textFromSMS}      The token activation code for your account is:
    Delete SMS From Mobile
    Open Test Application
    sleep    ${SleepDelay5s}
    Open Browser With Activation Link       ${SMSActivationLink}
    sleep   ${SleepDelay5s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePassSMS6

Verify that 8 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 8 which is linked with the app using mobile activation method
    [Tags]  USR_NEW_TKN_035     SurePassID_M1_SMS
    Delete User form the User List if existing      ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Click on Add button
    Verify User added Success Message receive or not
    Go To User Details Page    ${inputUserName}
    Go To Add New Soft Token Page From User Details Page
    Sleep   ${SleepDelay5s}
    Select OTP length   ${8DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePassSMS8
    Web.Click Element    ${smsToPhoneOptn}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open SMS Application
    sleep    ${SleepDelay2s}
    Mobile.Wait Until Element Is Visible    ${SMSTitleVMSURJTQ}
    Mobile.Click Element    ${SMSTitleVMSURJTQ}
    Mobile.Wait Until Element Is Visible    ${getTextFromSMS}
    ${textFromSMS}      Mobile.Get Text    ${getTextFromSMS}
    ${SMSActivationLink}    Remove String	    ${textFromSMS}      The token activation code for your account is:
    Delete SMS From Mobile
    Open Test Application
    sleep    ${SleepDelay5s}
    Open Browser With Activation Link       ${SMSActivationLink}
    sleep   ${SleepDelay5s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePassSMS8

Verify that 10 digit token is displayed on SurePassID Authenticator app when a SurePassID Authenticator Token is created with OTP length 10 which is linked with the app using mobile activation method
    [Tags]  USR_NEW_TKN_036     SurePassID_M1_SMS
    Delete User form the User List if existing      ${inputUserName}
    Click on New Option
    Provide required details for the new Admin user
    Select Admin option
    Click on Add button
    Verify User added Success Message receive or not
    Go To User Details Page    ${inputUserName}
    Go To Add New Soft Token Page From User Details Page
    Sleep   ${SleepDelay5s}
    Select OTP length   ${10DOTPlength}
    Add Token To The User Account    TokenType=9    UserDefinedName=SurePassSMS10
    Web.Click Element    ${smsToPhoneOptn}
    ${OriginalOTPLength}    Web.Get Text    ${OTPLengthSelected}
    Open SMS Application
    sleep    ${SleepDelay2s}
    Mobile.Wait Until Element Is Visible    ${SMSTitleVMSURJTQ}
    Mobile.Click Element    ${SMSTitleVMSURJTQ}
    Mobile.Wait Until Element Is Visible    ${getTextFromSMS}
    ${textFromSMS}      Mobile.Get Text    ${getTextFromSMS}
    ${SMSActivationLink}    Remove String	    ${textFromSMS}      The token activation code for your account is:
    Delete SMS From Mobile
    Open Test Application
    sleep    ${SleepDelay5s}
    Open Browser With Activation Link       ${SMSActivationLink}
    sleep   ${SleepDelay5s}
    Press Enter Key
    ${status}    Run Keyword And Return Status    Mobile.Wait Until Page Contains Element    ${OpenWithSPAuthApp}
    Run Keyword If    '${status}' == 'True'    Select SurePass As Default On Browser
    Mobile.Wait Until Element Is Visible    ${SurePassTokenValue}    ${StandardTimeout}
    ${OTP_Text}    Mobile.Get Text    ${SurePassTokenValue}
    ${otpTextLength}    Get Regexp Matches    ${OriginalOTPLength}    \\d+
    ${appOTPLength}    Remove String Using Regexp    ${OTP_Text}    \\s+
    ${appOTPLengthFigure}    Get Length    ${appOTPLength}
    should be equal as strings    ${otpTextLength}[0]    ${appOTPLengthFigure}
    sleep    ${SleepDelay5s}
    [Teardown]    Run Keywords    Mobile.Close Application
    ...           AND    Delete SurePassToken
    ...           AND    Delete Token If Existing    SurePassSMS10

#**********************************************************************************************************************#
