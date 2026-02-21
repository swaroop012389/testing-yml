*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot


*** Variables ***
# dropdown
${BR_BI_BillingPreferences}=    //input[@name='BrokerBillType']


*** Keywords ***
Billing Information
    [Arguments]    ${test_data}
    #wait until element is visible    ${BR_BI_BillingPreferences}  20s
    click element      ${BR_BI_BillingPreferences}
    Input text   ${BR_BI_BillingPreferences}    ${test_data['Billing Preferences']}
    Press Keys   ${BR_BI_BillingPreferences}    ARROW_DOWN
    Press Keys   ${BR_BI_BillingPreferences}    RETURN
    log to console    NAVIGATED TO BILLING INFORMATION PAGE
    Click Continue Button
    sleep  2s
