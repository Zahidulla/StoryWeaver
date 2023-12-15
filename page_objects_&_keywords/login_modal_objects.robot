*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/test_data.robot
Resource    read_page_objects.robot
*** Variables ***
${SignupLoginbutton}    //span[text()="Sign Up/Log In"]
${LoginButtonSmallModal}    //a[text()='Log In']
${Login/SignupModal}    //form[@class="pb-auth-modal__form-content"]
${Emailbuttonmodal}    //a[text()="Email"] 
${EmailInputField}    //input[@id='auth-modal-email']
${NextButton}     //button[text()='Next']
${PasswordField}     //input[@id='auth-modal-password']
${LoginButton}    //button[text()='Log In']
${MobileButton}    //a[text()="Mobile *"]
${MobileNumberField}    id=auth-modal-mobile-number
${ConfirmationLink}     //a[contains(text(),"Didn't receive confirmation instructions?")]
${ConfirmationButton}    //button[contains(text(),'Resend Confirmation Instructions')]
${ForgotPasswordLink}    //a[contains(text(),'Forgot Password?')]
${ForgetPasswordButton}    //button[contains(text(),'Send me Reset Password Instructions')]
${MandatoryLoaderScreen}    //div[@class="pb-auth-modal__content--mandatory-login-desc"]
*** Keywords ***
Login
    [Arguments]     ${UserID}
    Click Element   ${SignupLoginbutton}
    Click Element    ${Emailbuttonmodal}
    input text    ${EmailInputField}   ${UserID}
    Click Button   ${NextButton}
    Sleep    2s
    input password    ${PasswordField}   ${Password}
    click button    ${LoginButton}
    Sleep    5s
Click on Login/Signup button
    Sleep    2s
    click Element   ${SignupLoginbutton}
Verify the Login/signup modal should visible
    Sleep    2s
    Element Should Be Visible    ${Login/SignupModal}
click on Google button
    Click Element    //*[@class="pb-svg-icon pb-svg-icon--type-google pb-button__icon-left"]
Click on Login/Signup button from generic login signup(Appear when clicked on action button)
    Sleep    2s
    Click Element    ${LoginButtonSmallModal}
Click on email option
     Sleep    2s
     Click Element    ${Emailbuttonmodal}
Enter email id
    [Arguments]     ${UserName}
    Sleep    2s
    input text    ${EmailInputField}   ${UserName}
Click on captcha button
    Select Frame    //iframe[@title='reCAPTCHA']
    Sleep    5s
    Click Element    //*[@class='recaptcha-checkbox-border']
Click on next button
    Click Button   ${NextButton}
    Wait Until Element Is Visible    ${PasswordField}       timeout=15s
Enter Vaild Password in password field
    input password    ${PasswordField}   ${Password}
    sleep    2s
Click login button after entering password
    Click Element    ${LoginButton}
    sleep    2s
Verify the notification for Successfully login
    element text should be    ${GlobalSlimNotification}      Login Successful
    Log     Login Successful
Enter Invalid Password in password field
    input password    ${PasswordField}   ${Invalid_Password}
    sleep    2s
Invalid Email/Password slim notification
    element text should be    ${GlobalSlimNotification}     Invalid email or password.
    Click close button
Click on Mobile Login Option
    Click Element    ${MobileButton}
    Sleep    2s
Enter Mobile number in mobile field
    Input Text    ${MobileNumberField}    ${MobileNumber}
    Sleep    2s
OTP notification should be visible
    Element Should Be Visible    ${GlobalSlimNotification}
    Click close button
Click on Resend confirmation links
    Click Element    ${ConfirmationLink}
Click on Resend confirmation button
    Click Element       ${ConfirmationButton}
Confirmation mail should be visible
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}    You will receive an email with instructions for how to confirm your email address in a few minutes.
Click on Forgot password link from the login popup
    Click Element       ${ForgotPasswordLink}
Click on Forget password button from login popup
    Click Button    ${ForgetPasswordButton}
Forgot password notification should be visible
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    [Arguments]     ${UserName}
    Element Should Contain    ${GlobalSlimNotification}    We have sent a password reset link to ${UserName}
Manadatory login loader screen should appear
    Element Should Be Visible    //div[@class="pb-loader pb-loader--m"]
Close Login/Signup Modal
    Element Should Be Visible    ${CloseButton}
    Click Element    ${CloseButton}




  
