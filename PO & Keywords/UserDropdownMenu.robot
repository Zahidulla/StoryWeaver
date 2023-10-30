*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot
*** Variables ***
${UserNameDropdown}     (//span[@class="pb-site-nav-link__title"])[2]
${DashboardOption}      //a[text()='Dashboard']
*** Keywords ***
Click on UserName
    Sleep    2s
    Click Element    ${UserNameDropdown}
Click on Dashboard option from user name dropdown
    Click Element    ${DashboardOption}