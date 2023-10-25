*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/CreateFeatureObjects.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Resource    ../PO & Keywords/ImagePageObjects.robot

*** Test Cases ***
Setup
        Open_Web_browser    ${IndividualImageURL}
Test for clicking on create option from main menu as an unsigned user
    [Tags]      TC200       Sanity
    Hover and click on create option from main menu
    Verify the Login/signup modal should visible
    Close Login/Signup Modal
Test for clicking on create option from individual image page
    [Tags]      TC201       Sanity
    Accept GDPR
    Click on create story button from individual image page
    Click on Login/Signup button from generic login signup(Appear when clicked on action button)
    Verify the Login/signup modal should visible
Test for Login and opening create page
    [Tags]      TC202       Sanity
    Login
    Hover and click on create option from main menu
    Verify create page opened
Test for filling the publish form
    [Tags]      TC203       Sanity
    Select language of Story in Publish Form
    Enter Story title in Publish Form
    Select level of Story in Publsih Form
    Click on start with words button in Publish Form
Test for adding new page and add image and text in 3rd page
    [Tags]      TC205       Sanity
    Insert new page in the editor
    Add random image to reader
    Adding Text in Readers textbox
    Click on second page
Test for selecting readers orientation
    [Tags]      TC206       Sanity
    Select some orientation for the reader
    Add random image to reader
Test for adding textbox and adding text in it
    [Tags]      TC207       Sanity
    Add text box in the reader
    Enter Text in the text box
Test for adding Speech bubble and adding text in it
    [Tags]      TC208       Sanity
    Add Speech bubble
    Enter Text in Speech Bubble
Test for adding image in front cover page
    [Tags]      TC209       Sanity
    Click on Front cover page
    Add random image to reader
Test for filling final publish form
    [Tags]      TC210       Sanity
    Close the PTR page if visible       #Ensures to close the popup to avoid interception error
    Click on Publish button from editor
    Check for empty speech bubble or text box while publihsing  #To ensure continuity if any stale element error occurs while adding speech bubble and text box
    CLick on Done button
    Enter synopsis in final Publish form
    Select category from final Publish form
    Enter English story title in final Publsih form
    Click on publish button from final publish form
Verify the UGC published Notification
    [Tags]      TC211       Sanity
    Verify the UGC slim notification after publishing
Tear Down
    Close_the_browser

