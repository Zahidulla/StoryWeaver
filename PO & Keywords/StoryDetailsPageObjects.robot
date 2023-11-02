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