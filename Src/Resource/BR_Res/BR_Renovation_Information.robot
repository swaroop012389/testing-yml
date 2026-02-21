*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot


*** Variables ***
# text fields
${BR_RI_RenovationDescription}=    //textarea[@name='RenovationProjectDescription']
${BR_RI_ValueOfRenovation}=    //input[@name='StructureRenoValue']
${BR_RI_ActualCashValue_ExistingStructure}=    //input[@name='StructureValueOnExisting']
${BR_RI_StructureBuiltYear}=    //input[@name='StructureBuiltYear']
# radio button
${BR_RI_Remodel}=    licenseType
${BR_RI_ExistingStructure}=    ExistingStructureCoverage
${BR_RI_HistoricalDesignation}=    HistoricalDesignation
#text
${BR_RI_HistoricalDesignation}=    id=HistoricalDesignation_labelText
${BR_RI_ExistingStructureCoverage}=    ExistingStructureCoverage_labelText


*** Keywords ***
Renovation Information
    [Arguments]     ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Page Contains    Renovation Information    30s
    click element   //input[@name='RenovationType' and @value='${test_data['Please select one of the three options below']}']
    IF   '${test_data['Please select project type:']}' == 'RemodelingIncludingExistingStructure'
         IF      '${test_data['Please select one of the three options below']}' != 'RemodelMajorStructural'
                Input text  ${BR_RI_RenovationDescription}  ${test_data['Provide description of the renovation project']}
                Input text  ${BR_RI_ActualCashValue_ExistingStructure}    ${test_data['What is the actual cash value of the existing structure?']}
                Input text  ${BR_RI_ValueOfRenovation}      ${test_data['What is the value of the renovation and improvement?']}
                Input text  ${BR_RI_StructureBuiltYear}     ${test_data['What year was the structure built?']}
                click element  //input[@name='PropertyHistoricalDesignationYN' and @value='${test_data['Does the property have any historical designation?']}']
          END
    ELSE
        IF   '${test_data['Please select project type:']}' == 'RemodelingExcludingExistingStructure'
             IF      '${test_data['Please select one of the three options below']}' != 'RemodelMajorStructural'
                    Input text  ${BR_RI_RenovationDescription}  ${test_data['Provide description of the renovation project']}
                    Input text  ${BR_RI_ValueOfRenovation}      ${test_data['What is the value of the renovation and improvement?']}
                    click element  //input[@name='ExistingStructureCoverageYN' and @value='${test_data['Is coverage in place for the existing structure?']}']
             END
         END
    END
    Click Continue Button


   # wait until element is visible    ${BR_RI_Remodel}    timeout=10s
   # Run Keyword If    '${test_data['Please select one of the three options below']}'=='Remodel'    select radio button    ${BR_RI_Remodel}    Remodel
   # ...    ELSE IF    '${test_data['Please select one of the three options below']}'=='Remodel/minor structural'    select radio button    ${BR_RI_Remodel}    RemodelMinorStructural
   # ...    ELSE    log to console    PLEASE SELECT ONE LICENSE TYPE
   # wait until element is visible    ${BR_RI_RenovationDescription}
   # input text    ${BR_RI_RenovationDescription}    ${test_data['Provide description of the renovation project']}
   # ${ActualCash}=    run keyword and return status    page should contain element    ${BR_RI_ActualCashValue_ExistingStructure}
   # Run Keyword If    '${ActualCash}'=='True'    check and enter input    ${BR_RI_ActualCashValue_ExistingStructure}    ${test_data['What is the actual cash value of the existing structure?']}
   # wait until element is visible    ${BR_RI_ValueOfRenovation}
   # input text    ${BR_RI_ValueOfRenovation}    ${test_data['What is the value of the renovation and improvement?']}
   # ${StructureBuiltYear}=    run keyword and return status    page should contain element    ${BR_RI_StructureBuiltYear}
   # Run Keyword If    '${StructureBuiltYear}'=='True'    Run Keywords  sleep  1s  AND    Check And Enter Input    ${BR_RI_StructureBuiltYear}    ${test_data['What year was the structure built?']}
   # ${HistoricalDesignation}=    run keyword and return status    page should contain element    ${BR_RI_HistoricalDesignation}
   # Run Keyword If    '${HistoricalDesignation}'=='True'    select radio button    ${BR_RI_HistoricalDesignation}    ${test_data['Does the property have any historical designation?']}
   # ${ExistingStructureCoverage}=    run keyword and return status    page should contain element    ${BR_RI_ExistingStructureCoverage}
   # sleep  2s
   # Run Keyword If    '${ExistingStructureCoverage}'=='True'    select radio button    ${BR_RI_ExistingStructure}    ${test_data['Is coverage in place for the existing structure?']}
