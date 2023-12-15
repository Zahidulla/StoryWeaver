*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/CreateFeatureObjects.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Resource    ../PO & Keywords/DashbordObjects.robot
Resource    ../PO & Keywords/StoryDetailsPageObjects.robot
Resource    ../PO & Keywords/TranslatePageObjects.robot


*** Test Cases ***
Test Setup
    Open_Web_browser    ${Url}
Login
    Login   ${UserName}
    Sleep    3s
Test if the translate page is be opened
    [Tags]      TC11-001       Sanity
    Click on Translate from main menu
    Verify Trabslate page is opened
Test if the language is not selected and clicking on Translate
    [Tags]      TC11-002       Sanity
    Click on translate from Story card
    Slim notification without choosing language
    Clcik on offline translate button from story card
    Slim notification without choosing language
Test for selecting To and From language from Translate page
    [Tags]      TC11-003       Sanity
    Select 'From' language
    Search for Language
    Select the language from the dropdown to translate
    Select 'To' language from translate
Test for translating story when clicked on translate
    [Tags]      TC11-004       Sanity
    Click on translate from Story card
    Handle alert if any
    Translate editor should open
Test for entering Text in editor
    [Tags]      TC11-005       Sanity
    Enter Text in editor for translate page
    Click on next page from translate editor
Test for selecting reader orientation
    [Tags]      TC11-006       Sanity
    Select orientation from Translate editor
    Enter Text in editor for translate page
Test for adding duplicate page
    [Tags]      TC11-007       Sanity
    Click on duplicate page icon
    Enter Text in editor for translate page
Test for preview in translate page
    [Tags]      TC11-008       Sanity
    Click on preview from translate editor
    Verify preview should open
    Close preview
Test for filling the publish form
    [Tags]      TC11-009       Sanity
    Click on publish button
    Fill publsih form from translate
    Scroll to publish button and click on it
#Test for publishing the translated story
#    [Tags]      TC11-0010       Sanity
#    Scroll to publish button and click on it
#    Click on publish button from Translates final publish form
Verify the ugc slim notification after submitting
    [Tags]      TC11-0011       Sanity
    Verify the UGC slim notification after publishing
Test if the translate another story modal is opened in Read page
    [Tags]      TC11-0012       Sanity
     Verify Translate another story modal is appearing
