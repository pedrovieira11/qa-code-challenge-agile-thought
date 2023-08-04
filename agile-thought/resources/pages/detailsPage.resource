*** Settings ***
Documentation        Actions and elements product details page

Library        Browser
Library        String

Resource       components/Modal.resource

*** Keywords ***
Compare different prices
    
    ${price_element}    Set Variable    css=p[data-automation-test-id=buy-box-pricing]   

    ${first_price}        Get Text        ${price_element}
    
    Close modal
    
    ${second_product}    Set Variable   xpath=//label[@for=0003]
    Click                ${second_product}

    ${second_price}    Get Text       ${price_element}
    
    Should Not Be Equal    ${first_price}    ${second_price}

Add product to Cart
    ${element}        Set Variable    id=buybox-cta-proper

    Wait For Elements State    ${element}
    Click                      ${element}