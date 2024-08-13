*** Settings ***
Resource     /home/richatyagi/PycharmProjects/pythonProject/PracticeAutomation/locators/HomePagelocator.robot
Library  SeleniumLibrary
Library    BuiltIn


*** Test Cases ***
1.Home page with three sliders only
    [Tags]    Home_page_01
     Open Browser    ${url}    ${Browser}
     Maximize Browser Window
     Click Element       ${Shopmenu}
     Click Element       ${home}
     ${slider_count}    Get Element Count    ${slider}
     Should be Equal As Numbers    ${slider_count}     3
     ${slider_images}    Get WebElements     ${slider}
     FOR    ${images}    IN    @{slider_images}
     Log to Console  ${images.get_attribute('src')}
     END
     Close All Browsers

2.Home page with three arrivals only
     [Tags]    Home_page_02
     Open Browser    ${url}    ${Browser}
     Maximize Browser Window
     Click Element       ${Shopmenu}
     Click Element       ${home}
     ${arrival_count}   Get Element Count   ${arrival}
     Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
     ${arrivals_names}    Get WebElements     ${arrival}
     FOR    ${element}    IN    @{arrivals_names}
     Log to Console  ${element.text}
     END
     Close All Browsers

3.Home page-Images in Arrivals should navigate
    [Tags]    Home_page_03
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image1}
    Click Button      ${addtobasket}
    Close All Browsers

4.Home page-Arrivals-Images-description
    [Tags]    Home_page_04
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image1}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Sleep    5s
    Click Element     ${description}
    Page Should Contain Element      ${description_text}
    Close All Browsers

5.Home page-Arrivals-Images-Reviews
    [Tags]    Home_page_05
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image1}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element     ${Reviews}
    Page Should Contain Element      ${Reviews_text}
    Close All Browsers

6.Home page-Arrivals-Add to Basket
    [Tags]    Home_page_06
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image1}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    Page Should Contain Element       ${bookinBasket}
    Page Should Contain Element       ${bookPrize}
    Close All Browsers

#7.Home page-Arrivals-Add to Basket with more books





8.Home page-Arrivals-Add to Basket items
    [Tags]    Home_page_08
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image1}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    Page Should Contain Element       ${bookinBasket}
    Page Should Contain Element       ${bookPrize}
    Sleep    5s
    Click Element           ${checkout}
    Close All Browsers


9.Home page-Arrivals-Add to Basket-items-Coupons
    [Tags]    Home_page_09
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image1}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    Page Should Contain Element       ${bookinBasket}
    Page Should Contain Element       ${bookPrize}
    Sleep   5s
    Click Element           ${checkout}
    Click Element           ${Coupon_link}
    Input Text           ${CouponInputbox}      krishnasakinala
    Click Element       ${ApplyCoupon}
    Close All Browsers

10.Home page-Arrivals-Add to Basket-items-Coupons value <450
    [Tags]    Home_page_010
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image2}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    Page Should Contain Element       ${bookinBasket}
    Page Should Contain Element       ${bookPrize}
    Sleep   5s
    Click Element           ${checkout}
    Click Element           ${Coupon_link}
    Input Text           ${CouponInputbox}      krishnasakinala
    Click Element       ${ApplyCoupon}
    Sleep       5s
    Page Should Contain Element       ${ErrorCoupon}
    Close All Browsers


11.Home page-Arrivals-Add to Basket-items-Remove book
    [Tags]    Home_page_11
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image1}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    Page Should Contain Element       ${bookinBasket}
    Page Should Contain Element       ${bookPrize}
    Sleep   5s
    Page Should Contain Element       ${checkout}
    Click Element          ${Remove_item}
    Close All Browsers


12.Home page-Arrivals-Add to Basket-items-Add book
    [Tags]    Home_page_12
    Open Browser    ${url}     ${Browser}
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image2}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    SeleniumLibrary.Page Should Contain Element      ${bookinBasket}
    SeleniumLibrary.Page Should Contain Element      ${bookPrize}
    Sleep   5s
    SeleniumLibrary.Page Should Contain Element      ${checkout}
    Click Element      ${EditQuantity}
    Input Text     ${EditQuantity}        3
    Click Element      ${UpdateBasket}
    Sleep  5s
    SeleniumLibrary.Page Should Contain Element        ${UpdateBasketMessage}
    Close All Browsers


13.Home page-Arrivals-Add to Basket-items-Checkout Book Final Prize
    [Tags]    Home_page_13
    Open Browser    ${url}     ${Browser}
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image2}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    SeleniumLibrary.Page Should Contain Element      ${bookinBasket}
    SeleniumLibrary.Page Should Contain Element      ${bookPrize}
    Sleep   5s
    Click Element      ${checkout}
    SeleniumLibrary.Page Should Contain Element        ${totalprize}
    ${total}    Get Text    ${totalprize}
    Log to Console   ${total}
    Close All Browsers


14.Home page-Arrivals-Add to Basket-items-Checkout Update Basket
    [Tags]    Home_page_14
    Open Browser    ${url}     ${Browser}
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image2}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    SeleniumLibrary.Page Should Contain Element      ${bookinBasket}
    SeleniumLibrary.Page Should Contain Element      ${bookPrize}
    Sleep   5s
    SeleniumLibrary.Page Should Contain Element      ${checkout}
    Click Element      ${EditQuantity}
    Input Text     ${EditQuantity}        3
    Click Element      ${UpdateBasket}
    Sleep  5s
    SeleniumLibrary.Page Should Contain Element        ${UpdateBasketMessage}
    Close All Browsers

15.Home page-Arrivals-Add to Basket-items-Checkout Total & Sub-total Condition
    [Tags]    Home_page_15
    Open Browser    ${url}     ${Browser}
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image2}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    SeleniumLibrary.Page Should Contain Element      ${bookinBasket}
    SeleniumLibrary.Page Should Contain Element      ${bookPrize}
    Sleep  5s
    Click Element      ${checkout}
    SeleniumLibrary.Page Should Contain Element        ${totalprize}
    ${total}    Get Text    ${totalprize}
    Log to Console   ${total}
    SeleniumLibrary.Page Should Contain Element        ${Subtotalprize}
    ${Subtotal}    Get Text    ${Subtotalprize}
    Log to Console   ${Subtotal}
    ${total}    Evaluate    "${total.split('₹')[1].strip()}"
    Log to Console   ${total}
    ${Subtotal}    Evaluate    "${Subtotal.split('₹')[1].strip()}"
    Log to Console   ${Subtotal}
    Run Keyword If    ${total} > ${Subtotal}
     ...   Log to Console    Total is greater than Subtotal
     ...   ELSE
     ...   Log to Console    Total is not greater than Subtotal
    Close All Browsers


16.Home page-Arrivals-Add to Basket-items-Check-out functionality
    [Tags]    Home_page_16
    Open Browser    ${url}     ${Browser}
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image2}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    SeleniumLibrary.Page Should Contain Element      ${bookinBasket}
    SeleniumLibrary.Page Should Contain Element      ${bookPrize}
    SeleniumLibrary.Page Should Contain Element        ${totalprize}
    ${total}    Get Text    ${totalprize}
    Log to Console   ${total}
    SeleniumLibrary.Page Should Contain Element        ${Subtotalprize}
    ${Subtotal}    Get Text    ${Subtotalprize}
    Log to Console   ${Subtotal}
    ${total}    Evaluate    "${total.split('₹')[1].strip()}"
    Log to Console   ${total}
    ${Subtotal}    Evaluate    "${Subtotal.split('₹')[1].strip()}"
    Log to Console   ${Subtotal}
    Run Keyword If    ${total} > ${Subtotal}
     ...   Log to Console    Total is greater than Subtotal
     ...   ELSE
     ...   Log to Console    Total is not greater than Subtotal
    Sleep    4s
    Wait Until Page Contains Element      ${checkout}
    Click Element      ${checkout}
    Sleep      3s
    SeleniumLibrary.Page Should Contain Element      ${paymentpage}
    Close All Browsers

17.Home page-Arrivals-Add to Basket-items-Check-out functionality-Payment Gateway
    [Tags]    Home_page_17
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image2}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    SeleniumLibrary.Page Should Contain Element      ${bookinBasket}
    SeleniumLibrary.Page Should Contain Element      ${bookPrize}
    SeleniumLibrary.Page Should Contain Element        ${totalprize}
    ${total}    Get Text    ${totalprize}
    Log to Console   ${total}
    SeleniumLibrary.Page Should Contain Element        ${Subtotalprize}
    ${Subtotal}    Get Text    ${Subtotalprize}
    Log to Console   ${Subtotal}
    ${total}    Evaluate    "${total.split('₹')[1].strip()}"
    Log to Console   ${total}
    ${Subtotal}    Evaluate    "${Subtotal.split('₹')[1].strip()}"
    Log to Console   ${Subtotal}
    Run Keyword If    ${total} > ${Subtotal}
     ...   Log to Console    Total is greater than Subtotal
     ...   ELSE
     ...   Log to Console    Total is not greater than Subtotal
    Sleep     5s
    Wait Until Page Contains Element      ${checkout}
    Click Element      ${checkout}
    Sleep      3s
    SeleniumLibrary.Page Should Contain Element      ${paymentDeatails}
    SeleniumLibrary.Page Should Contain Element      ${BillingDetails}
    SeleniumLibrary.Page Should Contain Element      ${OrderDetails}
    SeleniumLibrary.Page Should Contain Element      ${Additionaldetails}
    Input Text    ${firstname}     Richa
    Input Text    ${Lastname}      Tyagi
    Input Text    ${CompanyName}      Volansys
    Input Text    ${email}       tyagiricha@gmail.com
    Input Text    ${PhoneNumber}      8950485409
    Wait Until Page Contains Element     ${CountryDropdown}
    Click Element      ${CountryDropdown}
    Click Element     ${SelectCountry}
    Input Text       ${Address1}          village=Mnadavali
    Input Text       ${Address2}          post=Mandavali
    Input Text       ${postcode}           368329
    Input Text       ${city}           Najibabad
    SeleniumLibrary.Page Should Contain Element     ${Coupon_link}
    Close All Browsers



18.Home page-Arrivals-Add to Basket-items-Check-out functionality-Payment Gateway-Place Order.
    [Tags]    Home_page_18
    Open Browser    ${url}     ${Browser}
    Maximize Browser Window
    Click Element       ${Shopmenu}
    Click Element       ${home}
    ${arrival_count}   Get Element Count   ${arrival}
    Should Be Equal As Numbers  ${arrival_count}    3     Home page should have exactly 3 arrivals
    ${arrivals_names}    Get WebElements     ${arrival}
    FOR    ${element}    IN    @{arrivals_names}
    Log to Console  ${element.text}
    END
    Click Element     ${image2}
    Element should be visible     ${addtobasket}
    Click Button      ${addtobasket}
    Click Element      ${View_basket}
    SeleniumLibrary.Page Should Contain Element      ${bookinBasket}
    SeleniumLibrary.Page Should Contain Element      ${bookPrize}
    SeleniumLibrary.Page Should Contain Element        ${totalprize}
    ${total}    Get Text    ${totalprize}
    Log to Console   ${total}
    SeleniumLibrary.Page Should Contain Element        ${Subtotalprize}
    ${Subtotal}    Get Text    ${Subtotalprize}
    Log to Console   ${Subtotal}
    ${total}    Evaluate    "${total.split('₹')[1].strip()}"
    Log to Console   ${total}
    ${Subtotal}    Evaluate    "${Subtotal.split('₹')[1].strip()}"
    Log to Console   ${Subtotal}
    Run Keyword If    ${total} > ${Subtotal}
     ...   Log to Console    Total is greater than Subtotal
     ...   ELSE
     ...   Log to Console    Total is not greater than Subtotal
    Sleep     5s
    Wait Until Page Contains Element      ${checkout}
    Click Element      ${checkout}
    Sleep      3s
    SeleniumLibrary.Page Should Contain Element      ${paymentDeatails}
    SeleniumLibrary.Page Should Contain Element      ${BillingDetails}
    SeleniumLibrary.Page Should Contain Element      ${OrderDetails}
    SeleniumLibrary.Page Should Contain Element      ${Additionaldetails}
    Input Text    ${firstname}     Richa
    Input Text    ${Lastname}      Tyagi
    Input Text    ${CompanyName}      Volansys
    Input Text    ${email}       tyagiricha@gmail.com
    Input Text    ${PhoneNumber}      8950485409
    Wait Until Page Contains Element     ${CountryDropdown}
    Click Element      ${CountryDropdown}
    Click Element     ${SelectCountry}
    Input Text       ${Address1}          village=Mnadavali
    Input Text       ${Address2}          post=Mandavali
    Input Text       ${postcode}           368329
    Input Text       ${city}           Najibabad
    SeleniumLibrary.Page Should Contain Element     ${Coupon_link}
    Click Element       ${PlaceOrder}
    Sleep    5s
    SeleniumLibrary.Page Should Contain Element      ${ConfirmOrder}
    Close All Browsers
