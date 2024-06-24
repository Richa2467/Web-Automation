*** Settings ***
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../resources/SSPResource.robot
Resource    ../locators/SSPLocator.robot
Resource    ../locators/SettingsPageLocator.robot
Resource    ../Resources/TokenGroupResource.robot
Resource    ../labels/LoginPageLabel.robot

Suite Setup    Run Keywords    Open SurePass On Browser    AND
...                            Submit 2FA Page Using Email OTP    6
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify the presence of header fields of the Tokens table
     [Tags]    USR_TKN_LIST_001    SurePassID_M1                 SurePassId_Web
     Go To User Details Page        ${UserName}
     Wait Until the Update Icon Disappear
     Web.Element Should Contain      ${ActionHeaderLocator}     Action
     Web.Element Should Contain      ${SNHeaderLocator}         Serial Number
     Web.Element Should Contain       ${UserDefHeaderLocator}   User Defined Name
     Web.Element Should Contain      ${StatusHeaderLocator}     Status
     Web.Element Should Contain      ${TokenTypeHeaderLocator}  Token Type

Verify that in the 'Action' column, Edit and Delete options should be listed
     [Tags]     USR_TKN_LIST_002    SurePassID_M1                 SurePassId_Web
     Go To Token Page
     Web.Page Should Contain Element    ${EditLinkLocator}
     Web.Page Should Contain Element    ${DeleteLinkLocator}

Verify the scroll functionality of the tokens table is working properly
     [Tags]    USR_TKN_LIST_003     SurePassID_M1                    SurePassId_Web
     Go To User Details Page    ${UserName}
     Web.Scroll Element Into View    ${CopyrightSection}
     Web.Execute Javascript    $("#ctl00_ContentPlaceHolder1_Grid1_scrollOutter").animate({ scrollTop: 200 });

Verify that by clicking the Tokens table header fields, the table content is sorted in ascending/descending order
        [Tags]    USR_TKN_LIST_004     SurePassId_Web
     Go To User Details Page    ${UserName3}
     sleep   5s
     Web.Scroll Element Into View    ${CopyrightSection}
     Web.Click Element      ${SNHeaderLocator}
     ${elementList}    Web.Get WebElements     //*[@id="ctl00_ContentPlaceHolder1_Grid1_itemsHolder"]/*
     ${elementListLength}     Get Length     ${elementList}
     ${SerialNumList}    Create List
     FOR     ${i}  IN RANGE      20     #${elementListLength}-${6}
            ${TextElementList}     Web.Get Text       //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c1"]//following-sibling::div[1]//*[@class="tabBodyCellStyle"]
            log to console         ${TextElementList}
            Web.Execute Javascript    $("#ctl00_ContentPlaceHolder1_Grid1_scrollOutter").animate({ scrollTop: 50+(${i}*${30})});
            ${stringLength}    Get Length    ${TextElementList}
            log to console    ${stringLength}
            Run Keyword If    ${stringLength} != 0    Run Keyword    Append To List     ${SerialNumList}     ${TextElementList}
            sleep   1s
     END
     Log To Console    ${SerialNumList}
     ${SNLength}     Get Length     ${SerialNumList}
     ${TotalSNLenght}    Evaluate    ${SNLength}-${1}
#     log to console     ${SNLength}
#     log to console     ${TotalSNLenght}
     FOR     ${i}   IN RANGE    ${TotalSNLenght}
              ${newIndex}    Evaluate    ${i}+${1}
              ${HigherSrN0}    Get Regexp Matches    ${SerialNumList}[${newIndex}]    \\d+
              ${LowerSrN0}    Get Regexp Matches    ${SerialNumList}[${i}]    \\d+
              ${HigherInt}    Convert To Integer    ${HigherSrN0}[0]
              ${LowerInt}    Convert To Integer    ${LowerSrN0}[0]
              Should be True    ${HigherInt}>${LowerInt}
     END
       sleep    5s
       Web.Execute Javascript    $("#ctl00_ContentPlaceHolder1_Grid1_scrollOutter").animate({ scrollTop: 0});
       sleep    5s


      Web.Click Element      ${SNHeaderLocator}
      sleep    10s
      ${elementList}    Web.Get WebElements    //*[@class="tabBodyAltItemStyle"]
      ${elementListLength}     Get Length     ${elementList}
#      log to console      ${elementListLength}
      ${SerialNumList}    Create List
     FOR     ${i}  IN RANGE     20    # ${elementListLength}-${6}
            ${TextElementList}     Web.Get Text      //*[@id="ctl00_ContentPlaceHolder1_Grid1_i${i}_c1"]//following-sibling::div[1]//*[@class="tabBodyCellStyle"]
            Web.Execute Javascript    $("#ctl00_ContentPlaceHolder1_Grid1_scrollOutter").animate({ scrollTop: 50+(${i}*${30})});
            ${stringLength}    Get Length    ${TextElementList}
            log to console    ${stringLength}
            Run Keyword If    ${stringLength} != 0    Run Keyword    Append To List     ${SerialNumList}     ${TextElementList}
            sleep   1s
     END
     Log To Console    ${SerialNumList}
     ${SNLength}     Get Length     ${SerialNumList}
     ${TotalSNLenght}    Evaluate    ${SNLength}-${1}
     log to console     ${SNLength}
     log to console     ${TotalSNLenght}
      FOR     ${i}   IN RANGE    ${TotalSNLenght}
              ${newIndex}    Evaluate    ${i}+${1}
              ${HigherSrN0}    Get Regexp Matches    ${SerialNumList}[${newIndex}]    \\d+
              ${LowerSrN0}    Get Regexp Matches    ${SerialNumList}[${i}]    \\d+
              ${HigherInt}    Convert To Integer    ${HigherSrN0}[0]
              ${LowerInt}    Convert To Integer    ${LowerSrN0}[0]
              Should be True    ${HigherInt}<${LowerInt}
      END

Verify that by clicking the Tokens table header field which has only a single type of content, the table remains unchanged
       [Tags]     USR_TKN_LIST_005    SurePassID_M1                          SurePassId_Web
       Delete User form the User List if existing       ${inputUserName}
       Navigate to Users Folder
       Click on New Option
       Provide required details for the new user
       Click on Add button
       ${UserValue}    Web.Get Value    ${UserNameField}
       Wait Until the Update Icon Disappear
       Go To User Details Page         ${UserValue}
       Go To Add New Soft Token Page From User Details Page
       Wait Until the Update Icon Disappear
       Add Token To The User Account    TokenType=9    UserDefinedName=Token1
       Wait Until Keyword Succeeds  5x  1s  Web.Click Element     ${CloseTempPwd}
       Go To Add New Soft Token Page From User Details Page
       Add Token To The User Account    TokenType=9    UserDefinedName=Token2
       Wait Until Keyword Succeeds  5x  1s  Web.Click Element     ${CloseTempPwd}
       Go To Add New Soft Token Page From User Details Page
       Add Token To The User Account    TokenType=9    UserDefinedName=Token3
       Wait Until Keyword Succeeds  5x  1s  Web.Click Element     ${CloseTempPwd}
       Web.Scroll Element Into View     ${CopyrightSection}
       Compare TokenID Values in Ascending order
       Wait Until Keyword Succeeds  5x  1s  Web.Click Element   ${StatusHeaderLocator}
       Compare TokenID Values in Ascending order

Verify that when a token is created without a user-defined name, it gets listed on the Tokens table with an auto genrated user defined name
    [Tags]    USR_TKN_LIST_006    SurePassID_M1                     SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=9
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Go To User Details Page    ${UserName}
    Web.Scroll Element Into View    ${CopyrightSection}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
    Web.Wait Until Element Is Visible    xpath://*[text()="${TokenSerialNo}"]//parent::div//following-sibling::div[1]/*    ${StandardTimeout}
    ${TokenName}    Web.Get Text    xpath://*[text()="${TokenSerialNo}"]//parent::div//following-sibling::div[1]/*
    Page Should Contain         ${TokenName}

Verify that when the token name is changed, that change gets reflected on the Tokens form of the user detail page
    [Tags]    USR_TKN_LIST_007    SurePassID_M1                SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=${UDNTokenName}
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    ${EditedTokenName}    Edit Token Name    ${UDNTokenName}
    Go To User Details Page    ${UserName}
    Web.Scroll Element Into View    ${CopyrightSection}
    Scroll Page To Location   0   1000
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
    Web.Wait Until Page Contains Element    xpath://*[@class="tabBodyCellStyle" and text()="TOKEN_NAME_TEST"]    ${StandardTimeout}
    Delete Token If Existing     ${TokenSerialNo}

Verify when the assigned user of the token is changed, the token no long appears in the current user's tokens listing table and instead appears in the token's newly assigned user's page
    [Tags]    USR_TKN_LIST_008    SurePassID_M1                 SurePassId_Web
    Delete User form the User List if existing    ${inputUserName}
    Navigate to Users Folder
    Click on New Option
    Provide required details for the new user
    Click on Add button
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=${TokenDefName}
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Log To Console      ${TokenSerialNo}
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${IsSrNoDropdown}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenDefName}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SrNoFilterSearchIcon}
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenDefName}"]    ${StandardTimeout}
    Log To Console      ${TokenDefName}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${EditUDF}
    Wait Until the Update Icon Disappear
    Web.Input Text    ${AssignTokenUsrDropdown}     ${inputUserName}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenAddButton}

Verify when an enabled/new token's status is changed to disabled, the change status should appear in the Tokens table
    [Tags]    USR_TKN_LIST_009    SurePassID_M1                 SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Tinker4     TokenStatus=1
    Web.Scroll Element Into View    ${CopyrightSection}
    Update and Verify Success Message
    Go To User Details Page    ${UserName}
    Web.Wait Until Element Is Visible    ${CopyrightSection}
    Web.Scroll Element Into View    ${CopyrightSection}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
    Web.Wait Until Page Contains Element    //*[text()="Tinker4"]/parent::div/following-sibling::div//*[text()="Disabled"]    ${StandardTimeout}
    Web.Page Should Contain Element    //*[text()="Tinker4"]/parent::div/following-sibling::div//*[text()="Disabled"]

Verify when an enabled/disabled token's status is changed to new, the changed status should appear in the Tokens table
    [Tags]    USR_TKN_LIST_010    SurePassID_M1                        SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=${TokenDefName}     TokenStatus=-1
    Web.Scroll Element Into View    ${CopyrightSection}
    Update and Verify Success Message
    Go To User Details Page    ${UserName}
    Web.Wait Until Element Is Visible    ${CopyrightSection}
    Web.Scroll Element Into View    ${CopyrightSection}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
    Web.Scroll Element Into View    ${CopyrightSection}
    Web.Wait Until Page Contains Element    //*[text()="${TokenDefName}"]/parent::div/following-sibling::div/*[text()="New"]    ${StandardTimeout}
    Web.Page Should Contain Element    //*[text()="${TokenDefName}"]/parent::div/following-sibling::div/*[text()="New"]

Verify when an disabled/new token's status is changed to enabled, the changed status should appear in the Tokens table
     [Tags]   USR_TKN_LIST_011    SurePassID_M1                  SurePassId_Web
     Delete Token If Existing       Disabled_Token
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=Disabled_Token     TokenStatus=1
     ${DisabledTokenSN}    Web.Get Value     ${SerialNumber}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Close}
     Web.Scroll Element Into View     ${CopyrightSection}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element       xpath://*[text()= "${DisabledTokenSN}"]/parent::div//parent::div//*[@src="images/icons-mini/edit.png"]
     Web.Select From List by Value    ${TokenStatusLocator}       0
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element                ${TokenEditUpdateLink}

Verify when the user clicks on the Cancel button, the user is redirected to the update user page
      [Tags]   USR_TKN_LIST_012    SurePassID_M1                SurePassId_Web
      Delete Token If Existing          ${TokenDefName}
      Go To User Details Page    ${UserName}
      Go To Add New Soft Token Page From User Details Page
      Add Token To The User Account    TokenType=9    UserDefinedName=${TokenDefName}
      ${CancelDelTokenSN}    Web.Get Value     ${SerialNumber}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Close}
      Web.Scroll Element Into View     ${CopyrightSection}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element       xpath://*[text()= "${CancelDelTokenSN}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${CloseSuccessMsg}
      Web.Element Should Contain     ${UserDetailPageHeader}     Update

Verify when the user clicks on the Delete button, the token is successfully deleted
      [Tags]   USR_TKN_LIST_013    SurePassID_M1        SurePassId_Web
      Delete Token If Existing         ${TokenDefName}
      Go To User Details Page    ${UserName}
      Go To Add New Soft Token Page From User Details Page
      Add Token To The User Account    TokenType=9    UserDefinedName=${TokenDefName}
      ${SuccessDelTokenSN}    Web.Get Value     ${SerialNumber}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Close}
      Web.Scroll Element Into View     ${CopyrightSection}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${UserDefHeaderLocator}
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element       xpath://*[text()= "${SuccessDelTokenSN}"]/parent::div//parent::div//*[@src="images/icons-mini/trash_black_white.png"]
      Wait Until the Update Icon Disappear
      Wait Until Keyword Succeeds  5x  1s  Web.Click Element   ${DeleteButton}
      Wait Until the Update Icon Disappear
      Web.Element Text Should Be          ${ToastSuccess}     Success

Verify that a disabled token is getting enabled from ServicePass portal
     [Tags]   USR_TKN_LIST_014    SurePassID_M1     SSP
     Delete Token If Existing           ${TokenDefName}
     Delete User form the User List if existing      ${inputUserName}
     Add User and retrieve login details
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=${TokenDefName}     TokenStatus=1
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${Close}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=Test_token_12     TokenStatus=0
     ${DisabledTokenSN}    Web.Get Value     ${SerialNumber}
     set global variable     ${DisabledTokenSN}
     Close Window
     Enable Selected Mobile Token
     Open SurePass On Browser
     Submit 2FA Page Using Email OTP      6
     Go To User Details Page    ${UserValue}
     sleep   ${SleepDelay5s}
     Web.Scroll Element Into View     ${CopyrightSection}
     Web.Page Should Contain Element         xpath://*[text()="${TokenDefName}"]/parent::div/parent::div//*[text()="Enabled"]

Verify that a token is getting deleted from ServicePass portal
     [Tags]    USR_TKN_LIST_015    SurePassID_M1        SSP
     Delete Token If Existing          ${TokenDefName}
     Delete User form the User List if existing      ${inputUserName}
     Add User and retrieve login details
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=${TokenDefName}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${Close}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=Test_token_99
     Close Window
     Open ServicePass On Browser
     Submit First SSP Login Page       ${UserValue}    ${Passwordvalue}
     Submit SSP 2FA
     Delete Selected Token    ${TokenDefName}

Verify that a token is getting added from ServicePass portal
     [Tags]    USR_TKN_LIST_016    SurePassID_M1        SSP
#     Delete User form the User List if existing      ${inputUserName}
#     Add User and retrieve login details
     Open ServicePass On Browser
     Submit First SSP Login Page       ${UserValue}  ${Passwordvalue}
     Submit SSP 2FA
     Add Mobile Token
     ${TokenValue}   Web.Get Text     ${TokenIdValue}
     Web.Close Window
     Open SurePass On Browser
     Submit 2FA Page Using Email OTP     6
     Go To User Details Page          ${UserValue}
     sleep   ${SleepDelay5s}
     Web.Scroll Element Into View    ${CopyrightSection}
     Web.Page Should Contain Element      xpath://*[text()="${TokenValue}"]

Verify Helpdesk user should view tokens of selected Users.
       [Tags]    USR_TKN_LIST_017    SurePassID_M1      SurePassId_Web
       Delete User form the User List if existing    ${inputUserName}
       Navigate to Users Folder
       Click on New Option
       Provide required details for the new user
       Select Helpdesk User role
       ${Passwordvalue}    Web.Get Value      ${getPassword}
       set global variable  ${Passwordvalue}
       Click on Add button
       ${UserValue}    Web.Get Value    ${UserNameField}
       set global variable  ${UserValue}
       Delete Token If Existing          ${TokenDefName}
       Go To User Details Page     ${UserValue}
       Go To Add New Soft Token Page From User Details Page
       Add Token To The User Account    TokenType=9    UserDefinedName=${TokenDefName}
       ${TokenNoValue}     Web.Get Value     ${TokenEditSrNoField}
       Wait Until Keyword Succeeds  5x  1s  Web.Click Element          ${ClickOnLogout}
       Submit First Login Page for Helpdesk User      ${inputUserName}       ${Passwordvalue}
       Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AcknowledgeCheckbox}
       Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${AcknowledgeLicense}
       View User Details Page      ${UserValue}
       Web.Scroll Element Into View     ${CopyrightSection}
       Web.Page Should Contain Element     xpath://*[text()="${TokenNoValue}"]