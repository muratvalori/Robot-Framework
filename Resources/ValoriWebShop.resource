*** Settings ***
Resource            ../Resources/PO/AccountPage.resource
Resource            ../Resources/PO/FooterNav.resource
Resource            ../Resources/PO/LandingPage.resource
Resource            ../Resources/PO/SignInPage.resource
Resource            ../Resources/PO/TopNav.resource
Resource            ../Resources/PO/CreateAccountPage.resource
Resource            ../Resources/PO/SingleProductPage.resource
Resource            ../Resources/PO/OrderModal.resource
Resource            ../Resources/PO/CartPage.resource
Resource            ../Resources/PO/AccountAddressPage.resource
Resource            ../Resources/PO/NewAddressPage.resource
Resource            ../Resources/PO/ClothesProductsPage.resource
Resource            ../Resources/PO/CheckoutPage.resource
Resource            ../Resources/PO/OrderSummaryPage.resource
Resource            ../Resources/PO/OrderHistoryPage.resource
Resource            ../Resources/PO/OrderDetailsPage.resource
Resource            ../Resources/PO/SearchResultsPage.resource
Resource            ../Resources/PO/ContactUsPage.resource
Resource            ../Resources/Keywords/GenerateAndUseMockData.resource


*** Keywords ***

Go to Valori Webshop landing page
    LandingPage.Load
    LandingPage.Verify page loaded

Sign in to Valori Webshop
    [Arguments]    ${email}    ${password}
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Enter Email             ${email}
    SignInPage.Enter password          ${password}
    SignInPage.Click sign in
    TopNav.Click logged in user link
    AccountPage.Verify Account page loaded

Sign in to Valori Webshop with invalid email
    [Arguments]    ${email}    ${password} 
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Enter invalid Email    ${email}
    SignInPage.Enter password         ${password}
    SignInPage.Click sign in
    SignInPage.Capture Page Screenshot after entering invalid email
    SignInPage.Compare screenshot after entering invalid email
    SignInPage.Verify if still on sign in page after entering invalid email and/or password

Sign in to Valori Webshop with invalid password
    [Arguments]    ${email}    ${password}
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Enter Email              ${email}
    SignInPage.Enter invalid password   ${password}
    SignInPage.Click sign in
    SignInPage.Verify authentication failed message displayed
    SignInPage.Verify if still on sign in page after entering invalid email and/or password

Sign in to Valori Webshop with invalid email and password
    [Arguments]    ${email}    ${password}
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Enter unknown Email       ${email}
    SignInPage.Enter invalid password    ${password}
    SignInPage.Click sign in
    SignInPage.Verify authentication failed message displayed
    SignInPage.Verify if still on sign in page after entering invalid email and/or password

Create a "Mr." account on Valori Webshop
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Click create an account link
    CreateAccountPage.Verify Create Account page loaded
    CreateAccountPage.Click radio button "Mr."
    GenerateAndUseMockData.Generate and Use Valid "Create Account" Mock Data
    CreateAccountPage.Enter date of birth
    CreateAccountPage.Click "Receive offers" checkbox
    CreateAccountPage.Click "Agree to terms" checkbox
    CreateAccountPage.Click "Sign up for newsletter" checkbox
    CreateAccountPage.Click "Save" new account button
    LandingPage.Verify page loaded
    TopNav.Click logged in user link
    AccountPage.Verify Account page loaded

Create a "Mr." account on Valori Webshop with invalid email
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Click create an account link
    CreateAccountPage.Verify Create Account page loaded
    CreateAccountPage.Click radio button "Mr."
    CreateAccountPage.Enter First Name
    CreateAccountPage.Enter Last Name
    CreateAccountPage.Enter Invalid Email
    CreateAccountPage.Enter Password
    CreateAccountPage.Enter date of birth
    CreateAccountPage.Click "Receive offers" checkbox
    CreateAccountPage.Click "Sign up for newsletter" checkbox
    CreateAccountPage.Click "Save" new account button
    CreateAccountPage.Capture screenshot after entering invalid email
    CreateAccountPage.Compare screenshot after entering invalid email
    CreateAccountPage.Verify if still on create account page after entering invalid email

Create a "Mr." account on Valori Webshop with invalid password
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Click create an account link
    CreateAccountPage.Verify Create Account page loaded
    CreateAccountPage.Click radio button "Mr."
    CreateAccountPage.Enter First Name
    CreateAccountPage.Enter Last Name
    CreateAccountPage.Enter valid Email
    CreateAccountPage.Enter Wrong Format Password
    CreateAccountPage.Enter date of birth
    CreateAccountPage.Click "Receive offers" checkbox
    CreateAccountPage.Click "Sign up for newsletter" checkbox
    CreateAccountPage.Click "Save" new account button
    CreateAccountPage.Capture screenshot after entering invalid password
    CreateAccountPage.Compare screenshot after entering invalid password
    CreateAccountPage.Verify if still on create account page after entering invalid password

Add 5 products to cart
    LandingPage.Click product "HummingBird Printed T-Shirt"
    SingleProductPage.Select "Size M" dropdown
    SingleProductPage.Click "Add to cart" button
    OrderModal.Verify Order Modal is displayed
    OrderModal.Click "Continue shopping" button
    SingleProductPage.Click "Home" link
    LandingPage.Click product "The Adventure Begins Framed Poster"
    SingleProductPage.Select "Dimensions" "40 x 60cm"
    SingleProductPage.Click "Add to cart" button
    OrderModal.Verify Order Modal Is Displayed
    OrderModal.Click "Continue shopping" button
    SingleProductPage.Click "Home" link
    LandingPage.Click product "HummingBird Printed Sweater"
    SingleProductPage.Select "Size L" dropdown
    SingleProductPage.Click "Add to cart" button
    OrderModal.Verify Order Modal Is Displayed
    OrderModal.Click "Continue shopping" button
    SingleProductPage.Click "Home" link
    LandingPage.Click product "The Best is Yet to Come Framed Poster"
    SingleProductPage.Select "Dimensions" "60 x 90cm"
    SingleProductPage.Click "Add to cart" button
    OrderModal.Verify Order Modal Is Displayed
    OrderModal.Click "Continue shopping" button
    SingleProductPage.Click "Home" link
    LandingPage.Click product "The Best is Yet to Come Mug"
    SingleProductPage.Click "Add to cart" button
    OrderModal.Verify Order Modal Is Displayed
    OrderModal.Click "Proceed to checkout" button
    CartPage.Verify Cart page loaded
    Cartpage.Verify products in cart
    CartPage.Remove items from cart

Add address to existing user
    FooterNav.Click on "YOUR ACCOUNT" Link
    AccountPage.Verify Account Page Loaded
    ${create_address_link_visible}=         Run Keyword And Return Status
    ...     Page Should Contain Element     ${ACCOUNT_PAGE_ADD_FIRST_ADDRESS_ELEMENT}
    Run Keyword If                          ${create_address_link_visible}
    ...     AccountPage.Click "Add First Address" Element
    ...     ELSE    AccountPage.Click "Addresses" element
    Run Keyword And Ignore Error    AccountAddressPage.Click "Create new address" Element
    NewAddressPage.Verify New Address Page Loaded
    NewAddressPage.Enter "Address"
    NewAddressPage.Enter "Zip/postal code"
    NewAddressPage.Enter "City"
    NewAddressPage.Select "Country" "Netherlands"
    NewAddressPage.Click "Save" button
    AccountAddressPage.Verify "Address succesfully added!" message is displayed
    AccountAddressPage.Verify address added to existing user
    AccountAddressPage.Delete address from existing user
    AccountAddressPage.Click "Home" Element
    TopNav.Click "Sign out" link

Place an order and go to own address
    FooterNav.Click on "YOUR ACCOUNT" Link
    AccountPage.Verify Account Page Loaded
    ${create_address_link_visible}=         Run Keyword And Return Status
    ...     Page Should Contain Element     ${ACCOUNT_PAGE_ADD_FIRST_ADDRESS_ELEMENT}
    Run Keyword If                          ${create_address_link_visible}
    ...     AccountPage.Click "Add First Address" Element
    ...     ELSE    AccountPage.Click "Addresses" element
    Run Keyword And Ignore Error    AccountAddressPage.Click "Create new address" Element
    NewAddressPage.Verify New Address Page Loaded
    NewAddressPage.Enter All Address Fields "France"
    NewAddressPage.Click "Save" button
    AccountAddressPage.Verify "Address succesfully added!" message is displayed
    TopNav.Click "Clothes" Dropdown
    ClothesProductsPage.Verify "Clothes" Products Page Loaded
    ClothesProductsPage.Click "Hummingbird Printed T-shirt" Picture
    SingleProductPage.Verify "Hummingbird Printed T-shirt" Product Page Loaded
    SingleProductPage.Select "Size M" Dropdown
    SingleProductPage.Click "Color" Black Radio Buttton
    SingleProductPage.Select "Quantity" "2" from Dropdown
    SingleProductPage.Click "Add to cart" button
    OrderModal.Verify Order Modal Is Displayed
    OrderModal.Click "Proceed to checkout" button
    CartPage.Verify Cart page loaded
    CartPage.Click "Proceed to checkout" button
    CheckoutPage.Verify Checkout page "Personal information" loaded
    CheckoutPage.Click "Addresses" "Continue" button
    CheckoutPage.Verify Checkout page "Shipping method" loaded
    CheckoutPage.Choose shipping method "My carrier"
    CheckoutPage.Click Shipping method "Continue" button
    CheckoutPage.Verify Checkout page "Payment method" loaded
    CheckoutPage.Choose payment method "Pay by check"
    CheckoutPage.Check "I agree with the terms of service and will adhere to them unconditionally." Checkbox
    CheckoutPage.Click payment method "Place order" button
    OrderSummaryPage.Verify Order Summary page loaded
    OrderSummaryPage.Verify Order Summary page "YOUR ORDER IS CONFIRMED" message is displayed

Send a message about the order and confirm that the message is sent
	FooterNav.Click on "YOUR ACCOUNT" Link
    AccountPage.Verify Account page loaded
    AccountPage.Click "Order History and Details" Element
    OrderHistoryPage.Verify "Order History" page loaded
    OrderHistoryPage.Click "Order DAGEDQZUV Details" Link
    OrderDetailsPage.Verify "Order Details" page loaded
    OrderDetailsPage.Select Product "Mountain fox cushion" from Dropdown
    OrderDetailsPage.Enter Message "What does the fox say?" in Textarea
    OrderDetailsPage.Click "Send" button
    OrderDetailsPage.Verify "Message succesfully sent" message displayed

Search for product and confirm that the product is found
    TopNav.Enter "Hummingbird t-shirt" in Search field
    TopNav.Click "Search" button
    SearchResultsPage.Verify "Search results" page loaded
    SearchResultsPage.Verify "Hummingbird t-shirt" product is found

File a complaint and confirm that the complaint is filed
    TopNav.Click "Contact us" link
    ContactUsPage.Verify "Contact us" page loaded
    ContactUsPage.Select "Customer service" from Dropdown
    ContactUsPage.Enter Email in Email Field
    ContactUsPage.Enter Complaint in Message Field
    ContactUsPage.Click "Send" button
    ContactUsPage.Verify "Your message has been successfully sent to our team." message displayed


Delete user account and confirm that the account is deleted
    FooterNav.Click on "YOUR ACCOUNT" Link
    AccountPage.Verify Account page loaded
    AccountPage.Click "Delete your account" Element
    AccountPage.Verify "Are you sure you want to delete your account?" message displayed
    AccountPage.Click "Delete my account" button
    AccountPage.Verify "Your account has been deleted." message displayed

# Behavior Driven Development (BDD) testing

I am on the webshop homepage
    LandingPage.Load

I login with valid credentials
    [Arguments]    ${email}    ${password}
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Enter Email           ${email}          
    SignInPage.Enter password        ${password}
    SignInPage.Click sign in

I should see my account page
    AccountPage.Verify Account page loaded

I search for "Hummingbird t-shirt"
	TopNav.Enter "Hummingbird t-shirt" in Search field
    TopNav.Click "Search" button

I should see search results for "Hummingbird t-shirt"
    SearchResultsPage.Verify "Search results" page loaded
	SearchResultsPage.Verify "Hummingbird t-shirt" product is found

I login with invalid password
	[Arguments]    ${email}    ${password}
    TopNav.Click sign in link
    SignInPage.Verify Sign In page loaded
    SignInPage.Enter Email              ${email}
    SignInPage.Enter invalid password   ${password}
    SignInPage.Click sign in

I should see an error message
    SignInPage.Verify authentication failed message displayed













