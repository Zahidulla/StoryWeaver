*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/test_data.robot
*** Variables ***
${ReadOptionMainMenu}       //span[text()='Read']
${AllBooksOption}       //span[text()='All Books']
${TranslateOptionMainMenu}      //span[text()='Translate']
${VideoOption}           //span[text()='Videos']
*** Keywords ***
Select Read page from read dropdown
    Mouse Over    ${ReadOptionMainMenu}
    Click Element    ${ReadOptionMainMenu}
    Sleep    2s
    Click Element    ${AllBooksOption}
Click on Translate from main menu
    Click Element    ${TranslateOptionMainMenu}
Select Videos page from read dropdown
    Mouse Over    ${ReadOptionMainMenu}
    Click Element    ${ReadOptionMainMenu}
    Sleep    2s
    Click Element    ${VideoOption}