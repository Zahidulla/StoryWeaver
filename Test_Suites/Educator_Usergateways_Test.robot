*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/ReadPageObjects.robot
Resource    ../PO & Keywords/Unsigned_gatewayObjects.robot
Resource    ../PO & Keywords/StoryFinder.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Resource    ../PO & Keywords/StudentGatewayObjects.robot
Resource    ../PO & Keywords/ParentGatewayObjects.robot
Resource    ../PO & Keywords/EducatorGatewayObjects.robot

*** Test Cases ***
Test Setup
    Open_Web_browser    ${URL}
Login as a Educator user
   [Tags]      TC07-001       Sanity
    Login   ${TeachersUserName}
Verify Educator gateway should load
    [Tags]      TC07-002       Sanity
    ${CurrentUrl}=      Get Location
    Should Be Equal As Strings    "${CurrentUrl}"    "https://storyweaver.org.in/en/educator"
Test for Banners from Educator gateway
   [Tags]      TC07-003       Sanity
    Banners link should be present
Test for all sections in Educator Usergateway should be visible
   [Tags]      TC07-004       Sanity
    Verify trending this week title for Educator usergateway
    Verify the 5great thing section should be visible
    Verify Looking for books section Title
    Verify looking for books tabs for unsigned user
    Verify the books should be visible in Looking for books section
    Verify all the Ideas for classroom section should be visible
    Verify resource section from educator gateway should be visible
    Verify explore Topics section should be visible
    Verify explore books section should be visible for educator gateway
    Verify Tips and Ideas section should be visible
    Verify Share your experience section
    Verify the language section should be visible
    Enter text in langauge serach field
    Suggestions should be visible upon text input




