*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/ReadPageObjects.robot
Resource    ../PO & Keywords/Unsigned_gatewayObjects.robot
Resource    ../PO & Keywords/StoryFinder.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Resource    ../PO & Keywords/StudentGatewayObjects.robot
Resource    ../PO & Keywords/ParentGatewayObjects.robot

*** Test Cases ***
Test Setup
    Open_Web_browser    ${URL}
Login as a Parent user
   [Tags]      TC06-001       Sanity
    Login   ${ParentUserName}
Verify Parent gateway should load
    [Tags]      TC06-002       Sanity
    ${CurrentUrl}=      Get Location
    Should Be Equal As Strings    "${CurrentUrl}"    "https://storyweaver.org.in/en/parent"
Test for Banners from Parent gateway
   [Tags]      TC06-003       Sanity
    Banners link should be present
Test for all sections in Parent Usergateway should be visible
   [Tags]      TC06-004       Sanity
    Verify trending this week title for student usergateway     #Re-Using the composnents
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
