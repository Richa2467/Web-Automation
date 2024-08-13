*** Settings ***
Resource    ../Labels/SSOLabel.robot

*** Variables ***
${SSOTab}                   xpath://*[@href="clientcustomizesso.aspx"]
${SSOLoginSupport}          xpath://*[@id="ctl00_ContentPlaceHolder1_ddlAllowSSO"]
${AllowSingleFactor}        xpath://*[@id="ctl00_ContentPlaceHolder1_ddlAllowSingleFactor"]
${AllowChangePassword}      xpath://*[@id="ctl00_ContentPlaceHolder1_ddlAllowChangePassword"]
${ShowCertBtn}              xpath://*[@id="ctl00_ContentPlaceHolder1_btnShowCert"]
${DwnldCertBtn}             xpath://*[@id="ctl00_ContentPlaceHolder1_btnDownloadCert"]
${ThumbPrint}               xpath://*[@id="ctl00_ContentPlaceHolder1_tbxThumbPrint"]
${TextCert}                 xpath://*[@id="ctl00_ContentPlaceHolder1_tbxCert"]
#${CpyBtn}                   xpath://*[@id="ctl00_ContentPlaceHolder1_btnCopy"]
${CpyBtn}                   xpath://*[@id="btnCopy"]            #Changed locator in MFA-Dev server build
${DwnldSuccessPopUp}        xpath://*[@class="jq-toast-single jq-has-icon jq-icon-success"]
${UserAuthType}             xpath://*[@id="ctl00_ContentPlaceHolder1_ddlUserAuthType"]
${NewCustomApp}             xpath://*[@id="ctl00_ContentPlaceHolder1_hplNewCustomApp"]
${NewWebFormApp}            xpath://*[@id="ctl00_ContentPlaceHolder1_hplNewWebFormApp"]

${SAML2Settings}            xpath://*[@id="ctl00_ContentPlaceHolder1_lblpdivIdpSettings"]
${WebFormLoginSettings}     xpath://*[@id="ctl00_ContentPlaceHolder1_lblpdivHtmlSettings"]

${SSO_RoleTab}              xpath://*[@href="clientssoroles.aspx"]
${NewRolelink}              xpath://*[@id="ctl00_ContentPlaceHolder1_hplNew"]
${addRoleBtn}               xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]

${noRoleName}               xpath://*[@id="ctl00_lblErrorMsgBoxLabel0"]
${InputRoleName}            xpath://*[@id="ctl00_ContentPlaceHolder1_tbxRole_NameData"]
${InputRoleDesc}            xpath://*[@id="ctl00_ContentPlaceHolder1_tbxDescription"]
${Role_SuccessPop}          xpath://*[@class="jq-toast-single jq-has-icon jq-icon-success"]

${EditRolelink}             xpath://*[text()= "${RoleName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
${CopyRolelink}             xpath://*[text()= "${RoleName}"]/parent::div//parent::div//*[@src="images/icons-mini/copy_black_white.png"]
${DeleteRolelink}           xpath://*[text()= "${RoleName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]

${SSO_PolicyTab}            xpath://*[@href="clientssopolicies.aspx"]
${InputPolicyName}          xpath://*[@id="ctl00_ContentPlaceHolder1_tbxPolicy_NameData"]
${DeletePolicylink}         xpath://*[text()= "${PolicyName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
${CopyPolicylink}           xpath://*[text()= "${PolicyName}"]/parent::div//parent::div//*[@src="images/icons-mini/copy_black_white.png"]
${SSOAppSelect}             xpath://*[text()= "GMail"]/parent::div//parent::div//*[input]
${SSOAppUpdate}             xpath://*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${SSORedBar1stErrMsg}       xpath://*[@id="ctl00_lblErrorMsgBoxLabel0"]
${SSORedBar2ndErrMsg}       xpath://*[@id="ctl00_lblErrorMsgBoxLabel1"]
${IdentityProviderURL}      xpath://*[@id="ctl00_ContentPlaceHolder1_btlStartIdp"]
${RoleNameAcending}         xpath://*[@id="ctl00_ContentPlaceHolder1_Grid1_c2_i"]

${Copied}                   xpath://*[@id="ctl00_ContentPlaceHolder1_lblLoginCopied"]
