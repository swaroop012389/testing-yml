*** Settings ***
Library    SeleniumLibrary
Library    ../Global-variable/login.py
Resource    ../Generic.robot

*** Variables ***
${BR_QC_TotalCompletedValueofAnyOneStructure}=  //input[@name='TotalCompletedValueofAnyOneStructure']
${BR_QC_TotalCompletedValueofAllCoveredProperty}=   //input[@name='TotalCompletedValueofAllCoveredProperty']
${BR_QC_Deductible}=  //input[@name='Deductible']

*** Keywords ***
BR Quick Cover Eligibility
    [Arguments]    ${test_data}
    sleep  2s
    Wait Until Page Contains    Get Started!      20s
    log to console    NAVIGATED TO Quick Cover Eligibility  PAGE
    run keyword if   '${test_data['Standard Quote – All other risks']}' == 'Builders Risk QuickCover'    Builders Risk QuickCover  ${test_data}  ELSE   click element    //input[@name='QuoteType' and @value='${test_data['Standard Quote – All other risks']}']
    Click Continue Button

Builders Risk QuickCover
    [Arguments]  ${test_data}
     click element    //input[@name='QuoteType' and @value='${test_data['Standard Quote – All other risks']}']
     click element  //input[@name='PctCompleteLessThan30' and @value='${test_data['Is the home less than 30% complete?']}']
     run keyword if  '${test_data['Is the home less than 30% complete?']}' == 'YES'  click element  //input[@name='ProtectionClass1to7' and @value='${test_data['Is this property with a protection class 1-7?']}']
     run keyword if  '${test_data['Is this property with a protection class 1-7?']}' == 'YES'  click element  //input[@name='TwoYearExp' and @value='${test_data['Does the builder, remodeler, owner or general contractor have at least two years experience?']}']
     run keyword if  '${test_data['Does the builder, remodeler, owner or general contractor have at least two years experience?']}' == 'YES'  click element  //input[@name='LossInThreeYears' and @value='${test_data['Has the builder had any builders risk loss in the last three years?']}']
     run keyword if  '${test_data['Has the builder had any builders risk loss in the last three years?']}' == 'NO'  click element  //input[@name='IncreaseAdditionCoverages' and @value='${test_data['QC-Do you want to increase the automatic additional coverages or add any optional coverages?']}']
     Execute Javascript  window.scrollTo(0,800)
     IF  '${test_data['Has the builder had any builders risk loss in the last three years?']}' == 'NO'
         IF  '${test_data['QC-Do you want to increase the automatic additional coverages or add any optional coverages?']}' == 'NO'
             Input text   ${BR_QC_TotalCompletedValueofAnyOneStructure}   ${test_data['Total Completed Value of any one structure']}
             Input text  ${BR_QC_TotalCompletedValueofAllCoveredProperty}   ${test_data['Total Completed value of all covered property']}
             run keyword if  '${test_data['Deductible']}' != '$1,000'   Select Value from Dropdown    ${BR_QC_Deductible}     ${test_data['Deductible']}
         END
     END
     sleep   1s


