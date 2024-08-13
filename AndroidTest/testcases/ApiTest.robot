*** Settings ***
Library    String
Library    Collections
Library    SeleniumLibrary
Resource    ../resources/UsersPageResource.robot
Resource    ../resources/LoginPageResource.robot
Library     ../lib/ApiTesting.py    ${SandboxApiUrl}    ${AccountId}    ${AccountToken}

*** Test Cases ***
Send SMS OTP To The User
    [Tags]    API1
    ${statusCode}    Send OATH OTP   ${UserName}    sms
    Should be Equal as Strings    ${statusCode}    0

Send Email OTP To The User And Verify OTP
    [Tags]    API2
    ${statusCode}    Send OATH OTP   ${UserName}    email
    Should be Equal as Strings    ${statusCode}    0
    sleep    5s    # Waiting for email to arrive
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    ${otpTextLength}    Get Length    ${otpText}[0]
    Delete Email    ${LATEST}
    Should Be Equal As Strings    ${otpTextLength}    6

Validate The User name and Password
    [Tags]    API3
    ${statusCode}    Validate User   ${UserName}    ${Password}    1
    Should be Equal as Strings    ${statusCode}    0

Verify User Name Only
    [Tags]    API4
    ${statusCode}    Validate User   ${UserName}    ${Password}    1
    Should be Equal as Strings    ${statusCode}    0

Send Email OTP and Validate Passcode
    [Tags]    API5
    ${statusCode}    Send OATH OTP   ${UserName}    email
    Should be Equal as Strings    ${statusCode}    0
    sleep    ${SleepDelay5s}    # Waiting for email to arrive
    Open Mailbox    host=${GmailHost}    user=${GmailId}    password=${GmailPassword}
    ${LATEST} =    Wait For Email    sender=${MailSenderId}    status=UNSEEN    timeout=300
    ${HTML} =    Get Email Body    ${LATEST}
    ${otpText}    Get Regexp Matches    ${HTML}    \\d{6}
    ${otpTextLength}    Get Length    ${otpText}[0]
    Delete Email    ${LATEST}
    ${statusCode2}    Validate Passcode    ${UserName}    ${otpText}[0]
    Should be Equal as Strings    ${statusCode2}    0

Update User First Name and Last Name
    [Tags]    API6
    ${statusCode}    Update User  ${UserName}    ${apiFirstName}     ${apiLastName}
    Should be Equal as Strings    ${statusCode}    0
    ${returnString}    Find User Detail   ${UserName}    firstName
    Should be Equal as Strings    ${returnString}    ${apiFirstName}
    ${returnString}    Find User Detail   ${UserName}    lastName
    Should be Equal as Strings    ${returnString}    ${apiLastName}
    ${statusCode}    Update User  ${UserName}    ${apiOldFirstName}     ${apiOldLastName}
    Should be Equal as Strings    ${statusCode}    0

Update User Email Address And Verify The Updated Details
    [Tags]    API7
    ${statusCode}    Update User    ${UserName}    ${apiOldFirstName}
    Should be Equal as Strings    ${statusCode}    0
    ${returnString}    Find User Detail   ${UserName}    email
    Should be Equal as Strings    ${returnString}    ${GmailId}

Update User Mobile Number And Verify The Updated Details
    [Tags]    API8
    ${statusCode}    Update User    ${UserName}    ${apiOldFirstName}
    Should be Equal as Strings    ${statusCode}    0
    ${returnString}    Find User Detail   ${UserName}    mobile
    Should be Equal as Strings    ${returnString}    ${inputCellPhoneNo}

Find User Details
    [Tags]    API9
    ${returnString}    Find User Detail   ${UserName}    username
    Should be Equal as Strings    ${returnString}    ${UserName}

Add Google Authenticator Token To User Account
    [Tags]    API10
    ${returnString}    Add Token   ${UserName}    8    1
    Should be Equal as Strings    ${returnString}[0]    0
    ${statusCode}    Delete Token    ${UserName}    ${returnString}[1]
    Should be Equal as Strings    ${statusCode}    0

Add SurePass Authenticator Token To User Account
    [Tags]    API11
    ${returnString}    Add Token   ${UserName}    9    1
    Should be Equal as Strings    ${returnString}[0]    0
    ${statusCode}    Delete Token    ${UserName}    ${returnString}[1]
    Should be Equal as Strings    ${statusCode}    0

Create Session Token
    [Tags]    API12
    ${returnString}    Create Session Token     ${SessionTokenUserName}       ${SessionTokenPassword}
    Should be Equal as Strings    ${returnString}[0]    0
    Should be Equal as Strings    ${returnString}[1]    OK

Add User to Admin portal
    [Tags]    API13
    ${returnString}   add user      ${apiUserName}  ${apiFirstName}  ${apiEmail}
    Should be Equal as Strings      ${returnString}    0
    ${returnString}   delete user   ${apiUserName}
    Should be Equal as Strings      ${returnString}    0

Delete User
    [Tags]    API14
    ${returnString}   add user      ${apiDeleteUser}    ${apiFirstName}      ${apiDeleteEmail}
    Should be Equal as Strings      ${returnString}    0
    ${returnString}   delete user   ${apiDeleteUser}
    Should be Equal as Strings      ${returnString}    0