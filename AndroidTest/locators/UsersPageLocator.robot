*** Variables ***
##************************************************** HomePageLocator *************************************************##
${clickOnHome}                  xpath=//*[@id="tab_Homelink"]
${clickOnUsers}                 xpath=//*[@id="tab_Userslink"]
${clickOnNewOption}             xpath=//*[@id="ctl00_ContentPlaceHolder1_hplNew"]
${UserDetailPageHeader}         xpath=//*[@id="ctl00_ContentPlaceHolder1_lblPageHeader"]
${AddNewSoftToken}              xpath=//*[@id="ctl00_ContentPlaceHolder1_hplNew"]

##************************************************ UsersNewPageLocator ***********************************************##
${UserNameField}                xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxLogin_NameData"]
${FirstNameField}               xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxFirst_NameData"]
${LastNameField}                xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxLast_NameData"]
${EmailIDField}                 xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxPrimaryEmail"]
${CellPhoneField}               xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxCellPhone"]
${AddBtn}                       xpath=//*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${PasswordFieldTitle}           xpath=//*[@id="ctl00_ContentPlaceHolder1_lblLogin_Password"]
${getPassword}                  xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxLogin_PasswordData"]
${clickOnUpdateBtn}             xpath=//*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${clickOnCloseLink}             xpath=//*[@id="ctl00_ContentPlaceHolder1_btlClose"]
${ToastSuccess}                 xpath=//*[@class="jq-toast-heading"]
${AcknowledgeCheckbox}          xpath=//*[@id="chkboxAgreeToTerms"]
${AcknowledgeLicense}           xpath=//*[@id="btnConfirmLicenseAcknowledgment"]
##New Added
${clickOnPIN}                   xpath=//*[@id="ctl00_ContentPlaceHolder1_btnNewPassword"]
${getTextPIN}                   xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxLogin_PasswordData"]
${SuccessMSGPIN}                xpath=//*[@id="ctl00_ContentPlaceHolder1_lblErrorMsgBoxLabel0"]
${clickOnselectTimeZone}        xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlTimeZone"]
${clickOnSuperAdmin}            xpath=//*[@id="ctl00_ContentPlaceHolder1_radioUserRole"]
${clickOnCloseLink}             xpath=//*[@id="ctl00_ContentPlaceHolder1_btlClose"]
${mobileActvCode}               xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxSSOMobileActivationCode"]
${ssoIdentity}                  xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxSSOFederationName"]
${checkUsrstatusDisabled}       xpath=//*[text()= "${inputFirstName} ${inputLastName}"]/parent::div//parent::div//*[text()="Disabled"]
${adminEditUsr}                 xpath=//*[text()= "${inputFirstName} ${inputLastName}"]/parent::div//parent::div//*[src="images/icons-mini/edit.png"]

##************************************************ Filter User *******************************************************##
${selectUserFilter}             xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlRoleFilter"]
${RowsFilter}                   xpath=//*[@id='ctl00_ContentPlaceHolder1_ddlPageSize']
${UserNameFilter}               xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlFilterComparator"]


#xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlFilterComparator"]

${UserNameTextFilter}           xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxUserFilter"]
${UserSearchBtn}                xpath=//*[@id="ctl00_ContentPlaceHolder1_btnFilterUsers"]

##************************************************ Select User Role **************************************************##
${selectSuperAdmin}             xpath=//*[@id="ctl00_ContentPlaceHolder1_radioUserRole_0"]
${selectAdminUsr}               xpath=//*[@id="ctl00_ContentPlaceHolder1_radioUserRole_1"]
${selectHelpdeskUsr}            xpath=//*[@id="ctl00_ContentPlaceHolder1_radioUserRole_2"]
${selectUserNPAccess}           xpath=//*[@id="ctl00_ContentPlaceHolder1_radioUserRole_3"]
${userRoles}                     xpath=//table[@id="ctl00_ContentPlaceHolder1_radioUserRole"]

${disabledSAdmin}               xpath=//*[@id="ctl00_ContentPlaceHolder1_radioUserRole_0"][@disabled="disabled"]
${checkedUserPortalUsr}         xpath=//*[@id="ctl00_ContentPlaceHolder1_radioUserRole_3"][@checked="checked"]

${clickOnNewLink}               xpath=//*[@id="ctl00_ContentPlaceHolder1_hplNewUser"]
${editTestSms}                  xpath=//*[@id="ctl00_ContentPlaceHolder1_btlTestSms"]
${clickOnTestCall}              xpath=//*[@id="ctl00_ContentPlaceHolder1_btlTestCall"]
##********************************************** Delete User Confirm Msg *********************************************##
${clickOnEditAction}            xpath=//*[text()= "${inputFirstName} ${inputLastName}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
${deleteConfirmMsg}             xpath=//*[@id="ctl00_ContentPlaceHolder1_Dialog1_ctl01_btnConfirm"]
${successMsgGreenbar}           xpath=//*[@id="ctl00_ContentPlaceHolder1_lblErrorMsgBoxLabel0"]
${editActionforImportUsr}       xpath=//*[text()= "DemoUN DemoLN"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
${clickOnImrtdeleteAction}      xpath=//*[text()= "DemoUN DemoLN"]/parent::div//parent::div//*[text()="Delete"]
${clickOnImrtdeleteAction}      xpath=//*[text()= "DemoUN DemoLN"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
${clickOnEditActionForTKNSR}    xpath=//*[text()= "DemoUN DemoLN"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
${userSRTKNo}                   xpath=//*[@class="tabBodyCellStyle"]
${selectMultiCheckBox}          xpath=//*[text()= "${inputFirstName} ${inputLastName}"]/parent::div//parent::div//*[input]
${selectActionCheckbox}         xpath=//*[text()= "Action"]/parent::div//parent::div//*[input]
${deleteCheckedItems}           xpath=//*[@id="ctl00_ContentPlaceHolder1_hplDeleteSelected"]
${deleteOKBtn}                  xpath=//*[@id="ctl00_ContentPlaceHolder1_Dialog1_ctl01_btnConfirm"]
${clickOnEmailLgnInfo}          xpath=//*[@id="ctl00_ContentPlaceHolder1_btlSendLoginEmail"]
${clickOnPinPassWord}           xpath=//*[@id="ctl00_ContentPlaceHolder1_btlVpnPinRest"]
${clickOnImportUsrEditAction}   xpath=//*[text()= "DemoUN DemoLN"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
${cancleDeleteOption}           xpath=//*[@id="ctl00_ContentPlaceHolder1_Dialog1_ctl01_btnCancel"]
#${clickOnDeleteAction}          xpath://*[text()= "${inputFirstName} ${inputLastName}"]/parent::div//parent::div//*[text()="Delete"]
${clickOnDeleteAction}          xpath=//*[text()= "${inputFirstName} ${inputLastName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
${clickOnSelfDeleteAction}      xpath=//*[text()= "${UserName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]

${UpdateIcon}                   xpath=//*[@id="ctl00_ContentPlaceHolder1_imgUpdateProgress"]

##************************************************ Status section ****************************************************##
${selectStatus}                 xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlStatus"]
#${DisabledInfo}                 xpath://*[@id="ctl00_ContentPlaceHolder1_tbxDisabledDate_Data"]
${clickonUpdate}                xpath=//*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${DisabledInfo}                 xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxDisabledDate_Data"][@id="ctl00_ContentPlaceHolder1_tbxDisabledDate_Data"]
#${DisabledInfo}                 xpath://*[@id="ctl00_ContentPlaceHolder1_ddlStatus"][@value="Disabled"]
${DisabledInfo}                 xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxDisabledDate_Data"]
##****************************************************** Import User *************************************************##
${selectImportUsr}              css=[href="partneruserimport.aspx"]
#${selectImportUsr}              xpath://*[@id="submenu_line"][@title="Import Users"]
${fileBrowse}                   xpath=//*[@class="labeltextnopad"]
${clickOnNextBtn}               xpath=//*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${selectIgnrFirstOpt}           xpath=//*[@id="ctl00_ContentPlaceHolder1_chkFileHasHeaderRecord"]
${column2RedColor}              xpath=//*[@id="ctl00_ContentPlaceHolder1_lbl1"][@style="display:inline-block;color:Red;width:200px;"]

##*********************************************************** IMport User step 3 *************************************##
${clickOnImportBtn}             xpath=//*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${textImportSummary}            xpath=//*[@id="ctl00_ContentPlaceHolder1_lblpdivImportSummary"]
${textImportLog}                xpath=//*[@id="ctl00_ContentPlaceHolder1_lblErorListHeader"]
${successImportMsgbar}          xpath=//*[@class="UImessagebar UImessagebar-success"]
${warningImportMsgbar}          xpath=//*[@class="UImessagebar UImessagebar-warning"]
${selectTokenType}              xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlDevice_TypeData"][@name="ctl00$ContentPlaceHolder1$ddlDevice_TypeData"]
${selectTKNserialNo}            xpath=//*[@id="ctl00_ContentPlaceHolder1_lbl0Col1"]
${clickOndeleteAction}          xpath=//*[text()= "${inputFirstName} ${inputLastName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
${MergeIfExitUsr}               xpath=//*[@id="ctl00_ContentPlaceHolder1_chkMergeDuplicateUsers"]
${MergeIfExitUsrDisabled}       xpath=//*[@id="ctl00_ContentPlaceHolder1_chkMergeDuplicateUsers"][@disabled="disabled"]
${ImportGoodRcrd}               xpath=//*[@id="ctl00_ContentPlaceHolder1_chkCommitWithErrors"]
${SendNotiChkeckBox}            xpath=//*[@id="ctl00_ContentPlaceHolder1_chkSendNotification"]
${SendUsrAccountInfo}           xpath=//*[@id="ctl00_ContentPlaceHolder1_chkSendUserAccountInfo"]
${SendDeviceActivationInfo}     xpath=//*[@id="ctl00_ContentPlaceHolder1_chkSendDeviceActivationInfo"]
${EmailNotification}            xpath=//*[@id="ctl00_ContentPlaceHolder1_lbl0Col5"]
${MobileNotification}           xpath=//*[@id="ctl00_ContentPlaceHolder1_lbl0Col2"]
${UserGroupEnable}              xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlGroups"]
${CreateGroupCB}                xpath=//*[@id="ctl00_ContentPlaceHolder1_chkCreateGroup"]
${GroupNameEnable}              xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxNewGroup"]
##***************************************************** Users Group **************************************************##
${selectUsersGrp}               css=[href="groups.aspx"]
${selectGrpNewLink}             xpath=//*[@id="ctl00_ContentPlaceHolder1_hplNew"]
${inputGrpName}                 xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxGroupName"]
${inputGrpDiscription}          xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxDescriptionData"]
${selectMulticheckboxOpt}       xpath=//*[@id="ctl00_ContentPlaceHolder1_GridApps_c0_i"]
${clickOnUserAddBtn}            xpath=//*[@id="ctl00_ContentPlaceHolder1_btnAction"]
${UserGroupDropDown}            xpath=//*[@id="ctl00_ContentPlaceHolder1_ddlGroups"]

##****************************************************** Delete Group ************************************************##
${clickOnGroupDeleteAction}      xpath=//*[text()= "${inputGroupName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
${clickOnDeleteOkBtn}            xpath=//*[@id="ctl00_ContentPlaceHolder1_Dialog1_ctl01_btnConfirm"]
${deleteGrpsuccessMsg}           xpath=//*[@id="ctl00_lblErrorMsgBoxLabel0"]
${titleforImportUsrStep3}        xpath=//*[@id="ctl00_ContentPlaceHolder1_lblPageHeader"]
${titleforImportUsrStep2}        xpath=//*[@id="ctl00_ContentPlaceHolder1_lblPageHeader"]
${disabledPINField}              xpath=//*[@id="ctl00_ContentPlaceHolder1_tbxLogin_PasswordData"][@disabled="disabled"]

##********************************************** ViewHDUsr ***********************************************************##
${viewOption}                    xpath=//*[text()= "${inputUsername}"]/parent::div//parent::div//*[@src="images/icons-mini/view_black_white.png"]
${viewOptionHelpdesk}            xpath=//*[text()= "${inputUsername2}"]/parent::div//parent::div//*[@src="images/icons-mini/view_black_white.png"]
${editOption}                    xpath=//*[text()= "${inputUsername}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
${editOptionHelpdesk}            xpath=//*[text()= "${inputUsername2}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
##********************************************** User Toast PopUp Message ********************************************##
${ToastPopUpMsg}       xpath=//*[@class="jq-toast-heading"]
#${UsrAddSuccessToastPopUp}       xpath://*[@class="jq-toast-loader jq-toast-loaded"]
${ClickonCancelBtn}           xpath=//*[@id="ctl00_ContentPlaceHolder1_Dialog1_ctl01_btnCancel"]

##********************************************** AckPage *************************************************************##
${TermOfUserPage}                   xpath=//*[@class="loginheadertext"]
${CheckBoxAgreeToTermUse}           xpath=//*[@id="chkboxAgreeToTerms"]
${selectAckBtn}                     xpath=//*[@id="btnConfirmLicenseAcknowledgment"]
##********************************************** Other ***********************************************************##
${BypassMFA}                    xpath=//*[@id="ctl00_ContentPlaceHolder1_chkboxBypassMFA"]
${VIP_Member}                   xpath=//*[@id="ctl00_ContentPlaceHolder1_chkboxVIP"]
${VIP_UserIcon}                 xpath=//*[text()= "${inputUserName}"]/parent::div//parent::div//*[@src="images/icons-mini/vip.png"]
${ShowOnlyVIP}                  xpath=//*[@id="ctl00_ContentPlaceHolder1_chkboxVIPFilter"]

##### Optimization #######
${DeletePrefix}                 xpath=//*[text()="
${DeletePostfix}                "]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]

