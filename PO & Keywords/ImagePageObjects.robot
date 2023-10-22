*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot
*** Variables ***
${CreateStoryButton}    //a[contains(text(),'Create Story')]

*** Keywords ***
Click on create story button from individual image page
    Scroll Element Into View    ${CreateStoryButton}
    Click Element    ${CreateStoryButton}
    Sleep    2s
    