*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../locators/MFAOptionsPortalLoginLocator.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/OpenSystemAlertResource.robot

*** Keywords ***
Page should contain All MFA Options For Portal Login Page
    Web.Wait Until Element Is Visible   ${OathPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${OathPush_MFA}
    Web.Wait Until Element Is Visible   ${VoicePush_MFA}    ${StandardTimeout}
    Web.Page Should Contain Element     ${VoicePush_MFA}
    Web.Wait Until Element Is Visible   ${SmsOtpPush_MFA}   ${StandardTimeout}
    Web.Page Should Contain Element     ${SmsOtpPush_MFA}
    Web.Wait Until Element Is Visible   ${VoiceOtpPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${VoiceOtpPush_MFA}
    Web.Wait Until Element Is Visible   ${EmailOtpPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${EmailOtpPush_MFA}
    Web.Wait Until Element Is Visible   ${SmsYesNOPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${SmsYesNOPush_MFA}

Select Send Sms OTP Option
    Web.Wait Until Element Is Visible   ${SendSmsOtp_MFA}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SendSmsOtp_MFA}

Select Send Email Otp
    Web.Wait Until Element Is Visible   ${SendEmailOtp_MFA}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SendEmailOtp_MFA}

Select Voice Otp
    Web.Wait Until Element Is Visible   ${VoiceOtp_MFA}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${VoiceOtp_MFA}

Select Push Sms Question
    Web.Wait Until Element Is Visible   ${PushSmsQuestion_MFA}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${PushSmsQuestion_MFA}

Select Push Question To App
    Web.Wait Until Element Is Visible   ${PushQuestionToApp_MFA}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${PushQuestionToApp_MFA}

Select Call My Phone
    Web.Wait Until Element Is Visible   ${CallMyPhone_MFA}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${CallMyPhone_MFA}

Verify Message For Second Factor SurePassID Login Portal
    Wait Until Keyword Succeeds  5x  1s  Web.Wait Until Element Is Visible    ${SecFacMsg}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${SecFacMsg}    ${StandardTimeout}
    ${GetSecFacMsg}     Web.Get Text	  ${SecFacMsg}
    Should Be Equal     ${GetSecFacMsg}       Complete your login using a second factor.

Second Factor Login Contain Push Question To App Option
    Web.Wait Until Element Is Visible   ${OathPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${OathPush_MFA}

Second Factor Login Contain Send IVR authentication request to your mobile device Option
    Web.Wait Until Element Is Visible   ${VoicePush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${VoicePush_MFA}

Second Factor Login Contain Send SMS OTP to my Phone Option
    Web.Wait Until Element Is Visible   ${SmsOtpPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${SmsOtpPush_MFA}

Second Factor Login Contain Say the OTP on my phone Option
    Web.Wait Until Element Is Visible   ${VoiceOtpPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${VoiceOtpPush_MFA}

Second Factor Login Contain Send OTP to my Email Option
    Web.Wait Until Element Is Visible   ${EmailOtpPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${EmailOtpPush_MFA}

Second Factor Login Contain Send SMS authentication request to my phone Option
    Web.Wait Until Element Is Visible   ${SmsYesNOPush_MFA}     ${StandardTimeout}
    Web.Page Should Contain Element     ${SmsYesNOPush_MFA}

Navigate To Account Details Page
    Web.Wait Until Element Is Visible    ${AccountLink}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AccountLink}
    
Uncheck All MFA Options For Portal Login Under Account Section
    Web.Wait Until Element Is Enabled    ${NewSendOtpSms}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${NewSendOtpSms}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewSendOtpSms}

    Web.Wait Until Element Is Enabled    ${NewSendOtpEmail}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${NewSendOtpEmail}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewSendOtpEmail}

    Web.Wait Until Element Is Enabled    ${NewSendOtpVoice}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${NewSendOtpVoice}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewSendOtpVoice}

    Web.Wait Until Element Is Enabled    ${NewPushSmsQuestion}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${NewPushSmsQuestion}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewPushSmsQuestion}

    Web.Wait Until Element Is Enabled    ${NewPushAppQuestion}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${NewPushAppQuestion}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewPushAppQuestion}

    Web.Wait Until Element Is Enabled    ${NewPushVoice}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${NewPushVoice}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewPushVoice}

Check All MFA Options For Portal Login Under Account Section
    Web.Wait Until Element Is Enabled    ${NewSendOtpSms}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${NewSendOtpSms}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewSendOtpSms}

    Web.Wait Until Element Is Enabled    ${NewSendOtpEmail}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${NewSendOtpEmail}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewSendOtpEmail}

    Web.Wait Until Element Is Enabled    ${NewSendOtpVoice}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${NewSendOtpVoice}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewSendOtpVoice}

    Web.Wait Until Element Is Enabled    ${NewPushSmsQuestion}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${NewPushSmsQuestion}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewPushSmsQuestion}

    Web.Wait Until Element Is Enabled    ${NewPushAppQuestion}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${NewPushAppQuestion}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewPushAppQuestion}

    Web.Wait Until Element Is Enabled    ${NewPushVoice}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${NewPushVoice}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${NewPushVoice}

Click on Settings Update Button Under Account Section
    Web.Wait Until Element Is Visible    ${SettingsUpdateBtn}   ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SettingsUpdateBtn}

Verify Success message for Account Section
    Wait Until Keyword Succeeds  5x  1s     Web.Page Should Contain         Account has been updated successfully.
