*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/ReadPageObjects.robot
Resource    ../PO & Keywords/Unsigned_gatewayObjects.robot
Resource    ../PO & Keywords/StoryFinder.robot

*** Test Cases ***
Test Setup
    Open_Web_browser    ${URL}
Test for Banners
   [Tags]      TC05-001       Sanity    test:retry(2)
    Close the PTR Notification if visible
    Banners link should be present
    Select second banner
    StoryFinder Banner should be visible for an unsigned user
Test for StoryFinder banner
   [Tags]      TC05-002       Sanity
    StoryFinder Modal should appear when clicked on StoryFinder banner
    Default values should appear in filters of StoryFinder modal
    Stories carousel should appear when clicked on Find A Book button with default values
    Click close button
Test for all sections in Unsigned Usergateway should be visible
   [Tags]      TC05-003       Sanity    test:retry(2)

    Verify trending this week title for Unsigned usergateway
    Books in Trending this week should be visible
    Verify level section should be visible
    Verify Looking for books section Title
    Verify looking for books tabs for unsigned user
    Verify the books should be visible in Looking for books section
    Verify Popular Langauges section should be visible
    Verify Spotlight cards section should be visible
    Verify StoryWeaver & you section should be visible
    Verify the resource carousel in homepage
    Veify blogs section should be visible
    Verify Social icons should be visible
    Verify langauge search section should be visible
Test for language search from Student user gateway
   [Tags]      TC05-004       Sanity
    Enter text in langauge serach field
    Suggestions should be visible upon text input
    Searching language from the suggestions
Verify the searched language filter should be applied in read page
   [Tags]      TC05-005       Sanity
    Filter should be visible
Test Teardown
    Close_the_browser




