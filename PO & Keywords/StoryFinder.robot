*** Settings ***
Resource    LoginModalObjects.robot
Resource    StoryFinder.robot
Resource    SmileyRatingObjects.robot
*** Variables ***
${StoryFinderBanner} =    .pb-hero-carousel__container .slick-current [alt='banner-0']
${StoryFinderModal} =    .pb-modal__content-wrapper
${LanguageDropdwon} =    language
${LevelDropdown} =    level
${ThemeDropdown} =    theme
${FindABookButton} =    Find a Book
${StoryFinderCarousel} =    .pb-center-mode-carousal
${StoryFinderTitle} =    //h1[@class='pb-center-mode-carousal__title']
${ReaderModalTitle} =    //p[@class='cover_title english ']
${StoryTitleOnCarousel} =    //div[@class='pb-center-mode-carousal__card-title']
${CarouselReadButton} =    //a[.='Read Story']
*** Keywords ***
StoryFinder Banner should be visible for an unsigned user
    wait until element is visible    css=${StoryFinderBanner}
    LOG    StoryFinder Banner is visible
StoryFinder Modal should appear when clicked on StoryFinder banner
    
    wait until element is visible    css=${StoryFinderBanner}
    click element    css=${StoryFinderBanner}
    element should be visible    css=.pb-modal__content-wrapper
    log    StoryFinder Search Modal is visble
Default values should appear in filters of StoryFinder modal
    element should contain  ${languagedropdwon}    English
    element should contain    ${LevelDropdown}    Level 1
    element should contain    ${themedropdown}      Family & Friends
    sleep    2s
    log    All the default values are as expected
Stories carousel should appear when clicked on Find A Book button with default values
    click link    ${FindABookButton}
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

