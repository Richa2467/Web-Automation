*** Settings ***
Library     OperatingSystem
Resource    ../locators/TokenStatisticsLocator.robot
Resource    ../locators/UsersFilterLocator.robot
Resource    ../resources/LoginPageResource.robot
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/TokenStatisticsLabel.robot
Resource    ../locators/TokenPageLocator.robot
Resource    ../locators/TokenGroupLocator.robot

*** Keywords ***
Get Total Status of Enable Counter
    ${GetTotalEnableCounter}    Web.Get Text     ${StatusEnabled}
    ${TotalEnbCnt}    Convert To Integer    ${GetTotalEnableCounter}
    ${L1}=    Create List
    Append To List    ${L1}     ${TotalEnbCnt}
    RETURN    ${L1}

Get Total Status of Disabled Counter
    ${GetTotalDisabledCounter}    Web.Get Text     ${StatusDisabled}
    ${TotalDisCnt}    Convert To Integer    ${GetTotalDisabledCounter}
    ${L2}=    Create List
    Append To List    ${L2}     ${TotalDisCnt}
    RETURN    ${L2}

Get Total Status of New Counter
    ${GetTotalNewCounter}    Web.Get Text     ${StatusNew}
    ${TotalNewCnt}    Convert To Integer    ${GetTotalNewCounter}
    ${L3}=    Create List
    Append To List    ${L3}     ${TotalNewCnt}
    RETURN    ${L3}

Get Total Status of Token Counter
    ${GetTotalTokenCounter}    Web.Get Text     ${TokenCount}
    ${TotalTknCnt}    Convert To Integer    ${GetTotalTokenCounter}
    ${L4}=    Create List
    Append To List    ${L4}     ${TotalTknCnt}
    RETURN    ${L4}

Get Total Status of Mobile Token Counter
    ${GetTotalMobileTokenCounter}    Web.Get Text     ${MobileTokens}
    ${TotalMobTknCnt}    Convert To Integer    ${GetTotalMobileTokenCounter}
    ${L5}=    Create List
    Append To List    ${L5}     ${TotalMobTknCnt}
    RETURN    ${L5}

Get Total Status of Hard Token Counter
    ${GetTotalHardTokenCounter}    Web.Get Text     ${HardTokens}
    ${TotalHrdTknCnt}    Convert To Integer    ${GetTotalHardTokenCounter}
    ${L6}=    Create List
    Append To List    ${L6}     ${TotalHrdTknCnt}
    RETURN    ${L6}

Get Total Status of Desktop Token Counter
    ${GetTotalDesktopTokenCounter}    Web.Get Text     ${DesktopTokens}
    ${TotalDskTknCnt}    Convert To Integer    ${GetTotalDesktopTokenCounter}
    ${L7}=    Create List
    Append To List    ${L7}     ${TotalDskTknCnt}
    RETURN    ${L7}

Get Total Status of Fido Token Counter
    ${GetTotalFidoTokenCounter}    Web.Get Text     ${FidoTokens}
    ${TotalFdoTknCnt}    Convert To Integer    ${GetTotalFidoTokenCounter}
    ${L8}=    Create List
    Append To List    ${L8}     ${TotalFdoTknCnt}
    RETURN    ${L8}

Click On New Link On Token Page
    Web.Wait Until Element Is Visible    ${TknNewLink}     ${StandardTimeout}
    Web.Click Element    ${TknNewLink}

Select Token Type From Token Page
    [Arguments]    ${TokenType}
    Web.Select From List by Value   ${SelectTokenType}   ${TokenType}

Select Token Status From Token Page
    [Arguments]    ${TokenStatus}
    Web.Select From List by Value   ${TokenStatusType}   ${TokenStatus}

Select Filter Token Type From Token Page
    [Arguments]    ${FilterType}
    Web.Select From List by Value   ${SelectFilterTokenType}   ${FilterType}
    Sleep  ${SleepDelay5s}

Select User Filter From User Page
    [Arguments]    ${UserType}
    Sleep   ${SleepDelay5s}
    Web.Select From List by Value   ${FilterUser}   ${UserType}
    Sleep   ${SleepDelay5s}

Input Current User Name
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${AssignToUserTextBox}     ${StandardTimeout}
    Web.Input Text   ${AssignToUserTextBox}   ${UserName}
    Sleep   ${SleepDelay5s}

Input User Defined Token Name
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${UserDefineTokenName}     ${StandardTimeout}
    Web.Input Text   ${UserDefineTokenName}   ${DemoTokenName}
    Sleep   ${SleepDelay5s}

Input Current User Name In Search Box
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${UserFilterText}     ${StandardTimeout}
    Web.Input Text   ${UserFilterText}   ${UserName}
    Sleep   ${SleepDelay5s}

Click On Edit Link Of Current User
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${EditLinkUser}     ${StandardTimeout}
    Web.Click Element    ${EditLinkUser}
    Sleep   ${SleepDelay5s}

Double Click On Serial Number Coloumn
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${SearialNumberCol}     ${StandardTimeout}
    Web.Click Element    ${SearialNumberCol}
    Web.Wait Until Element Is Visible    ${SearialNumberCol}     ${StandardTimeout}
    Web.Click Element    ${SearialNumberCol}
    Sleep   ${SleepDelay5s}

Click On Delete Link Of Last Created Tokens
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${DeleteLinkToken}     ${StandardTimeout}
    Web.Click Element    ${DeleteLinkToken}
    Sleep   ${SleepDelay5s}

Click On Delete Button For Token
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${DeleteToken}     ${StandardTimeout}
    Web.Click Element    ${DeleteToken}
    Sleep   ${SleepDelay5s}

Delete Last Created Hard Token
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${DeleteHardToken}     ${StandardTimeout}
    Web.Click Element    ${DeleteHardToken}
    Sleep   ${SleepDelay5s}

Click On Hard Token Link
    Sleep   ${SleepDelay5s}
    Web.Wait Until Element Is Visible    ${ImportHardTokenLink}     ${StandardTimeout}
    Web.Click Element    ${ImportHardTokenLink}
    Sleep   ${SleepDelay5s}


Go To Import Hard Token Page And Upload File
    [Arguments]    ${HrfTknFileName}
    Web.Wait Until Element Is Visible   ${FileUpload}     ${StandardTimeout}
    Web.Choose File    ${FileUpload}        ${HrfTknFileName}
    Web.Wait Until Element Is Visible    ${NextButton}     ${StandardTimeout}
    Web.Click Element    ${NextButton}

Select Map Import Data From Import Hard Token Page Column One
    [Arguments]    ${MapDataTypeOne}
    Web.Select From List by Value   ${MapDataColOne}   ${MapDataTypeOne}

Select Map Import Data From Import Hard Token Page Column Two
    [Arguments]    ${MapDataTypeTwo}
    Web.Select From List by Value   ${MapDataColTwo}   ${MapDataTypeTwo}

Input Sample Notes In Import Hard Tokens Section
    Web.Wait Until Element Is Visible    ${NotesImportHrdTkn}     ${StandardTimeout}
    Web.Input Text   ${NotesImportHrdTkn}       ${DemoTokenNotes}
    Sleep   ${SleepDelay5s}

Select Token Status as a NEW
    Web.Wait Until Element Is Enabled    ${TokenStatusDropdown}    ${StandardTimeout}
    Web.Select From List by Value    ${TokenStatusDropdown}    -1