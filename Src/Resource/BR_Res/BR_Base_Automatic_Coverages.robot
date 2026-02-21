*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot


*** Variables ***
# text fields
${BR_BAC_CompletedValueOneStructure}=    //input[@name='CompletedValueofAnyOneStructure']
${BR_BAC_CoveredPropertyValue}=    //input[@name='CompletedValueofAllCoveredProperty']
${BR_BAC_Deductible selection}=   //input[@name='DeductibleSelection_AllOtherStates']
# validation
${COMPLETED_VALUE_ONE_STRUCTURE}=    What is the total completed value of any one structure?
${COVERED_PROPERTY_VALUE}=    What is the total completed value of all covered property?
${BR_BAC_Scaffolding_construction forms}=     (//input[@role='combobox'])[2]
${BR_BAC_Re-erection of scaffolding}=     (//input[@role='combobox'])[3]
${BR_BAC_Debris removal}=     (//input[@role='combobox'])[4]
${BR_BAC_Discharge from sewer}=     (//input[@role='combobox'])[5]
${BR_BAC_Fire department}=     (//input[@role='combobox'])[6]
${BR_BAC_Valuable papers}=     (//input[@role='combobox'])[7]
${BR_BAC_Pollutant clean up}=     (//input[@role='combobox'])[8]
${BR_BAC_Reward payments}=     (//input[@role='combobox'])[9]
${BR_BAC_Expediting expenses}=     (//input[@role='combobox'])[10]
${BR_BAC_Claims preparation}=     (//input[@role='combobox'])[11]
${BR_BAC_Blueprint and construction}=     (//input[@role='combobox'])[12]
${BR_BAC_Fraud and deceit}=   (//input[@role='combobox'])[13]
${Soft Costs}=   //input[@name='Coverage_SoftCosts1']









*** Keywords ***
Base And Automatic Coverages
    [Arguments]    ${test_data}
    Wait Until Page Contains    Base And Automatic Coverages    30s
    IF  '${test_data['Please select project type:']}' == 'New construction'
        Input text    ${BR_BAC_CompletedValueOneStructure}     ${test_data['Total completed value of any one structure']}
        Input text    ${BR_BAC_CoveredPropertyValue}   ${test_data['Total completed value of all covered property']}
    END
     #IF  '${test_data['Deductible selection']}' != '$1,000'
            click element    ${BR_BAC_Deductible selection}
            #Press Keys     ${BR_BAC_Deductible selection}    CTRL+a+BACKSPACE
            Select Value From Dropdown  ${BR_BAC_Deductible selection}    ${test_data['Deductible selection']}
#            Input text   ${BR_BAC_Deductible selection}    ${test_data['Deductible selection']}
#            Press Keys   ${BR_BAC_Deductible selection}    ARROW_DOWN
#            Press Keys   ${BR_BAC_Deductible selection}    RETURN
     #END
     click element  //input[@name='automatic_additional_coverages' and @value='${test_data['Do you want to increase the automatic additional coverages or add any optional coverages?']}']
     run keyword if   '${test_data['Do you want to increase the automatic additional coverages or add any optional coverages?']}' == 'YES'   Automatic coverages   ${test_data}
     Click Continue Button

Automatic Coverages
    [Arguments]  ${test_data}
     run keyword if  '${test_data['Scaffolding, construction forms and temporary structures']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Scaffolding_construction forms}   ${test_data['Scaffolding, construction forms and temporary structures']}
     sleep  1.5s
     wait until element is enabled   ${BR_BAC_Re-erection of scaffolding}   10s
     sleep  1.5s
     run keyword if  '${test_data['Re-erection of scaffolding']}' != 'nan'   Select Value from Dropdown  ${BR_BAC_Re-erection of scaffolding}   ${test_data['Re-erection of scaffolding']}
     wait until element is enabled    ${BR_BAC_Debris removal}    10s
     sleep  1.5s
     run keyword if  '${test_data['Debris removal']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Debris removal}   ${test_data['Debris removal']}
     wait until element is enabled    ${BR_BAC_Discharge from sewer}   10s
     sleep  1.5s
     run keyword if  '${test_data['Discharge from sewer, drain and sump']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Discharge from sewer}   ${test_data['Discharge from sewer, drain and sump']}
     wait until element is enabled    ${BR_BAC_Fire department}    10s
     sleep  1.5s
     run keyword if  '${test_data['Fire department service charge']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Fire department}   ${test_data['Fire department service charge']}
     wait until element is enabled    ${BR_BAC_Valuable papers}    10s
     sleep  1.5s
     run keyword if  '${test_data['Valuable papers and records']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Valuable papers}    ${test_data['Valuable papers and records']}
     wait until element is enabled    ${BR_BAC_Pollutant clean up}   10s
     sleep  1.5s
     run keyword if  '${test_data['Pollutant clean up and removal']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Pollutant clean up}    ${test_data['Pollutant clean up and removal']}
     wait until element is enabled    ${BR_BAC_Reward payments}    10s
     sleep  1.5s
     run keyword if  '${test_data['Reward payments']}' != 'nan'   Select Value from Dropdown    ${BR_BAC_Reward payments}   ${test_data['Reward payments']}
     wait until element is enabled    ${BR_BAC_Expediting expenses}    10s
     sleep  1.5s
     run keyword if  '${test_data['Expediting expenses']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Expediting expenses}    ${test_data['Expediting expenses']}
     wait until element is enabled    ${BR_BAC_Claims preparation}    10s
     sleep  1.5s
     run keyword if  '${test_data['Claims preparation expense']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Claims preparation}    ${test_data['Claims preparation expense']}
     wait until element is enabled    ${BR_BAC_Blueprint and construction}   10s
     sleep  1.5s
     run keyword if  '${test_data['Blueprint and construction documents']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Blueprint and construction}    ${test_data['Blueprint and construction documents']}
     wait until element is enabled   ${BR_BAC_Fraud and deceit}    10s
     sleep  1.5s
     run keyword if  '${test_data['Fraud and deceit']}' != 'nan'   Select Value from Dropdown   ${BR_BAC_Fraud and deceit}       ${test_data['Fraud and deceit']}
     wait until element is enabled     ${Soft Costs}   10s
     sleep  1.5s
     Execute Javascript  window.scrollTo(0,1800)
     IF   '${test_data['Soft Costs ($100,000 is automatically included, enter value if higher limit desired)']}' != 'nan'
             Press Keys   ${Soft Costs}   CTRL+a+BACKSPACE
             Input Text   ${Soft Costs}    ${test_data['Soft Costs ($100,000 is automatically included, enter value if higher limit desired)']}
     END




