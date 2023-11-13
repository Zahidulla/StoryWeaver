*** Settings ***
Resource    LoginModalObjects.robot
Resource    StoryFinder.robot
Resource    SmileyRatingObjects.robot

*** Variables ***
${StoryFinderBanner}        (//img[@class="pb-img__img"])[3]
${StoryFinderModal} =    //div[@class="pb-modal__content"]
${LanguageDropdwon} =    //button[@id="language"]
${LevelDropdown} =    //button[@id="level"]
${ThemeDropdown} =    //button[@id="theme"]
${FindABookButton} =    //a[text()="Find a Book"]
${StoryFinderCarousel} =    //div[@class="pb-center-mode-carousal"]
${StoryFinderTitle} =    //h1[@class='pb-center-mode-carousal__title']
${ReaderModalTitle} =    //p[@class='cover_title english ']
${StoryTitleOnCarousel} =    //div[@class='pb-center-mode-carousal__card-title']
${CarouselReadButton} =    //a[.='Read Story']
*** Keywords ***
StoryFinder Banner should be visible for an unsigned user
    ${StoryFinderBannerLink}    Get Element Attribute    ${StoryFinderBanner}    src
    IF    "${StoryFinderBannerLink}" != "https://static.storyweaver.org.in/user_gateways/images/SW_Homepage_Banner.png"
         Fail
    END
StoryFinder Modal should appear when clicked on StoryFinder banner
    click element    ${StoryFinderBanner}
    element should be visible    css=.pb-modal__content-wrapper
Default values should appear in filters of StoryFinder modal
    element should contain  ${languagedropdwon}    English
    element should contain    ${LevelDropdown}    Level 1
    element should contain    ${themedropdown}      Family & Friends
    sleep    2s
    log    All the default values are as expected
Stories carousel should appear when clicked on Find A Book button with default values
    Click Element    ${FindABookButton}
    sleep    4s
    element should contain    ${StoryFinderTitle}    The StoryFinder has selected these books for you…
    log    StoryFinder carousel is opened
User should be able read a book from Storyfinder carousel
    scroll element into view    ${CarouselReadButton}
    click element    ${CarouselReadButton}
    sleep    4s
    Read full story
    sleep    2s
The Next read window should be of Storyfinder carousel itself
    click link    ${SmileyRatingNextLink}
    log    smiley rating window is visible
    sleep   2s
    element should contain    ${StoryFinderTitle}    The StoryFinder has selected these books for you…
    log    The next read suggestion window is of the StoryFinder itself

