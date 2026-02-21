*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot
Resource    ../Billing&ContactInformation.robot


*** Variables ***
${AE_BI_Billing_preferences}=   //input[@name='BillingPreferences']
${AE_BI_Payment_plan}=  (//input[@role='combobox'])[2]
${AE_BI_AcctContactName}=  //input[@name='AcctContactName']
${AE_BI_AcctContactemail}=  //input[@name='AcctContactemail']
${AE_BI_AcctContactPhone}=  //input[@name='AcctContactPhone']


*** Keywords ***
AE Billing and Contact Information
    [Arguments]   &{test_data}
    sleep  3s
    Wait Until Page Contains Element    ${AE_BI_Billing_preferences}  10s
    Wait Until Element Is Enabled    ${AE_BI_Billing_preferences}
#    Click Element    ${AE_BI_Billing_preferences}
#    click element  //li[normalize-space()="${test_data['Billing Preference']}"]
    Press Keys    NONE  TAB
    Select Value From Dropdown  ${AE_BI_Payment_plan}  ${test_data['Payment Plan']}
#    click element  ${AE_BI_Payment_plan}
#    Sleep    1s
#    click element  //li[normalize-space()="${test_data['Payment Plan']}"]
    click element  //input[@name='primarycontactYESNO' and @value='${test_data["Is your accounting contact the same as your primary contact?"]}']
    run keyword if  '${test_data['Is your accounting contact the same as your primary contact?']}' == 'NO'   AE Accounting Contact Information     &{test_data}
    Sleep    2s
    Continue Click RE

AE Accounting Contact Information
    [Arguments]  &{test_data}
    Check and enter input  ${AE_BI_AcctContactName}   ${test_data['Contact name']}
    Check and enter input  ${AE_BI_AcctContactemail}     ${test_data['Contact email']}
    Check and enter input  ${AE_BI_AcctContactPhone}    ${test_data['Contact phone']}
