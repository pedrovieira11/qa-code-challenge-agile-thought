*** Settings ***
Documentation        Actions and elements search component

Library        Browser

*** Keywords ***
Do search
    [Arguments]        ${search}
    
    ${search_button}             Set Variable    id=search
    ${search_element}            Set Variable    id=cli_shellHeaderSearchInput

    Click                      ${search_button}
    Fill Text                  ${search_element}    ${search}
    Press Keys                 ${search_element}        Backspace

Select searched product by title
    [Arguments]        ${item}
    
    ${element}        Set Variable    h1[class="h2"]

    Click    css=a[aria-label*="${item}"]
    Wait For Elements State    ${element}
    Get Text    ${element}    contains    ${item}