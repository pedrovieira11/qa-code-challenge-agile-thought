*** Settings ***    
Documentation        tests scenario for QA code challenge Agile Thought     

Resource    ../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Validate all menu items are present

    ${data}        Get fixture        menu        header

    Header should have all menu item         ${data}
    
Validate open dropdown on About Windows Menu

    Access menu item page        Windows
    User should be on Windows page
    Open dropdown About Windows

Validate feature search on Windows Page

    Access menu item page            Windows
    Do search                        Visual Studio1
    
    Select searched product by title    Visual Studio Enterprise Subscription

Validate different prices on details page

    Access menu item page            Windows
    Do search                        Visual Studio1
    
    Select searched product by title    Visual Studio Enterprise Subscription
    Set country US on modal
    Compare different prices

Validate same prices amounts on cart

    
    Access menu item page    Windows
    Do search    Visual Studio1

    Select searched product by title    Visual Studio Enterprise Subscription
    Set country US on modal
    Add product to Cart
    Compare same prices

Validate total price alternate quantity

    Access menu item page    Windows
    Do search    Visual Studio1

    Select searched product by title    Visual Studio Enterprise Subscription
    Set country US on modal
    Add product to Cart
    Should update total price        20