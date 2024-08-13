*** Settings ***
Library     OperatingSystem
Resource    ../resources/TokenGroupResource.robot
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/TokenPageResource.robot

Suite Setup    Run Keywords     Open SurePass On Browser
...          AND                Submit 2FA Page Using Email OTP    6
Suite Teardown    Run keyword   Web.Close All Browsers

*** Test Cases ***
Verify that token group cannot be created when description field is kept blank
    [Tags]     EDT_TKN_GROUP_001    SurePassID_M1     SurePassId_Web
    Go To Token Group Page And Create New Token Group
    Web.Wait Until Element Is Visible       ${TokenGroupsAdd}        ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenGroupsAdd}
    Verified Error Message For Empty Description Group

Verify that token group is created successfully when text is written in Description field and Notes field is kept blank
    [Tags]      EDT_TKN_GROUP_002    SurePassID_M1     SurePassId_Web
    Go To Token Group Page And Create New Token Group
    Web.Wait Until Element Is Visible   ${Description}      ${StandardTimeout}
    Web.Input Text    ${Description}    ${DescriptionText}
    Web.Wait Until Element Is Visible    ${TokenGroupsAdd}       ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenGroupsAdd}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${TokenGroupsAdd}
    Wait Until Keyword Succeeds  5x  1s  Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokenGroupsAdd}
    Wait Until the Update Icon Disappear
    Verified Success Message For Description Group
    Navigate To TokenGroups
    Click On Last Updated Coloumn
    Delete Token Group

Verify that token group is created successfully when text is written in both Description and Notes field
    [Tags]      EDT_TKN_GROUP_003    SurePassID_M1     SurePassId_Web
    Go To Token Group Page And Create New Token Group
    Web.Wait Until Element Is Visible   ${Description}      ${StandardTimeout}
    Web.Input Text    ${Description}    ${DescriptionText}
    Web.Wait Until Element Is Visible   ${Notes}      ${StandardTimeout}
    Web.Input Text    ${Notes}      ${NotesText}
    Web.Wait Until Element Is Visible    ${TokenGroupsAdd}       ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenGroupsAdd}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${TokenGroupsAdd}
    Wait Until Keyword Succeeds  5x  1s  Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokenGroupsAdd}
    Wait Until the Update Icon Disappear
    Verified Success Message For Description Group
    Verified Update Token Group Details

Verify that token is getting added to the group Update Token Group page
    [Tags]      EDT_TKN_GROUP_004    SurePassID_M1     SurePassId_Web
    Go To Token Page
    Go To Token Group Page And Create New Token Group
    Web.Wait Until Element Is Visible   ${Description}      ${StandardTimeout}
    Web.Input Text    ${Description}    ${DescriptionText}
    Web.Wait Until Element Is Visible   ${Notes}      ${StandardTimeout}
    Web.Input Text    ${Notes}      ${NotesText}
    Web.Wait Until Element Is Visible    ${TokenGroupsAdd}       ${StandardTimeout}
    Web.Wait Until Element Is Enabled  ${TokenGroupsAdd}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${TokenGroupsAdd}
    Wait Until Keyword Succeeds  5x  1s  Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokenGroupsAdd}
    Wait Until the Update Icon Disappear
    Verified Success Message For Description Group
    Go To Token Page
    Web.Wait Until Element Is Visible   ${TokenGroups}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenGroups}
    Click On Last Updated Coloumn
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${EditDescriptionGrid}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${EditDescriptionGrid}
    Web.Wait Until Element Is Visible   ${AddNewSoftTokenLink}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${AddNewSoftTokenLink}
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible    ${AddNewSoftTokenButton}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element       ${AddNewSoftTokenButton}
    Web.Wait Until Element Is Visible    ${PrintedSerialNumberGet}      ${StandardTimeout}
    ${PutPrintedSerialNumber}   Web.Get Value    ${PrintedSerialNumberGet}
    Set Global Variable    ${PutPrintedSerialNumber}
    Web.Wait Until Element Is Visible   ${TokenGroups}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenGroups}
    Click On Last Updated Coloumn
    Web.Wait Until Element Is Visible       ${IdentifyToken}        ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${IdentifyToken}
    ${IdentifyTokenCount}   Web.Get Text    ${IdentifyToken}
    Should Be Equal    ${IdentifyTokenCount}    1
    Go To Token Page
    Navigate To TokenGroups
    Click On Last Updated Coloumn
    Delete Token Group

Verify that after getting deleted, the token group name does not appear in the Token page's Token group filter
    [Tags]      EDT_TKN_GROUP_005    SurePassID_M1     SurePassId_Web
    Go To Token Group Page And Create New Token Group
    Web.Wait Until Element Is Visible   ${Description}      ${StandardTimeout}
    Web.Input Text    ${Description}    ${DescriptionText}
    Web.Wait Until Element Is Visible   ${Notes}      ${StandardTimeout}
    Web.Input Text    ${Notes}      ${NotesText}
    Web.Wait Until Element Is Visible    ${TokenGroupsAdd}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenGroupsAdd}
    Go To Token Page
    Navigate To TokenGroups
    Click On Last Updated Coloumn
    Delete Token Group
    Go To Token Page
    Web.Wait Until Element Is Visible   ${TokenGroupDropDown}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenGroupDropDown}
    ${GetItem}=	Web.Get List Items      ${TokenGroupDropDown}
    ${D1}=    Create List
    Append To List    ${D1}     ${GetItem}
    List Should Not Contain Value       ${D1}       Test Description Text

Verify that token group name is getting updated
    [Tags]      EDT_TKN_GROUP_006    SurePassID_M1     SurePassId_Web
    Go To Token Group Page And Create New Token Group
    Web.Wait Until Element Is Visible   ${Description}      ${StandardTimeout}
    Web.Input Text    ${Description}    ${DescriptionText}
    Web.Wait Until Element Is Visible   ${Notes}      ${StandardTimeout}
    Web.Input Text    ${Notes}      ${NotesText}
    Web.Wait Until Element Is Visible    ${TokenGroupsAdd}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenGroupsAdd}
    Go To Token Page
    Wait Until the Update Icon Disappear
    Web.Wait Until Element Is Visible   ${TokenGroups}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${TokenGroups}
    Web.Wait Until Element Is Visible    ${EditDescriptionGrid}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${EditDescriptionGrid}
    Web.Wait Until Element Is Visible    ${UpdateDecription}
    Web.Input Text    ${UpdateDecription}   ${UpdateDecriptionText}
    Web.Wait Until Element Is Visible    ${UpdateNotes}
    Web.Input Text    ${UpdateNotes}        ${UpdateNotesText}
    Click On Update Button
    Web.Page Should Contain     Updated
    Web.Wait Until Element Is Visible   ${CloseButton}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${CloseButton}
    Delete Updated Token Group

Verify that Last Updated By columns is getting updated accurately
    [Tags]      EDT_TKN_GROUP_007    SurePassID_M1     SurePassId_Web
    Go To Token Group Page And Create New Token Group
    Web.Wait Until Element Is Visible   ${Description}      ${StandardTimeout}
    Web.Input Text    ${Description}    ${DescriptionText}
    Web.Wait Until Element Is Visible   ${Notes}      ${StandardTimeout}
    Web.Input Text    ${Notes}      ${NotesText}
    Web.Wait Until Element Is Visible    ${TokenGroupsAdd}       ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenGroupsAdd}
    Go To Token Page
    Web.Wait Until Element Is Visible   ${TokenGroups}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${TokenGroups}
    Web.Wait Until Element Is Visible   ${DescriptionGrid}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${DescriptionGrid}
    Web.Wait Until Element Is Visible    ${EditDescriptionGrid}     ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${EditDescriptionGrid}
    Web.Page Should Contain    ${mainUserName}
    Web.Wait Until Element Is Visible   ${CloseButton}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${CloseButton}
    Delete Token Group

Verify that token group is created when a user group is imported
    [Tags]      EDT_TKN_GROUP_008    SurePassID_M1     SurePassId_Web
    ${NormalizedPath}    Normalize Path    ${UserImportFile}
    Go To Import User Page And Upload File      ${NormalizedPath}
    TokenGroupResource.Click On Import Button
    Web.Wait Until Element Is Visible       ${IgnoreFirstRecord}        ${StandardTimeout}
    Web.Select Checkbox    ${IgnoreFirstRecord}
    Map Data With Coloumn
    Web.Wait Until Element Is Visible    ${NextButton}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${NextButton}
    Web.Wait Until Element Is Visible    ${TokenType}       ${StandardTimeout}
    Web.Select From List By Label    ${TokenType}       SurePassID Authenticator Token
    TokenGroupResource.Click On Import Button
    Verified Success Message For Records Were Added
    Navigate To TokenGroups
    Click On Last Updated Coloumn
    Web.Wait Until Element Is Visible       ${TokenGroupDescriptionColumn}        ${StandardTimeout}
    Web.Wait Until Element Is Visible    ${TokenGroupDescriptionColumn}
    ${P_TokenGroupDescriptionColumn}    Web.Get Text    ${TokenGroupDescriptionColumn}
    Should Be Equal     ${P_TokenGroupDescriptionColumn}     Token Group created as part of user import.