*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot
*** Variables ***
${MoreDropdown}     (//div[@title="More"])[1]
${EditStoryButton}      //div[text()="Edit"]
${YesButton}        //a[text()='Yes']
${BookCrad}     (//div[@class="pb-book-card__wrapper"])[1]
*** Keywords ***
Edit story from story details page
    Click Element    ${MoreDropdown}
    Click Element    ${EditStoryButton}
    Click Element    ${YesButton}
Cick on book card to read the story
    Click Element    ${BookCrad}