*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/test_data.robot
Resource    login_modal_objects.robot
Resource    unsigned_gateway_objects.robot
Resource    parent_gateway_objects.robot

*** Variables ***
${5GreatThingsTitle}        //h3[@class="pb-home__title pb-home__edu-title"]
${5GreatThingSection}       //div[@class="pb-grid pb-grid--5up"]
${IdeasForCLassroomTitle}       (//div[@class="pb-home__title pb-home__center"])[1]
${IdeasforCLassroomSection}        (//div[@class="pb-classroom-resource__bg"])[1]
${ResourcesTitle-Educator}        (//div[@class="pb-home__title pb-home__center"])[2]
${STEMresourceTitle-Educator}       (//p[@class="pb-structured-resources-item__title"])[1]
${RPresourceTitle-Educator}       (//p[@class="pb-structured-resources-item__title"])[2]
${FLPresourceTitle-Educator}       (//p[@class="pb-structured-resources-item__title"])[3]
${ListresourceTitle-Educator}       (//p[@class="pb-structured-resources-item__title"])[4]
${ExploreTopicsTitle}   (//div[@class="pb-home__title"])[2]
${ExploreTopicsCards}       //div[@class="pb-grid pb-grid--2up-6up"]
${ExploreBooksTitle}        (//div[@class="pb-home__title"])[3]
${Tips&Ideastitle}      //h3[@class="pb-home__center"]
${Tips&ideasVideos}     //div[@class="pb-ece-resources-section"]

*** Keywords ***
Verify trending this week title for Educator usergateway
    Scroll Element Into View    ${TrendingTitle}
    Sleep    2s
    Element Should Contain    ${TrendingTitle}    Trending Stories for Educators
    Scroll Element Into View    ${TrendingthisweekStory}
Verify the 5great thing section should be visible
    Scroll Element Into View    ${5GreatThingsTitle}
    Element Should Contain        ${5GreatThingsTitle}      5 great things about StoryWeaver in the classroom
    Scroll Element Into View    ${5GreatThingSection}
Verify all the Ideas for classroom section should be visible
    Scroll Element Into View    ${IdeasForCLassroomTitle}
    Element Should Contain    ${IdeasForCLassroomTitle}    Ideas for classroom
    Scroll Element Into View    ${IdeasforCLassroomSection}
Verify resource section from educator gateway should be visible
    Scroll Element Into View    ${ResourcesTitle-Educator}
    Element Should Contain    ${ResourcesTitle-Educator}    Classroom-ready reading programmes
    Scroll Element Into View    ${STEMresourceTitle-Educator}
    Element Should Contain    ${STEMresourceTitle-Educator}    STEM Literacy Programme
    Scroll Element Into View    ${RPresourceTitle-Educator}
    Element Should Contain    ${RPresourceTitle-Educator}    Reading Programme
    Scroll Element Into View    ${FLPresourceTitle-Educator}
    Element Should Contain    ${FLPresourceTitle-Educator}    Foundational Literacy Programme
    Scroll Element Into View    ${ListresourceTitle-Educator}
    Element Should Contain    ${ListresourceTitle-Educator}    Themed Book Lists
Verify explore Topics section should be visible
    Scroll Element Into View    ${ExploreTopicsTitle}
    Element Should Contain    ${ExploreTopicsTitle}    Explore Storybooks that cover Topics
    Scroll Element Into View    ${ExploreTopicsCards}
Verify explore books section should be visible for educator gateway
    Scroll Element Into View    ${ExploreBooksTitle}
    Element Should Contain    ${ExploreBooksTitle}    Explore different kinds of books to keep learning
    Scroll Element Into View    ${ReadalongResourceCard}
    Element Should Be Visible    ${ReadalongResourceCard}
    Element Should Be Visible    ${BilingualResourceCard}
    Element Should Be Visible    ${WordlessStoriesResourceCard}
Verify Tips and Ideas section should be visible
    Scroll Element Into View    ${Tips&Ideastitle}
    Element Should Contain    ${Tips&Ideastitle}    Tips and ideas for using StoryWeaver in the classroom
    Scroll Element Into View    ${Tips&ideasVideos}
