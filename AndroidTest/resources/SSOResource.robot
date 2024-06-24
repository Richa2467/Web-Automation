*** Settings ***
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../labels/SSOLabel.robot
Resource    ../locators/SSOLocator.robot

*** Keywords ***
Navigate to SSO tab
    Web.Wait Until Element Is Visible    ${SSOTab}    ${StandardTimeout}
    Web.Mouse Over     ${SSOTab}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element    ${SSOTab}
    #Web.Click Element    ${SSOTab}

Delete Role form the Role(s) List if existing
    [Arguments]     ${RoleName}
    Sleep   10s
    ${Count}=    Web.Get Element Count   ${DeleteRolelink}
    Run Keyword If  ${Count} > 0        Delete Roles    ${Count}

Delete Roles
    [Arguments]     ${Count}
    FOR     ${i}  IN RANGE      ${Count}
           Web.Wait Until Element Is Visible    ${DeleteRolelink}   ${StandardTimeout}
           Web.Click Element	                  ${DeleteRolelink}
           Click on Confirm button
           Verify Role(s) Delete Success Message receive or not
           Sleep   ${SleepDelay2s}
    END

#Verify Role(s) Delete Success Message receive or not
#    Web.Wait Until Element Is Visible    xpath://*[@class="jq-toast-single jq-has-icon jq-icon-success"]    ${StandardTimeout}
#    Page Should Contain     ${RoleDeleteMsg}

Delete Policy form the Policy(ies) List if existing
    [Arguments]     ${PolicyName}
    ${Count}=    Web.Get Element Count   ${DeletePolicylink}
    Run Keyword If  ${Count} > 0        Delete Policy    ${Count}

Delete Policy
    [Arguments]     ${Count}
    FOR     ${i}  IN RANGE      ${Count}
           Web.Wait Until Element Is Visible    ${DeletePolicylink}   ${StandardTimeout}
           Web.Click Element	                  ${DeletePolicylink}
           Click on Confirm button
           Verify Policy(s) Delete Success Message receive or not
           Sleep   ${SleepDelay2s}
    END

Verify Role(s) Delete Success Message receive or not
    Web.Wait Until Element Is Visible    xpath://*[@class="jq-toast-single jq-has-icon jq-icon-success"]    ${StandardTimeout}
    Page Should Contain     ${RoleDeleteMsg}

Verify Policy(s) Delete Success Message receive or not
    Web.Wait Until Element Is Visible    xpath://*[@class="jq-toast-single jq-has-icon jq-icon-success"]    ${StandardTimeout}
    Page Should Contain     ${PolicyDeleteMsg}

Select GMail Application and click on the Update button
    Web.Wait Until Element Is Enabled    ${SSOAppSelect}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Be Selected     ${SSOAppSelect}
    Run Keyword If    '${status}' == 'False'  Click on the Update Button

Uncheck GMail Application and click on the Update button
    Web.Wait Until Element Is Enabled    ${SSOAppSelect}    ${StandardTimeout}
    ${Status}   Run Keyword and return status   Checkbox Should Not Be Selected     ${SSOAppSelect}
    Run Keyword If    '${status}' == 'False'  Click on the Update Button

Click on the Update Button
    Web.Click Element	  ${SSOAppSelect}
    Web.Wait Until Element Is Visible    ${SSOAppUpdate}    ${StandardTimeout}
    Web.Click Element	  ${SSOAppUpdate}
