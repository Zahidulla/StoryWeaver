*** Settings ***
Resource    ../Resources/common.robot

*** Variables ***
${SmileyRatingModal} =    //*[@id="root"]/div/div[7]/div[2]/div/div
${SmileyRatingNextLink} =    Next Story

*** Keywords ***
Smiley rating window should appear after reading a book
    element should be visible    ${SmileyRatingModal}


