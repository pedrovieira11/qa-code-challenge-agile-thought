*** Settings ***
Documentation        Actions and elements header

Library        Browser
Library        JSONLibrary

*** Keywords ***
Header should have all menu item
    [Arguments]        ${header}

    ${element}        Set Variable        css=nav[id="uhf-g-nav"]

    FOR    ${item}    IN    @{header}[items]
        Wait For Elements State            ${element} >> text=${item}
        Get Text                           ${element} >> text=${item}       equal        ${item}
    END

Access menu item page
    [Arguments]        ${item}
    
    ${element}    Set Variable    css=nav[id="uhf-g-nav"] >> text=${item}

    Wait For Elements State            ${element}
    Click                              ${element}