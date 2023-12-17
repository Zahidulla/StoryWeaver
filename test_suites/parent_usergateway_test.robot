*** Settings ***
Resource    ../resources/test_data.robot
Resource    ../page_objects_&_keywords/read_page_objects.robot
Resource    ../page_objects_&_keywords/unsigned_gateway_objects.robot
Resource    ../page_objects_&_keywords/storyfinder_objects.robot
Resource    ../page_objects_&_keywords/login_modal_objects.robot
Resource    ../page_objects_&_keywords/student_gateway_objects.robot
Resource    ../page_objects_&_keywords/parent_gateway_objects.robot

*** Test Cases ***
Test Setup
    Open_Web_browser    ${URL}
Login as a Parent user
   [Tags]      Parent-Gateway Test      Sanity
    Login   ${ParentUserName}
Verify Parent gateway should load
    [Tags]      Parent-Gateway Test      Sanity
    ${CurrentUrl}=      Get Location
    Should Be Equal As Strings    "${CurrentUrl}"    "https://storyweaver.org.in/en/parent"
Test for Banners from Parent gateway
   [Tags]      Parent-Gateway Test       Sanity
    Banners link should be present
Test for all sections in Parent Usergateway should be visible
   [Tags]      Parent-Gateway Test       Sanity
    Verify trending this week title for Parent usergateway     #Re-Using the composnents
    Books in Trending this week should be visible
    Verify Spotlight cards section should be visible in Student gateway
    Verify Looking for books section Title
    Verify looking for books tabs for unsigned user
    Verify the books should be visible in Looking for books section
    Verify explore Books section should be visible
    Verify the videos section should be visible
    Verify Explore different stories section should be visible
    Verify if the Resource carousel is present
    Verify Here from Other parents section should appear
    Verify Share your experience section
    Verify the language section should be visible
    Enter text in langauge serach field
    Suggestions should be visible upon text input
    Verify Parents page story section
Teardown
    Close_the_browser