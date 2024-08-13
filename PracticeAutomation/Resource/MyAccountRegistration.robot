*** Settings ***
Library      SeleniumLibrary
Resource      /home/richatyagi/PycharmProjects/pythonProject/PracticeAutomation/locators/MyAccountlocator.robot

*** Test Cases ***
1.Registration Sign-in
    [Tags]    Register_01
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    ${generated_email}    Generate Unique Email
    Input Text      ${Reg_Email}        ${generated_email}
    Input Text      ${Reg_Pass}            Richa@12345
    Click Element    ${Reg_Button}
    SeleniumLibrary.Page Should Contain Element  ${Reg_success}
    Close All Browsers

2.Registration with invalid email
    [Tags]    Register_02
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Reg_Email}         xyz@bjkb
    Input Text      ${Reg_Pass}            Richa@12345
    Click Element    ${Reg_Button}
    SeleniumLibrary.Page Should Contain Element    ${Reg_Email_Error}
    Close All Browsers

3.Registration with empty email
    [Tags]    Register_03
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Reg_Email}           \
    Input Text      ${Reg_Pass}            Richa@12345
    Click Element     ${Reg_Button}
    SeleniumLibrary.Page Should Contain Element    ${Reg_Email_Error}
    Close All Browsers

4.Registration with empty password
    [Tags]    Register_04
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Reg_Email}           avsbb@gmail.com
    Input Text      ${Reg_Pass}            \
    Click Element     ${Reg_Button}
    SeleniumLibrary.Page Should Contain Element   ${Reg_Pass_Error}
    Close All Browsers

5.Registration with empty email and empty password
    [Tags]    Register_05
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Reg_Email}           \
    Input Text      ${Reg_Pass}            \
    Click Element     ${Reg_Button}
    SeleniumLibrary.Page Should Contain Element    ${Reg_Email_Error}
    Close All Browsers