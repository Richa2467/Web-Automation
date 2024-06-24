#*** Settings ***
#Library  SeleniumLibrary
#
#*** Variables ***
#${url}   https://formstone.it/components/dropdown/demo/
#${selectUserFilter}  //button[@id="demo_basic-dropdown-selected"]
#
#*** Test Cases ***
#AddToken
#     Open Browser    ${url}  Chrome
#     Select From List by Value   ${selectUserFilter}/option[@value='2']   2

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}               https://formstone.it/components/dropdown/demo/
${selectUserFilter}  //button[@id="demo_basic-dropdown-selected"]

*** Test Cases ***
AddToken
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${selectUserFilter}    timeout=30s
    Click Element    ${selectUserFilter}
    Click Element    //ul[@id="demo_basic-dropdown-selected"]//li[@data-value='2']




