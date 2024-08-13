*** Settings ***
Resource    ../locators/TokenGroupLocator.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/AndroidResource.robot
Resource    ../resources/SettingsPageResource.robot

Suite Setup    Run Keywords
...    Open SurePass On Browser
...    AND
...    Submit First Login Page
...    AND
...    Get OTP From Mobile APP And Enter It
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify User is able to add the first token and recieve henceforth notifications after allowing the notifications permission.
    [Tags]    Android_Auth_007    SurePassID_M1    SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha    UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    //*[@id="btTapAuthPush"]    ${StandardTimeout}
    Web.Click Element    //*[@id="btTapAuthPush"]
    sleep    ${SleepDelay2s}
    Open Notification Panel
    Approve Push Notification
    sleep      ${SleepDelay2s}
    Close Notification Panel
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
    sleep    ${SleepDelay5s}
#    [Teardown]    Run Keywords    Mobile.Close Application
#      ...     AND     Delete SurePassToken
#       ...     AND    Web.Close All Browsers
#       ...     AND    Open SurePass On Browser
#       ...     AND    Open Test Application
#
#       ...     AND    Get OTP From Mobile APP And Enter It
#      ...     AND    Delete Token If Existing    ${TokenSerialNo}
#      ...     AND    Delete Token If Existing    Tinker30
#       Suite Teardown    Close All Browsersr

#    Go To User Details Page    ${UserName}
#    Go To Add New Soft Token Page From User Details Page
#    Add Token To The User Account       UserDefinedName=Tinker30    AuthType=2
#    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
#    Get Token Activation Link And Add It To SurePass Auth App
#    Click On Logout option
#    Submit First Login Page
#    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
#    Web.Wait Until Element Is Visible    //*[@id="btTapAuthPush"]    ${StandardTimeout}
#    Web.Click Element    //*[@id="btTapAuthPush"]
#    sleep    ${SleepDelay2s}
#    Open Test Application
#    Open Notification Panel
#    Open Test Application
#    Approve Push Notification
#
#    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
#  Run Keywords     Open Test Application
#     ...     AND
#     ...     Delete SurePassToken
#     ...     AND
#     ...     Web.Close All Browsers
#     ...     AND
#     ...     Open SurePass On Browser
#     ...     AND
#     ...     Submit First Login Page
#     ...     AND
#     ...     Get OTP From Mobile APP And Enter It
#     ...     AND    Delete Token If Existing    ${TokenSerialNo}
#     ...     AND    Delete Token If Existing    Tinker30
#
#    Suite Teardown    Close All Browsersr



#         Submit First Login Page
#         Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
#         Web.Wait Until Element Is Visible    //*[@id="btTapAuthPush"]    ${StandardTimeout}
#         Web.Click Element    //*[@id="btTapAuthPush"]
#         sleep    ${SleepDelay2s}
#         Open Notification Panel
#         Approve Push Notification
#         Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
#         [Teardown]    Run Keywords    Mobile.Close Application
##      ...     AND    Delete SurePassToken
#       ...     AND    Web.Close All Browsers
#       ...     AND    Open SurePass On Browser
#       ...     AND    Open Test Application
#
#       ...     AND    Get OTP From Mobile APP And Enter It
##      ...     AND    Delete Token If Existing    ${TokenSerialNo}
##      ...     AND    Delete Token If Existing    Tinker30
#       Suite Teardown    Close All Browsersr




Verify User should be able to add Token and receive Notifications in case Notification setting is approved from Settings page of Android.
    [Tags]    Android_Auth_009    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Send Push Notification
    sleep    ${SleepDelay5s}
    Open Notification Panel
    Approve Push Notification
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
#    [Teardown]    Run Keywords    Mobile.Close Application
#     ...     AND    Delete SurePassToken
#     ...     AND    Web.Close All Browsers
#     ...     AND    Open SurePass On Browser
#     ...     AND    Submit 2FA Page Using Email OTP    6
#     ...     AND    Delete Token If Existing    ${TokenSerialNo}
#     ...     AND    Delete Token If Existing    Tinker30

Verify the notification received even if the Android Authenticator app is open.
    [Tags]    Android_Auth_011    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Send Push Notification
    sleep    ${SleepDelay5s}


    Open Notification Panel
    Approve Push Notification
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
#    [Teardown]    Run Keywords    Mobile.Close Application
#    ...     AND    Delete SurePassToken
#    ...     AND    Web.Close All Browsers
#    ...     AND    Open SurePass On Browser
#    ...     AND    Submit 2FA Page Using Email OTP    6
#    ...     AND    Delete Token If Existing    ${TokenSerialNo}
#    ...     AND    Delete Token If Existing    Tinker30

Verify the notification received even if the Android Authenticator app is closed.
    [Tags]    Android_Auth_012    SurePassID_M101     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Mobile.Close Application
#    Open Eribank Application
    Click On Logout option
    Submit First Login Page
    Send Push Notification
    sleep    ${SleepDelay2s}
    Open Notification Panel
    Approve Push Notification
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
#    [Teardown]    Run Keywords    Close Notification Panel
#    ...     AND    Mobile.Close Application
#    ...     AND    Delete SurePassToken
#    ...     AND    Web.Close All Browsers
#    ...     AND    Open SurePass On Browser
#    ...     AND    Submit 2FA Page Using Email OTP    6
#    ...     AND    Delete Token If Existing    ${TokenSerialNo}
#    ...     AND    Delete Token If Existing    Tinker30

Verify the notification received even if the device is locked.
    [Tags]    Android_Auth_013    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Accept Push Notification After Phone Is Locked
#    [Teardown]    Run Keywords    Mobile.Close Application
#    ...     AND    Delete SurePassToken
#    ...     AND    Web.Close All Browsers
#    ...     AND    Open SurePass On Browser
#    ...     AND    Submit 2FA Page Using Email OTP    6
#    ...     AND    Delete Token If Existing    ${TokenSerialNo}
#     ...     AND    Delete Token If Existing    Tinker30

Verify the notification received even if another app is in use.
    [Tags]    Android_Auth_014    SurePassID_M101     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
#    Open Eribank Application
    Click On Logout option
    Submit First Login Page
    Send Push Notification
    sleep    ${SleepDelay5s}
    Open Notification Panel
    Approve Push Notification
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
#    [Teardown]    Run Keywords    Mobile.Close Application
#    ...     AND    Delete SurePassToken
#    ...     AND    Web.Close All Browsers
#    ...     AND    Open SurePass On Browser
#    ...     AND    Submit 2FA Page Using Email OTP    6
#    ...     AND    Delete Token If Existing    ${TokenSerialNo}
#    ...     AND    Delete Token If Existing    Tinker30

Verify User is able to register new assigned Token by accessing the instant link available.
    [Tags]    Android_Auth_018    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha  UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    [Teardown]    Run Keywords     Mobile.Close Application
    ...     AND    Delete SurePassToken
    ...     AND    Delete Token If Existing    ${TokenSerialNo}
    ...     AND    Delete Token If Existing    Tinker30

Verify User is able to re-add the Token to mobile application after deleting.
    [Tags]    Android_Auth_019    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing   Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha    UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Mobile.Close Application
    Delete SurePassToken
    Search The Token And Reset It   ${TokenSerialNo}
    Get Token Activation Link And Add It To SurePass Auth App
    [Teardown]    Run Keywords   Delete SurePassToken
    ...     AND    Delete Token If Existing    ${TokenSerialNo}
    ...     AND    Delete Token If Existing    Tinker30

Verify User should be able to login using linked token.
    [Tags]    Android_Auth_020    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha   UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Open Test Application
    ${AppOTP}   Mobile.Get Text    ${GetAppOTP}
    sleep    40s
    Enter OTP On 2FA Page    ${AppOTP}
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
    [Teardown]    Run Keywords    Delete SurePassToken
    ...     AND    Delete Token If Existing    ${TokenSerialNo}
    ...     AND    Delete Token If Existing    Tinker30
    ...     AND    Web.Close All Browsers


Verify user is not able to proceed with login using expired OTP.
    [Tags]    Android_Auth_021    SurePassID_M1     SurePassId_Mobile
#    [Setup]    Run Keywords    Open SurePass On Browser    AND
#    ...           Submit 2FA Page Using Email OTP    6
#    AND
#    [Setup]    Run Keywords    Open SurePass On Browser    AND
#     ...    Submit First Login Page
#     ...    AND
#     ...    Get OTP From Mobile APP And Enter It
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha  UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Open Test Application
    ${AppOTP}   Mobile.Get Text    ${GetAppOTP}
    sleep    120s
    Enter OTP On 2FA Page    ${AppOTP}
    sleep    ${SleepDelay5s}
    Web.Page Should Not Contain Element    ${HomeTab}    ${StandardTimeout}
    [Teardown]    Run Keywords    Delete SurePassToken
#    ...     AND    Delete Token If Existing    ${TokenSerialNo}
#    ...     AND    Delete Token If Existing    Tinker30

Verify user is NOT able to login with same OTP again if it has not expired.
    [Tags]    Android_Auth_022    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha   UserDefinedName=Tinker30    AuthType=2    OTPWindowSize=240
    sleep    20s
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Open Test Application
    ${AppOTP}    Mobile.Get Text    ${GetAppOTP}
    Enter OTP On 2FA Page    ${AppOTP}
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
    Click On Logout option
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Open Test Application
    Enter OTP On 2FA Page    ${AppOTP}
    sleep    ${SleepDelay5s}
    Web.Page Should Not Contain Element    ${HomeTab}    ${StandardTimeout}
    Open Test Application
    [Teardown]    Run Keywords     Delete SurePassToken
#    ...     AND    Delete Token If Existing    ${TokenSerialNo}
#    ...     AND    Delete Token If Existing    Tinker30
    ...     AND    Web.Close All Browsers

Verify user is able to login with Push notification
    [Tags]    Android_Auth_023    SurePassID_M1     SurePassId_Mobile
#    [Setup]    Run Keywords    Open SurePass On Browser    AND
#    ...           Submit 2FA Page Using Email OTP    6
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha    UserDefinedName=Tinker30    AuthType=2    OTPWindowSize=120
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Send Push Notification
    sleep    ${SleepDelay5s}
    Open Notification Panel
    Approve Push Notification
    Close Notification Panel
    Web.Wait Until Element Is Enabled    ${HomeTab}    ${StandardTimeout}
    [Teardown]    Run Keywords    Delete SurePassToken
    ...     AND    Delete Token If Existing    ${TokenSerialNo}
    ...     AND    Delete Token If Existing    Tinker30

Verify User is able to delete Token from the application
    [Tags]    Android_Auth_028    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha   UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Delete SurePassToken
    [Teardown]    Run Keywords      Delete Token If Existing    ${TokenSerialNo}
    ...     AND    Delete Token If Existing    Tinker30

Verify User is able to copy Token value from the Android Authenticator
    [Tags]    Android_Auth_029    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha    UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Copy SurePassToken Value
    [Teardown]    Run Keywords      Delete Token If Existing    ${TokenSerialNo}
    ...     AND     Delete Token If Existing    Tinker30

Verify User is able to update Token name
    [Tags]    Android_Auth_030    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha  UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Open Test Application
    Edit SurePassToken Name    Tinker30
    Mobile.Wait Until Element Is Visible    ${TokenNameText}
    ${updatedName}    Mobile.Get Text    ${TokenNameText}
    Should Be Equal As Strings    ${updatedName}    Tinker30
    [Teardown]      Run Keywords    Delete Token If Existing    ${TokenSerialNo}
    ...     AND     Delete Token If Existing    Tinker30

If token is deleted from the SurePassID token, it should not be able accessible from SurePass mobile application.
    [Tags]    Android_Auth_027    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha   UserDefinedName=Tinker30    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Delete Token If Existing    ${TokenSerialNo}
    Click On Logout option
    Submit First Login Page
    Open Test Application
    ${AppOTP}   Mobile.Get Text    ${GetAppOTP}
    Web.Input Text    //*[@id="tbxOTP"]    ${AppOTP}
    Web.Click Element    //*[@id="btnVerifyOtp"]
    sleep    ${SleepDelay5s}
    Web.Page Should Not Contain Element    ${HomeTab}
#    [Teardown]    Run Keywords    Web.Close All Browsers
#    ...     AND                   Open SurePass On Browser
#    ...     AND                   Submit 2FA Page Using Email OTP    6
#    ...     AND                   Delete Token If Existing    ${TokenSerialNo}
#    ...     AND                   Delete Token If Existing    Tinker30

Verify on Rejecting Push Notification, user should not be able to login.
    [Tags]    Android_Auth_024    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    AuthType=2    OTPWindowSize=120
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
#    Open Notification Panel
    Send Push Notification
    sleep    ${SleepDelay2s}
    Open Notification Panel
    Reject Push Notification
    Close Notification Panel
    sleep    ${SleepDelay5s}
    Web.Page Should Not Contain Element    ${HomeTab}
#    [Teardown]    Run Keywords    Web.Close All Browsers
#    ...     AND                   Open SurePass On Browser
#    ...     AND                   Submit 2FA Page Using Email OTP    6
#    ...     AND                   Delete Token If Existing    ${TokenSerialNo}
#    ...     AND                   Delete Token If Existing    Tinker30

Verify User is only able to login with latest Push Notification received.
    [Tags]    Android_Auth_025    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    AuthType=2    OTPWindowSize=120
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
    Send Push Notification
    Web.Wait Until Element Is Visible    //*[@id="btnCancelPush"]    ${StandardTimeout}
    Web.Click Element    //*[@id="btnCancelPush"]
    sleep    ${SleepDelay5s}
    Send Push Notification
    sleep    ${SleepDelay5s}
    Open Notification Panel
    Approve Push Notification
    # Accept The First Notification
    Close Notification Panel
    Web.Wait Until Element Is Visible    ${HomeTab}    ${StandardTimeout}
    Web.Page Should Contain Element    ${HomeTab}
#    [Teardown]    Run Keywords    Web.Close All Browsers
#    ...     AND                   Open SurePass On Browser
#    ...     AND                   Submit 2FA Page Using Email OTP    6
#    ...     AND                   Delete Token If Existing    ${TokenSerialNo}
#    ...     AND                   Delete Token If Existing    Tinker30

Verify proper validation message is received by user, incase Push notification gets time-out.
    [Tags]    Android_Auth_026    SurePassID_M1     SurePassId_Mobile
    Delete Token If Existing    Tinker30
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker30    AuthType=2    OTPWindowSize=120
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Get Token Activation Link And Add It To SurePass Auth App
    Click On Logout option
    Submit First Login Page
#    Open Notification Panel
    Send Push Notification
    sleep    60s
    Web.Wait Until Element Is Visible    ${PushAuthError}    ${StandardTimeout}
    Web.Page Should Contain Element    ${PushAuthError}
#    [Teardown]    Run Keywords    Web.Close All Browsers
#    ...     AND                   Open SurePass On Browser
#    ...     AND                   Submit 2FA Page Using Email OTP    6
#    ...     AND                   Delete Token If Existing    ${TokenSerialNo}
#    ...     AND                   Close Notification Panel
#    ...     AND                   Delete SurePassToken
#    ...     AND                   Delete Token If Existing    Tinker30

