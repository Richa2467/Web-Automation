*** Settings ***
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../labels/TokenPageLabel.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/UsersPageLocator.robot
Resource    ../locators/TokenPageLocator.robot
Resource    ../locators/TokenGroupLocator.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../locators/AddNewSoftTokenLocator.robot
Resource    ../resources/AndroidResource.robot
Resource    ../locators/CreateAndAssignTokenLocator.robot
Resource    ../resources/CreateAndAssignTokenResource.robot
Resource    ../resources/CustomizeMobileMSGResource.robot

*** Keywords ***
Go To Tokens Page
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${AssignTokenLink}    ${StandardTimeout}

Add Token To The User Account for Alpha
    [Arguments]    ${TokenType}=None    ${UserDefinedName}=None    ${AuthType}=None    ${OTPWindowSize}=None    ${OTPType}=None    ${TokenStatus}=None    ${OTPLen}=None
    Web.Wait Until Element Is Visible    ${UserDefinedNameField}    ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Run Keyword If    '${TokenType}' != 'None'    Run Keyword    Select Token Type    ${TokenType}
    Run Keyword If    '${UserDefinedName}' != 'None'    Web.Input Text    ${UserDefinedNameField}    ${UserDefinedName}
    Run Keyword If    '${AuthType}' != 'None'  Wait Until Keyword Succeeds  5x  1s   Web.Select From List by Value    ${AuthUsageDropdown}    9
    Web.Wait Until Element Is Enabled  ${AuthUsageDropdown}/option[@value='9']

     Web.select Checkbox    ctl00$ContentPlaceHolder1$ucMobileUsage$cbOath
     Sleep    5s
     Web.select Checkbox    ctl00$ContentPlaceHolder1$ucMobileUsage$cbPush
     Sleep    5s
     Web.Unselect Checkbox    ctl00$ContentPlaceHolder1$ucMobileUsage$cbRequireCredentials




    Run Keyword If    '${OTPType}' != 'None'    Run Keywords        Web.Scroll Element Into View    ${CopyrightSection}
    ...                AND                         Web.Select From List by Value    ${OTPTypeDropdown}    ${OTPType}
    Run Keyword If     '${TokenStatus}' != 'None'     Run Keyword    Web.Select From List by Value    ${TokenStatusLocator}    ${TokenStatus}
    Web.Scroll Element Into View    ${CopyrightSection}
    Run Keyword If    '${OTPWindowSize}' != 'None'    Web.Input Text    ${OTPWindowSizeLocator}    ${OTPWindowSize}
#    Run Keyword If    '${TokenType}' != '8'    Run Keyword     Check token type is not NymiBand     ${TokenType}
    Run Keyword If     '${OTPLen}' != 'None'    Run Keyword     Web.Select From List by Value       ${OTPLength}       10
    Wait Until the Update Icon Disappear
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenAddButton}
    Wait Until the Update Icon Disappear
    Verify Success Toast Message




#    Wait Until Keyword Succeeds  5x  1s  Web.Select From List by Value  ${UserNameFilter}   3
#    Web.Wait Until Element Is Enabled  ${UserNameFilter}/option[@value='3']


#    Run Keyword If    '${AuthType}' != 'None'    Web.Select From List by Value    {AuthUsageDropdown}$    ${AuthType}
#    Run Keyword If    '${OTPType}' != 'None'    Run Keywords        Web.Scroll Element Into View    ${CopyrightSection}
#    ...                AND                         Web.Select From List by Value    ${OTPTypeDropdown}    ${OTPType}
#    Run Keyword If     '${TokenStatus}' != 'None'     Run Keyword    Web.Select From List by Value    ${TokenStatusLocator}    ${TokenStatus}
#    Web.Scroll Element Into View    ${CopyrightSection}
#    Run Keyword If    '${OTPWindowSize}' != 'None'    Web.Input Text    ${OTPWindowSizeLocator}    ${OTPWindowSize}
#    Run Keyword If    '${TokenType}' != '8'    Run Keyword     Check token type is not NymiBand     ${TokenType}
#    Run Keyword If     '${OTPLen}' != 'None'    Run Keyword     Web.Select From List by Value       ${OTPLength}       10
#    Wait Until the Update Icon Disappear
#    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenAddButton}
#    Wait Until the Update Icon Disappear
    #Verify Success Toast Message

Add Token To The User Account
    [Arguments]    ${TokenType}=None    ${UserDefinedName}=None    ${AuthType}=None    ${OTPWindowSize}=None    ${OTPType}=None    ${TokenStatus}=None    ${OTPLen}=None
    Web.Wait Until Element Is Visible    ${UserDefinedNameField}    ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Run Keyword If    '${TokenType}' != 'None'    Run Keyword    Select Token Type    ${TokenType}
    Run Keyword If    '${UserDefinedName}' != 'None'    Web.Input Text    ${UserDefinedNameField}    ${UserDefinedName}
    Run Keyword If    '${AuthType}' != 'None'    Web.Select From List by Value    ${AuthUsageDropdown}    ${AuthType}
    Run Keyword If    '${OTPType}' != 'None'    Run Keywords        Web.Scroll Element Into View    ${CopyrightSection}
    ...                AND                         Web.Select From List by Value    ${OTPTypeDropdown}    ${OTPType}
    Run Keyword If     '${TokenStatus}' != 'None'     Run Keyword    Web.Select From List by Value    ${TokenStatusLocator}    ${TokenStatus}
    Web.Scroll Element Into View    ${CopyrightSection}
    Run Keyword If    '${OTPWindowSize}' != 'None'    Web.Input Text    ${OTPWindowSizeLocator}    ${OTPWindowSize}
    Run Keyword If    '${TokenType}' != '8'    Run Keyword     Check token type is not NymiBand     ${TokenType}
    Run Keyword If     '${OTPLen}' != 'None'    Run Keyword     Web.Select From List by Value       ${OTPLength}       10
    Wait Until the Update Icon Disappear
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenAddButton}
    Wait Until the Update Icon Disappear
    #Verify Success Toast Message

Enter User Define Name
    [Arguments]    ${UserDefinedName}
    Web.Input Text    ${UserDefinedNameField}    ${UserDefinedName}

Check token type is not NymiBand
    [Arguments]    ${TokenType}
    Run Keyword If    '${TokenType}' != '13'    Check token type is not Desktop     ${TokenType}
    Sleep    ${SleepDelay2s}

Check token type is not Desktop
    [Arguments]    ${TokenType}
    Run Keyword If    '${TokenType}' != '10'    Check token type is not Voice Message OTP     ${TokenType}
    Sleep    ${SleepDelay2s}

Check token type is not Voice Message OTP
    [Arguments]    ${TokenType}
    Run Keyword If    '${TokenType}' != '1'    Check token type is not SMS Token    ${TokenType}
    Sleep    ${SleepDelay2s}

Check token type is not SMS Token
    [Arguments]    ${TokenType}
    Run Keyword If    '${TokenType}' != '7'    Run Keyword  Web.Select From List by Value           ${MobileSetupVerification}        0
    Sleep    ${SleepDelay2s}

Select Token Type
    [Arguments]    ${TokenType}
    # 1=Desktop Token, 12=Fido Token, 8=Google Auth Token, 13=Nymi Band, 7=SMS, 9=SurePass, 10=Voice Message OTP
    Web.Wait Until Element Is Visible    ${TokenTypeDropdown}    ${StandardTimeout}
    Web.Click Element    ${TokenTypeDropdown}
    Web.Select From List by Value    ${TokenTypeDropdown}    ${TokenType}
    sleep    ${SleepDelay2s}

Go To Token Page And Search Token
    [Arguments]    ${TokenName}    ${DropdownType}=3
    Sleep    ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokensTab}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${TokensTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}    ${StandardTimeout}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${DropdownType}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenName}
    Web.Click Element    ${SrNoFilterSearchIcon}
    Sleep   ${SleepDelay10s}
    #Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenName}"]    ${StandardTimeout}

Go To Token Page And Delete Token
    [Arguments]    ${TokenName}
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}    ${StandardTimeout}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${IsSrNoDropdown}
    Sleep   2s      #Wait to list token
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Sleep   2s      #Wait to list token
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenName}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${SrNoFilterSearchIcon}
    Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenName}"]    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokenPageDeleteAction}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokenPageDeleteAction}
    #    Web.Wait Until Element Is Visible    ${CrossIcon}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${PopupDeletebutton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${PopupDeletebutton}
    Wait Until the Update Icon Disappear
    Verify Success Toast Message

Verified Success Message For Token Delete
    [Arguments]     ${ActualMsg}
    Web.Wait Until Element Is Visible    ${successMsgGroup}    ${StandardTimeout}
    ${SuccessMsg}     Web.Get Text	  ${successMsgGroup}
    Should Be Equal     ${SuccessMsg}      ${ActualMsg}

Edit Token Name
    [Arguments]    ${TokenName}
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${IsSrNoDropdown}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Wait Until the Update Icon Disappear
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenName}
    Web.Click Element    ${SrNoFilterSearchIcon}
    Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenName}"]    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${TokenPageEditAction}    ${StandardTimeout}
    Web.Click Element    ${TokenPageEditAction}
    Web.Wait Until Element Is Visible    ${TokenNameEditField}    ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${TokenNameEditField}    ${StandardTimeout}
    Web.Input Text      ${TokenNameEditField}      TOKEN_NAME_TEST
    ${CopyTokenName}    Web.Get Text        ${TokenNameEditField}
    Web.Click Element    ${TokenEditUpdateLink}

Edit Assigned User Name In Token
    [Arguments]    ${TokenName}    ${UserName}
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${IsSrNoDropdown}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenName}
    Web.Click Element    ${SrNoFilterSearchIcon}
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenName}"]    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokenPageEditAction}    ${StandardTimeout}
    Web.Click Element    ${TokenPageEditAction}
    Sleep   ${SleepDelay5s}
    Web.Input Text     ${clickOnAssignToUsr}    demo.user01
    Sleep   ${SleepDelay5s}
    Web.Click Element    xpath://*[text()="${assignToUsrName}"]
    Web.Click Element    ${TokenEditUpdateLink}
    Web.Wait Until Element Is Visible    ${SuccessMessage}    ${StandardTimeout}

Edit Token Status
    [Arguments]    ${TokenName}    ${TokenStatus}
    # TokenStatus: -1 New, 0 Enabled, 1 Disabled
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${IsSrNoDropdown}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenName}
    Web.Click Element    ${SrNoFilterSearchIcon}
    Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenName}"]    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokenPageEditAction}    ${StandardTimeout}
    #Web.Click Element    ${TokenPageEditAction}
    Web.Wait Until Element Is Enabled  ${TokenPageEditAction}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokenPageEditAction}
    Web.Wait Until Element Is Visible    ${TokenStatusDropdown}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokenStatusDropdown}    ${StandardTimeout}
    Web.Select From List by Value    ${TokenStatusDropdown}    ${TokenStatus}
    Wait Until Keyword Succeeds  5x  1s    Web.Click Element    ${TokenEditUpdateLink}
    #Web.Wait Until Element Is Visible    ${SuccessMessage}    ${StandardTimeout}

Assign Token To The User
    [Arguments]    ${UserName}    ${TokenSerialNo}
    Web.Click Element    ${AssignTokenLink}
    Web.Wait Until Element Is Visible    ${AssignTokenSrNo}     ${StandardTimeout}
    Web.Input Text    ${AssignTokenSrNo}    ${TokenSerialNo}
    Web.Click Element    ${AssignTokenUsrDropdown}
    Web.Click Element    ${AssignTokenUsrDropdown}/option[contains(text(), "${UserName}")]
    Web.Click Element    ${AllowReassignCheckbox}
    Web.Click Element    ${EmailUserCheckbox}
    Web.Click Element    ${AssignTokenBtn}
    Web.Wait Until Page Contains    Token ${TokenSerialNo} is now assigned    ${StandardTimeout}

Create Temporary Password
    Web.Wait Until Element Is Visible    ${CreateTempPwd}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CreateTempPwd}     ${StandardTimeout}
    Web.Click Element      ${CreateTempPwd}
    sleep    ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${CreateTempPwdAction}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CreateTempPwdAction}     ${StandardTimeout}
    Web.Click Element    ${CreateTempPwdAction}
    Web.Wait Until Page Contains Element    ${CreateTempPwdMsg}    ${StandardTimeout}
    ${Message}    Web.Get Text    ${ToastPwdMsg}
    ${TempPwd}    Get Regexp Matches    ${Message}    \\d{6}
    Web.Wait Until Element Is Visible    ${CloseTempPwd}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CloseTempPwd}     ${StandardTimeout}
    Web.Click Element    ${CloseTempPwd}
#    Set Global Variable    ${TempPwd}
    [RETURN]    ${TempPwd}

Verify the Create Temporary Password PopUpMsg
    sleep   ${SleepDelay2s}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    ${ToastPopUpMsg}    Web.Get Text    ${ToastPopUpMsg}
    Page Should Contain     Temporary Passcode has been created. It is valid until
    String Should Contain   ${ToastPopUpMsg}    Temporary Passcode has been created. It is valid until

Check OTP From Tokens Page for Google Authenticator
    [Arguments]    ${Result}
#    Web.Wait Until Element Is Visible    ${CheckOTP}     ${StandardTimeout}
#    Web.Wait Until Element Is Enabled    ${CheckOTP}     ${StandardTimeout}
#    Web.Click Element    ${CheckOTP}
    Web.Wait Until Element Is Visible    ${OTPField}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${OTPField}     ${StandardTimeout}
    Sleep   ${SleepDelay3s}
    Web.Input Text    ${OTPField}    ${Result}
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${CheckOTPAction}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CheckOTPAction}     ${StandardTimeout}
    Web.Click Element    ${CheckOTPAction}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    ${ToastPopUpMsg}    Web.Get Text    ${ToastPopUpMsg}
    Should contain     ${ToastPopUpMsg}      Success

Check OTP From Tokens Page for AppOTP
    [Arguments]    ${Result}
    Web.Wait Until Element Is Visible    ${CheckOTP}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CheckOTP}     ${StandardTimeout}
    Web.Click Element    ${CheckOTP}
    Web.Wait Until Element Is Visible    ${OTPField}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${OTPField}     ${StandardTimeout}
    Sleep   ${SleepDelay3s}
    Web.Input Text    ${OTPField}    ${Result}
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${CheckOTPAction}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CheckOTPAction}     ${StandardTimeout}
    Web.Click Element    ${CheckOTPAction}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    ${ToastPopUpMsg}    Web.Get Text    ${ToastPopUpMsg}
    Should contain     ${ToastPopUpMsg}      Success


Check OTP From Tokens Page
    [Arguments]    ${TempPwd}
    Web.Wait Until Element Is Visible    ${CheckOTP}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CheckOTP}     ${StandardTimeout}
    Web.Click Element    ${CheckOTP}
    Web.Wait Until Element Is Visible    ${OTPField}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${OTPField}     ${StandardTimeout}
    Sleep   ${SleepDelay3s}
    Web.Input Text    ${OTPField}    ${TempPwd}
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${CheckOTPAction}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CheckOTPAction}     ${StandardTimeout}
    Web.Click Element    ${CheckOTPAction}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    ${ToastPopUpMsg}    Web.Get Text    ${ToastPopUpMsg}
    Should contain     ${ToastPopUpMsg}      Success

Check OTP From Tokens Page For Expired OTP
    [Arguments]    ${TempPwd}
    Web.Wait Until Element Is Visible    ${CheckOTP}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CheckOTP}     ${StandardTimeout}
    Web.Click Element    ${CheckOTP}

    Web.Wait Until Element Is Visible    ${OTPField}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${OTPField}     ${StandardTimeout}
    Web.Input Text    ${OTPField}    ${TempPwd}

    Web.Wait Until Element Is Visible    ${CheckOTPAction}     ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${CheckOTPAction}     ${StandardTimeout}
    Web.Click Element    ${CheckOTPAction}
    Page Should Contain    OTP is NOT valid.

Search The Token And Reset It
    [Arguments]    ${TokenSerialNo}
    Go To Token Page And Search Token    ${TokenSerialNo}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${TokenPageEditAction}    ${StandardTimeout}
    Web.Click Element    ${TokenPageEditAction}
    Web.Wait Until Element Is Visible    ${ResetToken}    ${StandardTimeout}
    Web.Click Element    ${ResetToken}
    Web.Wait Until Page Contains    Token activation has been reset. Users can activate this token again.

Compare User Assignment Status if Assigned
    Select User Assignment Filter     Assigned
    sleep  ${SleepDelay10s}
    ${Count}=    Web.Get Element Count   ${TokenPageEditAction}
    FOR     ${i}   IN RANGE    ${Count}
        ${AssigneeName}      Web.Get Text        //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c6"]
        ${LengthAssigneeName}      Get Length    ${AssigneeName}
        Should be True    ${LengthAssigneeName}>0
        should Be True    '${AssigneeName}' != '<not assigned>'
    END
    Sleep    ${SleepDelay5s}

Compare User Assignment Status if Unassigned
    Select User Assignment Filter     Unassigned
    Sleep   ${SleepDelay10s}
    ${Count}=    Web.Get Element Count   ${TokenPageEditAction}
    FOR     ${i}   IN RANGE    ${Count}
        ${AssigneeName}      Web.Get Text        //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c6"]
        Should Be Equal    ${AssigneeName}     <not assigned>
    END

Compare Device Status Filter
     # DeviceFilterName = New, Enabled or Disabled
    [Arguments]     ${DeviceFilterName}
    Web.Click Element     ${UserAssignmentFilter}
    Web.Click Element     //*[@id="ctl00_ContentPlaceHolder1_ddlDeviceStatus"]/*[text()="${DeviceFilterName}"]
    Sleep    ${SleepDelay5s}
    Web.Select From List by Value       ${DisplayRecordsFilter}        200
    Sleep    20s
    ${Count}=    Web.Get Element Count   ${TokenPageEditAction}
    FOR     ${i}   IN RANGE    ${Count}
        ${StatusName}      Web.Get Text        //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c4"]
        Should Be Equal    ${StatusName}     ${DeviceFilterName}
    END

Compare Serial Number Filter with Is
    [Arguments]       ${SNValue}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${IsSrNoDropdown}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    40s
    Sleep   ${SleepDelay10s}
    Web.Input Text    ${SrNoFilterSearchField}    ${SNValue}
    Web.Click Element    ${SrNoFilterSearchIcon}
    Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${SNValue}"]    ${StandardTimeout}

Reset Token Filters
    Web.Select From List by Value    //*[@id="ctl00_ContentPlaceHolder1_ddlBatch"]      -1
    Web.Select From List by Value    ${TokenTypeFilter}                                 -1
    Web.Select From List by Value    ${UserAssignmentFilter}                            -1
    Web.Select From List by Value    ${DeviceStatusFilter}                              -2
    Web.Select From List by Value    ${DisplayRecordsFilter}                             200
    Web.Select From List by Value    ${UserTokenFilter}                                   0
    Web.Select From List by Value    ${SerialNoFilterDropdown}                           0

Compare User Filter on Tokens
     # ${User_Filter_Select}  = Begins with, Is or Contains
    [Arguments]      ${User_Filter_Select}
    Web.Click Element     //*[@id="ctl00_ContentPlaceHolder1_ddlUserFilterComparator"]/*[text()="${User_Filter_Select}"]
    Sleep    20s
    Web.Input Text        ${UserTokenInputField}    ${SecondUser}
    Sleep    ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${UserTokenSearchBtn}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${UserTokenSearchBtn}    ${StandardTimeout}
    Web.Click Element                    ${UserTokenSearchBtn}
    #Web.Select From List by Value       ${DisplayRecordsFilter}        200
    Sleep    20s
    ${Count}=    Web.Get Element Count   ${TokenPageEditAction}
    FOR     ${i}   IN RANGE    ${Count}
        ${UserTokenName}      Web.Get Text        //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c5"]
        Should Contain    ${UserTokenName}        ${SecondUser}
    END

Compare Pagination
     Web.Select From List by Value    ${DisplayRecordsFilter}        200
     sleep   ${SleepDelay10s}
     Web.Scroll Element Into View    ${CopyrightSection}
     Web.Page should not contain element     //*[@id="ctl00_ContentPlaceHolder1_Grid1_pbt"]//*[text()="${intvalue}"]

Verify Token Type Field Is Disabled
     Go To Tokens Page
     Compare Serial Number Filter with Is       ${SNumToken}
     sleep    ${SleepDelay10s}
     Web.Wait Until Element Is Visible       ${TokenPageEditAction}
     Web.Click Element                        ${TokenPageEditAction}
     sleep    ${SleepDelay10s}
     Web.Element Should Be Disabled           ${TokenTypeDropdown}

Compare TokenID Values in Ascending order
       ${elementList}    Web.Get Web Elements     //*[@id="ctl00_ContentPlaceHolder1_Grid1_itemsHolder"]/*
       ${elementListLength}     Get Length     ${elementList}
        ${SerialNumList}    Create List
       FOR     ${i}  IN RANGE      ${3}
              ${TextElementList}     Web.Get Text      //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c2"]/div
             Web.Execute Javascript    $("#ctl00_ContentPlaceHolder1_Grid1_scrollOutter");
             Append To List     ${SerialNumList}     ${TextElementList}
             sleep   1s
       END

       FOR     ${i}   IN RANGE    ${2}
               ${newIndex}      Evaluate    ${i}+${1}
               ${HigherSrN0}    Get Regexp Matches    ${SerialNumList}[${newIndex}]    \\d+
               ${LowerSrN0}     Get Regexp Matches    ${SerialNumList}[${i}]    \\d+
               ${HigherInt}     Convert To Integer    ${HigherSrN0}[0]
               ${LowerInt}      Convert To Integer    ${LowerSrN0}[0]
               Should be True   ${HigherInt}>${LowerInt}
       END

Share Token With A User
    [Arguments]    ${FirstName}
    Web.Wait Until Element Is Visible    ${ShareTokenLink}    ${StandardTimeout}
    Web.Click Element    ${ShareTokenLink}
    sleep    ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${ShareTokenSearchBox}    ${StandardTimeout}
    Web.Input Text    ${ShareTokenSearchBox}    ${FirstName}
    Web.Click Element    ${ShareTokenSearchIcon}
    sleep    ${SleepDelay2s}
    Web.Click Element    ${ShareTokenUserDropDwn}
    sleep    ${SleepDelay2s}
    Web.Click Element    //*[@id="ctl00_ContentPlaceHolder1_ddlAssigned_Partner_User_IdData"]/*[contains(text(),"${FirstName}")]
    Web.Click Element    ${ShareTokenShareBtn}
    sleep   ${SleepDelay2s}
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}

Create Temporary Password and Check OTP
    [Arguments]     ${TokenType}
    Delete User form the User List if existing      ${inputUserName2}
    Add Admin User2 and retreive login detials
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=${TokenType}    UserDefinedName=${TokenDefName}
    ${SNValue}    Web.Get Value                  ${TokenEditSrNoField}
    set global variable                          ${SNValue}
    Go To Tokens Page
    Compare Serial Number Filter with Is         ${SNValue}
    sleep    ${sleepdelay5s}
    Web.Wait Until Element is Enabled            ${TokenPageEditCompare}           ${StandardTimeout}
    Web.Click Element                            ${TokenPageEditCompare}
    ${TempPwd}    Create Temporary Password
    Click On Logout option
    sleep      ${sleepdelay10s}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Clear Element Text                        ${UserNameLocator}
    Web.Input Text                                ${UserNameLocator}       ${UserValue2}
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text                                ${PasswordLocator}       ${Passwordvalue2}
    Web.Click Element                             ${SignInButton}
    Web.Wait Until Element Is Enabled             ${OtpTextBox}     ${StandardTimeout}
    Web.Input Text                                ${OtpTextBox}     ${TempPwd}
    Web.Click Element                             ${VerifyOtpButton}

Create Temporary Password and Check OTP for Alpha
    [Arguments]     ${TokenType}
    Delete User form the User List if existing      ${inputUserName2}
    Add Admin User2 and retreive login detials
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account for Alpha    TokenType=${TokenType}    UserDefinedName=${TokenDefName}
    ${SNValue}    Web.Get Value                  ${TokenEditSrNoField}
    set global variable                          ${SNValue}
    Go To Tokens Page
    Compare Serial Number Filter with Is         ${SNValue}
    sleep    ${sleepdelay5s}
    Web.Wait Until Element is Enabled            ${TokenPageEditCompare}           ${StandardTimeout}
    Web.Click Element                            ${TokenPageEditCompare}
    ${TempPwd}    Create Temporary Password
    Click On Logout option
    sleep      ${sleepdelay10s}
    Web.Wait Until Element Is Enabled             ${UserNameLocator}       ${StandardTimeout}
    Web.Clear Element Text                        ${UserNameLocator}
    Web.Input Text                                ${UserNameLocator}       ${UserValue2}
    Web.Wait Until Element Is Enabled             ${PasswordLocator}       ${StandardTimeout}
    Web.Input Text                                ${PasswordLocator}       ${Passwordvalue2}
    Web.Click Element                             ${SignInButton}
    Web.Wait Until Element Is Enabled             ${OtpTextBox}     ${StandardTimeout}
    Web.Input Text                                ${OtpTextBox}     ${TempPwd}
    Web.Click Element                             ${VerifyOtpButton}

Share Token with User
    [Arguments]    ${AssigneeUserName}
    Web.Wait Until Element Is Visible       ${AssigneeDropdownLocator}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled       ${AssigneeDropdownLocator}    ${StandardTimeout}
    Web.Click Element                       ${AssigneeDropdownLocator}
    sleep   ${SleepDelay5s}
    Web.Select From List By Label           ${AssigneeDropdownLocator}    ${AssigneeUserName}
    Sleep    ${SleepDelay10s}
    Web.Click Element                       ${ShareButtonLocator}

Delete Token If Existing
     [Arguments]    ${TokenName}
     set global variable    ${TokenName}
     Go To Token Page And Search Token    ${TokenName}
     ${Count}=    Web.Get Element Count   xpath://*[text()= "${TokenName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
     Run Keyword If  ${Count} > 0        Delete Tokens    ${Count}

Delete Tokens
    [Arguments]     ${Count}
    FOR     ${i}  IN RANGE      ${Count}
           Web.Wait Until Element Is Visible     xpath://*[text()= "${TokenName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]   ${StandardTimeout}
           Wait Until Keyword Succeeds  5x  1s      Web.Click Element       xpath://*[text()= "${TokenName}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
           Click on Delete button
           Verify Delete Token Success Message receive or not
    END

Click on Delete button
    sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${PopupDeletebutton}  ${StandardTimeout}
    Web.Click Element	                 ${PopupDeletebutton}

Verify Delete Token Success Message receive or not
    Web.Wait Until Element Is Visible    ${ToastPopUpMsg}    ${StandardTimeout}
    Page Should Contain     Token(s) has been deleted successfully.

Compare Token Type Values
    [Arguments]    ${TokenTypeValue}
    Web.Wait Until Element Is Visible    ${TokenTypeFilter}    ${StandardTimeout}
    Web.Click Element     ${TokenTypeFilter}
    Web.Click Element     //*[@id="ctl00_ContentPlaceHolder1_ddlType"]/*[text()="${TokenTypeValue}"]
    sleep  ${SleepDelay10s}
    ${Count}=    Web.Get Element Count   ${TokenPageEditAction}
    FOR     ${i}   IN RANGE    ${Count}
        Web.Element Should Contain     //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c5"]/*         ${TokenTypeValue}
        ${ValueId}   Web.Get Text    //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c1"]/*
    END

Select User Assignment Filter
     #UserAssignmentStats = Assigned or Unassigned
     [Arguments]     ${UserAssignmentStatus}
     Web.Click Element     ${UserAssignmentFilter}
     Web.Click Element     //*[@id="ctl00_ContentPlaceHolder1_ddlStatus"]/*[text()="${UserAssignmentStatus}"]

Enter OTP in Synchronize Section
    [Arguments]    ${AppOTP}
    Web.Click Element    ${SynchronizeBtn}
    Web.Wait Until Element Is Visible    ${SyncOTPBox}    ${StandardTimeout}
    Web.Input Text    ${SyncOTPBox}    ${AppOTP}
    Web.Click Element    ${SyncConfirm}

Add New User with Desktop Token
   Delete Token If Existing           ${TokenDefName}
   Delete User form the User List if existing      ${inputUserName}
   Add User and retrieve login details
   #Go To User Details Page       ${inputUserName}
   Go To Add New Soft Token Page From User Details Page
   Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName}      TokenStatus=0
   ${IdValue}    Web.Get Value    ${TokenID}
   set global variable      ${IdValue}

Verify Token Synchronization with Time Window
   [Arguments]       ${TimeWindowValue}=None
   Web.Click Element                            ${SynchronizeBtn}
   Sleep    ${SleepDelay10s}
   Run Keyword If    '${TimeWindowValue}' != 'None'    Web.Input Text    ${TimeWindow}         ${TimeWindowValue}
   Web.Wait Until Element Is Visible            ${SyncOTPBox}           ${StandardTimeout}
   Web.Input Text                               ${SyncOTPBox}               ${OTPValue}
   Web.Wait Until Element Is Visible            ${SyncConfirm}          ${StandardTimeout}
   Web.Click Element                            ${SyncConfirm}
   Sleep   ${SleepDelay5s}
   Web.Element Should Contain              ${SuccessMsgLocatorShare}           Token has been synchronized

Add New User with Google Authentication Token
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Add User and retrieve login details
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=8    UserDefinedName=${TokenDefName}      TokenStatus=0
    Extract Activation Code

Add New User with SurePassId Authentication Token
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName}
    Add User and retrieve login details
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=9    UserDefinedName=${TokenDefName}      TokenStatus=0

Add New Admin with Google Authentication Token
    Delete Token If Existing           ${TokenDefName}
    Delete User form the User List if existing      ${inputUserName2}
    Add Admin User2 and retreive login detials
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account      TokenType=8    UserDefinedName=${TokenDefName}      TokenStatus=0
    Extract Activation Code

Select Token PIN
    Sleep  ${SleepDelay5s}
    Web.Input Text    ${PINTextfieldLocator}       1234

Add New Admin with Desktop Token
   Delete Token If Existing           ${TokenDefName}
   Delete User form the User List if existing      ${inputUserName2}
   Add Admin User2 and retreive login detials
   #Go To User Details Page       ${inputUserName}
   Go To Add New Soft Token Page From User Details Page
   Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName}      TokenStatus=0
   ${IdValue}    Web.Get Value    ${TokenID}
   set global variable      ${IdValue}

Add New User with Desktop Token with 10 Digits
   Delete Token If Existing           ${TokenDefName}
   Delete User form the User List if existing      ${inputUserName}
   Add User and retrieve login details
   #Go To User Details Page       ${inputUserName}
   Go To Add New Soft Token Page From User Details Page
   Add Token To The User Account      TokenType=1    UserDefinedName=${TokenDefName}      TokenStatus=0       OTPLen=10
   ${IdValue}    Web.Get Value    ${TokenID}
   set global variable      ${IdValue}

Verify Success Toast Message
    Sleep   ${SleepDelay2s}
    Web.Wait Until Element Is Visible    ${ToastSuccess}    ${StandardTimeout}
    Web.Element Text Should Be          ${ToastSuccess}     Success

Go To Token Page And Search Token For SuperAdmin
    [Arguments]    ${TokenName}     ${AccountNametest}    ${DropdownType}=3
    Sleep    ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
#    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    sleep    ${SleepDelay5s}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${AccountDropdown}    ${StandardTimeout}
    Web.Select From List By Label       ${AccountDropdown}      ${AccountNametest}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}    ${StandardTimeout}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${DropdownType}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenName}
    Web.Click Element    ${SrNoFilterSearchIcon}
    Sleep   ${SleepDelay10s}
    #Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenName}"]    ${StandardTimeout}
