*** Settings ***
Resource    ../resources/test_data.robot
Resource    ../page_objects_&_keywords/read_page_objects.robot
Resource    ../page_objects_&_keywords/login_modal_objects.robot
Resource    ../page_objects_&_keywords/story_details_page_objects.robot


*** Test Cases ***
Test Setup
    Open_Web_browser    ${StorydetailURL}
Test for Manadatory login/signup after 3 reads
    [Tags]      Mandatory Login Test       Sanity
    Cick on book card to read the story
    ${ReaderOpenStatus}     Run Keyword And Return Status    Wait Until Element Is Visible    ${CloseButton}
    FOR    ${i}    IN RANGE    3    #Ensures 3 read at max
        IF    ${ReaderOpenStatus} == ${True}  #To ensure if any refresh happens as observed multiple times
            Close the reader
            Cick on book card to read the story
            ${ReaderOpenStatus}     Run Keyword And Return Status    Wait Until Element Is Visible    ${CloseButton}
        END
        
    END

Verify the Mandatory login/Signup modal should be visible
    [Tags]      Mandatory Login Test       Sanity
    Wait Until Element Is Visible    ${Emailbuttonmodal}    timeout=10s
    Element Should Be Visible   ${Emailbuttonmodal}
Test Teardown
    Close_the_browser



