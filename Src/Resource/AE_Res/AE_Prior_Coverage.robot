*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${Professional_liability_coverage?}=  ProfessionalLiabilityCoverage
${Insured_with_Victor/CNA}=  InsuredWithVictorCNA
${AE_PC_RetroactiveDate}=    //input[@name='RetroactiveDate']
${AE_PC_Premium1}=    //input[@name='PriorCoveragePremium']
${AE_PC_Select}=  //input[@name='tableInputs[0].PriorCoverage_Carrier']
${AE_PC_Ded_Select}=  //input[@name='tableInputs[0].PriorCoverage_DeductibleType']
${AE_PC_policyPeriodEffectiveDate1}=    //input[@name='tableInputs[0].PriorCoverage_EffectiveDate']
${AE_PC_insuranceCarrier1}=   //div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary Mui-error MuiInputBase-formControl formGroupInput MuiSelect-root css-17pxabm']
${AE_PC_limitOfLiability1}=    //input[@name='tableInputs[0].PriorCoverage_Limit']
${AE_PC_limitOfAggregate1}=    //input[@name='tableInputs[0].PriorCoverage_Aggregate']
${AE_PC_deductible1}=    //input[@name='tableInputs[0].PriorCoverage_Deductible']
${AE_PC_aggregate-deductible1}=    //input[@name='tableInputs[0].PriorCoverage_AggregateDeductible']
${AE_PC_deductibletype1}=    //div[@class='MuiSelect-select MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input css-79944f']
${AE_PC_Add}=    //button[text()='Add']
${AE_PC_policyPeriodEffectiveDate2}=    //input[@name='tableInputs[1].PriorCoverage_EffectiveDate']
${AE_PC_insuranceCarrier2}=    id=InsuranceCarrier2
${AE_PC_limitOfLiability2}=    //input[@name='tableInputs[1].PriorCoverage_Limit']
${AE_PC_limitOfAggregate2}=    //input[@name='tableInputs[1].PriorCoverage_Deductible']
${AE_PC_deductible2}=    //input[@name='tableInputs[1].PriorCoverage_Deductible']
${AE_PC_deductibletype2}=    id=DeductibleType2


*** Keywords ***
AE Prior Coverage
        [Arguments]    &{test_data}
        Sleep    3s
        Execute Javascript    window.scrollTo(0, 0)
        click element  //input[@name='ProfessionalLiabilityCoverageYN' and @value='${test_data['Does the firm currently carry professional liability coverage?']}']
        click element   //input[@name='CNAInsuredYN' and @value='${test_data['Has the firm insured with Victor/CNA in the last 5 years?']}']
        run keyword if    '${test_data['Does the firm currently carry professional liability coverage?']}' == 'YES'    Retroactive Coverage    &{test_data}
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Retroactive Coverage
        [Arguments]    &{test_data}
         sleep  0.5s
       # Wait Until Element Is Visible  ${AE_PC_RetroactiveDate}  5s
        Press Keys   ${AE_PC_RetroactiveDate}    ${test_data['Retroactive date']}
        input text    ${AE_PC_Premium1}    ${test_data['Premium-1']}
        Scroll Element Into View    ${AE_PC_policyPeriodEffectiveDate1}
        Execute Javascript    window.scrollTo(0, 60)
        Scroll Element Into View    ${AE_PC_Add}
        Wait Until Element Is Enabled    ${AE_PC_policyPeriodEffectiveDate1}
        sleep  2s
        Press Keys  ${AE_PC_policyPeriodEffectiveDate1}    ${test_data['Policy date-1']}
        sleep  3s
        wait until element is not visible   globalAjaxLoading  50
#        Click element    ${AE_PC_Select}
#        sleep  2s
#        click element   //li[@data-value='${test_data['Insurance Carrier-1']}']
        Select Value From Dropdown   ${AE_PC_Select}    ${test_data['Insurance Carrier-1']}
        wait until element is not visible   globalAjaxLoading  50
        Wait Until Element Is Visible    ${AE_PC_limitOfLiability1}  2s
        input text    ${AE_PC_limitOfLiability1}    ${test_data['Limit of Liability-1']}
        input text    ${AE_PC_limitOfAggregate1}    ${test_data['Limit of Aggregate-1']}
        input text    ${AE_PC_deductible1}    ${test_data['Deductible-1']}
        sleep  1s
        wait until element is not visible   globalAjaxLoading  50
        Wait Until Element Is Enabled    ${AE_PC_aggregate-deductible1}  3s
        input text    ${AE_PC_aggregate-deductible1}    ${test_data['Aggregate-Deductible-1']}
#        click element  ${AE_PC_Ded_Select}
#        click element  //li[@data-value='${test_data['Deductible type-1']}']
         Select Value From Dropdown   ${AE_PC_Ded_Select}   ${test_data['Deductible type-1']}

Add
        [Arguments]    &{test_data}
        click element    ${AE_PC_Add}
        sleep  3s
        input text    ${AE_PC_policyPeriodEffectiveDate2}    ${test_data['Policy date-2']}
        sleep  1s
        click element  ${AE_PC_Select}
        click element    //li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1pq8hud' and @data-value='${test_data['Insurance Carrier-2']}']
        wait until element is not visible   globalAjaxLoading  50
        wait until element is enabled  ${AE_PC_limitOfLiability2}
        input text    ${AE_PC_limitOfLiability2}    ${test_data['Limit of Liability-2']}
        input text    ${AE_PC_limitOfAggregate2}    ${test_data['Limit of Aggregate-2']}
        input text    ${AE_PC_deductible2}    ${test_data['Deductible-2']}
        wait until element is not visible   globalAjaxLoading  50
        wait until element is enabled  ${AE_PC_aggregate-deductible2}
        input text    ${AE_PC_aggregate-deductible2}    ${test_data['Aggregate-Deductible-2']}
        click element  ${AE_PC_Select}
        click element  //li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1pq8hud' and @data-value='${test_data['Deductible type-2']}']