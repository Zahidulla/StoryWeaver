*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/test_data.robot
*** Variables ***
${ReadOptionMainMenu}       //span[text()='Read']
${AllBooksOption}       //span[text()='All Books']
${TranslateOptionMainMenu}      //span[text()='Translate']
${VideoOption}           //span[text()='Videos']
${ResourcesOptionMainMenu}           //span[text()='Resources']
${STEMOption}       //div[text()='STEM Literacy Programme']
${FLPOption}        //div[text()='Foundational Literacy Programme']
${ECEOption}        //div[text()='Early Learning Resources']
${RPOption}        //div[text()='Reading Programme']
${BookListOption}        //div[text()='Book Lists']
${EnglishOption}        //span[text()='English']
${HindiOption}        //span[text()='Hindi']
${MarathiOption}        //span[text()='Marathi']
${OdiaOption}        //span[text()='Odia']
${UrduOption}        //span[text()='Urdu']
${FrenchOption}        //span[text()='French']
${SpanishOption}        //span[text()='Spanish']
${KonkanniOption}        //span[text()='Konkani']
${ArabicOption}        //span[text()='Arabic']
${FarsiOption}        //span[text()='Farsi']
${TamilOption}        //span[text()='Tamil']
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
Select stem option from main menu
    Mouse Over    ${ResourcesOptionMainMenu}
    Click Element    ${ResourcesOptionMainMenu}
    Sleep    2s
    Click Element    ${STEMOption}
Click English option
    Click Element    ${EnglishOption}
Click Hindi option
    Click Element    ${HindiOption}
Click Marathi option
    Click Element    ${MarathiOption}
Click Odia option
    Click Element    ${OdiaOption}
Click Urdu option
    Click Element    ${UrduOption}
Click French option
    Click Element    ${FrenchOption}
Click konkani option
    Click Element    ${KonkanniOption}
Click French option
    Click Element    ${FrenchOption}
Click spanish option
    Click Element    ${SpanishOption}
Click Tamil option
    Click Element    ${TamilOption}
Click Farsi option
    Click Element    ${FarsiOption}
Click Arabic option
    Click Element    ${ArabicOption}
Select FLP option from main menu
    Mouse Over    ${ResourcesOptionMainMenu}
    Click Element    ${ResourcesOptionMainMenu}
    Sleep    2s
    Click Element    ${FLPOption}
Select ECE option from main menu
    Mouse Over    ${ResourcesOptionMainMenu}
    Click Element    ${ResourcesOptionMainMenu}
    Sleep    2s
    Click Element    ${ECEOption}
Select RP option from main menu
    Mouse Over    ${ResourcesOptionMainMenu}
    Click Element    ${ResourcesOptionMainMenu}
    Sleep    2s
    Click Element    ${RPOption}
Select Booklist option from main menu
    Mouse Over    ${ResourcesOptionMainMenu}
    Click Element    ${ResourcesOptionMainMenu}
    Sleep    2s
    Click Element    ${BookListOption}
