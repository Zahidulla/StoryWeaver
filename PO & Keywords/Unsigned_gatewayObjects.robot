*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot
Resource    LoginModalObjects.robot
Resource    StoryFinder.robot
Resource    SmileyRatingObjects.robot


*** Variables ***
${FirstBannerLink}     (//img[@class="pb-img__img"])[2]
${StoryFinderBannersLink}   (//img[@class="pb-img__img"])[3]
${TrendingTitle}    (//div[@class="pb-home__title"])[1]
${TrendingthisweekStory}    (//div[@class="slick-track"])[2]
${LevelSectionTitle}    //div[@class="pb-home__title pb-home__level-title"]
${Levelcards}   (//div[@class="pb-horizontal-grid__wrapper"])[1]
${LookingForBooksCarouselTitle}  //span[@class="pb-tabs__home-title"]
${PopularLanguageTitle}     (//div[@class="pb-home__title"])[2]
${FeaturedBooksTab}     (//div[@class="pb-book-selection-el__tab"])[1]
${NewArrivalsTab}       (//div[@class="pb-book-selection-el__tab"])[2]
${AwardWinningTab}      (//div[@class="pb-book-selection-el__tab"])[3]
${LookingForBooksCarousel}      (//div[@class="slick-track"])[3]
${PopularLanguagecards}     (//div[@class="pb-horizontal-grid__wrapper"])[2]
${SpotlightTitle}       (//div[@class="pb-home__title"])[3]
${SpotLightCards}       //div[@class="pb-home__el pb-home__el--centered"]
${StoryWeaver&YouTitle}       (//div[@class="pb-home__title"])[4]
${ForParentsCard}      (//div[@class="pb-share-ctacard pb-ctasection__section-card"])[1]
${ForEducatorCard}      (//div[@class="pb-share-ctacard pb-ctasection__section-card"])[2]
${ForStudentCard}      (//div[@class="pb-share-ctacard pb-ctasection__section-card"])[2]
${ResourcecarouselTitle}       (//div[@class="pb-home__title"])[5]
${STEMresourceTitle}    (//p[@class="pb-structured-resources-item__title"])[1]
${ReadingProgramResourceTitle}    (//p[@class="pb-structured-resources-item__title"])[2]
${FLPResourceTitle}    (//p[@class="pb-structured-resources-item__title"])[3]
${ThemeListResourceTitle}    (//p[@class="pb-structured-resources-item__title"])[4]
${BlogsectionTitle}     (//div[@class="pb-home__title"])[6]
${FollowUsCard}     (//div[@class="pb-home__title"])[7]
${BlogCards}        //div[@class="pb-home__blogs"]
${FollowUsIcons}    //div[@class="pb-home__social"]
${LanguageSearchTitle}      //p[@class="pb-language-explorer__search-title"]
${LanguageSearchField}      (//input[@class="pb-auto-suggestions-el__search"])[2]
${LanguageSearchSection}        //div[@class="pb-language-explorer__search"]
${LanguageSuggestion}       //ul[@class="pb-list pb-auto-suggestions-el__search-item"]
${Secondbannerdot}     //button[contains(text(),'2')]
${FirstBannerdot}     //button[contains(text(),'1')]
${ResorceNextButton}        (//*[@class="pb-svg-icon pb-svg-icon--type-chevron-right"])[3]
*** Keywords ***
Banners link should be present
    Sleep    2s
    Click Element    ${FirstBannerdot}
    ${image_src}  Get Element Attribute  ${FirstBannerLink}  src
    IF    "${image_src}" == "None"
         Log    The banner is not present
    END
Select second banner
    Click Element    ${Secondbannerdot}
Verify trending this week title for Unsigned usergateway
    Scroll Element Into View    ${TrendingthisweekStory}
    Element Should Contain    ${TrendingTitle}    Trending this week
Books in Trending this week should be visible
    Element Should Be Visible    ${TrendingthisweekStory}
Verify level section should be visible
    Scroll Element Into View    ${Levelcards}
    Element Should Contain    ${LevelSectionTitle}    Our storybooks are based on reading proficiency rather than age. Our books are categorised across four Reading Levels:
    Element Should Be Visible    ${Levelcards}
Verify Looking for books section Title
    Scroll Element Into View    ${LookingForBooksCarouselTitle}
    Scroll Element Into View    ${LookingForBooksCarousel}
    Element Should Contain    ${LookingForBooksCarouselTitle}    Looking for a book to read? Pick one of these!
Verify looking for books tabs for unsigned user
     Element Should Be Visible    ${FeaturedBooksTab}
     Element Should Be Visible    ${NewArrivalsTab}
     Element Should Be Visible    ${AwardWinningTab}
Verify the books should be visible in Looking for books section
    Element Should Be Visible    ${LookingForBooksCarousel}
Verify Popular Langauges section should be visible
    Scroll Element Into View    ${PopularLanguagecards}
    Element Should Contain    ${PopularLanguageTitle}    Popular languages this week
    Element Should Be Visible    ${PopularLanguagecards}
Verify Spotlight cards section should be visible
    Scroll Element Into View    ${SpotLightCards}
    Element Should Contain    ${SpotlightTitle}    In the spotlight
    Element Should Be Visible    ${SpotLightCards}
Verify StoryWeaver & you section should be visible
    Scroll Element Into View    ${ForEducatorCard}
    Element Should Contain    ${StoryWeaver&YouTitle}    StoryWeaver and You
    Element Should Be Visible    ${ForParentsCard}
    Element Should Be Visible    ${ForStudentCard}
    Element Should Be Visible    ${ForEducatorCard}
Verify the resource carousel in homepage
    Scroll Element Into View    ${ResorceNextButton}
    Element Should Contain    ${ResourcecarouselTitle}    StoryWeaver-crafted reading programmes for your child
    Element Should Contain    ${STEMresourceTitle}      STEM Literacy Programme
    Click Element    ${ResorceNextButton}
    Sleep    1S
    Element Should Contain    ${ReadingProgramResourceTitle}        Reading Programme
    Click Element    ${ResorceNextButton}
    Sleep    1S
    Element Should Contain    ${FLPResourceTitle}       Foundational Literacy Programme  
    Click Element    ${ResorceNextButton}
    Sleep    1S
    Element Should Contain    ${ThemeListResourceTitle}     Themed Book Lists
Veify blogs section should be visible
    Scroll Element Into View    ${BlogsectionTitle}
    Element Should Contain    ${BlogsectionTitle}    Read our blog
    Element Should Be Visible    ${BlogCards}
Verify Social icons should be visible
    Element Should Contain    ${FollowUsCard}    Follow us
    Element Should Be Visible    ${FollowUsIcons}
Verify langauge search section should be visible
    Scroll Element Into View    ${LanguageSearchTitle}
    Element Should Contain    ${LanguageSearchTitle}    Explore storybooks in over 300 languages!
Enter text in langauge serach field
    Scroll Element Into View    ${LanguageSearchField}
    Input Text    ${LanguageSearchField}    Telu
Suggestions should be visible upon text input
    Sleep    1s
    Element Should Be Visible    ${LanguageSuggestion}
Searching language from the suggestions
    Click Element    ${LanguageSuggestion}














    


    


