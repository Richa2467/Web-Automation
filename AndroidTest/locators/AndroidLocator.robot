*** Variables ***
${GetAppOTP}                        //android.widget.TextView[@resource-id="com.surepassid.otp.authenticator:id/token_value"]
${ChromeURL}                        //android.widget.EditText[@resource-id="com.android.chrome:id/url_bar"]

#${SurePassTokenValue}               //android.widget.TextView[@class="android.widget.TextView"]
${SurePassTokenValue}                //android.widget.TextView[@resource-id="com.surepassid.otp.authenticator:id/token_value"]
${SurePassTokenDeleteIcon}          //android.widget.ImageButton[@resource-id="com.surepassid.otp.authenticator:id/delete_otp_account"]
${SurePassTokenDeleteOK}            //android.widget.Button[@resource-id="com.surepassid.otp.authenticator:id/delete_button"]

${SurePassScanQRCodeButton}         //android.widget.Button[@resource-id="com.surepassid.otp.authenticator:id/btn_scan_qr_code"]
${CamPermissionAllow}               //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_one_time_button"]
${CamPermissionDeny1}                //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_deny_and_dont_ask_again_button"]
${CamPermissionDeny}                //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_deny_button"]


${CameraWarnMessage}                //android.widget.TextView[@resource-id="android:id/message"]
# added
${CameraWarnMessageNotNow}              //android.widget.Button[@resource-id="android:id/button2"]
${CameraWarnMessageok}              //android.widget.Button[@resource-id="android:id/button1"]
${CameraWarnMessageGotoSettings}     //android.widget.Button[@resource-id="android:id/button1"]

${SettingIcon}                       //android.widget.TextView[@content-desc="Settings"]
${Notification}                     //android.widget.TextView[@resource-id="android:id/title" and @text="Notifications"]
#android:id/title]
${AuthenticatorIcon}                 //android.widget.TextView[@resource-id="com.android.settings:id/entity_header_title"]
#${AuthenticatorIcon}                //android.widget.TextView[@text="Authenticator"]
${AppInfoOption}                    //android.widget.TextView[@text="App info"]
${NotificationsOption}              //android.widget.TextView[@text="Notifications"]
${NotificationToggle}               //android.widget.Switch[@resource-id="com.android.settings:id/switch_widget"]
#${NotificationToggleOff}            //android.widget.Switch[@resource-id="com.android.settings:id/switch_widget" and @text="App notifications, Show notifications, Off"]
${NotificationToggleOff}            //android.widget.Switch[@resource-id="com.android.settings:id/switch_widget" and @text="Notifications, Show notifications, Off"]
${NotificationToggleOn}             //android.widget.Switch[@resource-id="com.android.settings:id/switch_widget" and @text="Notifications, Show notifications, On"]

${CopyButton}                       //android.widget.ImageButton[@resource-id="com.surepassid.otp.authenticator:id/copy_token"]
${CopySucessPopup}                  //android.widget.TextView[@resource-id="com.surepassid.otp.authenticator:id/snackbar_text"]

${ExpandPush}                        //android.widget.Button[@resource-id="android:id/expand_button"]
${PushNotificationOptions}          //android.widget.Button[@resource-id="android:id/action0"]
#${PushNotificationApprove}          //android.widget.Button[@text="Approve"]
#${PushNotificationApprove}          //android.widget.Button[@text="APPROVE"]
${PushNotificationApprove}          //android.widget.Button[@resource-id="com.surepassid.otp.authenticator:id/approve_button"]


#${PushNotificationReject}           //android.widget.Button[@text="Deny"]
${PushNotificationReject}           //android.widget.Button[@text="DENY"]
${UpdateDecriptionText}     Updated Description Text Demo-57

#${AddAuthenticationDevice}          //android.widget.TextView[@text="Add Authentication Device"]
${AddAuthenticationDevice}          //android.widget.TextView[@text="Add Token"]
${ErrorDownloadPushNotiSMsg}        //android.widget.TextView[@resource-id="com.surepassid.otp.authenticator:id/status_message"]
#${OpenWithSPAuthApp}                //android.widget.TextView[@resource-id="android:id/text1"][@text="Authenticator"]
${AlwaysButton}                     //android.widget.Button[@text="ALWAYS"]

${OpenWithSPAuthApp}                //android.widget.TextView[@resource-id="android:id/title"][@text="Open with Authenticator"]
#${AlwaysButton}                     //android.widget.Button[@text="ALWAYS"]
${AlwaysButton}                     //android.widget.Button[@resource-id="android:id/button_always"][@text="ALWAYS"]


#************************************************ SMS App Locators ***********************************************#
${SMSTitleVMSURJTQ}                 //android.widget.TextView[@resource-id="com.google.android.apps.messaging:id/conversation_text_content"]
${SMSTitleNumber}                   //android.widget.TextView[@resource-id="com.google.android.apps.messaging:id/conversation_name"]
${getTextFromSMS}                   //android.widget.TextView[@resource-id="com.google.android.apps.messaging:id/message_text"]
#${SMSDeleteIcon}                    //android.widget.ImageView[@index="1"]
#added new xpath for SMSDeleteIcon
${SMSDeleteIcon}                     //android.widget.Button[@content-desc="Delete"]
${clickOnDeleteBtn}                  //android.widget.Button[@resource-id="android:id/button1"]
#added new xpath for clickOnDeleteBtn
#${clickOnDeleteBtn}                 //android.widget.TextView[@resource-id="com.google.android.apps.messaging:id/inc_custom_dialog_button_positive"]
${EditIcon}                         //android.widget.ImageButton[@resource-id="com.surepassid.otp.authenticator:id/edit_account_name"]
${EditNameBox}                      //android.widget.EditText[@resource-id="com.surepassid.otp.authenticator:id/account_name_edit"]
${SaveNewNameBtn}                   //android.widget.Button[@resource-id="com.surepassid.otp.authenticator:id/account_name_save_button"]
${TokenNameText}                    //android.widget.TextView[@resource-id="com.surepassid.otp.authenticator:id/account_name"]

#************************************************Google Authenticator***********************************************#
${AddGoogleToken}                    //android.widget.ImageButton[@resource-id="com.google.android.apps.authenticator2:id/add_account_fab"]
${GetStarted}                        //android.widget.Button[@text="Get started"]
${Back}                              //android.widget.ImageButton[@content-desc="Navigate up"]
${EnterSetupKey}                     //android.widget.TextView[@text="Enter a setup key"]
${AccNameTextField}                  //android.widget.EditText[@resource-id="com.google.android.apps.authenticator2:id/account_name"]
${TokenIdTextField}                  //android.widget.EditText[@resource-id="com.google.android.apps.authenticator2:id/key_value"]
${AddButton}                         //android.widget.Button[@resource-id="com.google.android.apps.authenticator2:id/add_account_button_enter_key"]
${AddAccount}                        //android.widget.Button[@text="ADD ACCOUNT"]
${PinValue}                          //android.widget.TextView[@resource-id="com.google.android.apps.authenticator2:id/pin_value"]
${Vol_Token}                         //android.widget.TextView[@resource-id="com.google.android.apps.authenticator2:id/current_user"]
${Delete_GoogleToken}                //android.widget.TextView[@resource-id="com.google.android.apps.authenticator2:id/delete"]
${RemoveAccount}                     //android.widget.Button[@resource-id="android:id/button1"]

#************************************************Date and Time***********************************************#
${OpenDateTime}                      //android.widget.Button[@text="OPEN!"]
${UpdateAutoTime}                    //android.widget.TextView[@text="Automatic date and time"]
${SetTime}                           //android.widget.TextView[@text="Set time"]
${Hour}                              //android.widget.EditText[@resource-id="android:id/numberpicker_input"]
${Min}                               //android.widget.LinearLayout[@resource-id="android:id/minute"]
${Done}                              //android.widget.Button[@text="Done"]
