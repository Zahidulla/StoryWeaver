*** Settings ***
Resource    ../Resources/common.robot

*** Variables ***
${SmileyRatingModalTitle} =    //h2[@class="pb-smiley-rating-modal__title"]
${SmileyRatingNextLink} =    (//a[@class="pb-link pb-link--default pb-smiley-rating-modal__link"])[3]

*** Keywords ***
Smiley rating window should appear after reading a book
    Wait Until Element Is Visible    ${SmileyRatingModalTitle}      timeout=15s
    element should be visible    ${SmileyRatingModalTitle}


