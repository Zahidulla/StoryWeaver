*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/test_data.robot

*** Variables ***
${VideospageTitle}      //div[@class="yottie-widget-header-inner"]
${EnglishVideosTab}     //a[text()='StoryWeaver English']
${HindiVideosTab}     //a[text()='StoryWeaver Hindi']
${KannadaVideosTab}     //a[text()='StoryWeaver Kannada']
${MarathiVideosTab}     //a[text()='StoryWeaver Marathi']
${EnglishVideosCard}      (//span[@class="yottie-widget-video-preview-thumbnail"])[1]
${HindiVideosCard}      (//span[@class="yottie-widget-video-preview-thumbnail"])[25]
${MarathiVideosCard}      (//span[@class="yottie-widget-video-preview-thumbnail"])[50]
${KannadaVideosCard}      (//span[@class="yottie-widget-video-preview-thumbnail"])[76]
*** Keywords ***

Videos title should be visible
    Sleep    5s
    Element Should Be Visible    ${VideospageTitle}
Videos should appear in the english tab
    Wait Until Element Is Visible    ${EnglishVideosCard}     timeout=15s
Click on Hindi tab
    Click Element    ${HindiVideosTab}
Videos should appear in the hindi tab
    Wait Until Element Is Visible    ${HindiVideosCard}     timeout=15s
Videos should appear in the marathi tab
    Wait Until Element Is Visible    ${MarathiVideosCard}     timeout=15s
Videos should appear in the kannada tab
    Wait Until Element Is Visible    ${KannadaVideosCard}     timeout=15s
Click on Kannada tab
    Click Element    ${KannadaVideosTab}
Click on Marathi tab
    Click Element    ${MarathiVideosTab}