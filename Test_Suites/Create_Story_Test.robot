*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/CreateFeatureObjects.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Resource    ../PO & Keywords/ImagePageObjects.robot
Resource    ../PO & Keywords/DashbordObjects.robot
Resource    ../PO & Keywords/StoryDetailsPageObjects.robot
Resource    ../PO & Keywords/UserDropdownMenu.robot

*** Test Cases ***
Setup
        Open_Web_browser    ${IndividualImageURL}
Test for clicking on create option from individual image page
    [Tags]      TC02-001       Sanity
    Accept GDPR
    Click on create story button from individual image page
    Click on Login/Signup button from generic login signup(Appear when clicked on action button)
    Verify the Login/signup modal should visible
    Close Login/Signup Modal
Test for clicking on create option from main menu as an unsigned user
    [Tags]      TC02-002       Sanity
    Hover and click on create option from main menu
    Verify the Login/signup modal should visible
    Close Login/Signup Modal
Test for Login and opening create page
    [Tags]      TC02-003       Sanity
    Login   ${UserName}
    Hover and click on create option from main menu
    Verify create page opened
Test for filling the publish form
    [Tags]      TC02-004       Sanity
    Select language of Story in Publish Form
    Enter Story title in Publish Form
    Select level of Story in Publsih Form
    Click on start with words button in Publish Form
Test for adding new page and add image and text in 3rd page
    [Tags]      TC02-005       Sanity
    Insert new page in the editor
    Add random image to reader
    Adding Text in Readers textbox
Test for selecting readers orientation
    [Tags]      TC02-006       Sanity
    Click on second page
    Select some orientation for the reader
    Add random image to reader
Test for adding textbox and adding text in it
    [Tags]      TC02-007       Sanity
    Add text box in the reader
    Enter Text in the text box
Test for adding Speech bubble and adding text in it
    [Tags]      TC02-008       Sanity
    Add Speech bubble
    Enter Text in Speech Bubble
Test for adding image in front cover page
    [Tags]      TC02-009       Sanity
    Click on Front cover page
    Add random image to reader
Test for previewing story
    [Tags]      TC02-010       Sanity
    Click on preview button
    Verify the preview
    Close preview
Test for filling final publish form
    [Tags]      TC02-011       Sanity
    Click on Publish button from editor
    Check for empty speech bubble or text box while publihsing  #To ensure continuity if any stale element error occurs while adding speech bubble and text box
    CLick on Done button
    Enter synopsis in final Publish form
    Select category from final Publish form
    Enter English story title in final Publsih form
    Click on publish button from final publish form
Verify the UGC published Notification
    [Tags]      TC02-012       Sanity
    Verify the UGC slim notification after publishing
Verify publsihed story should appear in My Publsihed dashboard ---Made a different suite as the published story will take time to appear in My published story
    [Tags]      TC02-013       Sanity
    Click on UserName
    Click on Dashboard option from user name dropdown
    My published story tab should be visible
    Verify the publsihed story should appear in My publsihed tab      ${StoryTitleText}
Test for editing Publsihed story from story details page
    [Tags]      TC02-014       Sanity
    Click on Story title link from My published tab
    Sleep    3s
    Edit story from story details page
    Click on save button
Verify publsihed under edit notfication should appear
    [Tags]      TC02-015       Sanity
    Verify publsihed under edit notification
Tear Down
    Close_the_browser

