*** Settings ***
Resource    /home/richatyagi/PycharmProjects/pythonProject/AndroidTest/resources/LoginPageResource.robot
Resource    /home/richatyagi/PycharmProjects/pythonProject/AndroidTest/resources/UsersPageResource.robot
Resource    /home/richatyagi/PycharmProjects/pythonProject/AndroidTest/resources/TokenPageResource.robot
Resource    /home/richatyagi/PycharmProjects/pythonProject/AndroidTest/resources/AndroidResource.robot
Resource    /home/richatyagi/PycharmProjects/pythonProject/AndroidTest/resources/SettingsPageResource.robot

Suite Setup    Run Keywords
...    Open SurePass On Browser
...    AND
...    Submit First Login Page
...    AND
...    Get OTP From Mobile APP And Enter It
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify User is able promoted to Access Camera permissions.
    [Tags]    Android_Auth_003    SurePassID_M1_S   SurePassId_Mobile
    Open Test Application With Reset
    Mobile.Wait Until Element Is Visible    ${SurePassScanQRCodeButton}
    Mobile.Click Element    ${SurePassScanQRCodeButton}
    Mobile.Wait Until Page Contains Element    ${CamPermissionAllow}
    Mobile.Page Should Contain Element    ${CamPermissionAllow}

Verify application functions properly , incase Camera access is denied.
    [Tags]    Android_Auth_005    SurePassID_M1_S   SurePassId_Mobile
    Mobile.Click Element    ${CamPermissionDeny}
    Mobile.Wait Until Page Contains Element    ${CameraWarnMessage}
    Mobile.Page Should Contain Text    Camera permissions are required to scan QR Codes.
    ## change from ok to Notnow
    Mobile.Click Element    ${CameraWarnMessageNotNow}
    Mobile.Wait Until Element Is Visible    ${SurePassScanQRCodeButton}
    Mobile.Page Should Contain Element    ${SurePassScanQRCodeButton}

Verify User is prompted again in case user attempts to scan QR code with denied camera permission.
    [Tags]    Android_Auth_006    SurePassID_M1_S   SurePassId_Mobile
    Mobile.Page Should Contain Element    ${SurePassScanQRCodeButton}
    Mobile.Click Element    ${SurePassScanQRCodeButton}
    ##added
    Mobile.Click Element    ${CameraWarnMessageOK}
    Mobile.Wait Until Page Contains Element    ${CamPermissionAllow}
    Mobile.Page Should Contain Element    ${CamPermissionAllow}
    Mobile.Click Element    ${CamPermissionDeny1}

Verify User is not able to add Token incase Permission of Notification is not allowed for the first time.
    [Tags]    Android_Auth_008    SurePassID_M1_S   SurePassId_Mobile
    sleep    ${SleepDelay2s}
#  Added Go to settings
    Mobile.Click Element    ${CameraWarnMessageGotoSettings}
    Turn Authenticator Notification Off
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    UserDefinedName=Tinker31    AuthType=2
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    set global variable    ${TokenSerialNo}
    Get Token Activation Link And Add It To SurePass Auth App
#    Mobile.Wait Until Element Is Visible     ${CameraWarnMessageOK}
#    Mobile.Click Element    ${CameraWarnMessageOK}
    Open Test Application
    Mobile.Wait until page does not contain element    ${SurePassTokenValue}

#
#
#
    # Failing in the previous step because the token should not get added when notification is off

Verify User does not receive Notifications in case Notifications are switched OFF from settings
    [Tags]    Android_Auth_010    SurePassID_M1_S   SurePassId_Mobile
    Click On Logout option
    Submit First Login Page
    Send Push Notification
    sleep    ${SleepDelay5s}
    Open Notification Panel
    Mobile.Page Should Not Contain Element    ${ExpandPush}
#    [Teardown]    Run Keywords    Close Notification Panel
#    ...     AND    Mobile.Close Application
#    ...     AND    Delete SurePassToken
#    ...     AND    Turn Authenticator Notification On
#    ...     AND    Delete Token If Existing    ${TokenSerialNo}