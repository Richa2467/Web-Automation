*** Settings ***
Library    DateTime    # Import the DateTime library for date/time operations
Library    String

*** Variables ***
${url}                         http://practice.automationtesting.in/
${Browser}                     Chrome
${MyAccount}                   //a[contains(text(),"My Account")]
${Inputemail}                  //input[@id="username"]
${Inputpass}                   //input[@id="password"]
${loginButton}                 //input[@class="woocommerce-Button button"]
${Reg_Email}                   //input[@id="reg_email"]
${Reg_Pass}                    //input[@id="reg_password"]
${Reg_Button}                  //input[@type="submit" and @value="Register"]
${Reg_Email_Error}             //li[contains(text()," Please provide a valid email address.")]
${Reg_Pass_Error}              //li[contains(text()," Please enter an account password.")]
${Reg_success}                 //a[contains(text(), "Dashboard")]
${login_success}               //a[contains(text(), "Dashboard")]
${Login_Email_Error}           //li[contains(text()," A user could not be found with this email address.")]
${Login_pass_empty_Error}      //li[contains(text(),"Password is required.")]
${Login_email_empty_Error}     //li[contains(text(),"Username is required.")]
${login_invalidpas}            //li[contains(text(),"The password you entered for the username ")]
${SignOut}                     //a[contains(text(),"Sign out")]
${Login_Page}                  //h2[contains(text(),"Login")]

*** Keywords ***
Generate Unique Email
    ${timestamp}    Get Current Date    result_format=%Y%m%d%H%M%S
    ${random_number}    Evaluate    random.randint(1000, 9999)
    ${email}    Set Variable    tyagiricha80+${timestamp}+${random_number}@gmail.com
    [Return]    ${email}




