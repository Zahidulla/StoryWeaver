*** Settings ***
Resource    ../Resources/common.robot
Library    SeleniumLibrary


*** Variables ***
${CreateMenu}    //*[text()="Create"]
${DropdownCreate}   (//span[@class="pb-site-nav-link__title"][text()='Create'])[2]
${SelectLanguage}    //select[@id='story_language_id']
${StorytitleField}    //input[@id='story_title']
${StoryLevel}    //strong[contains(text(),'${LevelStory}')]
${StartswithWordsButton}    //input[@id="with_words"]
${AddImageButton}    //span[text()='add an image']
${Add the first image}    (//a[@class="illustration_drawer_img"])[1]
${Addimagetopage}    (//*[text()="add to current page"])
${Editorsection}   //div[@id='txtEditor']
${SaveImagebutton}    //i[@class='cropControlSave']
${FrontCoverPage}    //a[@class="page_thumbnail FrontCoverPage"]
${SaveButton}    //a[@id="save"]
${PublishButton}    (//a[@class="btn btn-app btn-brand-1 font-sm"])[3]
${DoneButton}    //button[@id="storycard-img-edit-done"]
${PublishBookButton}    //button[@id="publish-book"]
${SynopsisTextField}    //textarea[@id="story_synopsis"]
${CategoryButton}     //button[@class="multiselect dropdown-toggle btn btn-default"]
${CategoryDropdown}     //*[@class='checkbox' and contains(text(),'Activity Books')]
${EnglishStoryTitleField}      //input[@id="story_english_title"]
${PublihsFormNextBtn}       //button[@id="next"]
${FinalPublishStoryBtn}     //button[@id="publish_story"]
${InsertPageButton}     //span[@id='insert_pages']
${InsertOkaybutton}      (//span[@id='insert_page'])[1]
${ReadersSecondPage}       (//div[@class="illustration_container"])[2]
${OrientationDropdown}      //span[text()='Orientation & Layout']
${ReaderOrientation}        (//img[@class="sc-sidebar-layout-img"])[5]
${InsertDropdown}      //span[text()='Insert']
${AddTextBoxButton}       //div[@id="create-textbox"]
${TextBox}      //span[@class="page-position-content"]
${PreviewButton}        //a[@id="preview"]
${TextBoxField}     //div[@title="click to write into textbox"]
${SpeechBubbleOption}       //div[@id="create-speech-bubble"]
${SelectSpeechBubbletype}       (//a[@class="speech-bubble-type vertical"])[1]
${AddSpeechBubbleBtn}       //button[@class="btn add-speech-bubble"]
${SpeechBubbleTextfield}        //div[@title="click to write into speech bubble"]
${PreviewTitle}     (//div[@class="cover-text" ])[3]
${PreviewCloseButton}      //button[@id="close-button"]
${LevelbandInReader}        (//div[@class="logo-level"])[3]
*** Keywords ***
Hover and click on create option from main menu
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}    timeout=10s
    Sleep    2s
    Mouse Over    ${CreateMenu}
    Click Element    ${DropdownCreate}
Verify create page opened
    Sleep    5s
#     ${PublishForm}=  Run Keyword And Return Status  Element Should Be Visible  ${SelectLanguage}
#    WHILE    ${PublishForm} != ${TRUE}
#        Reload Page
#        ${PublishForm}=  Run Keyword And Return Status  Page Should Contain Element  ${SelectLanguage}
#    END
    Wait Until Element Is Visible    ${SelectLanguage}          timeout=15s
Select language of Story in Publish Form
    Select From List By Value    ${SelectLanguage}   4
Enter Story title in Publish Form
    Input Text    ${StorytitleField}    ${StoryTitleText}
    Sleep    4s
Select level of Story in Publsih Form
    Click Element    ${StoryLevel}
Click on start with words button in Publish Form
    Click Element    ${StartswithWordsButton}
Verify the Story title
    Element Text Should Be    //div[@class='heading-title gutter english devanagri']   ${StoryTitleText}
Add random image to reader
    Click Element    ${AddImageButton}
    Mouse Over    ${Add the first image}
    Click Element    ${Addimagetopage}
    Sleep    2s
    Click Element    ${SaveImagebutton}
Adding Text in Readers textbox
    Sleep    2s
    Input Text    ${Editorsection}    Testing Test for editor by automation.
Click on Front cover page
    Mouse Up    ${FrontCoverPage}
    Click Element    ${FrontCoverPage}
Click on Publish button from editor
    Sleep    2s
    Click Element    ${PublishButton}
    
CLick on Done button
    Sleep    2s
    Wait Until Element Is Visible    ${DoneButton}
    Sleep    2s
    Click Button    ${DoneButton}
    Wait Until Element Is Visible    ${PublishBookButton}
    Sleep    2s
    Click Button    ${PublishBookButton}
Enter synopsis in final Publish form
    Input Text    ${SynopsisTextField}    Synopis text for the story.
Select category from final Publish form
    Click Button   ${CategoryButton}
    Click Element    ${CategoryDropdown}
    Click Button    ${CategoryButton}
Enter English story title in final Publsih form
    Input Text    ${EnglishStoryTitleField}    TestEnglishTitle
Click on publish button from final publish form
    Mouse Down      ${PublihsFormNextBtn}
    Click Button    ${PublihsFormNextBtn}
    Wait Until Element Is Visible    ${FinalPublishStoryBtn}
    Click Button    ${FinalPublishStoryBtn}
Verify the UGC slim notification after publishing
    Sleep    5s
    Wait Until Element Is Visible    ${GlobalSlimNotification}
    Element Should Contain    ${GlobalSlimNotification}    Yay! Your story is published and will appear under 'My Published Stories' soon
    Click Element    ${CloseButton}
Insert new page in the editor
    Sleep    2s
    Click Element    ${InsertPageButton}
    Click Element    ${InsertOkaybutton}
    Sleep    2s
Click on second page
    Click Element    ${ReadersSecondPage}
    Sleep    3s
Select some orientation for the reader
    Click Element    ${OrientationDropdown}
    Click Element    ${ReaderOrientation}
    Sleep    2s
Add text box in the reader
    Click Element    ${InsertDropdown}
    Click Element    ${AddTextBoxButton}
    Mouse Over    ${TextBox}
    Drag And Drop By Offset    ${TextBox}    180    100
Enter Text in the text box
    Mouse Over    ${TextBoxField}
    Click Element    ${TextBoxField}
    Sleep    5s
    Input Text    ${TextBoxField}    TextBoxTest
Add Speech bubble
    Sleep    2s
    Click Element    ${SpeechBubbleOption}
    Click Element    ${SelectSpeechBubbletype}
    Click Element    ${AddSpeechBubbleBtn}
Enter Text in Speech Bubble
    Sleep    2s
    Mouse Over    ${SpeechBubbleTextfield}
    Click Element    ${SpeechBubbleTextfield}
    Sleep    5s
    Input Text      ${SpeechBubbleTextfield}     SpeechBubbleText
Click on preview button
    Click Element    ${PreviewButton}
Verify the preview
    Sleep    5s
    Wait Until Element Is Visible    ${PreviewTitle}
    Element Should Be Visible    ${LevelBandInReader}
Close preview
    Click Element    ${PreviewCloseButton}
    
Check for empty speech bubble or text box while publihsing
    ${EmptyTextfieldModal}=  Run Keyword And Return Status    Element Should Be Visible    //span[text()='Your story isn’t completely done!']
    WHILE    ${EmptyTextfieldModal} == ${TRUE}
        Click Button    Yes
        ${EmptyTextfieldModal}=  Run Keyword And Return Status  Page Should Contain Element  ${SelectLanguage}
    END
Click on save button
    Sleep    5s
    Click Element    ${SaveButton}
Verify publsihed under edit notification
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=10s
    Element Should Contain    ${GlobalSlimNotification}    Your story has been saved as a draft. You can edit, complete and publish your story by clicking on 'My Drafts' on your Dashboard.



    








