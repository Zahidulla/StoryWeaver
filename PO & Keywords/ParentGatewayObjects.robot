*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot
Resource    LoginModalObjects.robot
Resource    Unsigned_gatewayObjects.robot

*** Variables ***
${ExploreBooksLevel-1&2}    (//div[@class="pb-home__title"])[3]
${ExploreBooksCards-1&2}    (//div[@class="pb-grid pb-grid--2up-6up"])[1]
${ExlporeBooksLevel-3&4}    (//div[@class="pb-home__title"])[4]
${ExploreBooksCards-3&4}    (//div[@class="pb-grid pb-grid--2up-6up"])[2]
${VideoSectionParentGateway}        //div[@class="pb-list-based-video-section__video-section"]
${ExploreDifferentBooksTitle}       (//div[@class="pb-home__title"])[5]
${ReadalongResourceCard}   //div[@class="pb-popular-resource-card__card"][1]
${BilingualResourceCard}    //div[@class="pb-popular-resource-card__card"][2]
${WordlessStoriesResourceCard}  //div[@class="pb-popular-resource-card__card"][3]
${ResourceCarousel}     (//div[@class="pb-home__title"])[6]
${HearFromOtherParentsTitle}    (//div[@class="pb-home__title"])[7]
${HearFromParentsVideos}        //div[@class="pb-ece-resources-section"]
${ShareYourExperienceTitle}     //div[@class="pb-home__title--red"]
${SubmitYourSToryButton}    //button[text()='Submit Your Story']
${ParentSharesection}       //h3[@class="pb-share-ctacard__title"]

*** Keywords ***
Verify explore Books section should be visible
    Scroll Element Into View    ${ExploreBooksLevel-1&2}
    Scroll Element Into View    ${ExploreBooksCards-1&2}
    Element Should Contain    ${ExploreBooksLevel-1&2}    Explore Level 1 & Level 2 books by theme
    Element Should Be Visible    ${ExploreBooksCards-1&2}
    Scroll Element Into View    ${ExlporeBooksLevel-3&4}
    Scroll Element Into View    ${ExploreBooksCards-3&4}
    Element Should Contain    ${ExlporeBooksLevel-3&4}    Explore Level 3 & Level 4 books by theme
    Element Should Be Visible    ${ExploreBooksCards-3&4}
Verify trending this week title for Parent usergateway
    Scroll Element Into View    ${TrendingTitle}
    Sleep    2s
    Element Should Contain    ${TrendingTitle}    Trending Stories for Parents
    Scroll Element Into View    ${TrendingthisweekStory}
Verify the videos section should be visible
    Scroll Element Into View    ${VideoSectionParentGateway}
    Element Should Be Visible    ${VideoSectionParentGateway}
Verify Explore different stories section should be visible
    Scroll Element Into View    ${ExploreDifferentBooksTitle}
    Element Should Contain    ${ExploreDifferentBooksTitle}    Explore different kinds of books to keep learning
    Scroll Element Into View    ${ReadalongResourceCard}
    Element Should Be Visible    ${ReadalongResourceCard}
    Element Should Be Visible    ${BilingualResourceCard}
    Element Should Be Visible    ${WordlessStoriesResourceCard}
    Scroll Element Into View    //p[@title="Wordless books are made up of pictures and no words. These books empower readers to use their own vocabulary and imagination, enable lateral thinking in readers who use the same visuals to tell multiple stories at every reading. They encourage collaboration between parent/educator and readers."]
Verify if the Resource carousel is present
    Scroll Element Into View    ${ResourceCarousel}
    Scroll Element Into View    ${ResorceNextButton}
    Element Should Contain    ${ResourceCarousel}    StoryWeaver-crafted reading programmes for your child
    Element Should Contain    ${STEMresourceTitle}      STEM Literacy Programme
    Click Element    ${ResorceNextButton}
    Sleep    1S
    Element Should Contain    ${ReadingProgramResourceTitle}        Reading Programme
    Click Element    ${ResorceNextButton}
    Sleep    1S
    Element Should Contain    ${FLPResourceTitle}       Themed Book Lists
Verify Here from Other parents section should appear
    Scroll Element Into View    ${HearFromOtherParentsTitle}
    Element Should Contain    ${HearFromOtherParentsTitle}    Hear from other parents
    Scroll Element Into View    ${HearFromParentsVideos}
    Element Should Be Visible    ${HearFromParentsVideos}
Verify Share your experience section
    Scroll Element Into View    ${ShareYourExperienceTitle}
    Element Should Contain    ${ShareYourExperienceTitle}    SHARE YOUR EXPERIENCE
    Scroll Element Into View    ${SubmitYourSToryButton}
    Element Should Be Visible    ${SubmitYourSToryButton}
Verify the language section should be visible
    Execute JavaScript    window.scrollBy(0, 300)
    Scroll Element Into View    ${LanguageSearchTitle}
    Element Should Contain    ${LanguageSearchTitle}    Help your child read in their mother tongue

Verify Parents page story section
    Scroll Element Into View    ${ParentSharesection}
    Element Should Contain    ${ParentSharesection}    Share this page with another parent
