*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Test_data.robot
Library    InstallWebdriver.py
*** Variables ***
${ReaderNextButton} =    //a[@title='Next']

*** Keywords ***
Open_Web_browser
      [Arguments]   ${Url}
      ${driver_path}=       InstallWebdriver.Get Driver Path With Browser   ${Browser_Name}
      Open Browser         ${Url}         ${Browser_Name}       executable_path=${driver_path}
      Set Window Size    1536	    864     #Setting the window size for headless mode
      Set Selenium Implicit Wait    20s
      maximize browser window
      Sleep    20s  #Giving this wait time to wait for service worker to get install
Close_the_browser
    close browser
    
Close the PTR page if visible
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   ${PTR_Image}
    Run Keyword If    ${present}    Click Element    ${PTR_Close_Button}

Read full story
    ${BUTTON} =    run keyword and return status    element should be visible    ${ReaderNextButton}
    WHILE   ${BUTTON}
        click element    ${ReaderNextButton}
        sleep    0.5s
        ${BUTTON} =    run keyword and return status    element should be visible    ${ReaderNextButton}
    END
Accept GDPR
    Click Element    //a[text()='Agree']
