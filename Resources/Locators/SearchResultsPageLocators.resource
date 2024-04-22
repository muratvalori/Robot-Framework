*** Variables ***
${SEARCH_RESULTS_PAGE_HEADER}                           xpath=//*[@id="js-product-list-header"]
${SEARCH_RESULTS_PAGE_HUMMINGBIRD_TSHIRT_PRODUCT}       xpath=//a[contains(text(),'Hummingbird printed t-shirt')]
${SEARCH_RESULTS_PAGE_HUMMINGBIRD_TSHIRT_PRICE}         xpath=//span[@class='price' and contains(text(), '28.92')]
${SEARCH_RESULTS_PAGE_HUMMINGBIRD_TSHIRT_IMAGE}         xpath=//img[@alt='Hummingbird printed t-shirt']