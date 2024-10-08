*** Variables ***
${SendSmsOtp_MFA}           xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpSms"]
${SendEmailOtp_MFA}         xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpEmail"]
${VoiceOtp_MFA}             xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpVoice"]
${PushSmsQuestion_MFA}      xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushSmsQuestion"]
${PushQuestionToApp_MFA}    xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushAppQuestion"]
${CallMyPhone_MFA}          xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushVoice"]
${OathPush_MFA}             xpath://*[@id="btTapAuthPush"]
${VoicePush_MFA}            xpath://*[@id="btVoicePush"]
${SmsOtpPush_MFA}           xpath://*[@id="btnSendSMSOTP"]
${VoiceOtpPush_MFA}         xpath://*[@id="btnSendVoiceOTP"]
${EmailOtpPush_MFA}         xpath://*[@id="btnEMailOTP"]
${SmsYesNOPush_MFA}         xpath://*[@id="btSMSPush"]
${SecFacMsg}                xpath://*[@id="lblErrorMsgBoxLabel0"]
${AccountLink}              xpath://*[@id="submenu_line"]/a[1]
${NewSendOtpSms}            xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpSms"]
${NewSendOtpEmail}          xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpEmail"]
${NewSendOtpVoice}          xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpVoice"]
${NewPushSmsQuestion}       xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushSmsQuestion"]
${NewPushAppQuestion}       xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushAppQuestion"]
${NewPushVoice}             xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushVoice"]
${SettingsUpdateBtn}        xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${NewSettingsSuccessBar}    xpath://*[@class="jq-toast-heading"]
${SleepDelay2s}             2
${UpdateIcon}                   xpath://*[@id="ctl00_ContentPlaceHolder1_imgUpdateProgress"]