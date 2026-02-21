*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${AE_OC_Sale1_select1}=  //input[@name='SALE1Limit']
${AE_OC_Sale2_select2}=  //input[@name='SALE2Limit']
${AE_OC_Sale3_select3}=  //input[@name='SALE3Limit']
${AE_OC_specific_client_Sale1_select1}=  //input[@name='SALE1ClientProject']
${AE_OC_specific_client_Sale2_select2}=  //input[@name='SALE2ClientProject']
${AE_OC_specific_client_Sale3_select3}=  //input[@name='SALE3ClientProject']
${AE_OC_Client/project_name_Sale1}=    //input[@name='SALE1ClientProjectName']
${AE_OC_Client/project_name_Sale2}=    //input[@name='SALE2ClientProjectName']
${AE_OC_Client/project_name_Sale3}=    //input[@name='SALE3ClientProjectName']
${AE_OC_Location_Sale1}=    //input[@name='SALE1Location']
${AE_OC_Location_Sale2}=    //input[@name='SALE2Location']
${AE_OC_Location_Sale3}=    //input[@name='SALE3Location']
${AE_OC_Job/contract_Sale1}=    //input[@name='SALE1JobContractNo']
${AE_OC_Job/contract_Sale2}=    //input[@name='SALE2JobContractNo']
${AE_OC_Job/contract_Sale3}=    //input[@name='SALE3JobContractNo']
${AE_OC_Start_date_Sale1}=    //input[@name='SALE1StartDate']
${AE_OC_Start_date_Sale2}=    //input[@name='SALE2StartDate']
${AE_OC_Start_date_Sale3}=    //input[@name='SALE3StartDate']
${AE_OC_Completion_date_Sale1}=    //input[@name='SALE1CompletionDate']
${AE_OC_Completion_date_Sale2}=    //input[@name='SALE2CompletionDate']
${AE_OC_Completion_date_Sale3}=    //input[@name='SALE3CompletionDate']
${AE_OC_Past_year's_billings_Sale1}=    //input[@name='SALE1PastYearsBillings']
${AE_OC_Past_year's_billings_Sale2}=    //input[@name='SALE2PastYearsBillings']
${AE_OC_Past_year's_billings_Sale3}=    //input[@name='SALE3PastYearsBillings']
${AE_OC_Current_year_billings_Sale1}=    //input[@name='SALE1CurrentYearBillings']
${AE_OC_Current_year_billings_Sale2}=    //input[@name='SALE2CurrentYearBillings']
${AE_OC_Current_year_billings_Sale3}=    //input[@name='SALE3CurrentYearBillings']
${AE_OC_Next_year_billings_Sale1}=    //input[@name='SALE1NextYearBillings']
${AE_OC_Next_year_billings_Sale2}=    //input[@name='SALE2NextYearBillings']
${AE_OC_Next_year_billings_Sale3}=    //input[@name='SALE3NextYearBillings']
${AE_OC_Subsequent_year(s)_billings1_Sale1}=    //input[@name='SALE1SubsequentYear1Billings']
${AE_OC_Subsequent_year(s)_billings1_Sale2}=    //input[@name='SALE2SubsequentYear1Billings']
${AE_OC_Subsequent_year(s)_billings1_Sale3}=    //input[@name='SALE3SubsequentYear1Billings']
${AE_OC_Subsequent_year(s)_billings2_Sale1}=    //input[@name='SALE1SubsequentYear2Billings']
${AE_OC_Subsequent_year(s)_billings2_Sale2}=    //input[@name='SALE2SubsequentYear2Billings']
${AE_OC_Subsequent_year(s)_billings2_Sale3}=    //input[@name='SALE3SubsequentYear2Billings']
${AE_OC_Subsequent_year(s)_billings3_Sale1}=    //input[@name='SALE1SubsequentYear3Billings']
${AE_OC_Subsequent_year(s)_billings3_Sale2}=    //input[@name='SALE2SubsequentYear3Billings']
${AE_OC_Subsequent_year(s)_billings3_Sale3}=    //input[@name='SALE3SubsequentYear3Billings']

*** Keywords ***
AE Optional Coverages
    [Arguments]    &{test_data}
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Page Contains Element  //input[@name='DOLPercent' and @value='${test_data['Per claim policy limit']}']  10s
    click element  //input[@name='DOLPercent' and @value='${test_data['Per claim policy limit']}']
    run keyword if    '${test_data['SALE1']}' == 'YES'    SALE-1    &{test_data}
    run keyword if    '${test_data['SALE2']}' == 'YES'    SALE-2    &{test_data}
    run keyword if    '${test_data['SALE3']}' == 'YES'    SALE-3    &{test_data}
    continue Click RE
    sleep  10s


AE Optional Coverages(No_policylimit_radio_button)
    [Arguments]    &{test_data}
    #${Policy_Limit}=    run keyword and return status    element should be visible    ${Per_claim_policy_limit}
    #run keyword if    ${Policy_Limit}    select radio button    ${Per_claim_policy_limit}    ${test_data['Per claim policy limit']}
    #select radio button    ${Per_claim_policy_limit}    ${test_data['Per claim policy limit']}
    run keyword if    '${test_data['SALE1']}' == 'YES'    SALE-1    &{test_data}
    run keyword if    '${test_data['SALE2']}' == 'YES'    SALE-2    &{test_data}
    run keyword if    '${test_data['SALE3']}' == 'YES'    SALE-3    &{test_data}
    continue Click RE
#    wait until element is not visible  ${ID_wait-One-moment-please}  30
    #wait until element is not visible  ${ID_Pleasewait}   30
   # sleep  5s


SALE-1
    [Arguments]    &{test_data}
    Select Value From Dropdown    ${AE_OC_Sale1_select1}  ${test_data['Sale limit SALE 1']}
#    Select Value From Dropdown    ${AE_OC_specific_client_Sale1_select1}  ${test_data['SALE for a specific client/project?Sale1']}
    Select Value From Dropdown    ${AE_OC_specific_client_Sale1_select1}  Project
#    Click Element    ${AE_OC_Sale1_select1}
#    Wait Until Element Is Enabled     //li/span[text()='${test_data['Sale limit SALE 1']}']  10s
#    click element    //li/span[text()='${test_data['Sale limit SALE 1']}']
#    Click Element    ${AE_OC_specific_client_Sale1_select1}
#    Wait Until Element Is Enabled    (//li[@data-value='${test_data['SALE for a specific client/project?Sale1']}'])[1]   10s
#    click element   (//li[@data-value='${test_data['SALE for a specific client/project?Sale1']}'])[1]
    input text    ${AE_OC_Client/project_name_Sale1}    ${test_data['Client/project name(Sale1)']}
    input text    ${AE_OC_Location_Sale1}    ${test_data['Location-Sale1']}
    input text    ${AE_OC_Job/contract_Sale1}   ${test_data['Job/contract-Sale1']}
    Wait Until Element Is Enabled    ${AE_OC_Start_date_Sale1}
    sleep  1s
    Press Keys    ${AE_OC_Start_date_Sale1}   ${test_data['Start date-Sale1']}
    Press Keys    NONE  TAB
    Wait Until Element Is Enabled    ${AE_OC_Completion_date_Sale1}
    sleep  1s
    Press Keys    ${AE_OC_Completion_date_Sale1}   ${test_data['Completion date-Sale1']}
    Press Keys    NONE  TAB
    Wait Until Element Is Enabled         ${AE_OC_Past_year's_billings_Sale1}
    input text    ${AE_OC_Past_year's_billings_Sale1}   ${test_data['Past years billings-Sale1']}
    Wait Until Element Is Enabled    ${AE_OC_Current_year_billings_Sale1}
    input text    ${AE_OC_Current_year_billings_Sale1}   ${test_data['Current year billings-Sale1']}
    Wait Until Element Is Enabled       ${AE_OC_Next_year_billings_Sale1}
    input text    ${AE_OC_Next_year_billings_Sale1}   ${test_data['Next year billings-Sale1']}
    Wait Until Element Is Enabled     ${AE_OC_Subsequent_year(s)_billings1_Sale1}
    input text    ${AE_OC_Subsequent_year(s)_billings1_Sale1}   ${test_data['Subsequent year(s) billings1-Sale1']}
    Wait Until Element Is Enabled    ${AE_OC_Subsequent_year(s)_billings2_Sale1}
    input text    ${AE_OC_Subsequent_year(s)_billings2_Sale1}   ${test_data['Subsequent year(s) billings2-Sale1']}
    Wait Until Element Is Enabled     ${AE_OC_Subsequent_year(s)_billings3_Sale1}
    input text    ${AE_OC_Subsequent_year(s)_billings3_Sale1}   ${test_data['Subsequent year(s) billings3-Sale1']}

SALE-2
    [Arguments]    &{test_data}
    Scroll Element Into View     ${AE_OC_Location_Sale2}
    Select Value From Dropdown   ${AE_OC_Sale2_select2}   ${test_data['Sale limit SALE 2']}
#    Select Value From Dropdown   ${AE_OC_specific_client_Sale2_select2}  ${test_data['SALE for a specific client/project?Sale2']}
    Select Value From Dropdown   ${AE_OC_specific_client_Sale2_select2}  Project
#    Click Element    ${AE_OC_Sale1_select1}
#    Wait Until Element Is Enabled     //li/span[text()='${test_data['Sale limit SALE 2']}']  10s
#    click element    //li/span[text()='${test_data['Sale limit SALE 2']}']
#    Click Element    ${AE_OC_specific_client_Sale2_select2}
#    Wait Until Element Is Enabled   //li[@data-value='${test_data['SALE for a specific client/project?Sale2']}']   10s
#    click element  //li[@data-value='${test_data['SALE for a specific client/project?Sale2']}']
    input text    ${AE_OC_Client/project_name_Sale2}    ${test_data['Client/project name(Sale2)']}
    input text    ${AE_OC_Location_Sale2}    ${test_data['Location-Sale2']}
    input text    ${AE_OC_Job/contract_Sale2}   ${test_data['Job/contract-Sale2']}
    sleep  1s
    Wait Until Element Is Enabled    ${AE_OC_Start_date_Sale2}   10s
    Press Keys   ${AE_OC_Start_date_Sale2}   ${test_data['Start date-Sale2']}
    Press Keys    NONE  TAB
    sleep  1s
    Wait Until Element Is Enabled    ${AE_OC_Completion_date_Sale2}   10s
    Press Keys       ${AE_OC_Completion_date_Sale2}   ${test_data['Completion date-Sale2']}
    Press Keys    NONE  TAB
    Wait Until Element Is Enabled     ${AE_OC_Past_year's_billings_Sale2}  10s
    input text    ${AE_OC_Past_year's_billings_Sale2}   ${test_data['Past years billings-Sale2']}
    Wait Until Element Is Enabled    ${AE_OC_Current_year_billings_Sale2}   10s
    input text    ${AE_OC_Current_year_billings_Sale2}   ${test_data['Current year billings-Sale2']}
    Wait Until Element Is Enabled      ${AE_OC_Next_year_billings_Sale2}      10s
    input text    ${AE_OC_Next_year_billings_Sale2}   ${test_data['Next year billings-Sale2']}
    Wait Until Element Is Enabled      ${AE_OC_Subsequent_year(s)_billings1_Sale2}     10s
    input text    ${AE_OC_Subsequent_year(s)_billings1_Sale2}   ${test_data['Subsequent year(s) billings1-Sale2']}
    Wait Until Element Is Enabled   ${AE_OC_Subsequent_year(s)_billings2_Sale2}       10s
    input text    ${AE_OC_Subsequent_year(s)_billings2_Sale2}   ${test_data['Subsequent year(s) billings2-Sale2']}
    Wait Until Element Is Enabled     ${AE_OC_Subsequent_year(s)_billings3_Sale2}       10s
    input text    ${AE_OC_Subsequent_year(s)_billings3_Sale2}   ${test_data['Subsequent year(s) billings3-Sale2']}

SALE-3
    [Arguments]    &{test_data}
    Scroll Element Into View    ${AE_OC_Location_Sale3}
    Select Value From Dropdown   ${AE_OC_Sale3_select3}  ${test_data['Sale limit SALE 3']}
#    Select Value From Dropdown   ${AE_OC_specific_client_Sale3_select3} ${test_data['SALE for a specific client/project?Sale3']}
    Select Value From Dropdown   ${AE_OC_specific_client_Sale3_select3}  Project
#    Click Element    ${AE_OC_Sale3_select3}
#    Wait Until Element Is Enabled     //li/span[text()='${test_data['Sale limit SALE 3']}']  10s
#    click element    //li/span[text()='${test_data['Sale limit SALE 3']}']
#    Click Element    ${AE_OC_specific_client_Sale3_select3}
#    Wait Until Element Is Enabled   //li[@data-value='${test_data['SALE for a specific client/project?Sale3']}']   10s
#    click element  //li[@data-value='${test_data['SALE for a specific client/project?Sale3']}']
    input text   ${AE_OC_Client/project_name_Sale3}    ${test_data['Client/project name(Sale3)']}
    input text   ${AE_OC_Location_Sale3}    ${test_data['Location-Sale3']}
    Input Text  ${AE_OC_Job/contract_Sale3}   ${test_data['Job/contract-Sale3']}
    sleep  1s
    Wait Until Element Is Enabled    ${AE_OC_Start_date_Sale3}   10s
    Press Keys       ${AE_OC_Start_date_Sale3}   ${test_data['Start date-Sale3']}
    Press Keys    NONE  TAB
    Wait Until Element Is Enabled    ${AE_OC_Completion_date_Sale3}   10s
    sleep  1s
    Press Keys       ${AE_OC_Completion_date_Sale3}   ${test_data['Completion date-Sale3']}
    Press Keys    NONE  TAB
    Wait Until Element Is Enabled    ${AE_OC_Past_year's_billings_Sale3}  10s
    input text    ${AE_OC_Past_year's_billings_Sale3}   ${test_data['Past years billings-Sale3']}
    Wait Until Element Is Enabled    ${AE_OC_Current_year_billings_Sale3}  10s
    input text    ${AE_OC_Current_year_billings_Sale3}   ${test_data['Current year billings-Sale3']}
    Wait Until Element Is Enabled    ${AE_OC_Next_year_billings_Sale3}   10s
    input text    ${AE_OC_Next_year_billings_Sale3}   ${test_data['Next year billings-Sale3']}
    Wait Until Element Is Enabled     ${AE_OC_Subsequent_year(s)_billings1_Sale3}  10s
    input text    ${AE_OC_Subsequent_year(s)_billings1_Sale3}   ${test_data['Subsequent year(s) billings1-Sale3']}
    Wait Until Element Is Enabled    ${AE_OC_Subsequent_year(s)_billings2_Sale3}  10s
    input text    ${AE_OC_Subsequent_year(s)_billings2_Sale3}   ${test_data['Subsequent year(s) billings2-Sale3']}
    Wait Until Element Is Enabled    ${AE_OC_Subsequent_year(s)_billings3_Sale3}  10s
    input text    ${AE_OC_Subsequent_year(s)_billings3_Sale3}   ${test_data['Subsequent year(s) billings3-Sale3']}
