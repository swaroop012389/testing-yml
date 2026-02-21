*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../Resource/UMS.robot
Resource  ../Resource/Generic.robot
Resource  ../../Data Provider/DataProvider.robot


*** Variables ***
${ML_BI_Billing_preferences}=  //input[@name='BillingPreferences']
${ML_BI_Payment plan}=  (//input[@role='combobox'])[2]
${ML_BI_primary-contact}=  id=accntgnPrmryCntct_0
${ID-BCI-Billing-preferences-IA} =  id=billingPreferencesIA
#NFP
${ML_BI_ContactFirstName}=  //input[@name='ACCOUNTINGCONTACTFIRSTNAME']
${ML_BI_ContactLastname}=  //input[@name='ACCOUNTINGCONTACTLASTNAME']
${ML_BI_ContactEmail}=  //input[@name='ACCOUNTINGCONTACTEMAILADDRESS']
#Private
${MLP_BI_ContactFirstName}=   //input[@name='ContactFirstName']
${MLP_BI_ContactLastname}=  //input[@name='ContactLastName']
${MLP_BI_ContactEmail}=  //input[@name='ContactEmailAddress']

*** Keywords ***
RE Billing and Contact Information
    [Arguments]    &{test_data}
    Wait Until Page Contains    Billing Preferences      40s
    Select Value From Dropdown  ${ML_BI_Billing_preferences}   ${test_data['Billing Preference']}
#    Input text     ${ML_BI_Billing_preferences}   ${test_data['Billing Preference']}
#    Press Keys     ${ML_BI_Billing_preferences}   ARROW_DOWN
#    Press Keys     ${ML_BI_Billing_preferences}   RETURN
#    Press Keys     ${ML_BI_Billing_preferences}    TAB
#    wait until element is not visible   globalAjaxLoading  60
#    sleep  0.5s
    Select Value From Dropdown      ${ML_BI_Payment plan}   ${test_data['Payment Plan']}
#    Press Keys    ${ML_BI_Payment plan}   ARROW_DOWN
#    Press Keys    ${ML_BI_Payment plan}   RETURN
#    Press Keys    ${ML_BI_Payment plan}    TAB
    continue Click RE


DNO Billing
    [Arguments]   &{test_data}
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    sleep  2s
    Select Value from Dropdown    ${ML_BI_Billing_preferences}   ${test_data['Billing Preference']}
    wait until element is not visible   globalAjaxLoading  60
    Select Value from Dropdown    ${ML_BI_Payment plan}   ${test_data['Payment Plan']}
    run keyword if  '${test_data['Billing Preference']}' == 'Direct Bill'  Accounting Contact Information  &{test_data}
    Continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    sleep  3s

Accounting Contact Information
    [Arguments]  &{test_data}
    Sleep    2s
    IF  '${test_data['Program']}' == 'ML-PRIVATE'
        click element  //input[@name='primarycontactYESNO' and @value='${test_data["Is your client's accounting contact the same as the contact previously entered?"]}']
        IF  '${test_data["Is your client's accounting contact the same as the contact previously entered?"]}' == 'NO'
            Input text  ${MLP_BI_ContactFirstName}    ${test_data['Contact First Name']}
            Input text  ${MLP_BI_ContactLastname}    ${test_data['Contact Last Name']}
            Input text  ${MLP_BI_ContactEmail}  ${test_data['Contact Email Address']}
        END
    ELSE
        Input text  ${ML_BI_ContactFirstName}    ${test_data['Contact First Name']}
        Input text  ${ML_BI_ContactLastName}     ${test_data['Contact Last Name']}
        Input text  ${ML_BI_ContactEmail}    ${test_data['Contact Email Address']}
    END
