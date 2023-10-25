*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Test Setup      Open_Web_browser    ${Url}
Test Teardown       Close_the_browser


*** Test Cases ***
Login Test with valid crediantials
    [Documentation]     Testing Login with In-valid credentials
    [Tags]      TC001       Sanity
    Click on Login/Signup button
    Click on email option
    Enter email id      zahid@yopmail.com
    Click on next button
    Enter Vaild Password in password field
    Click login button after entering password
    Verify the notification for Successfully login
Login Test with invalid credentials
    [Documentation]     Testing Login with valid credentials
    [Tags]      TC002       Sanity
    Click on Login/Signup button
    click on email option
    Enter email id      zahid@yopmail.com
    Click on next button
    Enter Invalid Password in password field
    Click login button after entering password
    Invalid Email/Password slim notification
Login Test with OTP
    [Documentation]     Testing Login with valid credentials
    [Tags]      TC003       Sanity
    Click on Login/Signup button
    Click on Mobile Login Option
    Enter Mobile number in mobile field
    Click on next button
    OTP notification should be visible
Resend confirmation Test
    [Documentation]     Testing confirmtion mail
    [Tags]      TC004       Sanity
    Click on Login/Signup button
    Click on email option
    Enter email id      test41@yopmail.com
    Click on Resend confirmation links
    Click on Resend confirmation button
    Confirmation mail should be visible
Forgot password Test
    [Documentation]     Testing forgot password mail
    [Tags]      TC005       Sanity
    Click on Login/Signup button
    Click on email option
    Enter email id    zahid@yopmail.com
    Click on Forgot password link from the login popup
    Click on Forget password button from login popup
    Forgot password notification should be visible      zahid@yopmail.com


