*** Variables ***
#### Constants  ####
${SurePassUrl}                  https://mfa-alpha.surepassid.com/default.aspx  # sandbox dev env URL
${ServicePassUrl}               https://volansys-alpha.surepassid.com/default.aspx   # service pass URL
${AccountName}                  volansys.com            # Account name or tenant name
${MailSenderId}                 automailer@surepassid.com  # SurePassID mail sender address
${GmailHost}                    imap.gmail.com  # gmail host

### Primary User ###
${mainUserName}                 KalpeshPatel   # primary surepassid username
${UserName}                     Kalpesh.Patel     # primary surepassid account loginname
${Password}                     Volansys@123     # primary surepassid account password
${GmailId}                      volspidqa3+352354@gmail.com     # primary surepass account's gmail id
${GmailPassword}                fktkoujczycopxhz            #Volansys@123         # primary surepass account's gmail password

${inputEmailId}                 volspidqa3+3264@gmail.com    # alias of gmailid1
${inputEmailId2}                volspidqa3+0779@gmail.com
${inputEmailIdforHDUsr}         volspidqa3+90718@gmail.com    # alias of gmailid1
${inputCellPhoneNo}             +91(745)3054374                       # valid cellphone number

### Secondary User ####
${mainUser}                     ${UserName}
${mainUserPw}                   ${Password}
${secondUserName}               Adam2 Snow   # Second user's surepassid username
${SecondUser}                   Adam2.Snow    # Second User's surepassid login name
${SecondUserPw}                 8OnB6CDqukwDx%7   # Second User's surepassid passwoed
${SecondUserGmailId}            eloview.d2+10@gmail.com    # Second user's gmail id
${SecondUserGmailPw}            Rahul@volansys123    # Second user's gmail password

### Tertiary User ###
${UserName3}                    Adam.Snow3
${UserFirstName3}               Adam3             # Valid secondary user first name in surepassId
${UserName3}                    Adam.Snow3       # Valid secondary login name in surepassid
${GmailId3}                     eloview.d2+20@gmail.com    # Gmail id of the secondary user
${GmailPassword3}               Rahul@volansys123    # Gmail password of the secondary user
${UserNameFirstLastName}        Adam3 Snow (Adam.Snow3)
${assignTokenTo}                ${UserName3} (Adam3 Snow)

### Super Admin User Credentials ###
${SuperAdminUserName}                QAFirstName QALastName   # Super Admin surepassid username
${SuperUserName}                     SuperAdmin     # Super Admin surepassid account loginname
${SuperPassword}                     NfkSDPosHGaVX$0     # Super Admin surepassid account password
${SuperGmailId}                      volspidqa3+081222@gmail.com     # Super Admin surepass account's gmail id
${SuperGmailPassword}                fktkoujczycopxhz

#hnvowkaopibsijug  #Volansys@123         # primary surepass account's gmail password

### For Desktop Authentication ###
${DeviceName}                   PC-Desktop           # Give DeviceName of PC System from 'About Your PC' Device Specification Section (Device Name)

### API User Details ###
${SandboxApiUrl}               https://mfa-dev.surepassid.com/AuthServer/REST/U2F/U2FServer.aspx
${AccountId}                   vo5vvRVi3WW50QwNVfLUUCoSrayybXrAKidfHwG8
${AccountToken}                0wAaNurG8LtenEsJcE1GULhctip4KYzkFfjkhPbV
${apiOldFirstName}             PARTH
${apiOldLastName}              ADMIN
${apiUserName}                 tony2021
${apiFirstName}                Tony
${apiLastName}                 Tiger
${apiMobile}                   +91(992)5852525
${apiEmail}                    parth.jani+205@volansys.com
${apiDeleteUser}               delete.user
${apiDeleteEmail}              parth.jani+215@volansys.com
${apiUpdateUserName}           Updated_tony2021
${SessionTokenUserName}        kpatel
${SessionTokenPassword}        Volansys@2021