*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot


*** Variables ***
${Link_QO_UMS}=    //a[contains(@href,'/Rating')]
${Name_PrimaryContact}=    accntgnPrmryCntct
${ID_BillingPreferences}=  //input[@name='BillingPreferences']


*** Keywords ***
CE Billing and Contact Information
    [Arguments]    ${test_data}
    log to console    NAVIGATED TO BILLING INFORMATION PAGE
    Execute Javascript    window.scrollTo(0, 0)
    wait until element is visible  ${ID_BillingPreferences}  5s
    Select Value From Dropdown  ${ID_BillingPreferences}  ${test_data['Billing Preference']}
    #wait until element is visible    ${Name_PrimaryContact}
    #select radio button    ${Name_PrimaryContact}    ${test_data['Is your accounting contact the same as your primary contact?']}
    Continue Click RE
