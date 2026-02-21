*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot


*** Variables ***
${CE_CH_ClaimsYesNo}=       claimsYesNo
${CE_CH_AddButton}=         //button[text()='Add']
${CE_CH_DateOfClaim_0}=     //input[@name='tableInputs[0].ClaimHistory_Date']
${CE_CH_DescOfClaim_0}=     //input[@name='tableInputs[0].ClaimHistory_Description']
${CE_CH_Open_Closed_0}=     //div[@id='«r4p»']
${CE_CH_Total_Incurred_0}=  //input[@name='tableInputs[0].ClaimHistory_TotalIncurred']
${CE_CH_DateOfClaim_1}=     //input[@name='tableInputs[1].ClaimHistory_Date']
${CE_CH_DescOfClaim_1}=     //input[@name='tableInputs[1].ClaimHistory_Description']
${CE_CH_Open_Closed_1}=     //div[@id='«r5d»']
${CE_CH_Total_Incurred_1}=  //input[@name='tableInputs[1].ClaimHistory_TotalIncurred']


*** Keywords ***
CE Claims History
    [Arguments]    ${test_data}
    Wait Until Page Contains Element    //input[@name='ApplicantHadAnyLosses' and @value='${test_data['In the past 5 years any losses']}']  30s
    Click Element   //input[@name='ApplicantHadAnyLosses' and @value='${test_data['In the past 5 years any losses']}']
    Run Keyword If    '${test_data['In the past 5 years any losses']}'=='YES'   Claims    ${test_data}
    Continue Click RE

Claims
    [Arguments]    ${test_data}
    Run Keyword If    '${test_data['First Claim']}'=='Yes'    First Claim    ${test_data}
    Run Keyword If    '${test_data['Second Claim']}'=='Yes'    Second Claim    ${test_data}

First Claim
    [Arguments]    ${test_data}
    wait until element is visible    ${CE_CH_DateOfClaim_0}    5s
    Input Text    ${CE_CH_DateOfClaim_0}    ${test_data['Claim Date_0']}
    Input Text    ${CE_CH_DescOfClaim_0}    ${test_data['ClaimsDescription_0']}
    Click Element   ${CE_CH_Open_Closed_0}    ${test_data['Open or Closed_0']}
    Wait Until Element Is Visible   //li[text()='${test_data['Open or Closed_0']}']
    Click Element    //li[text()='${test_data['Open or Closed_0']}']
    Input Text    ${CE_CH_Total_Incurred_0}    ${test_data['Claims_Total incurred_0']}

Second Claim
    [Arguments]    ${test_data}
    wait until element is visible    ${CE_CH_DateOfClaim_1}    5s
    Input Text    ${CE_CH_DateOfClaim_1}    ${test_data['Claim Date_1']}
    Input Text    ${CE_CH_DescOfClaim_1}    ${test_data['ClaimsDescription_1']}
    Click Element   ${CE_CH_Open_Closed_1}    ${test_data['Open or Closed_1']}
    Wait Until Element Is Visible   //li[text()='${test_data['Open or Closed_1']}']
    Click Element    //li[text()='${test_data['Open or Closed_1']}']}
    Input Text    ${CE_CH_Total_Incurred_1}    ${test_data['Claims_Total incurred_1']}

Claimdate
    [Arguments]    ${test_data}
    Click Element    ${CE_CH_AddButton}
    wait until element is visible    ${CE_CH_DateOfClaim_0}    5s
    Input Text    ${CE_CH_DateOfClaim_0}    ${test_data['Claim Date_0']}
    Input Text    ${CE_CH_DescOfClaim_0}    ${test_data['ClaimsDescription_0']}
    Check and select from list by label    ${CE_CH_Open_Closed_0}    ${test_data['Open or Closed_0']}
    Input Text    ${CE_CH_Total_Incurred_0}    ${test_data['Claims_Total incurred_0']}
    Input Text    ${CE_CH_DateOfClaim_1}    ${test_data['Claim Date_1']}
    Input Text    ${CE_CH_DescOfClaim_1}    ${test_data['ClaimsDescription_1']}
    Check and select from list by label    ${CE_CH_Open_Closed_1}    ${test_data['Open or Closed_1']}
    Input Text    ${CE_CH_Total_Incurred_1}    ${test_data['Claims_Total incurred_1']}

Ommission act
    [Arguments]    &{test_data}
    wait until element is visible    ${ID-CH-Date-Circumstance_0}    60
    wait until element is enabled    ${ID-CH-Date-Circumstance_0}    60
    Input Text    ${ID-CH-Date-Circumstance_0}    ${test_data['Date of circumstance_0']}
    Input Text    ${ID-CH-Date-Description_0}    ${test_data['Ommission Description_0']}
    Input Text    ${ID-CH-Date-Circumstance_1}    ${test_data['Date of circumstance_1']}
    Input Text    ${ID-CH-Date-Description_1}    ${test_data['Ommission Description_1']}