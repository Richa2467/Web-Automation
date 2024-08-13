*** Variables ***
#### Constants  ####
${SurePassUrl}                  https://mfa-alpha.surepassid.com/        # mfa-sandbox dev env URL
${ServicePassUrl}               https://volansys-alpha.surepassid.com/default.aspx   # service pass URL
${AccountName}                  volansys.com            # Account name or tenant name
${MailSenderId}                 automailer@surepassid.com  # SurePassID mail sender address
${GmailHost}                    imap.gmail.com  # gmail host

### Primary User ###
${mainUserName}                 kalp.onprem   # primary surepassid username
${UserName}                     Kalpesh.Patel    # primary surepassid account loginname
${Password}                     Volansys@123     # primary surepassid account password
${GmailId}                      volspidqa3+352354@gmail.com     # primary surepass account's gmail id
${GmailPassword}                nuxtaahsvlmuites                #fktkoujczycopxhz            #Volansys@123         # primary surepass account's gmail password

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
${SuperAdminUserName}                kalp.onprem   # Super Admin surepassid username
${SuperUserName}                     kalp.onprem   # Super Admin surepassid account loginname
${SuperPassword}                     Volansys@123      # Super Admin surepassid account password
${SuperGmailId}                      volspidqa3+352354@gmail.com     # Super Admin surepass account's gmail id
${SuperGmailPassword}                nuxtaahsvlmuites

### For Desktop Authentication ###
${DeviceName}                   PC-Desktop           # Give DeviceName of PC System from 'About Your PC' Device Specification Section (Device Name)