*** Variables ***
${clickOnCustmEmailMsg}         css=[href="clientcustomize.aspx"]
${SMTPSettings}                 xpath://*[@id="ctl00_ContentPlaceHolder1_lblpdivSMTPSettings"]
${Emailseetings}                xpath://*[@id="ctl00_ContentPlaceHolder1_lblpdivEmailSettings"]
${HostName}                     xpath://*[@id="ctl00_ContentPlaceHolder1_lblSMTPHost"]
${portName}                     xpath://*[@id="ctl00_ContentPlaceHolder1_lblSMTPPort"]
${SMTPUserName}                 xpath://*[@id="ctl00_ContentPlaceHolder1_lblSMTPUsername"]
${SMTPPassword}                 xpath://*[@id="ctl00_ContentPlaceHolder1_lblSMTPPassword"]
${disableHostNamefield}         xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSMTPServerHost"][@disabled="disabled"]
${disablePortfield}             xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSMTPPort"][@disabled="disabled"]
${disableSMTPUNfield}           xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSMTPUsername"][@disabled="disabled"]
${customSMTPCB}                 xpath://*[@id="ctl00_ContentPlaceHolder1_chkSetCustomSMTP"]
${disableSMTPPWfield}           xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSMTPPassword"][@disabled="disabled"]
${inputSMTPHostName}            xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSMTPServerHost"]
${inputSMTPPort}                xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSMTPPort"]
${inputSMTPUsrName}             xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSMTPUsername"]
${clickOnLock}                  xpath://*[@id="ctl00_ContentPlaceHolder1_btnShowPassword"]
${inputSMTPPswd}                xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSMTPPassword"]
${textEmailFormat}              xpath://*[@id="ctl00_ContentPlaceHolder1_lblEmailFormat"]
${textSysAction}                xpath://*[@id="ctl00_ContentPlaceHolder1_lblSystemAction"]
${textFromEmailName}            xpath://*[@id="ctl00_ContentPlaceHolder1_lblFromEmailName"]
${textFromEmailName}            xpath://*[@id="ctl00_ContentPlaceHolder1_lblFromEmailAddress"]
${textSubject}                  xpath://*[@id="ctl00_ContentPlaceHolder1_lblSubject"]
${textMessageBody}              xpath://*[@id="ctl00_ContentPlaceHolder1_tbxBody"]
${textMessage}                  xpath://*[@id="ctl00_ContentPlaceHolder1_lblBody"]
${selectEmailFormat}            xpath://*[@id="ctl00_ContentPlaceHolder1_ddlEmailFormat"]
${inputFromEmail}               xpath://*[@id="ctl00_ContentPlaceHolder1_tbxFromEmailName"]
${inutSubject}                  xpath://*[@id="ctl00_ContentPlaceHolder1_tbxSubject"]
${selectSysAction}              xpath://*[@id="ctl00_ContentPlaceHolder1_ddlSystemAction"]
#${disabledFromEmailAdd}         xpath://*[@id="ctl00_ContentPlaceHolder1_tbxFromEmailAddress"][@disabled="disabled"]
${disabledFromEmailAdd}         xpath://*[@id="ctl00_ContentPlaceHolder1_tbxFromEmailAddress"]
${btnAction}                    xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${btnLogout}                    xpath://*[@id="ctl00_lnkbtnLogout"]
${btnSetDefault}                xpath://*[@id="ctl00_ContentPlaceHolder1_btnSetDefault"]
${successGreenBarCEMsg}         xpath://*[@id="ctl00_lblErrorMsgBoxLabel0"]
${FromEmailAdd}                 xpath://*[@id="ctl00_ContentPlaceHolder1_tbxFromEmailAddress"]
