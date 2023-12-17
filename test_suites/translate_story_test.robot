*** Settings ***
Resource    ../resources/test_data.robot
Resource    ../page_objects_&_keywords/create_feature_objects.robot
Resource    ../page_objects_&_keywords/login_modal_objects.robot
Resource    ../page_objects_&_keywords/dashboard_objects.robot
Resource    ../page_objects_&_keywords/story_details_page_objects.robot
Resource    ../page_objects_&_keywords/translate_page_objects.robot
Resource    ../page_objects_&_keywords/main_menu_objects.robot

*** Test Cases ***
Test Setup
    Open_Web_browser    ${Url}
Login
    Login   ${UserName}
    Sleep    3s
Test if the translate page is be opened
    [Tags]      Translate Test       Sanity
    Click on Translate from main menu
    Verify Trabslate page is opened
Test if the language is not selected and clicking on Translate
    [Tags]      Translate Test       Sanity
    Click on translate from Story card
    Slim notification without choosing language
    Clcik on offline translate button from story card
    Slim notification without choosing language
Test for selecting To and From language from Translate page
    [Tags]      Translate Test       Sanity
    Select 'From' language
    Search for Language
    Select the language from the dropdown to translate
    Select 'To' language from translate
Test for translating story when clicked on translate
    [Tags]      Translate Test       Sanity
    Click on translate from Story card
    Handle alert if any
    Translate editor should open
Test for entering Text in editor
    [Tags]      Translate Test       Sanity
    Enter Text in editor for translate page
    Click on next page from translate editor
Test for selecting reader orientation
    [Tags]     Translate Test       Sanity
    Select orientation from Translate editor
    Enter Text in editor for translate page
Test for adding duplicate page
    [Tags]      Translate Test      Sanity
    Click on duplicate page icon
    Enter Text in editor for translate page
Test for preview in translate page
    [Tags]      Translate Test       Sanity
    Click on preview from translate editor
    Verify preview should open
    Close preview
Test for filling the publish form
    [Tags]      Translate Test       Sanity
    Click on publish button
    Fill publsih form from translate
    Scroll to publish button and click on it
Test for publishing the translated story
    [Tags]      Translate Test       Sanity
    Scroll to publish button and click on it
    Click on publish button from Translates final publish form
Verify the ugc slim notification after submitting
    [Tags]      Translate Test      Sanity
    Verify the UGC slim notification after publishing
Test if the translate another story modal is opened in Read page
    [Tags]      Translate Test       Sanity
     Verify Translate another story modal is appearing
Test Teardown
    Close_the_browser
