*** Settings ***
Library     DateTime
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot
Resource    ../labels/TokenPageLabel.robot
Resource    ../resources/ManageDashboardResource.robot

Suite Setup    Run Keywords    Open SurePass On Browser    AND
...           Submit 2FA Page Using Email OTP    6
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify that name of user matches on both Tokens page and Update Token page
   [Tags]   EDT_TKN_OPTN_001   SurePassID_M1        SurePassId_Web
   Go To User Details Page    ${UserName}
   Go To Add New Soft Token Page From User Details Page
   Add Token To The User Account    TokenType=9    UserDefinedName=${UDNTokenName}
   ${SelectedValue}     Get Value    xpath://*[@id="ctl00_ContentPlaceHolder1_tbxAssignedUser"]
   #${SelectedValue}    Web.Get Selected List Label    ${TokenUpdateUser}
   ${SNumToken}      Get Value      ${TokenEditSrNoField}
   Go To Tokens Page
   Compare Serial Number Filter with Is    ${SNumToken}
   Wait Until Keyword Succeeds  5x  1s  Web.Click Element   ${TokenPageEditAction}
   Wait Until the Update Icon Disappear
   ${SelectedValue2}     Get Value    xpath://*[@id="ctl00_ContentPlaceHolder1_tbxAssignedUser"]
   should be equal as strings    ${SelectedValue}   ${SelectedValue2}
   Go To Token Page And Delete Token    Token_to_test
   Verified Success Message For Token Delete        ${TokenDeleteSuccessMsg}

Verify that Serial Number, User Defined Name, Status, and Token Type of the token is matching on both Tokens page and Update Token page
    [Tags]   EDT_TKN_OPTN_002    SurePassID_M1      SurePassId_Web
    Delete Token If Existing    Token_to_test
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=9    UserDefinedName=${UDNTokenName}
    ${SNumToken}      Get Value      ${TokenEditSrNoField}
    Go To Tokens Page
    Compare Serial Number Filter with Is     ${SNumToken}
    ${TokenSNValue}               Web.Get Text        //*[@id="ctl00_ContentPlaceHolder1_Grid1_i0"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i0_c2"]
    ${TokenUserAssigneeName}      Web.Get Text        //*[@id="ctl00_ContentPlaceHolder1_Grid1_i0"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i0_c3"]
    ${TokenStatusName}            Web.Get Text        //*[@id="ctl00_ContentPlaceHolder1_Grid1_i0"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i0_c4"]
    ${TokenTypename}              Web.Get Text        //*[@id="ctl00_ContentPlaceHolder1_Grid1_i0"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i0_c5"]
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${TokenPageEditAction}
    Wait Until the Update Icon Disappear
    ${EditTokenSNValue}     Web.Get Value   ${TokenEditSrNoField}
    ${EditTokenUserAssigneeName}     Web.Get Value              ${TokenNameEditField}
    ${EditTokenStatusName}           Get Selected List Label    ${TokenStatusDropdown}
    should be equal as strings      ${TokenUserAssigneeName}              ${UDNTokenName}
    should be equal as strings      ${TokenStatusName}     Enabled

Verify that on clicking the close button, the user is getting redirected to Tokens page
    [Tags]   EDT_TKN_OPTN_003    SurePassID_M1   False_Fail              SurePassId_Web
    Delete Token If Existing    Token_to_test
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=9    UserDefinedName=${UDNTokenName}
    ${SNumToken}      Get Value      ${TokenEditSrNoField}
    Go To Tokens Page
    Compare Serial Number Filter with Is     ${SNumToken}
    Web.Wait Until Element Is Visible       ${TokenPageEditAction}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element                        ${TokenPageEditAction}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Close}
    Web.Page Should Contain Element    //*[@id="ctl00_ContentPlaceHolder1_lblPageHeader"]       Tokens

Verify that change in token's assigned user is getting reflected on the Tokens page
     [Tags]   EDT_TKN_OPTN_004    SurePassID_M1                  SurePassId_Web
    Delete Token If Existing    Token_to_test
    Go To User Details Page    ${inputUserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=9    UserDefinedName=${UDNTokenName}
    ${SNumToken}      Get Value      ${TokenEditSrNoField}
    Go To Tokens Page
    Compare Serial Number Filter with Is        ${SNumToken}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible       ${TokenPageEditAction}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element                        ${TokenPageEditAction}
    Wait Until the Update Icon Disappear
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element     ${TokenUpdateUser}
    Wait Until the Update Icon Disappear
    Web.Input Text     ${clickOnAssignToUsr}    TestUserName
    Web.Input Text       ${TokenUpdateUser}     Cynthia Williams (cynthia.williams)
    Randome Click On Screen
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Update}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Close}
    Compare Serial Number Filter with Is      ${SNumToken}
    ${TokenUserAssigneeName}      Web.Get Text         //*[text()= "${SNumToken}"]/parent::div//parent::div//*//parent::div//div[3]/*
    ${Name}      Remove String Using Regexp    ${TokenUserAssigneeName}    \(\w+.+\w+\)
    should be equal as strings    ${TokenUserAssigneeName}      ${Name}

Verify that change in token's Status is getting reflected on the Tokens page
     [Tags]   EDT_TKN_OPTN_005    SurePassID_M1            SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     Go To Tokens Page
     Compare Serial Number Filter with Is       ${SNumToken}
     Web.Wait Until Element Is Visible       ${TokenPageEditAction}
     Wait Until the Update Icon Disappear
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${TokenPageEditAction}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${TokenStatusDropdown}
     Web.Select From List By Label      ${TokenStatusDropdown}         Disabled
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Update}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Close}
     Wait Until the Update Icon Disappear
     ${TokenStatus}      Web.Get Text         //*[@id="ctl00_ContentPlaceHolder1_Grid1_i0"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i0_c4"]
     should be equal as strings      ${TokenStatus}     Disabled

Verify that change in token's User Defined Name is getting reflected on the Tokens page
     [Tags]   EDT_TKN_OPTN_006    SurePassID_M1                SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     Go To Tokens Page
     Compare Serial Number Filter with Is       ${SNumToken}
     sleep    ${SleepDelay10s}
     Web.Wait Until Element Is Visible       ${TokenPageEditAction}
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element                        ${TokenPageEditAction}
     Wait Until the Update Icon Disappear
     Web.Input Text     ${UserDefinedNameField}     Update_Token
     Wait Until the Update Icon Disappear
     Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Update}
     Wait Until the Update Icon Disappear
     Compare Serial Number Filter with Is       ${SNumToken}
     ${UpdatedName}      Web.Get Text         //*[@id="ctl00_ContentPlaceHolder1_Grid1_i0"]//*[@id="ctl00_ContentPlaceHolder1_Grid1_i0_c3"]
     should be equal as strings      ${UpdatedName}     Update_Token

Verify the Token Type field of Desktop Token is disabled
     [Tags]   EDT_TKN_OPTN_007    SurePassID_M1             SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}
     Verify Token Type Field Is Disabled

Verify the Token Type field of Fido Token is disabled
     [Tags]   EDT_TKN_OPTN_008    SurePassID_M1                SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=8    UserDefinedName=Token_to_test
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}
     Verify Token Type Field Is Disabled

Verify the Token Type field of Google Authenticator Token is disabled
     [Tags]   EDT_TKN_OPTN_009    SurePassID_M1               SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=8    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}
     Verify Token Type Field Is Disabled

Verify the Token Type field of Nymi Band Token is disabled
     [Tags]   EDT_TKN_OPTN_010    SurePassID_M1                SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=13    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}
     Verify Token Type Field Is Disabled

Verify the Token Type field of SMS Token is not editable
     [Tags]   EDT_TKN_OPTN_011    SurePassID_M1                 SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=7    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}
     Verify Token Type Field Is Disabled

Verify the Token Type field of SurePassID authentication Token is disabled
     [Tags]   EDT_TKN_OPTN_012    SurePassID_M1                 SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=9    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}
     Verify Token Type Field Is Disabled

Verify the Token Type field of Voice Message OTP Token is not editable
     [Tags]   EDT_TKN_OPTN_013    SurePassID_M1                      SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=10    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}
     Verify Token Type Field Is Disabled

Verify that token is getting deleted from Tokens page
     [Tags]   EDT_TKN_OPTN_014    SurePassID_M1                   SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=10    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}

Verify that user is getting redirected to Tokens page from Delete Token page
    [Tags]   EDT_TKN_OPTN_015    SurePassID_M1                   SurePassId_Web
     Delete Token If Existing    Token_to_test
     Go To User Details Page    ${UserName}
     Go To Add New Soft Token Page From User Details Page
     Add Token To The User Account    TokenType=10    UserDefinedName=${UDNTokenName}
     ${SNumToken}      Get Value      ${TokenEditSrNoField}
     set global variable    ${SNumToken}
     Go To Token Page And Delete Token      ${SNumToken}
     #Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${Cancel}
     Web.Page Should Contain Element    //*[@id="ctl00_ContentPlaceHolder1_lblPageHeader"]       Tokens