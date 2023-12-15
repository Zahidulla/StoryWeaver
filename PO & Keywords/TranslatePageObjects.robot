*** Settings ***
Resource    ../Resources/common.robot
Library    SeleniumLibrary
Resource     ReadPageObjects.robot
Resource        CreateFeatureObjects.robot


*** Variables ***
${TranslateOptionMainMenu}      (//span[@class="pb-site-nav-link__title"])[8]
${TranslatePageTitle}       //h1[@class="pb-page-header__title"]
${TranslateQuickview}       (//a[@class="pb-button pb-button--default pb-button--size-s pb-book-card__quick-menu-btn"])[1]
${TranslateOfflineOnBookcard}       (//a[@class="pb-link pb-link--light pb-link--no-text-decoration"])[1]
${FromLanguageDropdown}     //button[@id='pb-translate-landing-from-lang']
${ToLanguageDropdown}      //button[@id='pb-translate-landing-to-lang']
${TranslateSearchField}     //input[@class="pb-text-field__input"]
${LanguageTranslateDropdownOption}      //input[@class="pb-checkbox__input"]
${ToLanguageFromDropdown}       (//input[@class="pb-checkbox__input"])[3]
${TranslateEditorTitle}     //div[@class="pb-action-bar__title"]
${TranslateTextEditor}      //div[@id='txtEditor']
${EditorNextButton}         //span[@id='next_page']
${TranslateOrientationIcon}     //div[@title="Change Layout"]
${ReadersOrientration}     (//div[@class="pb-pagelayout__item pb-pagelayout__item-landscape"])[1]
${Duplicatepageicon}        //div[@id='duplicate_page']
${DeletePageicon}            //div[@id="delete_page"]
${PreviewButtonTranslateeditor}            //a[@id='preview']
${PreviewReader}        //div[@class="logo-level"]
${TranslatePublishBookButton}       //a[@id="publish"]
${TranslatesYesButton}        (//button[text()='Yes'])[2]
${PublishFormTitle}     (//div[@class="desk-one"])[1]
${TranslateStoryTitleInput}     //input[@id='story_title']
${TranslateEnglishStoryTitleField}      //input[@id='story_english_title']
${TranslateSynopsisTextField}       //textarea[@id='story_synopsis']
${ContinueButtoninform}     //span[contains(text(),'Continue')]
${Pickanotherstorymodaltitle}       //h1[@class="pb-center-mode-carousal__title"]
*** Keywords ***
Click on Translate from main menu
    Click Element    ${TranslateOptionMainMenu}
Verify Trabslate page is opened
    Wait Until Element Is Visible    ${BookCard}        timeout=15s
    Element Should Contain    ${TranslatePageTitle}    StoryWeaver Translator
Click on translate from Story card
    Mouse Over     ${BookCard}
    Click Element    ${TranslateQuickview}
Slim notification without choosing language
    Element Should Contain    ${GlobalSlimNotification}    Please select a language to translate
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=10s
Clcik on offline translate button from story card
    Mouse Over    ${BookCard}
    Click Element    ${TranslateOfflineOnBookcard}
Select 'From' language 
    Mouse Over    ${FromLanguageDropdown}
    Click Element    ${FromLanguageDropdown}
    Sleep    3s
Search for Language 
    Input Text    ${TranslateSearchField}    Ahiran
Select the language from the dropdown to translate
    Click Element    ${LanguageTranslateDropdownOption}
    Wait Until Element Is Visible    ${BookCard}    timeout=10s
Select 'To' language from translate
    Mouse Over    ${ToLanguageDropdown}
    Click Element    ${ToLanguageDropdown}
    Sleep    3s
    Click Element    ${ToLanguageFromDropdown}
Handle alert if any
    Run Keyword And Ignore Error    Handle Alert
Translate editor should open
    Wait Until Element Is Visible    ${TranslateEditorTitle}        timeout=25s
Enter Text in editor for translate page
    Sleep    10s
    Click Element    ${TranslateTextEditor}
    Input Text    ${TranslateTextEditor}    sample text added for testing purpose
Click on next page from translate editor
    Click Element    ${EditorNextButton}
    Sleep    5s
Select orientation from Translate editor
    Click Element    ${TranslateOrientationIcon}
    Click Element    ${ReadersOrientration}
    Sleep    5s
Click on duplicate page icon
    Click Element    ${Duplicatepageicon}
    Wait Until Element Is Visible    ${DeletePageicon}      timeout=15s
Click on preview from translate editor
    Click Element    ${PreviewButtonTranslateeditor}
Verify preview should open
    Wait Until Element Is Visible    ${PreviewReader}   timeout=15s
Click on publish button
    Click Element    ${TranslatePublishBookButton}
    Sleep    10s
    Set Focus To Element    ${TranslatesYesButton}
    Click Element    ${TranslatesYesButton}
Fill publsih form from translate
    Wait Until Element Is Visible    ${PublishFormTitle}    timeout=15s
    Sleep    2s
    Click Element    ${TranslateStoryTitleInput}
    Input Text    ${TranslateStoryTitleInput}    TranslateStoryTitle
    Sleep    2s
    Click Element    ${TranslateEnglishStoryTitleField}
    Input Text    ${TranslateEnglishStoryTitleField}    TranslateSToryTitle
    Sleep    2s
    Click Element    ${TranslateSynopsisTextField}
    Input Text    ${TranslateSynopsisTextField}    Test story synopsis for checking
Scroll to publish button and click on it
    Scroll Element Into View    ${ContinueButtoninform}
    Click Element    ${ContinueButtoninform}
Click on publish button from Translates final publish form
    Click Element    ${FinalPublishStoryBtn}
Verify Translate another story modal is appearing
    Element Should Contain    ${Pickanotherstorymodaltitle}    Pick another story to translate!





    
    