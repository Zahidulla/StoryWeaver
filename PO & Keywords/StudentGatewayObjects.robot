*** Settings ***
Resource    ../Resources/common.robot
Resource    ../Resources/Test_data.robot
Resource    LoginModalObjects.robot
Resource    StoryFinder.robot
Resource    SmileyRatingObjects.robot
Resource    Unsigned_gatewayObjects.robot
*** Variables ***
${StudentsSpotlightTitle}   (//div[@class="pb-home__title"])[2]
${StudentPopularLanguageTitle}     (//div[@class="pb-home__title"])[3]
${StudentPopularLanguagecards}      //div[@class="pb-horizontal-grid__wrapper"]
${Languagesfrompopularlanguage}     //div[@class="pb-language-card__language"]
${SideBar}  //div[@class="pb-toggle-sidebar__content"]
${UsernameInSidebar}    //h3[@class="pb-toggle-sidebar__name"]
${SideBarReadcount}     //div[@class="pb-toggle-sidebar__welcome-img"]
${SidebarHandpickedformeOption}    //h3[text()='Handpicked for me']
${SidebarAllBookOptions}   //h3[text()='All Books']
${SidebarReadalongOption}  //h3[text()='Readalongs']
${SidebarReadingProgramOption}     //h3[text()='Reading Programme']
${SidebarReadingListOption}      //h3[text()='Reading Lists']
${EngagementContentInSidebar}       //div[@class="pb-toggle-sidebar__engagement"]
${HighlightedText}      //h3[@class="pb-toggle-sidebar__nav-section-title--focus pb-toggle-sidebar__nav-section-title"]
*** Keywords ***
StoryFinder Banner should be visible for an Student user
    sleep   2s
    ${StoryFinderBannerLink}    Get Element Attribute    ${StoryFinderBanner}    src
    IF    "${StoryFinderBannerLink}" != "https://static.storyweaver.org.in/user_gateways/images/Student-Gateway-Banner-Desktop.jpg"
         Fail
    END
Verify looking for books tabs for Student user
     Scroll Element Into View    ${LookingForBooksCarousel}
     Element Should Be Visible    ${FeaturedBooksTab}
     Element Should Be Visible    ${NewArrivalsTab}
Verify trending this week title for student usergateway
    Scroll Element Into View    ${TrendingTitle}
    Sleep    2s
    Element Should Contain    ${TrendingTitle}    Trending Stories
    Scroll Element Into View    ${TrendingthisweekStory}
Verify Spotlight cards section should be visible in Student gateway
    Scroll Element Into View    ${SpotLightCards}
    Element Should Contain    ${StudentsSpotlightTitle}    In the spotlight
    Element Should Be Visible    ${SpotLightCards}
Verify Popular Langauges section should be visible from Student gateway
    Scroll Element Into View    ${StudentPopularLanguagecards}
    Scroll Element Into View    ${Languagesfrompopularlanguage}
    Element Should Contain    ${StudentPopularLanguageTitle}    Popular languages this week
    Element Should Be Visible    ${StudentPopularLanguagecards}
Verify side bar should have User name and read count image
    Element Should Contain    ${UsernameInSidebar}    Hi, zahid_cm
    Element Should Be Visible    ${SideBarReadcount}
Verify all the options from SideBar should be visible
    Element Should Be Visible    ${SidebarHandpickedformeOption}
    Element Should Be Visible    ${SidebarAllBookOptions}
    Element Should Be Visible    ${SidebarReadalongOption}
    Element Should Be Visible    ${SidebarReadingProgramOption}
    Element Should Be Visible    ${SidebarReadingListOption}
Verify the engagement content should be visible
    Scroll Element Into View    ${EngagementContentInSidebar}
    Element Should Be Visible    ${EngagementContentInSidebar}
Verify that read option is highlighted when the user is on Read page
    Element Should Contain    ${HighlightedText}    All Books
Verify that HandpickeOption should be highlighted when user is on Student homepage
    Element Should Contain    ${HighlightedText}    Handpicked for me
