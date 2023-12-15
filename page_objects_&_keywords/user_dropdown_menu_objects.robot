*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/test_data.robot
*** Variables ***
${UserNameDropdown}     //span[contains(text(),'Zahid_nu')]
${DashboardOption}      //a[text()='Dashboard']
*** Keywords ***
Click on UserName
    Sleep    4s
    Click Element    ${UserNameDropdown}
Click on Dashboard option from user name dropdown
    Click Element    ${DashboardOption}