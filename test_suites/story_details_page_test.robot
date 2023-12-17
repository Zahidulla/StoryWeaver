*** Settings ***
Resource    ../page_objects_&_keywords/story_details_page_objects.robot
Resource    ../page_objects_&_keywords/read_page_objects.robot
Resource    ../page_objects_&_keywords/smiley_rating_objects.robot
Resource    ../page_objects_&_keywords/login_modal_objects.robot
Resource    ../page_objects_&_keywords/storyfinder_objects.robot

*** Test Cases ***
Test Setup
    Open_Web_browser    ${StorydetailURL}
Login
    Login   ${TeachersUserName}
    Sleep    3s
Test for reading the story by clicking on card
   [Tags]      Story details Test       Sanity
   Cick on book card to read the story
   Close the reader
Test for reading the story by clicking on Readbutton
   [Tags]      Story details Test       Sanity
    Click on Read button
    Read full story
    Smiley rating window should appear after reading a book
    The Next read window should be visible
    The next read suggestion should appear
    Click close button
Test for the similar books section should be visible
    [Tags]      Story details Test       Sanity
    Verify you may also like section should be visible
    Click story card from You may also like section
Test for adding the story to My bookshelf
    [Tags]      Story details Test       Sanity
    Click on bookshelf from story details page
    Select the bookshelf list to save the book
    Verify slim notification after adding to Bookshelf
Test for deleting the story from My Bookshelf
    [Tags]      Story details Test      Sanity
    Click on remove from bookshelf button
    Verify slim notification after deleting to Bookshelf
Test for adding the story to offline library
    [Tags]      Story details Test       Sanity
    Click on save to offline library
    Verify slim notification for book saved in offline library
Test for deleting the story from offline library
    [Tags]      Story details Test      Sanity
    Click on delete from offline library button
    Verify slim notification after deleteting book from offline library

Test for tags section should be visible
    [Tags]      Story details Test       Sanity
    Verify tags should be visible
Teardown
    Close_the_browser
