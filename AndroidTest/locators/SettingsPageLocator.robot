*** Variables ***
${clickOnAccountTab}                css=[href="clientdetail.aspx"]
#${clickOnSettingsTab}               css=[href="clientsettings.aspx"]
${clickOnSettingsTab}               xpath://*[@id="submenu_line"]/a[1]
${clickOnHome}                      css=[href="home.aspx"]
${otpValidationToken}               xpath://*[@id="ctl00_ContentPlaceHolder1_tbxMax_User_Failed_LoginsData"]
${clickOnSettingsUpdateBtn}         xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${SuccessBarforSettingsPage}        xpath://*[@class="jq-toast-heading"]
${mobileNotiDropdown}               xpath://*[@id="ctl00_ContentPlaceHolder1_ddlSMSOTPTimeMins"]
#${settingsTabLocator}               xpath://*[@id="submenu_line"]/a[1]

${severeChecbox}                    xpath://*[@id="ctl00_ContentPlaceHolder1_chkError"]
${warningChecbox}                   xpath://*[@id="ctl00_ContentPlaceHolder1_chkWarning"]
${SuccessChecbox}                   xpath://*[@id="ctl00_ContentPlaceHolder1_chkSuccess"]
${ActionChecbox}                    xpath://*[@id="ctl00_ContentPlaceHolder1_chkAction"]
${InfoChecbox}                      xpath://*[@id="ctl00_ContentPlaceHolder1_chkInfo"]

${SendOtpSms}                       xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpSms"]
${SendOtpEmail}                     xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpEmail"]
${SendOtpVoice}                     xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxSendOtpVoice"]
${PushSmsQuestion}                  xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushSmsQuestion"]
${PushAppQuestion}                  xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushAppQuestion"]
${PushVoice}                        xpath://*[@id="ctl00_ContentPlaceHolder1_chkboxPushVoice"]

${ClickOnLogout}                    xpath://*[@id="ctl00_lnkbtnLogout"]
${CloseButton}                      xpath://*[@id="ctl00_ContentPlaceHolder1_btnClose"]


${btnTapAuthPush}                   xpath://*[@id="btTapAuthPush"]
${btVoicePush}                      xpath://*[@id="btVoicePush"]
${btnSendSMSOTP}                    xpath://*[@id="btnSendSMSOTP"]
${btnSendVoiceOTP}                  xpath://*[@id="btnSendVoiceOTP"]
${btnEMailOTP}                      xpath://*[@id="btnEMailOTP"]//*[@id="ctl00_ContentPlaceHolder1_ddlUserAuthType"]

${btSMSPush}                        xpath://*[@id="btSMSPush"]

${SettingsSuccessBar}               xpath://*[@id="ctl00_ContentPlaceHolder1_lblErrorMsgBoxLabel0"]
${AccPageHeader}                    xpath://*[@id="ctl00_ContentPlaceHolder1_lblPageHeader"]


${MaxUsersLicensedTextField}        xpath://*[@id="ctl00_ContentPlaceHolder1_tbxMax_UsersData"]
${MaxTokensLicensedTextField}       xpath://*[@id="ctl00_ContentPlaceHolder1_tbxMax_DevicesData"]
${AccountExpDatePicker}             xpath://*[@id="_eo_ctl00_ContentPlaceHolder1_dtPickerStart_picker"]
${CurrCulureTextFiled}              xpath://*[@id="ctl00_ContentPlaceHolder1_tbxCulture"]
${TimezoneDropdown}                 xpath://*[@id="ctl00_ContentPlaceHolder1_ddlTimeZone"]
${UpdateButton}                     xpath://*[@id="ctl00_ContentPlaceHolder1_btlSave"]
${AccPwdExpDropdown}                xpath://*[@id="ctl00_ContentPlaceHolder1_ddlPasswordExpirationDays"]
${MobileNotfValidMin}               xpath://*[@id="ctl00_ContentPlaceHolder1_ddlSMSOTPimeMins"]
${MobileNotfValidSec}               xpath://*[@id="ctl00_ContentPlaceHolder1_ddlSMSOTPTimeSecs"]
${EmailNotfValidMin}                xpath://*[@id="ctl00_ContentPlaceHolder1_ddlEmailOTPTimeMins"]
${EmailNotfValidSec}                xpath://*[@id="ctl00_ContentPlaceHolder1_ddlEmailOTPTimeSecs"]
${TempNotfValidMin}                 xpath://*[@id="ctl00_ContentPlaceHolder1_ddlTempOTPTimeMins"]
${TempNotfValidSec}                 xpath://*[@id="ctl00_ContentPlaceHolder1_ddlTempOTPTimeSecs"]
${UsrAuthMethodDropdown}            xpath://*[@id="ctl00_ContentPlaceHolder1_ddlUserAuthType"]




