*** Keywords ***

Add Eanble User in the System
    [Arguments]     ${apiUserName}
    ${returnString}   add_user_status_enable      ${apiUserName}  ${AccountId}    ${AccountToken}     ${apiFirstName}  ${apiLastName}   ${apiMobile}   ${apiEmail}  0   ${apiUserPassword}
    Should be Equal as Strings      ${returnString}    0

Delete User from the System
    [Arguments]     ${apiUserName}
    ${returnString}   delete user   ${apiUserName}  ${AccountId}    ${AccountToken}
    Should be Equal as Strings      ${returnString}    0