*** Settings ***
Documentation        Actions and elements on modal

Library        Browser

*** Keywords ***
Set country US on modal
    ${element}        Set Variable    xpath=//button[text()="Stay in United States - English"]

    Wait For Elements State    ${element}
    Click    ${element}

Close modal
    ${element}        Set Variable    css=button[class="close"]

    Wait For Elements State    ${element}
    Click                      ${element}    