*** Settings ***
Library      SeleniumLibrary

*** Variables ***
${url}        https://demoqa.com/
${Browser}    chrome
${elements}   //*[@class="card mt-4 top-card"]
${Textbox}    //li[@class="btn btn-light "][1]
${Firstname}    //input[@id="userName"]
${Email}        //inout[@id="userEmail" and @type ="userEmail"]
${CurrentAdd}    //inout[@id="currentAddress"]
${PermanantAdd}   //inout[@id="permanentAddress"]
${SubmitButton}    //button[@id="submit"]

*** Test Cases ***
TestDemo
    Open Browser    ${url}    ${Browser}
     SeleniumLibrary.Maximize Browser Window
     Click Element  ${elements}
     Sleep   5s
     Click Element   ${Textbox}
     Input text   ${Firstname}      Richa
     Input text   ${Email}              richatyagi@gmail
     Sleep 3s
     Input text    ${CurrentAdd}        Prahlad nagar, Ahmdabad
     Sleep 3s
     Input text    ${PermanantAdd}       village+post=Mandavali
     Sleep 3s
     Click button   ${SubmitButton}

