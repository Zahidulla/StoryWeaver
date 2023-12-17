*** Settings ***
Resource    ../page_objects_&_keywords/main_menu_objects.robot
Resource    ../page_objects_&_keywords/videos_page_objects.robot
*** Test Cases ***
Test Setup
    Open_Web_browser    ${URL}
Test for Opening videos page
   [Tags]      Videos page Test       Sanity
   Select Videos page from read dropdown
   Videos title should be visible
   Videos should appear in the english tab
Test for Hindi languages videos tab
    [Tags]      Videos page Test       Sanity
    Click on Hindi tab
    Videos should appear in the hindi tab
Test for Marathi languages videos tab
    [Tags]      Videos page Test       Sanity
    Click on Marathi tab
    Videos should appear in the marathi tab
Test for Kannada languages videos tab
    [Tags]      Videos page Test       Sanity
    Click on Kannada tab
    Videos should appear in the kannada tab
Test Teardown
    Close_the_browser


