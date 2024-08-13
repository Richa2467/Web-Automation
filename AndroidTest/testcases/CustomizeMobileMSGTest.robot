*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../locators/CustomizeMobileMSGLocators.robot
Resource    ../resources/CustomizeMobileMSGResource.robot


Suite Setup    Run Keywords    Open SurePass On Browser
...          AND              Submit 2FA Page Using Email OTP    6
Suite Teardown    run keyword    Web.Close All Browsers

*** Test Cases ***
Verify User is able to select 'Twilio' option as a SMS Provider
    [Tags]  CUSTM_MBL_MSG_001           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Select From List By Value            ${SMSProviderDropdown}     ${Twilio}
    Update and Verify Success Message

Verify If select 'Twilio' option as an SMS Provider, User is able to see 'Account SID', 'Auth Token' and 'From Phone Number' fields.
    [Tags]  CUSTM_MBL_MSG_002           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Select From List By Value            ${SMSProviderDropdown}     ${Twilio}
    Web.Wait Until Element Is Visible       ${AccountSIDField}    ${StandardTimeout}
    Web.Wait Until Element Is Visible       ${AuthTokenField}    ${StandardTimeout}
    Web.Wait Until Element Is Visible       ${FrmPhnNoField}    ${StandardTimeout}

Verify User is able to edit each message body.
    [Tags]  CUSTM_MBL_MSG_003           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Select From List By Value            ${SMSProviderDropdown}     ${Twilio}
    Web.Wait Until Element Is Visible       ${SMSServerLgnName}    ${StandardTimeout}
    Web.Clear Element Text	    ${SMSServerLgnName}
    Web.Input Text    ${SMSServerLgnName}    Test Login Name
    Web.Wait Until Element Is Visible       ${SMSServerLgnPw}    ${StandardTimeout}
    Web.Clear Element Text	    ${SMSServerLgnPw}
    Web.Input Text    ${SMSServerLgnPw}    Test Login Password
    Web.Wait Until Element Is Visible       ${CellPhnNo}    ${StandardTimeout}
    Web.Clear Element Text	    ${CellPhnNo}
    Web.Input Text    ${CellPhnNo}    12345

Verify User is able to set default message again for 'Activating a mobile token'.
    [Tags]  CUSTM_MBL_MSG_004           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Clear Element Text	    ${SMSSenderActivationMsgBody}
    Web.Input Text    ${SMSSenderActivationMsgBody}    ${MsgBodyMessage}
    Web.Wait Until Element Is Visible    ${SetDftBtnSMSSendActvn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SetDftBtnSMSSendActvn}

Verify User is able to set default message again for 'Sending One Time Passcode'.
    [Tags]  CUSTM_MBL_MSG_005           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Clear Element Text	    ${SMSCreateTRCTNMsgBody}
    Web.Input Text    ${SMSCreateTRCTNMsgBody}    ${MsgBodyMessage}
    Web.Wait Until Element Is Visible    ${SetDftBtnSMSCreate}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SetDftBtnSMSCreate}

Verify User is able to set default message again for 'Challenge question for push authentication'.
    [Tags]  CUSTM_MBL_MSG_006           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Clear Element Text	    ${SMSUpdtTRCTNStatusMsgBody}
    Web.Input Text    ${SMSUpdtTRCTNStatusMsgBody}    ${MsgBodyMessage}
    Web.Wait Until Element Is Visible    ${SetDftBtnSMSUpdate}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SetDftBtnSMSUpdate}

Verify User is able to set default message again for 'Voice message to send user'.
    [Tags]  CUSTM_MBL_MSG_007           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Clear Element Text	    ${VoiceUsrMsgBody}
    Web.Input Text    ${VoiceUsrMsgBody}    ${MsgBodyMessage}
    Web.Wait Until Element Is Visible    ${SetDftBtnIvrMsg}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SetDftBtnIvrMsg}

Verify User is able to set default message again for 'Voice message when user is approved access'.
    [Tags]  CUSTM_MBL_MSG_008           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Clear Element Text	    ${VoiceMsgAprMBody}
    Web.Input Text    ${VoiceMsgAprMBody}    ${MsgBodyMessage}
    Web.Wait Until Element Is Visible    ${SetDftBtnIvrSuccess}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SetDftBtnIvrSuccess}

Verify User is able to set default message again for 'Voice message when user is denied access'.
    [Tags]  CUSTM_MBL_MSG_009           SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Clear Element Text	    ${VoiceMsgRejectMBody}
    Web.Input Text    ${VoiceMsgRejectMBody}    ${MsgBodyMessage}
    Web.Wait Until Element Is Visible    ${SetDftBtnIvrFailure}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SetDftBtnIvrFailure}

Verify User is able to close Customize Mobile Messages Form.
    [Tags]  CUSTM_MBL_MSG_010     Check      SurePassID_M3   SurePassId_Web
    Go to CustomizeMobileMSG
    Web.Wait Until Element Is Visible    ${CloseBtn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${CloseBtn}
    Web.Wait Until Element Is Visible    ${AccountInformationPage}    ${StandardTimeout}
    Web.Close Browser

Verify If select Service Provider as a 'No Cell Provider' then User does not receive OTP message on mobile.
    [Tags]  CUSTM_MBL_MSG_012     Check      SurePassID_M3   SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Go to CustomizeMobileMSG
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Select From List By Value            ${SMSProviderDropdown}     ${NoCellProvider}
    Update and Verify Success Message
    Click On Logout option
    Web.Close All Browsers
    Open SurePass On Browser
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SendSMSOTPOptn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SendSMSOTPOptn}
    Sleep   ${SleepDelay10s}    # Here we need to add sleep because after click on login, it will take time to appear proper Error
    Web.Wait Until Element Is Visible    ${ErrorMsgBoxOnSecondLgnPage}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${ErrorMsgBoxOnSecondLgnPage}
    Should Be Equal     ${SuccessMsg}      ${CustomizeMobileErrorMsg}
    Web.Close All Browsers

Verify If select Service Provider as a 'Twilio' then User is able to receive OTP message on mobile.
    [Tags]  CUSTM_MBL_MSG_013   Check           SurePassID_M3   SurePassId_Web
    Open SurePass On Browser
    Submit 2FA Page Using Email OTP    6
    Go to CustomizeMobileMSG
    Web.Wait Until Element Is Visible       ${SMSProviderDropdown}    ${StandardTimeout}
    Web.Select From List By Value            ${SMSProviderDropdown}     ${Twilio}
    Update and Verify Success Message
    Click On Logout option
    Web.Close All Browsers
    Open SurePass On Browser
    Submit First Login Page
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SendSMSOTPOptn}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SendSMSOTPOptn}
    Sleep   ${SleepDelay10s}        # Here we need to add sleep because after click on login, it will take time to appear proper Erro
    Web.Wait Until Element Is Visible    ${SuccessMsgBar}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${SuccessMsgBar}
    Should Be Equal     ${SuccessMsg}   ${PasscodesuccessMsg}
