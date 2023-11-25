*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Test_data.robot
*** Variables ***
${ReaderNextButton} =    //a[@title='Next']


*** Keywords ***
Open_Web_browser
      ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
      ${ff_options}=  Evaluate  sys.modules['selenium.webdriver'].FirefoxOptions()  sys, selenium.webdriver

      Call Method    ${chrome_options}    add_argument    --disable-extensions
      Call Method    ${chrome_options}    add_argument    --headless
      Call Method    ${chrome_options}    add_argument    --disable-gpu
      Call Method    ${chrome_options}    add_argument    --no-sandbox
      Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
        Call Method    ${ff_options}    add_argument    --no-sandbox
        Call Method    ${ff_options}    add_argument    --headless
      [Arguments]   ${Url}
      Open Browser         ${Url}         ${Browser_Name}       options=${chrome_options}
      Set Window Size    1536	    864     #Setting the window size for headless mode
      Maximize Browser Window
      Set Selenium Implicit Wait    10s
      Sleep    20s  #Giving this wait time to wait for service worker to get install
Close_the_browser
    close browser
    
Close the PTR Notification if visible
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
    ${GDPRPresent}=  Run Keyword And Return Status    Element Should Be Visible   //a[text()='Agree']
    Run Keyword If    ${GDPRPresent}    Click Element    //a[text()='Agree']
Click close button
    Click Element    ${CloseButton}
