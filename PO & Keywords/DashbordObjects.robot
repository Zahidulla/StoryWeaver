*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot


*** Variables ***
${MyPublishedStoryTab}      //span[text()='My Published Stories']
${PublishedStoryTitle}      (//td[@class="underline-class"])[1]
${StoryTitle link}      (//span[text()='${StoryTitleText}'])[1]
*** Keywords ***
My published story tab should be visible
    Wait Until Element Is Visible    ${MyPublishedStoryTab}
Verify the publsihed story should appear in My publsihed tab
    [Arguments]     ${StoryTitle}
    Element Should Contain    ${PublishedStoryTitle}    ${StoryTitle}
Click on Story title link from My published tab
    Click Element    ${StoryTitle link}
    Sleep    2s
    Switch Window         NEW
    Set Window Size    1536	    864     #Setting the window size for headless mode
    Maximize Browser Window

