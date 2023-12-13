*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot

*** Variables ***
${BookCard}     (//div[@class="pb-book-card__container"])[1]
${3DotMenu}     (//*[@class="pb-svg-icon pb-svg-icon--type-dots"])[1]
${ReadStoryin3dotsmenu}    (//div[@class="pb-menu-item__label"])[1]
${FirstSelectedFilter}      //span[@class="pb-pill__label"]
${ReadOptionMainMenu}       (//span[@class="pb-site-nav-link__title"])[6]
${AllBooksOption}       (//span[@class="pb-site-nav-link__title"])[32]
${ReadpageLanguageFilter}       (//a[@class="pb-link pb-link--default"])[2]
${ReadpageLevelFilter}       (//a[@class="pb-link pb-link--default"])[3]
${ReadpageCategoryFilter}       (//a[@class="pb-link pb-link--default"])[4]
${ReadpagePublisherFilter}       (//a[@class="pb-link pb-link--default"])[5]
${SortOption}       //select[@id="filters-bar-sort-by"]
${FilterInputField}     id=filers-bar-languages-search-field
${HindiFilter}      (//input[@class="pb-checkbox__input"])[2]
${FirstBookcardLanguage}        (//span[@class="pb-book-card__language"])[1]
${SixthBookcardLanguage}        (//span[@class="pb-book-card__language"])[6]
${Level1FilterReadpage}     (//input[@class="pb-checkbox__input"])[2]
${LevelBandfirstStory}      (//span[@class="pb-book-card__level"])[1]
${LevelSixthStory}     (//span[@class="pb-book-card__level"])[6]
${ClickOnEmptySpace}        //h1[@class="pb-page-header__title"]
${PublisherInputField}      //input[@id="filers-bar-publishers-search-field"]
${BookshelfOption3dotsmenu}    (//div[@class="pb-menu-item__label"])[2]
${RemoveBookshelfOption3dotsmenu}    (//div[@class="pb-menu-item__label"])[2]
${OfflineOption3dotsmenu}         (//div[@class="pb-menu-item__label"])[3]
${RemoveOfflineOption3dotsmenu}      (//div[@class="pb-menu-item__label"])[3]
*** Keywords ***
Hover on first card
    Set Focus To Element    ${BookCard}
    Mouse Over    ${BookCard}
    Sleep    2s
Click on 3 dot icon
    Click Element       ${3DotMenu}
Click on read story from 3 dot menu
    Click Element    ${ReadStoryin3dotsmenu}
Close the reader
    Wait Until Element Is Visible    ${CloseButton}     timeout=10s
    Mouse Over    ${CloseButton}
    Sleep    1s
    Click Element    ${CloseButton}
Filter should be visible
    Wait Until Element Is Visible    ${FirstSelectedFilter}     timeout=15s
    Element Should Contain    ${FirstSelectedFilter}    TELUGU
Select Read page from read dropdown
    Mouse Over    ${ReadOptionMainMenu}
    Click Element    ${ReadOptionMainMenu}
    Sleep    2s
    Click Element    ${AllBooksOption}
Verify read page should open
    Wait Until Element Is Visible    ${BookCard}    timeout=20s
    ${ReadpageUrl}   Get Location
    Should Be Equal As Strings    ${ReadpageUrl}    https://storyweaver.org.in/en/stories?sort=Ratings
Apply language filter from read page
    Click Element    ${ReadpageLanguageFilter}
    Sleep    2s
    Click Element    ${FilterInputField}
    Sleep    2s
    Input Text    ${FilterInputField}   Hindi
    Sleep    2s
    Click Element    ${HindiFilter}
Verify the Language filtered stories should load in results
    Click Element    ${ClickOnEmptySpace}
    Wait Until Element Is Visible    ${FirstBookcardLanguage}   timeout=20s
    Element Should Contain    ${FirstBookcardLanguage}    HINDI
    Element Should Contain    ${SixthBookcardLanguage}    HINDI
Apply level filter from Read page
    Click Element    ${ReadpageLevelFilter}
    Sleep    2s
    Click Element    ${Level1FilterReadpage}
Verify the level filter is applied
    Click Element    ${ClickOnEmptySpace}
    Wait Until Element Is Visible    ${LevelBandfirstStory}     timeout=10s
    Element Should Contain    ${LevelBandfirstStory}    LEVEL 1
    Element Should Contain    ${LevelSixthStory}    LEVEL 1
Apply category filter from Read page
    Click Element    ${ReadpageCategoryFilter}
    Sleep    2s
    Click Element    ${HindiFilter}
Verify the Category filter is applied
    Click Element    ${ClickOnEmptySpace}
    Wait Until Element Is Visible    ${FirstBookcardLanguage}   timeout=20s
    Element Should Contain    ${FirstBookcardLanguage}    HINDI
    Element Should Contain    ${SixthBookcardLanguage}    HINDI
Apply publisher filter from Read page
    Click Element    ${ReadpagePublisherFilter}
    Sleep    2s
    Click Element    ${PublisherInputField}
    Sleep    2s
    Input Text    ${PublisherInputField}    Pratham
    Sleep    2s
    Click Element    ${HindiFilter}
Verify the publisher filter is applied
    Click Element    ${ClickOnEmptySpace}
    Wait Until Element Is Visible    ${FirstBookcardLanguage}   timeout=20s
    Element Should Contain    ${FirstBookcardLanguage}    HINDI
    Element Should Contain    ${SixthBookcardLanguage}    HINDI
Verify sort option by selecting New arrivals
    Select From List By Value    ${SortOption}  New Arrivals
Verify the sort is applied by checking the books in results
    Wait Until Element Is Visible    ${FirstBookcardLanguage}   timeout=20s
    Element Should Contain    ${FirstBookcardLanguage}    HINDI
    Element Should Contain    ${SixthBookcardLanguage}    HINDI
    Sleep    2s
Add book to bookshelf from 3 dot menu
    Sleep    2s
    Click Element    ${BookshelfOption3dotsmenu}
Remove book from bookshelf from 3 dot menu
    Sleep    2s
    Click Element    ${RemoveBookshelfOption3dotsmenu}
Add book to offline library from 3 dot menu
    Sleep    2s
    Click Element    ${OfflineOption3dotsmenu}
Remove book from offline linrary from 3 dot menu
    Click Element    ${RemoveOfflineOption3dotsmenu}
Verify slim notification for book saved in offline library from read page
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}    This story has been added to your offline library.
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=15s
Verify slim notification after deleteting book from offline library from Read page
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}     The Read and Readalong versions of this story have been removed from your offline library.
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=15s
Verify slim notification after adding to Bookshelf in read page
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}         Yay! This book has been added to your bookshelf!
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=15s
Verify slim notification after deleting to Bookshelf in read page
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}         This story has been removed from your bookshelf.
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=15s


