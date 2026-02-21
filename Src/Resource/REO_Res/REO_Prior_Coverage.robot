*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${ID-IP-EffectiveDate} =  id=effectiveDateIssuance
${ID-IP-Premium} =  id=quoteOptionTotalPremium
${ID-IP-Premium1} =  //input[contains(@id, 'quoteOptionTotalPremium')]
${RE_PC_RetroactiveDate}=    //input[@name='PriorCoverage_02']
${RE_PC_policyPeriodEffectiveDate1}=    //input[@name='tableInputs[0].PriorCoverages_PolicyPeriodEffectiveDate']
${RE_PC_insuranceCarrier1}=    //input[@name='tableInputs[0].PriorCoverages_InsuranceCarrier']
${RE_PC_limitOfLiability1}=    //input[@name='tableInputs[0].PriorCoverages_LimitOfLiability']
${RE_PC_deductible1}=    //input[@name='tableInputs[0].PriorCoverages_Deductible']
${RE_PC_annualPremium1}=    //input[@name='tableInputs[0].PriorCoverages_AnnualPremium']
${Add-Button}=    //button[text()='Add']
${RE_PC_policyPeriodEffectiveDate2}=    //input[@name='tableInputs[1].PriorCoverages_PolicyPeriodEffectiveDate']
${RE_PC_insuranceCarrier2}=    //input[@name='tableInputs[1].PriorCoverages_InsuranceCarrier']
${RE_PC_limitOfLiability2}=    //input[@name='tableInputs[1].PriorCoverages_LimitOfLiability']
${RE_PC_deductible2}=    //input[@name='tableInputs[1].PriorCoverages_Deductible']
${RE_PC_annualPremium2}=    //input[@name='tableInputs[1].PriorCoverages_AnnualPremium']
${RE_PC_policyPeriodEffectiveDate3}=    //input[@name='tableInputs[2].PriorCoverages_PolicyPeriodEffectiveDate']
${RE_PC_insuranceCarrier3}=             //input[@name='tableInputs[2].PriorCoverages_InsuranceCarrier']
${RE_PC_limitOfLiability3}=             //input[@name='tableInputs[2].PriorCoverages_LimitOfLiability']
${RE_PC_deductible3}=                   //input[@name='tableInputs[2].PriorCoverages_Deductible']
${RE_PC_annualPremium3}=                //input[@name='tableInputs[2].PriorCoverages_AnnualPremium']

*** Keywords ***
RE Prior Coverage
    [Arguments]    &{test_data}
    Wait Until Page Contains Element     //input[@name='REOInsurance' and @value='${test_data['Applicant Have Real Estate Error & Omission insurance']}']  10s
    click element  //input[@name='REOInsurance' and @value='${test_data['Applicant Have Real Estate Error & Omission insurance']}'] 
    run keyword if    '${test_data['Applicant Have Real Estate Error & Omission insurance']}' == 'YES'    Retroactive Coverage    &{test_data}
   # run keyword if    '${test_data['Applicant Have Real Estate Error & Omission insurance']}' == 'YES'    Execute Javascript  window.scrollTo(0,500)
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30

Retroactive Coverage
    [Arguments]    &{test_data}
    click element    //input[@name='PriorCoverage_33' and @value='${test_data['Retroactive Coverage']}']
    sleep  1s
    IF    '${test_data['Retroactive Coverage']}' == 'NO'
        Press keys    ${RE_PC_RetroactiveDate}    ${test_data['Retroactive date']}
        run keyword if    '${test_data['Policy Period Effective Date-1']}' != 'nan'    Press keys    ${RE_PC_RetroactiveDate}    TAB
    END
    Add E&O History   0     &{test_data}
    run keyword if    '${test_data['Policy Period Effective Date-1']}' != 'nan'     Add E&O History   1     &{test_data}
    run keyword if    '${test_data['Policy Period Effective Date-2']}' != 'nan'     Add E&O History   2     &{test_data}
    run keyword if    '${test_data['Policy Period Effective Date-3']}' != 'nan'     Add E&O History   3     &{test_data}
    run keyword if    '${test_data['Policy Period Effective Date-4']}' != 'nan'     Add E&O History   4     &{test_data}
   # sleep  2s
   # Set Selenium Speed    0.1s
   # Input text    ${RE_PC_policyPeriodEffectiveDate0}    ${test_data['Policy date-0']}
   # Input text    ${RE_PC_insuranceCarrier0}    ${test_data['Insurance Carrier-0']}
   # Input text    ${RE_PC_limitOfLiability0}    ${test_data['Limit of Liability-0']}
   # Wait Until Element Is Visible    ${RE_PC_deductible0}   2s
   # Set Selenium Speed    0s
   # Input text    ${RE_PC_deductible0}    ${test_data['Deductible-0']}
   # Input text    ${RE_PC_annualPremium0}    ${test_data['Annual Premium-0']}
   # run keyword if    '${test_data['Policy date-1']}' != 'NULL'    Add    &{test_data}

Add E&O History
    [Arguments]    ${index}  &{test_data}
    run keyword if  ${index} != 0  click element    ${Add-Button}
   # run keyword if    '${test_data['Retroactive date']}' != 'nan'   Execute Javascript  window.scrollTo(0,1300)
    sleep  2s
    #Press Keys   //input[@name='tableInputs[${index}].PriorCoverages_PolicyPeriodEffectiveDate']   TAB
    Input text   //input[@name='tableInputs[${index}].PriorCoverages_InsuranceCarrier']   ${test_data['Insurance Carrier-${index}']}
    sleep  0.5s
    Press Keys   //input[@name='tableInputs[${index}].PriorCoverages_PolicyPeriodEffectiveDate']   ${test_data['Policy Period Effective Date-${index}']}
    Input text   //input[@name='tableInputs[${index}].PriorCoverages_LimitOfLiability']     ${test_data['Limit of Liability-${index}']}
    Input text   //input[@name='tableInputs[${index}].PriorCoverages_Deductible']    ${test_data['Deductible-${index}']}
    Input text   //input[@name='tableInputs[${index}].PriorCoverages_AnnualPremium']    ${test_data['Annual Premium-${index}']}