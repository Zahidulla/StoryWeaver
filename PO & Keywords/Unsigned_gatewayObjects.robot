*** Settings ***
Resource    Menu_barObjects.robot
Resource    LoginModalObjects.robot
Resource    StoryFinder.robot
Resource    SmileyRatingObjects.robot

*** Keywords ***
login Modal when clicked on Create
    click link    ${CreateDropdwon}
    sleep    2s
    click element    css=${createoption}
   
Manadatory signup should appear after 3 reads
    sleep    2s
    scroll element into view    pb-card-item__card-div
    MOUSE OVER    pb-card-item__card-div
    click element    pb-card-item__card-div



