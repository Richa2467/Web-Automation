*** Settings ***
Library      SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${url}     https://www.amazon.in/
${browser}    chrome
${Signin}     //div[@class = "nav-line-1-container"]
${email}        //*[@id="ap_email"]
${continue}        //*[@id="continue"]
${password}         //*[@id="ap_password"]
${FinalSignin}       //*[@id="signInSubmit"]
${UserSpecification}  //*[@id="nav-link-accountList-nav-line-1"]
${Search}             //*[@id="twotabsearchtextbox"]
${Searchicon}           //*[@id="nav-search-submit-button"]
${SearchResult3}         //*[@data-cel-widget="search_result_4"]
${ProductName}           //*[@id="productTitle"]
${ProductPrize}         //*[@class="a-price-whole"]
${ProductRating}        //*[@class="a-size-base a-color-base"]
${file_path}           home/richatyagi/Documents/example.csv


*** Test Cases ***
Test
    Open Browser   ${url}    ${browser}
    Maximize Browser Window
#    Click Element     ${Signin}
#    Input Text     ${email}          7453054374
#    Click Button      ${continue}
#    Input Text      ${password}        Password@123
#    Click Element      ${FinalSignin}
#    ${element}=    Wait Until Element Is Visible   xpath=//span[contains(text(), "Hello, Richa")]    timeout=30s
#    ${text}=    Get Text    xpath=//span[contains(text(), "Hello, Richa")]
#    Run Keyword If    "${text}" == "Hello, Richa"    Log to Console    User-verified
#    ...    ELSE    Log    User-not verified
#    Log    ${text}
    Input Text    ${Search}      shoes
    ${original_window}=    Get Window Handles
    Click Element    ${Searchicon}
    Sleep    5s
    Click Element    ${SearchResult3}

    ${new_window}=    Get Window Handles
    Select Window    ${new_window}[1]

    ${file_path}=    Set Variable    example.csv
    Wait Until Element Is Visible     ${ProductName}
    ${Productname}=   Run Keyword      Get Text    ${ProductName}
    Log To Console    Product Name is: ${Productname}
    Wait Until Element Is Visible     ${ProductPrize}
    ${Productprize}=  Run Keyword    Get Text    ${ProductPrize}
    Log to Console    Product Prize is: ${Productprize}
    Wait Until Element Is Visible     ${ProductRating}
    ${Productrating}=  Run Keyword     Get Text    ${ProductRating}
    Log to Console   Product Rating is: ${Productrating}
    Log    Product details written to CSV file successfully.
    ${data}=    Create List   ${Productname}   ${Productprize}   ${Productrating}
    Create File    ${file_path}
    Append To File    ${file_path}    ${data}\n
    File Should Exist    ${file_path}
#    Log to Console    File path: ${file_path}









