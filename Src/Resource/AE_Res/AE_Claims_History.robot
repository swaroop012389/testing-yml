*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${AE_CH_Date_Of_Claim}=    //input[@name='tableInputs[0].ClaimHistory_Date']
${AE_CH_Claimant}=    //input[@name='tableInputs[0].ClaimHistory_Claimant']
${AE_CH_Description}=    //input[@name='tableInputs[0].ClaimHistory_Description']
${AE_CH_Select One}=  //input[@name='tableInputs[0].ClaimHistory_OpenClosed']
${AE_CH_Amount_Reserved}=    //input[@name='tableInputs[0].ClaimHistory_AmountReserved']
${AE_CH_Amount_Paid}=   //input[@name='tableInputs[0].ClaimHistory_AmountPaid']
${AE_CH_Date_Of_Claim1}=    //input[@name='tableInputs[1].ClaimHistory_Date']
${AE_CH_Claimant1}=    //input[@name='tableInputs[1].ClaimHistory_Claimant']
${AE_CH_Description_01}=    //input[@name='tableInputs[0].Circumstance_Description']
${AE_CH_Date_01}=    //input[@name='tableInputs[0].Circumstance_Date']
${AE_CH_Invest_Add1}=  //button[text()='Add']
${AE_CH_Invest_Add2}=  (//button[text()='Add'])[2]
${AE_CH_Description_02}=    //input[@name='tableInputs[1].Circumstance_Description']
${AE_CH_Date_02}=    //input[@name='tableInputs[1].Circumstance_Date']


*** Keywords ***
AE Claims History
    [Arguments]    &{test_data}
    Sleep    2s
    Wait Until Page Contains Element    //input[@name='ClaimsYN' and @value='${test_data['In the past 5 years (or 10 years if applicant has billings over $10M annually)']}']
    Execute Javascript    window.scrollTo(0, 0)
    click element  //input[@name='ClaimsYN' and @value='${test_data['In the past 5 years (or 10 years if applicant has billings over $10M annually)']}']
    run keyword if    '${test_data['In the past 5 years (or 10 years if applicant has billings over $10M annually)']}' == 'YES'    Claimdate    &{test_data}
    click element   //input[@name='ClaimKnowledgeYN' and @value='${test_data['After complete investigation and inquiry']}']
    run keyword if    '${test_data['After complete investigation and inquiry']}' == 'YES'    Investigation and Inquiry    &{test_data}
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  40
    wait until element is not visible  ${ID_Pleasewait}   40

Claimdate
    [Arguments]    &{test_data}
    sleep  1s
    Wait Until Element Is Visible   ${AE_CH_Date_Of_Claim}  5s
    Wait Until Element Is Not Visible    globalajaxLaoding  100
    Wait Until Element Is Enabled   ${AE_CH_Date_Of_Claim}
    Press Keys  ${AE_CH_Date_Of_Claim}    ${test_data['Date Of Claim']}
    Input text    ${AE_CH_Claimant}    ${test_data['Claimant']}
    Input text    ${AE_CH_Description}    ${test_data['Claims Description']}
#    click element   ${AE_CH_Select One}
#    Sleep    1s
#    click element   //li/span[text()='${test_data['Open or Closed']}']
    Select Value From Dropdown    ${AE_CH_Select One}  ${test_data['Open or Closed']}
    Input text    ${AE_CH_Amount_Reserved}    ${test_data['Amount Reserved']}
    Input text    ${AE_CH_Amount_Paid}    ${test_data['Amount Paid']}

Investigation and Inquiry
    [Arguments]    &{test_data}
    Wait Until Element Is Not Visible    globalajaxLaoding  100
    Wait Until Element Is Enabled   ${AE_CH_Date_01}
    Wait Until Element Is Visible   ${AE_CH_Date_01}
    sleep  5s
    Press Keys   ${AE_CH_Date_01}    ${test_data['Date01']}
    Input text    ${AE_CH_Description_01}    ${test_data['Description_01']}
    Wait Until Element Is Not Visible    globalajaxLaoding  100
    run keyword if    '${test_data['In the past 5 years (or 10 years if applicant has billings over $10M annually)']}' == 'YES'  Click element  ${AE_CH_Invest_Add2}  ELSE  Click element  ${AE_CH_Invest_Add1}
    Sleep  2s
    Wait Until Element Is Enabled   ${AE_CH_Date_02}
    Wait Until Element Is Visible   ${AE_CH_Date_02}
    sleep  10s
    Press Keys    ${AE_CH_Date_02}    ${test_data['Date02']}
    Input text    ${AE_CH_Description_02}    ${test_data['Description_02']}
