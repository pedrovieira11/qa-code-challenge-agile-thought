*** Settings ***
Documentation        Actions and elements on cart page

Library    Browser
Library    String

*** Keywords ***
Compare same prices
    
    Wait For Elements State            xpath=//h1[text()="Cart"]
    ${individual_price_element}        Get Text    xpath=//div[@class="item-price"]//span[@class="x-screen-reader"]
    ${item_price_element}              Get Text    xpath=//h2[text()="Order summary"]/..//span[@class="c-price"]//span[@itemprop="price"]
    ${total_price_element}             Get Text    xpath=//strong[text()="Total*"]/../..//strong//span[@itemprop="price"]

    Should Be Equal    ${item_price_element}    ${total_price_element}
    Should Be Equal    ${individual_price_element}    ${total_price_element}
    Should Be Equal    ${item_price_element}    ${individual_price_element}

Should update total price
    [Arguments]        ${quantity}    
    
    ${quatity_element}        Set Variable    xpath=//div[@class="itemQuantity--X4BIq29V"]//select
    ${unit_price_element}     Get Text    xpath=//div[@class="item-price"]//span[@class="x-screen-reader"]

    ${unit_price}            Remove String    ${unit_price_element}    $    .00    ,
    ${unit_price_convert}    Convert To Number    ${unit_price}

    Wait For Elements State    ${quatity_element}
    Select Options By    ${quatity_element}    text    ${quantity}
    Press Keys    ${quatity_element}    Enter
    
    Sleep    2
    ${total_price_element}    Get Text    xpath=//strong[text()="Total*"]/../..//strong//span[@itemprop="price"]

    ${total_price}             Remove String    ${total_price_element}    $    .00    , 
    ${total_price_convert}     Convert To Number    ${total_price}
    
    ${total_amount}    Evaluate    ${unit_price_convert}*${quantity}
    Should Be Equal    ${total_price_convert}    ${total_amount}