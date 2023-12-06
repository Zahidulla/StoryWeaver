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
    Click Element    ${OfflineLibraryOption}

Verify slim notification for book saved in offline library
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}    This story has been added to your offline library.
    Sleep    2s
    Click close button
Click on delete from offline library button
    Sleep    5s
    Click Element    ${OfflineLibraryOption}
    Click Element    ${ClickOnDelete}
Verify slim notification after deleteting book from offline library
    Sleep    3s
    Element Should Contain    ${GlobalSlimNotification}     The Read and Readalong versions of this story have been removed from your offline library.
    Sleep    2s
    Click close button
Click on bookshelf from story details page
    Sleep    3s
    Click Element    ${Bookshelfbutton}
    Element Should Be Visible    ${BookshelfModal}
Select the bookshelf list to save the book
    Wait Until Element Is Visible    ${BookshelfListoption}     timeout=10s
    Click Element    ${BookshelfListoption}
Verify slim notification after adding to Bookshelf
    Sleep    5s
    Element Should Contain    ${GlobalSlimNotification}         Yay! This book has been added to your bookshelf!
    Sleep    2s
    Click close button
Click on remove from bookshelf button
    Sleep    3s
    Click Element    ${DeleteBookshelfButton}
Verify slim notification after deleting to Bookshelf
    Wait Until Element Is Visible    ${GlobalSlimNotification}      timeout=15s
    Element Should Contain    ${GlobalSlimNotification}         This story has been removed from your bookshelf.







