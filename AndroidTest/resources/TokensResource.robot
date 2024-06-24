*** Settings ***
Documentation   This is the resource file for ajio page.
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/UsersPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../locators/NavBarLocator.robot
Resource    ../locators/LoginPageLocator.robot
Resource    ../locators/TokensLocator.robot


#Library    ImapLibrary
Library    SeleniumLibrary    run_on_failure=Web.Capture Page Screenshot    WITH NAME       Web
# Library    ApplicationLibrary.DesktopLibrary    run_on_failure=Windows.Capture Page Screenshot    WITH NAME       Windows
# Library    AppiumLibrary    run_on_failure=Mobile.Capture Page Screenshot    WITH NAME       Mobile
Library    Collections
Library    String
Library    DateTime
# Library    OTP

*** Keywords ***
Check Tokens Title on Home Dash Board
    Web.Element Should Be Visible       ${TknTitle}        ${StandardTimeout}

Get Enabled Token Count
    ${OldTknCountStr}      Web.get text       ${TknEnabledCount}
    ${OldTknCountEnabled}      Convert to integer     ${OldTknCountStr}   
    Set Global Variable     ${OldTknCountEnabled}

Verify For Enabled Token New Count Should be Greater Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknEnabledCount}
    ${NewTknCountEnabled}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${NewTknCountEnabled} > ${OldTknCountEnabled}

Verify For Enabled Token New Count Should be Less Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknEnabledCount}
    ${NewTknCountEnabled}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${OldTknCountEnabled} > ${NewTknCountEnabled}

Get Disabled Token Count
    ${OldTknCountStr}      Web.get text       ${TknDisabledCount} 
    ${OldTknCountDisabled}      Convert to integer     ${OldTknCountStr}   
    Set Global Variable     ${OldTknCountDisabled}

Verify For Disabled Token New Count Should be Greater Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknDisabledCount} 
    ${NewTknCountDisabled}      Convert To Integer       ${NewTknCountStr}
    Log to console      ${NewTknCountDisabled}
    Should be True      ${NewTknCountDisabled} > ${OldTknCountDisabled}

Verify For Disabled Token New Count Should be less Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknDisabledCount}
    ${NewTknCountDisabled}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${OldTknCountDisabled} > ${NewTknCountDisabled}

Get New Token Count
    ${OldTknCountStr}      Web.get text       ${TknNewCount}
    ${OldTknCountNew}      Convert to integer     ${OldTknCountStr}   
    Log to console      ${OldTknCountNew}
    Set Global Variable     ${OldTknCountNew}

Verify For New Token New Count Should be Greater Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknNewCount} 
    ${NewTknCountNew}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${NewTknCountNew} > ${OldTknCountNew}

Add New Token To The User Account
    [Arguments]    ${TokenType}=None    ${UserDefinedName}=None    ${AuthType}=None    ${OTPWindowSize}=None    ${OTPType}=None    ${TokenStatus}=None    ${OTPLen}=None
    Web.Wait Until Element Is Visible    ${UserDefinedNameField}    ${StandardTimeout}
    Run Keyword If    '${TokenType}' != 'None'    Run Keyword    Select Token Type    ${TokenType}
    Run Keyword If    '${UserDefinedName}' != 'None'    Web.Input Text    ${UserDefinedNameField}    ${UserDefinedName}
    Run Keyword If    '${AuthType}' != 'None'    Web.Select From List by Value    ${AuthUsageDropdown}    ${AuthType}
    Run Keyword If    '${OTPType}' != 'None'    Run Keywords        Web.Scroll Element Into View    ${CopyrightSection}
    ...                AND                         Web.Select From List by Value    ${OTPTypeDropdown}    ${OTPType}
    ...                AND                         Select Token PIN
    Run Keyword If     '${TokenStatus}' != 'None'     Run Keyword    Web.Select From List by Value    ${TokenStatusLocator}    ${TokenStatus}
    Web.Scroll Element Into View    ${CopyrightSection}
    Run Keyword If    '${OTPWindowSize}' != 'None'    Web.Input Text    ${OTPWindowSizeLocator}    ${OTPWindowSize}
    Run Keyword If    '${TokenType}' != '8'    Run Keyword     Check token type is not NymiBand     ${TokenType}
    Run Keyword If     '${OTPLen}' != 'None'    Run Keyword     Web.Select From List by Value       ${OTPLength}       10
    Web.Select From List by Value       ${StatusDrp}        ${TokenStatus}
    #Web.Click Element    ${TokenAddButton}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokenAddButton}

Add New FIDO Token To The User Account
    [Arguments]    ${TokenType}=None    ${UserDefinedName}=None    ${AuthType}=None    ${OTPWindowSize}=None    ${OTPType}=None    ${TokenStatus}=None    ${OTPLen}=None
    Web.Wait Until Element Is Visible    ${UserDefinedNameField}    ${StandardTimeout}
    Run Keyword If    '${TokenType}' != 'None'    Run Keyword    Select Token Type    ${TokenType}
    Run Keyword If    '${UserDefinedName}' != 'None'    Web.Input Text    ${UserDefinedNameField}    ${UserDefinedName}
    Run Keyword If    '${AuthType}' != 'None'    Web.Select From List by Value    ${AuthUsageDropdown}    ${AuthType}
    Run Keyword If    '${OTPType}' != 'None'    Run Keywords        Web.Scroll Element Into View    ${CopyrightSection}
    ...                AND                         Web.Select From List by Value    ${OTPTypeDropdown}    ${OTPType}
    ...                AND                         Select Token PIN
    Run Keyword If     '${TokenStatus}' != 'None'     Run Keyword    Web.Select From List by Value    ${TokenStatusLocator}    ${TokenStatus}
    Web.Scroll Element Into View    ${CopyrightSection}
    # Run Keyword If    '${OTPWindowSize}' != 'None'    Web.Input Text    ${OTPWindowSizeLocator}    ${OTPWindowSize}
    # Sleep    ${SleepDelay5s}
    # Run Keyword If    '${TokenType}' != '8'    Run Keyword     Check token type is not NymiBand     ${TokenType}
    # Run Keyword If     '${OTPLen}' != 'None'    Run Keyword     Web.Select From List by Value       ${OTPLength}       10
    # Web.Select From List by Value       ${StatusDrp}        ${TokenStatus}
    # Web.Click Element    ${TokenAddButton}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element  ${TokenAddButton}

Verify For New Token New Count Should be less Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknNewCount}
    ${NewTknCountNew}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${OldTknCountNew} > ${NewTknCountNew}

Get Mobile Token Count
    ${OldTknCountStr}      Web.get text       ${TknMobileCount}
    ${OldTknCountMobile}      Convert to integer     ${OldTknCountStr}   
    Set Global Variable     ${OldTknCountMobile}

Verify For Mobile Token New Count Should be Greater Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknMobileCount}
    ${NewTknCountMobile}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${NewTknCountMobile} > ${OldTknCountMobile}

Verify For Mobile Token New Count Should be Less Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknMobileCount}
    ${NewTknCountMobile}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${OldTknCountMobile} > ${NewTknCountMobile}

Get Desktop Token Count
    ${OldTknCountStr}      Web.get text       ${TknDesktopCount}
    ${OldTknCountDesktop}      Convert to integer     ${OldTknCountStr}   
    Set Global Variable     ${OldTknCountDesktop}

Verify For Desktop Token New Count Should be Greater Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknDesktopCount}
    ${NewTknCountDesktop}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${NewTknCountDesktop} > ${OldTknCountDesktop}

Verify For Desktop Token New Count Should be Less Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknDesktopCount}
    ${NewTknCountDesktop}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${OldTknCountDesktop} > ${NewTknCountDesktop}

Get Security Token Count
    ${OldTknCountStr}      Web.get text       ${TknSecurityCount}
    ${OldTknCountSecurity}      Convert to integer     ${OldTknCountStr}   
    Set Global Variable     ${OldTknCountSecurity}

Verify For Security Token New Count Should be Greater Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknSecurityCount}
    ${NewTknCountSecurity}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${NewTknCountSecurity} > ${OldTknCountSecurity}

Verify For Security Token New Count Should be Less Than Old Token Count
    ${NewTknCountStr}      Web.get text       ${TknSecurityCount}
    ${NewTknCountSecurity}      Convert To Integer       ${NewTknCountStr}
    Should be True      ${OldTknCountSecurity} > ${NewTknCountSecurity}

Select Tokens option on Manage Dashboard to view on Home Page
    Web.Wait Until Element Is Enabled    ${MD_Tokens}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${MD_Tokens}
    Run Keyword If    '${status}' == 'False'  Web.Click Element	  ${MD_Tokens}



    