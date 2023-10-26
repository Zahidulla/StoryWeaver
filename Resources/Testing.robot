*** Settings ***
Library    SeleniumLibrary
Library    ../Resources/testing.py

*** Test Cases ***
Suggest_edits Test
    testing.chromedriver        https://google.com
