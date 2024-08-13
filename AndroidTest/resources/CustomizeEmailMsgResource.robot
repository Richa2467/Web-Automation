*** Settings ***
Resource    ../locators/CustomizeEmailMsgLocator.robot
Resource    ../locators/UsersPageLocator.robot
Resource    ../labels/CustomizeEmailMsgLabel.robot


*** Keywords ***
Click On Customize Email MSG
    Web.Wait Until Element Is Enabled    ${clickOnCustmEmailMsg}    ${StandardTimeout}
    Web.Mouse Over     ${clickOnCustmEmailMsg}
    Web.Click Element    ${clickOnCustmEmailMsg}