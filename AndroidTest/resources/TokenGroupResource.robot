*** Settings ***
Library  SeleniumLibrary    run_on_failure=Web.Capture Page Screenshot    WITH NAME       Web
Library     ImapLibrary2
Library     Collections
Library     String

Resource    ../Labels/TokenGroupLabel.robot
Resource    ../Locators/TokenGroupLocator.robot
Resource    ../Labels/LoginPageLabel.robot
Resource    ../Labels/CommonLabels.robot

*** Keywords ***
Submit First Login Page Using Args
    [Arguments]    ${UserName}      ${Password}
    Web.Input Text    name:tbxDomain_Name    volansys.com
    Web.Input Text    name:tbxUser_Name     ${UserName}
    Web.Input Text    name:tbxPassword      ${Password}
    Web.Click Element    xpath://*[@id="btnLogin"]

Submit Second Login Page
    [Arguments]    ${GmailId}      ${GmailPassword}
    Web.Wait Until Element Is Visible    ${EmailIcon}    ${StandardTimeout}
    Web.Wait Until Element Is Enabled    ${OtpTextBox}    ${StandardTimeout}
    Web.Click Element    ${EmailIcon}
    Sleep    ${SleepDelay10s}
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    Delete Email    ${LATEST}
    Log To Console    ${otpText}
    Web.Input Text    ${OtpTextBox}    ${otpText}
    Web.Click Element    ${VerifyOtpButton}
    Web.Wait Until Element Is Enabled    ${TokensTab}

Go To Token Group Page And Create New Token Group
    Web.Wait Until Element Is Visible   ${TokensTab}    ${StandardTimeout}
    Web.Click Element   ${TokensTab}
    Web.Wait Until Element Is Visible   ${TokenGroups}      ${StandardTimeout}
    Web.Click Element    ${TokenGroups}
    Web.Wait Until Element Is Visible    ${TokenGroupsNew}      ${StandardTimeout}
    Web.Click Element    ${TokenGroupsNew}

Go To Token Page
    Web.Wait Until Element Is Visible   ${TokensTab}    ${StandardTimeout}
    Web.Click Element   ${TokensTab}

Verified Error Message For Empty Description Group
    Web.Wait Until Page Contains    Description:
    Web.Page Should Contain     Description:

Verified Success Message For Description Group
    Sleep   ${SleepDelay2s}
    Web.Element Text Should Be          ${SuccessToast}     Success

Verified Success Message For Delete Token
    Web.Wait Until Page Contains    Token Groups(s) deleted from the system.
    Web.Page Should Contain     Token Groups(s) deleted from the system.

Verified Success Message For Update Token
    Web.Wait Until Page Contains    Device has been added successfully.
    Web.Page Should Contain     Device has been added successfully.

Verified Success Message For Records Were Added
    Web.Wait Until Page Contains    All (1) user records were added.
    Web.Page Should Contain     All (1) user records were added.

Navigate To TokenGroups
    Web.Wait Until Element Is Visible   ${TokensTab}    ${StandardTimeout}
    Web.Click Element   ${TokensTab}
    Web.Wait Until Element Is Visible   ${TokenGroups}  ${StandardTimeout}
    Web.Click Element    ${TokenGroups}

Map Data With Coloumn
    Web.Wait Until Element Is Visible    ${Column1}     ${StandardTimeout}
    Web.Select From List By Label    ${Column1}     First Name
    Web.Wait Until Element Is Visible    ${Column2}     ${StandardTimeout}
    Web.Select From List By Label    ${Column2}     Last Name
    Web.Wait Until Element Is Visible    ${Column3}     ${StandardTimeout}
    Web.Select From List By Label    ${Column3}     Login Username
    Web.Wait Until Element Is Visible    ${Column4}     ${StandardTimeout}
    Web.Select From List By Label    ${Column4}     Email
    Web.Wait Until Element Is Visible    ${Column5}     ${StandardTimeout}
    Web.Select From List By Label    ${Column5}     Mobile Phone
    Web.Wait Until Element Is Visible    ${Column6}     ${StandardTimeout}
    Web.Select From List By Label    ${Column6}     PIN

#Click On Update Button
#    Web.Wait Until Element Is Visible    ${UpdateButton}    ${StandardTimeout}
#    Web.Click Element    ${UpdateButton}

Click On Import Button
    Web.Wait Until Element Is Visible    ${MapImportDataNextButton}
    Web.Click Element    ${MapImportDataNextButton}


Go To Import User Page And Upload File
    [Arguments]    ${FileName}
    Web.Wait Until Element Is Visible   ${UserTab}     ${StandardTimeout}
    Web.Click Element   ${UserTab}
    Web.Wait Until Element Is Visible   ${ImportUsers}     ${StandardTimeout}
    Web.Click Element   ${ImportUsers}
    Web.Wait Until Element Is Visible   ${FileUpload}     ${StandardTimeout}
    Web.Choose File    ${FileUpload}        ${FileName}

Verified Update Token Group Details
    Web.Wait Until Element Is Visible   ${CreatedOn}    ${StandardTimeout}
    Web.Wait Until Element Is Visible       ${CreatedOn}
    ${CreatedOnText}     Web.Get Text    ${CreatedOn}
    Should Be Equal    ${CreatedOnText}     Created On:

    Web.Wait Until Element Is Visible   ${LastUpdatedOn}    ${StandardTimeout}
    Web.Wait Until Element Is Visible       ${LastUpdatedOn}
    ${LastUpdatedOnText}     Web.Get Text    ${LastUpdatedOn}
    Should Be Equal    ${LastUpdatedOnText}     Last Updated On:

    Web.Wait Until Element Is Visible   ${LastUpdatedBy}    ${StandardTimeout}
    Web.Wait Until Element Is Visible       ${LastUpdatedBy}
    ${LastUpdatedByText}    Web.Get Text    ${LastUpdatedBy}
    Should Be Equal    ${LastUpdatedByText}     Last Updated By:

Delete Token Group
    Web.Wait Until Element Is Enabled  ${DeleteLinkToken}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${DeleteLinkToken}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${DeleteLinkToken}
    Web.Wait Until Element Is Enabled  ${DeleteButton}    ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Mouse Over  ${DeleteButton}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${DeleteButton}
    Verified Success Message For Description Group

Delete Updated Token Group
    Web.Wait Until Element Is Visible   ${UpdatedDeleteLinkToken}  ${StandardTimeout}
    Web.Click Element       ${UpdatedDeleteLinkToken}
    Web.Wait Until Element Is Visible       ${DeleteButton}     ${StandardTimeout}
    Web.Click Element    ${DeleteButton}
    Verified Success Message For Description Group

Click On Last Updated Coloumn
    Web.Wait Until Element Is Visible      ${LastUpdatedColoumn}        ${StandardTimeout}
    Web.Click Element    ${LastUpdatedColoumn}

Add Token Group
    Web.Wait Until Element Is Visible   ${Description}      ${StandardTimeout}
    Web.Input Text    ${Description}    ${DescriptionText}
    Web.Wait Until Element Is Visible   ${Notes}      ${StandardTimeout}
    Web.Input Text    ${Notes}      ${NotesText}
    Web.Wait Until Element Is Visible    ${TokenGroupsAdd}       ${StandardTimeout}
    Web.Click Element    ${TokenGroupsAdd}