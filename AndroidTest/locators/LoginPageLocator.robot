*** Variables ***
#${SignInButton}                 xpath://*[@id="btnLogin"]
#${AccountNameLocator}           xpath://*[@name="tbxDomain_Name"]
#${UserNameLocator}              xpath://*[@name="tbxUser_Name"]
#${PasswordLocator}              xpath://*[@name="tbxPassword"]
#${OtpTextBox}                   xpath://*[@name="tbxOTP"]
#${EmailIcon}                    xpath://*[@id="btnEMailOTP"]
#${VerifyOtpButton}              xpath://*[@id="btnVerifyOtp"]
#${OTPTextLocator}               xpath://*[@id="tbxOTP"]
#${UpdateIcon}                   xpath://*[@id="ctl00_ContentPlaceHolder1_imgUpdateProgress"]

#${SignInButton}                xpath://*[@id="btnLogin"]
${SignInButton}                 css:[id='btnLogin']

#${AccountNameLocator}          xpath://*[@name="tbxDomain_Name"]
${AccountNameLocator}           css:[name='tbxDomain_Name']

#${UserNameLocator}             xpath://*[@name="tbxUser_Name"]
${UserNameLocator}              css:[name='tbxUser_Name']

#${PasswordLocator}             xpath://*[@name="tbxPassword"]
${PasswordLocator}              css:[name='tbxPassword']

#${OtpTextBox}                  xpath://*[@name="tbxOTP"]
${OtpTextBox}                   css:[name='tbxOTP']

#${EmailIcon}                   xpath://*[@id="btnEMailOTP"]
${EmailIcon}                    css:[id='btnEMailOTP']

#${VerifyOtpButton}             xpath://*[@id="btnVerifyOtp"]
${VerifyOtpButton}              css:[id='btnVerifyOtp']

#${OTPTextLocator}              xpath://*[@id="tbxOTP"]
${OTPTextLocator}               css:[id='tbxOTP']
#************************************* Helpdesk Locator *********************************#
#${titleOpenSysAlerts}           xpath://*[@id="ctl00_ContentPlaceHolder1_lblPageCol3"]
#${titleUsrStatistics}           xpath://*[@id="ctl00_ContentPlaceHolder1_lblPageCol1"]
#${titleofUsersPage}             xpath://*[@id="ctl00_ContentPlaceHolder1_lblPageHeader"]
#${titleOpenSysAlerts}          xpath://*[@id="ctl00_ContentPlaceHolder1_lblPageCol3"]
${titleOpenSysAlerts}           css:[id$='lblPageHeader']
${HomePageWelcomeMsg}           xpath://*[@id="ctl00_lblErrorMsgBoxLabel0"]
#${titleUsrStatistics}          xpath://*[@id="ctl00_ContentPlaceHolder1_lblPageCol1"]
${titleUsrStatistics}           css:[id$='lblPageHeader']

#${titleofUsersPage}            xpath://*[@id="ctl00_ContentPlaceHolder1_lblPageHeader"]
${titleofUsersPage}             css:[id$='lblPageHeader']
#************************************* Forgot Password ***********************************#
#${ForgotPasswordLocator}        xpath://*[@id="hplForgotPassword"]
#${SendPWRecoveryBtn}            xpath://*[@id="btnSend"]
#${ForgotPWEmailField}           xpath://*[@id="tbxEmail"]
#${RecoveryMailSuccess}          xpath://*[@id="lblErrorMsgBoxLabel"]
#${ErrorSignIncorrectEmail}      xpath://*[@id="lblErrorMsgBoxImage"]
#${ForgetPWLink}                 xpath://*[@id="tbxEmail"]
#${ResetPasswordpage}            xpath://*[@id="form1"]/div[3]/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr[1]/td
#${NewPasswordText}              xpath://*[@id="lblNewPassword"]
#${NewPasswordField}             xpath://*[@id="tbxNewPassword"]
#${ConfirmPassword}              xpath://*[@id="tbxConfirmPassword"]
#${UpdatePasswordField}          xpath://*[@name="btnSend"]
#${PushAuthError}                xpath://*[@id="mbar"]
#${UpdateIcon}                   xpath://*[@id="ctl00_ContentPlaceHolder1_imgUpdateProgress"]

#${ForgotPasswordLocator}       xpath://*[@id="hplForgotPassword"]
${ForgotPasswordLocator}        css:[id='hplForgotPassword']

#${SendPWRecoveryBtn}           xpath://*[@id="btnSend"]
${SendPWRecoveryBtn}            css:[id='btnSend']

#${ForgotPWEmailField}          xpath://*[@name="tbxEmail"]
${ForgotPWEmailField}           css:[id='tbxEmail']

#${RecoveryMailSuccess}         xpath://*[@id="lblErrorMsgBoxLabel"]
${RecoveryMailSuccess}          css:[id='lblErrorMsgBoxLabel']

#${ErrorSignIncorrectEmail}     xpath://*[@id="lblErrorMsgBoxImage"]
${ErrorSignIncorrectEmail}      css:[id='lblErrorMsgBoxImage']


#${NewPasswordText}             xpath://*[@id="lblNewPassword"]
${NewPasswordText}              css:[id='lblNewPassword']

#${NewPasswordField}            xpath://*[@id="tbxNewPassword"]
${NewPasswordField}             css:[id='tbxNewPassword']

#${ConfirmPassword}             xpath://*[@id="tbxConfirmPassword"]
${ConfirmPassword}              css:[id='tbxConfirmPassword']

#${UpdatePasswordField}         xpath://*[@name="btnSend"]
${UpdatePasswordField}          css:[name='btnSend']


#${PushAuthError}               xpath://*[@id="mbar"]
#${PushAuthError}                css:[id='mbar']
${PushAuthError}                 xpath://*[@id='lblStaticMessage']

#${UpdateIcon}                  xpath://*[@id="ctl00_ContentPlaceHolder1_imgUpdateProgress"]
${UpdateIcon}                   css:img[id$='imgUpdateProgress']