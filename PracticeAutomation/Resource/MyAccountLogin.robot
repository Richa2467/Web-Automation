*** Settings ***
Library      SeleniumLibrary
Resource      /home/richatyagi/PycharmProjects/pythonProject/PracticeAutomation/locators/MyAccountlocator.robot

*** Test Cases ***
1.Login with valid emailid and password
    [Tags]    Login_01
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Inputemail}         tyagiricha80+1@gmail.com
    Input Text      ${Inputpass}            Richa@12345
    Click Button     ${loginButton}
    SeleniumLibrary.Page Should Contain Element  ${login_success}
    Close All Browsers


2.Login with invalid emailid and invalid password
    [Tags]    Login_02
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Inputemail}         tyagir@gmail.com
    Input Text      ${Inputpass}            Richa@12345nbjdbvcfd
    Click Button     ${loginButton}
    SeleniumLibrary.Page Should Contain Element    ${Login_Email_Error}
    Close All Browsers

3.Login with valid emailid and empty password
    [Tags]    Login_03
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Inputemail}         tyagiricha80+1@gmail.com
    Input Text      ${Inputpass}            \
    Click Button     ${loginButton}
    SeleniumLibrary.Page Should Contain Element    ${Login_pass_empty_Error}
    Close All Browsers

4.Login with empty emailid and correct password
    [Tags]    Login_04
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Inputemail}         \
    Input Text      ${Inputpass}            Richa@12345
    Click Button     ${loginButton}
    SeleniumLibrary.Page Should Contain Element    ${Login_email_empty_Error}
    Close All Browsers

5.Login with empty emailid and empty password
    [Tags]    Login_05
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Inputemail}         \
    Input Text      ${Inputpass}            \
    Click Button     ${loginButton}
    SeleniumLibrary.Page Should Contain Element    ${Login_email_empty_Error}
    Close All Browsers

6.Login Password is masked
    [Tags]    Login_06
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Inputemail}         tyagiricha80+1@gmail.com
    Input Text      ${Inputpass}            Richa@12345
    ${password_field}     Get WebElement    ${Inputpass}
    ${type_attribute}     Get Element Attribute    ${password_field}    type
    Should Be Equal As Strings    ${type_attribute}    password
    Close All Browsers

7.Login handles Case Sensitive
    [Tags]    Login_07
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Inputemail}         TYAGIRICHA80+1@GMAIL.COM
    Input Text      ${Inputpass}            rICHA@12345
    Click Button     ${loginButton}
    SeleniumLibrary.Page Should Contain Element  ${login_invalidpas}
    Close All Browsers



8.Login Authentication
    [Tags]    Login_08
    Open Browser   ${url}    ${Browser}
    Maximize Browser Window
    Click Element    ${MyAccount}
    Input Text      ${Inputemail}         tyagiricha80+1@gmail.com
    Input Text      ${Inputpass}            Richa@12345
    Click Button     ${loginButton}
    Click Element    ${SignOut}
    Go Back
    SeleniumLibrary.Page Should Contain Element     ${Login_Page}
    Close All Browsers