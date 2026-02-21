*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot


*** Variables ***
${BR_AI_AddNew_Button}=    //button[text()='Add New']
${BR_AI_AdditionalInterestType}=    (//div[@class='MuiSelect-select MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input css-79944f'])[1]
${BR_AI_AddName}=    //input[@name='AdditionalInterest_Name']
${BR_AI_AddStAddress}=    //input[@name='AdditionalInterest_Addr1']
${BR_AI_AddCity}=    //input[@name='AdditionalInterest_City']
${BR_AI_AddState}=    (//div[@class='MuiSelect-select MuiSelect-outlined Mui-error MuiInputBase-input MuiOutlinedInput-input css-79944f'])[1]
${BR_AI_AddZipcode}=    //input[@name='AdditionalInterest_MailingZipCode']
${BR_AI_AddLoanNumber}=    //input[@name='AdditionalInterest_LoanNum']
${BR_AI_AddButton}=    //button[text()='Add']


*** Keywords ***
Additional Interests
    log to console    NAVIGATED TO ADDITIONAL INTERESTS PAGE
    Wait Until Page Contains    Additional Interests    30s
    sleep  2s
#    Click Continue Button
    Continue Click RE
    Sleep  13s

Adding New Additional Interests
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  50
    wait until element is visible    ${BR_AI_AddNew_Button}    20
    click element    ${BR_AI_AddNew_Button}
    wait until element is visible    ${BR_AI_AdditionalInterestType}
    click element   ${BR_AI_AdditionalInterestType}
    click element   //li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1pq8hud' and @data-value='${test_data['Select additional interest from the following options:']}']
    wait until element is visible    ${BR_AI_AddName}
    Input text    ${BR_AI_AddName}    ${test_data['AI-Name']}
    Input text    ${BR_AI_AddStAddress}    ${test_data['AI-Mailing street address']}
    Input text    ${BR_AI_AddCity}    ${test_data['AI-City']}
    click element   ${BR_AI_AddState}    ${test_data['AI-State']}
    click element   //li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1pq8hud' and @data-value='${test_data['AI-State']}']
    Input text    ${BR_AI_AddZipcode}    ${test_data['AI-Zip code']}
    Input text    ${BR_AI_AddLoanNumber}    ${test_data['Loan number']}
    wait until element is visible    ${BR_AI_AddButton}
    click element    ${BR_AI_AddButton}
    Additional Interests
