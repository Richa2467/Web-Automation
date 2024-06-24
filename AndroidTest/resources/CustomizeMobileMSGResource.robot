*** Settings ***
Resource    ../labels/LoginPageLabel.robot
Resource    ../labels/CommonLabels.robot
Resource    ../labels/SettingsPageLabel.robot
Resource    ../locators/SettingsPageLocator.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../resources/LoginPageResource.robot
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/SettingsPageResource.robot
Resource    ../locators/CustomizeMobileMSGLocators.robot
Resource    ../labels/CustomizeEmailMsgLabel.robot

*** Keywords ***
Go to CustomizeMobileMSG
    Click on Account Tab
    Web.Wait Until Element Is Visible      ${CustomizeMSGLink}      ${StandardTimeout}
    Wait Until Keyword Succeeds  5x  1s  Web.Click Element      ${CustomizeMSGLink}

Update and Verify Success Message
    Web.Wait Until Element Is Enabled      ${UpdateButton}      ${StandardTimeout}
    Web.Wait Until Element Is Visible      ${UpdateButton}      ${StandardTimeout}
    Web.Click Element                      ${UpdateButton}
    #Sleep   ${SleepDelay2s}
    Web.Element Text Should Be      ${SuccessCustomizeMobilePage}     Success
