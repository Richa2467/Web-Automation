*** Settings ***
Resource    ../locators/AuditTrailLocator.robot
Resource    ../labels/AuditTrailLabel.robot


*** Keywords ***
Click on Cancle for Delete Conformation Box
    Web.Wait Until Element Is Visible    ${cancledeleteConformBox}    ${StandardTimeout}
    Web.Click Element	  ${cancledeleteConformBox}

Click on Audit Trail Tab
    Web.Wait Until Element Is Visible    ${auditTrailTab}    ${StandardTimeout}
    Web.Click Element	  ${auditTrailTab}

Get User delete message text
    Web.Wait Until Element Is Visible    ${deleteUsrMsgTxt}    ${StandardTimeout}
    ${UsrLogMsg}     Web.Get Text	  ${deleteUsrMsgTxt}
    RETURN    ${UsrLogMsg}

Get Audit log delete message text
    Web.Wait Until Element Is Visible    ${auditTrailConfMsg}    ${StandardTimeout}
    ${AuditLogMsg}     Web.Get Text	  ${auditTrailConfMsg}
    RETURN    ${AuditLogMsg}

Click on Cancle for Audit Trail Log Conformation Box
    Web.Wait Until Element Is Visible    ${deleteCancle}    ${StandardTimeout}
    Web.Click Element	  ${deleteCancle}
