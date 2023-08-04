*** Settings ***
Documentation        Actions and elements on windows page

Library        Browser

*** Keywords ***
User should be on Windows page
    ${element}    Set Variable    id=uhfCatLogo
    
    Get Text    ${element}    equal    Windows

Open dropdown About Windows
    ${element}    Set Variable    id=c-shellmenu_56

    Click    ${element}