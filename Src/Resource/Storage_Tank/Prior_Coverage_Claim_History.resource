*** Settings ***
Resource  ../../Resource/Global-variable/v2.robot
Resource  Facility_Storage_Tank_Schedule_Info.robot
*** Variables ***
${ST_PCCH_PL_PP_Exp_Date}=          //input[@name='tableInputs[0].PolicyPeriodExpirationDate']
${ST_PCCH_PL_PP_Retro_Date}=        //input[@name='tableInputs[0].PolicyPeriodRetroactiveDate']
${ST_PCCH_PL_Insurace_carr}=        //input[@name='tableInputs[0].InsuranceCarrier']
${ST_PCCH_PL_Premium}=              //input[@name='tableInputs[0].PollutionLiabilityInsurancePremium']
${ST_PCCH_PL_Limit_Liability}=      //input[@name='tableInputs[0].PollutionLiabilityInsuranceLimitOfLiability']
${ST_PCCH_PL_Policy_Deductible}=    //input[@name='tableInputs[0].PollutionLiabilityInsurancePolicyDeductible']
${ST_PCCH_PL_Other_Deduct}=         //input[@name='tableInputs[0].pollLiabInsPolicyDeductibleOther']
${ST_PCCH_Loss_Claim_Date}=         //input[@name='tableInputs[0].ReportedDt']
${ST_PCCH_Loss_Claim_Desc}=         //input[@name='tableInputs[0].IncidentClaimTypeDesc']
${ST_PCCH_Loss_Claim_Total_Inc}=    //input[@name='tableInputs[0].TotalIncurredAmt']
${ST_PCCH_PPD_Spill}=               //textarea[@name='ReportableReleasesOrSpillsDetails']
${ST_PCCH_PPD_Procecuted}=          //textarea[@name='ProsecutedForContraventionDetails']
${ST_PCCH_PPD_Toxic}=               //textarea[@name='DescOfClaimTheirDispositionDetails']
${ST_PCCH_PPD_Environmental}=       //textarea[@name='ManagerOrSupervisorResponsibilityDetails']



*** Keywords ***
ST Prior Coverage and Claim History
    [Arguments]    &{test_data}
    Execute Javascript    window.scrollTo(0, 0)
#    Execute Javascript    document.body.style.zoom="50%"
    Wait Until Page Contains Element  //input[@name='pollutionLiabilityInsurance' and @value='${test_data['Do you currently have Pollution Liability Insurance']}']  10s
    Click Element    //input[@name='pollutionLiabilityInsurance' and @value='${test_data['Do you currently have Pollution Liability Insurance']}']
    Run Keyword If    "${test_data['Do you currently have Pollution Liability Insurance']}"=="YES"  Enter Pollution Liability Insurance Details  &{test_data}
    Click Element    //input[@name='applicantHadAnyLosses' and @value='${test_data['In the past 5 years, has applicant had any one claim in last 5 years']}']
    Run Keyword If  "${test_data['In the past 5 years, has applicant had any one claim in last 5 years']}"=="YES"   Enter Claim Details  &{test_data}
    Click Element    //input[@name='lossesOver250000' and @value='${test_data['In the past 5 years, has applicant had a sum of losses over $250,000?']}']
    Click Element    //input[@name='reportableReleasesOrSpills' and @value='${test_data['During the last five years, has the applicant had any reportable releases or spills of hazardous substances']}']
    Run Keyword If  "${test_data['During the last five years, has the applicant had any reportable releases or spills of hazardous substances']}"=="YES"
    ...  Input Text    ${ST_PCCH_PPD_Spill}    ${test_data['Please Provide Spill Details']}
    Click Element    //input[@name='prosecutedForContravention' and @value='${test_data['During the last five years, has the applicant been prosecuted']}']
    Run Keyword If  "${test_data['During the last five years, has the applicant been prosecuted']}"=="YES"
    ...  Input Text    ${ST_PCCH_PPD_Procecuted}    ${test_data['Please Provide Details Procecuted']}
    Click Element    //input[@name='descOfClaimTheirDisposition' and @value='${test_data['During the last five years, has the applicant had any claim(s) and their disposition of claims made against them for clean-up']}']
    Run Keyword If  "${test_data['During the last five years, has the applicant had any claim(s) and their disposition of claims made against them for clean-up']}"=="YES"
    ...  Input Text   ${ST_PCCH_PPD_Toxic}    ${test_data['Please Provide Details Toxic']}
    Click Element    //input[@name='managerOrSupervisorResponsibility' and @value='${test_data['Is the applicant’s manager or supervisor responsible for environmental affairs, control or compliance or any officer']}']
    Run Keyword If  "${test_data['Is the applicant’s manager or supervisor responsible for environmental affairs, control or compliance or any officer']}"=="YES"
    ...  Input Text   ${ST_PCCH_PPD_Environmental}   ${test_data['Please Provide Details Environmental']}
    Continue Click RE

Enter Claim Details
    [Arguments]    &{test_data}
    Wait Until Page Contains Element     ${ST_PCCH_Loss_Claim_Date}
#    Input Text     ${ST_PCCH_Loss_Claim_Date}   ${test_data['Date Of Claim']}
    Select Current Date ST  //input[@name='tableInputs[0].ReportedDt']/parent::div/child::div/button
    Input Text     ${ST_PCCH_Loss_Claim_Desc}   ${test_data['Description Of Claim']}
    Select Value From Dropdown  //input[@name='tableInputs[0].ClaimStatusCd']   ${test_data['Open or Closed']}
    Input Text  ${ST_PCCH_Loss_Claim_Total_Inc}   ${test_data['Total Incurred']}

Enter Pollution Liability Insurance Details
    [Arguments]    &{test_data}
    Wait Until Page Contains Element    ${ST_PCCH_PL_PP_Exp_Date}
#    Input Text     ${ST_PCCH_PL_PP_Exp_Date}   ${test_data['Policy Period Expiration']}
    Select Current Date ST  //input[@name='tableInputs[0].PolicyPeriodExpirationDate']/parent::div/child::div/button
    Select Current Date ST  //input[@name='tableInputs[0].PolicyPeriodRetroactiveDate']/parent::div/child::div/button
    Input Text     ${ST_PCCH_PL_Insurace_carr}   ${test_data['Insurance Carrier']}
    Input Text     ${ST_PCCH_PL_Premium}   ${test_data['Premium']}
    Select Value From Dropdown  ${ST_PCCH_PL_Limit_Liability}    ${test_data['Limit of Liability']}
    Select Value From Dropdown  ${ST_PCCH_PL_Policy_Deductible}   ${test_data['Policy Deductible']}
    Input Text  ${ST_PCCH_PL_Other_Deduct}   ${test_data['Policy Deductible Other']}