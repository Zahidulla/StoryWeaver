*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/ReadPageObjects.robot
Resource    ../PO & Keywords/LoginModalObjects.robot


*** Test Cases ***
Test Setup
    Open_Web_browser    ${ReadPage}
Test for Manadatory login/signup after 3 reads
    [Documentation]     Testing Mandatory if login/signup appears after 3 reads as an unsigned user
    [Tags]      TC100       Sanity
    FOR    ${i}    IN RANGE    4    #Aftre 4th read the Mandatory Login signup should appear
            Hover on first card
            Click on 3 dot icon
            Click on read story from 3 dot menu
            ${CloseButtonstatus}=   run keyword and return status    element should be visible    ${CloseButton}
            Run Keyword If    ${CloseButtonstatus}      Close the reader
    END
    Wait Until Element Is Visible    ${Emailbuttonmodal}    timeout=10s
User should be able to login from the manadtory Login/Signup modal
    [Tags]      TC101       Sanity
    Click on email option
    Enter email id    ${UserName}
    Click on next button
    Enter Vaild Password in password field
    Click login button after entering password
    Verify the notification for Successfully login
Test Teardown
    Close_the_browser



