*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/test_data.robot
*** Variables ***
${UserNameDropdown}     //div[@class="pb-dropdown__toggle pb-site-header__dropdown-toggle"]
${DashboardOption}      //a[text()='Dashboard']
*** Keywords ***
Click on UserName
    Sleep    4s
    Click Element    ${UserNameDropdown}
Click on Dashboard option from user name dropdown
    Click Element    ${DashboardOption}