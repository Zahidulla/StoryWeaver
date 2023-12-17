*** Settings ***
Resource    ../page_objects_&_keywords/story_details_page_objects.robot
Resource    ../page_objects_&_keywords/read_page_objects.robot
Resource    ../page_objects_&_keywords/smiley_rating_objects.robot
Resource    ../page_objects_&_keywords/login_modal_objects.robot
Resource    ../page_objects_&_keywords/storyfinder_objects.robot
Resource    ../page_objects_&_keywords/main_menu_objects.robot
*** Test Cases ***
Test Setup
    Open_Web_browser    ${Url}
Login
    Login   ${UserName}
    Sleep    4s
Test for opening read page from Read dropdown
    [Tags]      Read page Test       Sanity
    Select Read page from read dropdown
    Verify read page should open
Test for language filter in Read page
    [Tags]      Read page Test       Sanity
    Apply language filter from read page
    Verify the Language filtered stories should load in results
Test for Level filter in Read oage
    [Tags]      Read page Test       Sanity
    Apply level filter from Read page
    Verify the level filter is applied
Test for Category filter in Read page
    [Tags]      Read page Test       Sanity
    Apply category filter from Read page
    Verify the Category filter is applied
Test for publisher filter in read page
    [Tags]      Read page Test       Sanity
    Apply publisher filter from Read page
    Verify the publisher filter is applied
Test for sort option from Read page
    [Tags]      Read page Test       Sanity
    Verify sort option by selecting New arrivals
    Verify the sort is applied by checking the books in results
Test for reading story from 3 dot menu
    [Tags]      Read page Test       Sanity
    Hover on first card
    Click on 3 dot icon
    Click on read story from 3 dot menu
    Read full story
    Smiley rating window should appear after reading a book
    The Next read window should be visible
    The next read suggestion should appear
    Click close button
Test for adding the story to My bookshelf from 3 dot menu
    [Tags]      Read page Test       Sanity
    Hover on first card
    Click on 3 dot icon
    Add book to bookshelf from 3 dot menu
    Select the bookshelf list to save the book
    Verify slim notification after adding to Bookshelf in read page
Test for removing the story from My bookshelf
    [Tags]      Read page Test      Sanity
    Hover on first card
    Click on 3 dot icon
    Remove book from bookshelf from 3 dot menu
    Verify slim notification after deleting to Bookshelf in read page
Test for adding the story to offline library from 3 dot menu
    [Tags]      Read page Test       Sanity
    Add book to offline library from 3 dot menu
    Verify slim notification for book saved in offline library from read page
Test for removing the story from offline library from 3 dot menu
    [Tags]      Read page Test       Sanity
    Remove book from offline linrary from 3 dot menu
    Verify slim notification after deleteting book from offline library from Read page
Tear Down
    Close_the_browser