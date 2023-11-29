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
    Close the PTR Notification if visible
    FOR    ${i}    IN RANGE    4    #Aftre 4th read the Mandatory Login signup should appear
            Cick on book card to read the story
            Sleep    4s
            ${ReaderStatus}=   run keyword and return status    element should be visible    ${LevelbandInReader} #To check if the reader opens thrice and on 4th time the elevel band is not visible
            Run Keyword If    ${ReaderStatus}      Close the reader
    END
Verify the Mandatory login/Signup modal should be visible
    [Tags]      TC03-002       Sanity
    Wait Until Element Is Visible    ${Emailbuttonmodal}    timeout=10s
    Element Should Be Visible   ${Emailbuttonmodal}
Test Teardown
    Close_the_browser



