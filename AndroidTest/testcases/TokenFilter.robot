*** Settings ***
Library     DateTime
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot


Suite Setup    Run Keywords    Open SurePass On Browser    AND
...           Submit 2FA Page Using Email OTP    6
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify the Token Type filter is working properly
    [Tags]    TKN_FLTR_LST_002    SurePassID_M1     SurePassId_Web
    Go To Tokens Page
    Compare Token Type Values      Nymi Band

Verify the User Assignment Status filter is working
    [Tags]    TKN_FLTR_LST_003    SurePassID_M1     SurePassId_Web
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${UserAssignmentFilter}    ${StandardTimeout}
    Compare User Assignment Status if Assigned
    Compare User Assignment Status if Unassigned

Verify the Device Status filter is working properly
    [Tags]    TKN_FLTR_LST_004    SurePassID_M1     SurePassId_Web
    Go To Tokens Page
    Web.Wait Until Element Is Visible    ${DeviceStatusFilter}    ${StandardTimeout}
    Compare Device Status Filter    Enabled

Verify the Serial Number filter 'Contains' is working properly
    [Tags]    TKN_FLTR_LST_005    SurePassID_M1     SurePassId_Web
    Delete Token If Existing     ${TokenDefName}
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=${TokenDefName}
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${ContainsSrNoDropdown}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenDefName}
    Wait Until the Update Icon Disappear
    Web.Click Element    ${SrNoFilterSearchIcon}
    Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenDefName}"]    ${StandardTimeout}
    Web.Page Should Contain Element    //*[@class="tabBodyCellStyle" and text()="${TokenDefName}"]

Verify the Serial Number filter 'Begins With' is working properly
    [Tags]    TKN_FLTR_LST_006    SurePassID_M1     SurePassId_Web
    Delete Token If Existing     ${TokenDefName}
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=${TokenDefName}
    ${TokenSerialNo}    Web.Get Element Attribute    ${TokenEditSrNoField}    ${Value}
    Web.Wait Until Element Is Visible    ${TokensTab}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${TokensTab}    ${StandardTimeout}
    Web.Click Element    ${TokensTab}
    Web.Wait Until Element Is Visible    ${SerialNoFilterDropdown}
    Web.Select From List by Value    ${SerialNoFilterDropdown}    ${BeginsWithSrNoDropdown}
    Web.Wait Until Element Is Visible    ${SrNoFilterSearchField}    ${StandardTimeout}
    Web.Input Text    ${SrNoFilterSearchField}    ${TokenSerialNo}
    Wait Until the Update Icon Disappear
    Web.Click Element    ${SrNoFilterSearchIcon}
    Web.Wait Until Element Is Visible    //*[@class="tabBodyCellStyle" and text()="${TokenDefName}"]    ${StandardTimeout}

Verify the Serial Number filter 'Is' is working properly
    [Tags]    TKN_FLTR_LST_007    SurePassID_M1     SurePassId_Web
    Go To User Details Page    ${UserName}
    Go To Add New Soft Token Page From User Details Page
    Add Token To The User Account    TokenType=1    UserDefinedName=Token_to_test_SN
    ${SNValue}    Web.Get Value      ${TokenEditSrNoField}
    set global variable   ${SNValue}
    Go To Tokens Page
    Wait Until the Update Icon Disappear
    Reset Token Filters
    Wait Until the Update Icon Disappear
    Compare Serial Number Filter with Is    ${SNValue}
    [Teardown]     Delete Token If Existing   Token_to_test_SN

Verify the User filter 'Contains' is working properly
    [Tags]    TKN_FLTR_LST_009    SurePassID_M1     SurePassId_Web
    Go To Tokens Page
    Reset Token Filters
    Compare User Filter on Tokens    Contains

Verify the User filter 'Is' is working properly
     [Tags]    TKN_FLTR_LST_008    SurePassID_M1     SurePassId_Web
    Go To Tokens Page
    Reset Token Filters
    Compare User Filter on Tokens    Is

Verify the User filter 'Begins With' is working properly
    [Tags]    TKN_FLTR_LST_010    SurePassID_M1     SurePassId_Web
    Go To Tokens Page
    Reset Token Filters
    Compare User Filter on Tokens    Begins with

Verify when the number of Rows to Display is increased, the number of page links given at the bottom of the table should change dynamically
     [Tags]    TKN_FLTR_LST_012    SurePassID_M1     SurePassId_Web
     Go To Tokens Page
     Web.Select From List by Value    ${DisplayRecordsFilter}        20
     ${PageCountText}     Web.Get Text     ${PageCountLocator}
     ${PageCount}    Get Regexp Matches    ${PageCountText}    \\d+
     ${PageCount}    Convert To Integer    ${PageCount}[0]
     ${TokenCount}=  evaluate   ${PageCount}*20
     ${dividevalue}=  evaluate   ${TokenCount}/200
     ${result} =	Convert To Number	${dividevalue}	0
     ${final}=   evaluate  ${result}+${1}
     ${intvalue}   convert to integer  ${final}
     set global variable    ${intvalue}
     Run Keyword If    ${intvalue}>8       Run Keywords       Web.Page should not contain element      xpath://*[@id="ctl00_ContentPlaceHolder1_Grid1_pbt"]//*[text()="${intvalue}"]
     ...                                   And                Compare Pagination

Verify that by clicking header field which has only a single type of content, the table remains unchanged
     [Tags]    TKN_FLTR_LST_013    SurePassID_M1     SurePassId_Web
     Go To Tokens Page
     Web.Select From List by Value    ${TokenTypeFilter}                          1
     Compare TokenID Values in Ascending order
     Web.Click Element      ${TokenTypeHeaderLocator}
     Compare TokenID Values in Ascending order
     #Web.Click Element      ${TokenTypeHeaderLocator}

Verify User is able to re-arrange Columns in Token list table
     [Tags]    TKN_FLTR_LST_014    SurePassID_M1     SurePassId_Web
     Go To Tokens Page
     Web.Wait Until Element Is Visible      ${UserDefHeaderLocator}     ${StandardTimeout}
     ${homeTabEleBeforeDandD}    Web.Execute JavaScript    return document.querySelector('#ctl00_ContentPlaceHolder1_Grid1_c1_i').getBoundingClientRect().left
     Web.Drag And Drop    ${SNHeaderLocator}       ${StatusHeaderLocator}
    ${homeTabEleAfterDandD}    Web.Execute JavaScript    return document.querySelector('#ctl00_ContentPlaceHolder1_Grid1_c1_i').getBoundingClientRect().left

Verify User is not able to rearrange Action column in Token list table
     [Tags]    TKN_FLTR_LST_015    SurePassID_M1     SurePassId_Web
     Go To Tokens Page
     Web.Wait Until Element Is Visible      ${UserDefHeaderLocator}     ${StandardTimeout}
     ${homeTabEleBeforeDandD}    Web.Execute JavaScript    return document.querySelector('#ctl00_ContentPlaceHolder1_Grid1_c0_i').getBoundingClientRect().left
     Web.Drag And Drop    ${ActionHeaderLocator}       ${StatusHeaderLocator}
    ${homeTabEleAfterDandD}    Web.Execute JavaScript    return document.querySelector('#ctl00_ContentPlaceHolder1_Grid1_c0_i').getBoundingClientRect().left
    should be equal    ${homeTabEleBeforeDandD}     ${homeTabEleAfterDandD}

Verify User that after reloading the page, the rearranged columns move to their default location.
     [Tags]    TKN_FLTR_LST_016    SurePassID_M1     SurePassId_Web
     Go To Tokens Page
     Web.Wait Until Element Is Visible      ${UserDefHeaderLocator}     ${StandardTimeout}
     ${homeTabEleBeforeDandD}    Web.Execute JavaScript    return document.querySelector('#ctl00_ContentPlaceHolder1_Grid1_c1_i').getBoundingClientRect().left
     Web.Drag And Drop    //*[@id="ctl00_ContentPlaceHolder1_Grid1_c1_i"]       //*[@id="ctl00_ContentPlaceHolder1_Grid1_c3_i"]
     ${homeTabEleAfterDandD}    Web.Execute JavaScript    return document.querySelector('#ctl00_ContentPlaceHolder1_Grid1_c1_i').getBoundingClientRect().left
     Web.Reload Page
     ${homeTabEleAfterRefresh}    Web.Execute JavaScript    return document.querySelector('#ctl00_ContentPlaceHolder1_Grid1_c1_i').getBoundingClientRect().left
     should be equal    ${homeTabEleBeforeDandD}    ${homeTabEleAfterRefresh}
