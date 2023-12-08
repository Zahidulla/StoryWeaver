*** Settings ***
Resource    ../PO & Keywords/StoryDetailsPageObjects.robot
Resource    ../PO & Keywords/ReadPageObjects.robot
Resource    ../PO & Keywords/SmileyRatingObjects.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Resource    ../PO & Keywords/StoryFinder.robot

*** Test Cases ***
Test Setup
    Open_Web_browser    ${StorydetailURL}
Login
    Login   ${TeachersUserName}
    Sleep    3s
Test for reading the story by clicking on card
   [Tags]      TC09-001       Sanity
   Close the PTR Notification if visible
   Cick on book card to read the story
   Close the reader
Test for reading the story by clicking on Readbutton
   [Tags]      TC09-002       Sanity
    Click on Read button
    Read full story
    Smiley rating window should appear after reading a book
    The Next read window should be visible
    The next read suggestion should appear
    Click close button
Test for adding the story to offline library
    [Tags]      TC09-003       Sanity
    Click on save to offline library
    Verify slim notification for book saved in offline library
Test for deleting the story from offline library
    [Tags]      TC09-004       Sanity
    Click on delete from offline library button
    Verify slim notification after deleteting book from offline library
Test for adding the story to My bookshelf
    [Tags]      TC09-005       Sanity
    Click on bookshelf from story details page
    Select the bookshelf list to save the book
    Verify slim notification after adding to Bookshelf
Test for deleting the story from My Bookshelf
    [Tags]      TC09-006       Sanity
    Click on remove from bookshelf button
    Verify slim notification after deleting to Bookshelf
Test for the similar books section should be visible
    [Tags]      TC09-007       Sanity
    Verify you may also like section should be visible
Test for tags section should be visible
    [Tags]      TC09-008       Sanity
    Verify tags should be visible
Teardown
    Close_the_browser
