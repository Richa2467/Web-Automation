*** Variables ***
#***************************** NewUser1 **********************************#
${inputUserName}                TestUserName_0011
${inputFirstName}               TestFirstName_00111
${inputLastName}                TestLastName_00111
${UserNamePreFix}               AtestUsr_
${userFullName}                 ${inputFirstName} ${inputLastName} (${inputUserName})
${userSurFullName}              ${inputFirstName} ${inputLastName}
${invalidMobileNoFrmt}          99099570
${assignToUsrName}              ${inputUserName}

${EmptyEmailMsg}                This user role requires an email.
#***************************** NewUser2 **********************************#
${inputUserName2}                TestUserName_020
${inputFirstName2}               TestUserName_020
${inputLastName2}                TestUserName_020
${UserNamePreFix2}               AtestUsr_
${userFullName2}                 ${inputFirstName2} ${inputLastName2}(${inputUserName2})

#****************************** New Group *******************************#
${inputGroupName}               TestGroup
${inputGrpDisDetail}            This is test group

#***************************** Helpdesk User *********************************************#
${inputHelpdeskUN}              TestHelpdeskUN
${inputHelpdeskUsrPW}           Jc7PGGgJLNG2j&9
${UserNameTest}                 TestUN_100
${HelpDeskUserName}             helpdesk.2022
${HelpDeskPassWord}             My@123india

#****************************** User Role *************************************************#
${selectUserNoPortalAccess}     xpath://*[@id="ctl00_ContentPlaceHolder1_radioUserRole_2"]
${selectHelpdeskUser}           3
${selectAdminUser}              Y
${statusEnabled}                Enabled
${statusDisabled}               Disabled

#****************************** Import User *************************************************#
${selectValue0}                 0
${selectValue1}                 1
${selectValue2}                 2
${selectValue3}                 3
${selectValue4}                 4
${selectValue5}                 5
${ImportSuccessMsg}             All (1) user records were added.
${ImportMergeSMsg}              All (0) user records were added.
${GroupName}                    TestGrourpName
${WarningMsg}                   Because of the errors, all changes were rolled back and no records were imported.
${UserRoleChangePWMsg}          Now that the users role has changed the PIN has been reset to a strong password. Please take note of the new password.
${ImprtUserName}                ImprtUsr
#********************************* Token Type ************************************************#
${NoneToenType}              -1
${SurePassAuthToken}          9
${validCellPhoneNo}             +91(898)0069272                     # valid cellphone number to test mobile number validation formate
${UserImportFile}               ${CURDIR}\\..\\appData\\Test_File_Sure_Pass_ID.txt
${HardTokenImportFile}          ${CURDIR}\\..\\appData\\TestNewHardToekn.csv
${UserGroupMessageComapre}      Are you sure you wish to delete the selected groups? This cannot be undone.
${UsrGroupEmptyGroupNameMsg}    Please enter a name for this group.

#********************************** Help Desk User for Manage Dashboard ***********************#
${MDashboardHDUsr}              Helpdesk_VolQa1
${MDashboardHDPw}               5moztAASoH9xM|3

#********************************** No Portal Access for Manage Dashboard *********************#
${MDDashboardNoPortalUsr}       VolQa1_NoPortal
${MDDashboardPIN}               3472