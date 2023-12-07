*** Settings ***
Resource    ../Resources/Test_data.robot
Resource    ../PO & Keywords/CreateFeatureObjects.robot
Resource    ../PO & Keywords/LoginModalObjects.robot
Resource    ../PO & Keywords/ImagePageObjects.robot
Resource    ../PO & Keywords/DashbordObjects.robot
Resource    ../PO & Keywords/StoryDetailsPageObjects.robot
Resource    ../PO & Keywords/UserDropdownMenu.robot

*** Test Cases ***
Test Setup
    Open_Web_browser    ${URL}
Login
    [Tags]      TC10-001       Sanity
    Login   ${UserName}
Verify publsihed story should appear in My Publsihed dashboard
    [Tags]      TC10-002      Sanity
    Click on UserName
    Click on Dashboard option from user name dropdown
    My published story tab should be visible
    Verify the publsihed story should appear in My publsihed tab      ${StoryTitleText}
Test for editing Publsihed story from story details page
    [Tags]      TC10-003       Sanity
    Click on Story title link from My published tab
    Sleep    3s
    Edit story from story details page
    Click on save button
Verify publsihed under edit notfication should appear
    [Tags]      TC02-004       Sanity
    Verify publsihed under edit notification