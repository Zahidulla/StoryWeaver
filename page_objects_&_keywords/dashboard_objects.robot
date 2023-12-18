*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/test_data.robot


*** Variables ***
${MyPublishedStoryTab}      //span[text()='My Published Stories']
${PublishedStoryTitle}      (//td[@class="underline-class"])[1]
${StoryTitle link}      //span[text()='${StoryTitle}']
*** Keywords ***
My published story tab should be visible

    FOR    ${i}    IN RANGE    2
           ${ElementIsvisible}       Run Keyword And Return Status    Element Should Be Visible    ${MyPublishedStoryTab}
           Exit For Loop If    ${ElementIsvisible} == ${TRUE}
           Reload Page
           Sleep    2s
    END
             
    Click Element    ${MyPublishedStoryTab}
Verify the publsihed story should appear in My publsihed tab
    [Arguments]     ${StoryTitle}
    Wait Until Element Is Visible    ${MyPublishedStoryTab}
    Element Should Contain    ${PublishedStoryTitle}    ${StoryTitle}
Click on Story title link from My published tab
    [Arguments]     ${StoryTitle}
    Click Element    ${StoryTitle}
    Sleep    2s
    Switch Window         NEW
    Set Window Size    1536	    864     #Setting the window size for headless mode
    Maximize Browser Window

