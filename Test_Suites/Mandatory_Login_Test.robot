*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/ReadPageObjects.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Resource    ../PO & Keywords/StoryDetailsPageObjects.robot


*** Test Cases ***
Test Setup
    Open_Web_browser    ${StorydetailURL}
Test for Manadatory login/signup after 3 reads
    [Documentation]     Testing Mandatory if login/signup appears after 3 reads as an unsigned user
    [Tags]      TC03-001       Sanity
    Cick on book card to read the story
    ${ReaderOpenStatus}     Run Keyword And Return Status    Wait Until Element Is Visible    ${CloseButton}
        WHILE   ${ReaderOpenStatus}
        Close the reader
        Cick on book card to read the story
        ${ReaderOpenStatus}     Run Keyword And Return Status    Wait Until Element Is Visible    ${CloseButton}
    END
Verify the Mandatory login/Signup modal should be visible
    [Tags]      TC03-002       Sanity
    Wait Until Element Is Visible    ${Emailbuttonmodal}    timeout=10s
    Element Should Be Visible   ${Emailbuttonmodal}
Test Teardown
    Close_the_browser



