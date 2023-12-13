*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot
*** Variables ***
${MoreDropdown}     (//div[@title="More"])[1]
${EditStoryButton}      //div[text()="Edit"]
${YesButton}        //a[text()='Yes']
${BookCrad}     (//div[@class="pb-book-card__wrapper"])[1]
${CoverTextInReader}        //div[@class="cover-text"]
${Readbutton}              //a[text()='Read Story']
${OfflineLibraryOption}     (//ul[@class="pb-list pb-list--inline"])[2]
${ClickOnDelete}        (//div[@class="pb-columnizer__column"])[1]
${Bookshelfbutton}      (//a[@class="pb-link"])[1]
${BookshelfModal}       //div[@class="pb-modal__content-wrapper"]
${BookshelfListoption}      (//div[@class="pb-select-bookshelf__bookshelf-el"])[1]
${DeleteBookshelfButton}        (//a[@class="pb-link pb-link--danger"])[1]
${YouMayAlsoLikeTitle}      //div[@class="pb-section-block__header"]
${SimilarStoryCarusel}      //div[@class="pb-cards-carousel"]
${TagsSection}      (//ul[@class="pb-list pb-list--inline"])[4]
${YouMayAlsoLikeStoryCard}      (//div[@class="pb-book-card__container"])[2]
*** Keywords ***
Edit story from story details page
    Click Element    ${MoreDropdown}
    Click Element    ${EditStoryButton}
    Wait Until Element Is Visible    ${YesButton}   timeout=10s
    Click Element    ${YesButton}
    ${Element}      Run Keyword And Return Status    Element Should Be Visible    ${GlobalSlimNotification}

    FOR    ${i}    IN RANGE    2
        Exit For Loop If    ${Element} != ${TRUE}
        Reload Page
        Click Element    ${MoreDropdown}
        Click Element    ${EditStoryButton}
        Wait Until Element Is Visible    ${YesButton}   timeout=10s
        Click Element    ${YesButton}
        ${Element}      Run Keyword And Return Status    Element Should Be Visible    ${GlobalSlimNotification}
    END


Cick on book card to read the story
    Click Element    ${BookCrad}
Reader should open after clicking on book card
    Sleep    3s
    Element Should Be Visible    ${CoverTextInReader}
Click on Read button
    Click Element    ${Readbutton}
Click on save to offline library
    Sleep    2s
    Mouse Over    ${OfflineLibraryOption}
    Click Element    ${OfflineLibraryOption}

Verify slim notification for book saved in offline library
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}    This story has been added to your offline library.
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=10s
Click on delete from offline library button
    Click Element    ${OfflineLibraryOption}
    Click Element    ${ClickOnDelete}
Verify slim notification after deleteting book from offline library
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}     The Read and Readalong versions of this story have been removed from your offline library.
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=10s
Click on bookshelf from story details page
    Click Element    ${Bookshelfbutton}
    Element Should Be Visible    ${BookshelfModal}
Select the bookshelf list to save the book
    Wait Until Element Is Visible    ${BookshelfListoption}     timeout=10s
    Click Element    ${BookshelfListoption}
Verify slim notification after adding to Bookshelf
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}         Yay! This book has been added to your bookshelf!
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=10s
Click on remove from bookshelf button
    Click Element    ${DeleteBookshelfButton}
Verify slim notification after deleting to Bookshelf
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}         This story has been removed from your bookshelf.
    Wait Until Element Is Not Visible    ${GlobalSlimNotification}      timeout=10
Verify you may also like section should be visible
    Execute JavaScript    window.scrollBy(0, 700)
    Element Should Contain    ${YouMayAlsoLikeTitle}    You may also like
Verify tags should be visible
    Element Should Be Visible    ${TagsSection}
Click story card from You may also like section
    Execute JavaScript    window.scrollBy(0, 700)
    Click Element    ${YouMayAlsoLikeStoryCard}






