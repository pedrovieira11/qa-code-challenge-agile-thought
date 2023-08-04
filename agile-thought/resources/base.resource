*** Settings ***

Library            Browser
Library            JSONLibrary

Resource           env.resource

Resource           pages/components/Header.resource
Resource           pages/components/Search.resource
Resource           pages/components/Modal.resource

Resource           pages/windowsPage.resource
Resource           pages/detailsPage.resource
Resource           pages/cartPage.resource

*** Keywords ***
Start Session
    New Browser             browser=chromium    headless=False
    New Page                ${BASE_URL}
    Set Viewport Size       1920    1080

Get fixture
    [Arguments]        ${file_name}    ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8
    
    [Return]    ${data}[${scenario}]