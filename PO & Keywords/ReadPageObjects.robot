*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot

*** Variables ***
${BookCard}     (//div[@class="pb-book-card__container"])[1]
${3DotMenu}     (//*[@class="pb-svg-icon pb-svg-icon--type-dots"])[1]
${ReadStoryin3dotsmenu}    //div[text()='Read Story']


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
    Click Element    ${CloseButton}




