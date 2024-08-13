*** Variables ***
#*************************************************** SurePassApp *******************************#
${ANDROID_AUTOMATION_NAME}          uiautomator2
${ANDROID_APP}                      ${CURDIR}\\..\\appData\\com.surepassid.otp.authenticator.push.apk
${SMSANDROID_APP}                   ${CURDIR}\\..\\appData\\com.simplemobiletools.smsmessenger.apk
${SMSANDROID_APP2}                  ${CURDIR}\\..\\appData\\com.jio.messages.apk
${EribankApp}                       ${CURDIR}\\..\\appData\\EriBank.apk
${DateTimeApp}                      ${CURDIR}\\..\\appData\\date-and-time-settings-shortcut_1.0.apk
#${ANDROID_APP}                     ${CURDIR}\\..\\appData\\ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}            Android
${ANDROID_PLATFORM_VERSION}        %{ANDROID_PLATFORM_VERSION=11.0}
${AppiumURL}                        http://127.0.0.1:4723/wd/hub
#${maxInstances}                     8
${AndroidDeviceName}                RZ8R31425NA
${AndroidSurePassPackageName}       com.surepassid.otp.authenticator
${AndroidSurePassActivityName}      com.surepassid.authenticator.activity.AuthenticatorActivity
#${AndroidSurePassActivityName}      com.surepassid.authenticator.common.activity.AuthenticatorNavigationActivity
#${AndroidSurePassActivityName}      com.google.android.gms.common.api.GoogleApiActivity
${AndroidEribankPackageName}        com.experitest.ExperiBank
${AndroidEribankActivityName}       com.experitest.ExperiBank.LoginActivity
${GOOGLE_APP}                       ${CURDIR}\\..\\appData\\Google Authenticator_v5.10_apkpure.com.apk
${AndroidGoogleAuthPackageName}     com.google.android.apps.authenticator2
${AndroidGoogleAuthActivityName}    com.google.android.apps.authenticator.AuthenticatorActivity
${AndroidDateTimePackageName}       dogfooderz.com.dateandtime
${AndroidDateTimeActivityName}      dogfooderz.com.openlanguagesettings.MainActivity
#dogfooderz.com.openlanguagesettings.MainActivity



