*** Settings ***
Resource  ../../Resource/Global-variable/v2.robot

*** Variables ***
${ST_PCCH_Each_Inc_Lia_Opt1}=              //input[@name='STLEachIncidentLiabilityOption_1']
${ST_PCCH_Each_Inc_Lia_Opt2}=              //input[@name='STLEachIncidentLiabilityOption_2']
${ST_PCCH_CS_Limit_Lia_Opt1}=              //input[@name='STLCoverageSectionLimitOfLiabilityOption_1']
${ST_PCCH_CS_Limit_Lia_Opt2}=              //input[@name='STLCoverageSectionLimitOfLiabilityOption_2']
${ST_PCCH_Deduct_Amount_Opt1}=             //input[@name='STLDeductibleAmountOption_1']
${ST_PCCH_Deduct_Amount_Opt2}=             //input[@name='STLDeductibleAmountOption_2']
${ST_PCCH_Onst_Clean_Each_Inc_Lia_Opt1}=    //input[@name='OSCCEachIncidentLiabilityOption_1']
${ST_PCCH_Onst_Clean_Each_Inc_Lia_Opt2}=    //input[@name='OSCCEachIncidentLiabilityOption_2']
${ST_PCCH_Onst_Clean_CS_Limit_Lia_Opt1}=    //input[@name='OSCCCoverageSectionLimitOfLiabilityOption_1']
${ST_PCCH_Onst_Clean_CS_Limit_Lia_Opt2}=    //input[@name='OSCCCoverageSectionLimitOfLiabilityOption_2']
${ST_PCCH_Onst_Clean_Deduct_Amount_Opt1}=   //input[@name='OSCCDeductibleAmountOption_1']
${ST_PCCH_Onst_Clean_Deduct_Amount_Opt2}=   //input[@name='OSCCDeductibleAmountOption_2']


*** Keywords ***
ST Coverage Selection
    [Arguments]    &{test_data}
    Wait Until Page Contains Element  ${ST_PCCH_Each_Inc_Lia_Opt1}  10s
    sleep  2s
    Select Value From Dropdown  ${ST_PCCH_Each_Inc_Lia_Opt1}    ${test_data['Each Incident Liability Option 1']}
    Select Value From Dropdown  ${ST_PCCH_Each_Inc_Lia_Opt2}    ${test_data['Each Incident Liability Option 2']}
    Select Value From Dropdown  ${ST_PCCH_CS_Limit_Lia_Opt1}    ${test_data['Coverage Section Limit of Liability_Option_1']}
    Select Value From Dropdown  ${ST_PCCH_CS_Limit_Lia_Opt2}    ${test_data['Coverage Section Limit of Liability_Option_2']}
    Select Value From Dropdown  ${ST_PCCH_Deduct_Amount_Opt1}    ${test_data['Deductible Amount_Option_1']}
    Select Value From Dropdown  ${ST_PCCH_Deduct_Amount_Opt2}    ${test_data['Deductible Amount_Option_2']}
    Wait Until Page Contains Element    //input[@name='optionalCoverageEmpty_2' and @value='${test_data['Optional Coverage_Option_1']}']
    Click Element    //input[@name='optionalCoverageEmpty_2' and @value='${test_data['Optional Coverage_Option_1']}']
    Click Element    //input[@name='optionalCoverageEmpty_1' and @value='${test_data['Optional Coverage_Option_2']}']
    Enter Onsite Cleanup Coverage Option  &{test_data}
    wait Until Page Contains Element  //input[@name='CertifiedActsOfTerrorismCovOption_1' and @value='${test_data['Certified Acts of Terrorism Coverage_Option_1']}']
    Click Element    //input[@name='CertifiedActsOfTerrorismCovOption_1' and @value='${test_data['Certified Acts of Terrorism Coverage_Option_1']}']
    Click Element    //input[@name='facilityAndStorageTankScheduleUploadMethod' and @value='${test_data['How do you want to provide your Facility and Storage Tank Schedule?']}']
    Continue Click RE

Enter Onsite Cleanup Coverage Option
    [Arguments]    &{test_data}
    Run Keyword If  "${test_data['Optional Coverage_Option_1']}"=="YES"  run keywords
    ...  Select Value From Dropdown  ${ST_PCCH_Onst_Clean_Each_Inc_Lia_Opt1}    ${test_data['Onsite_Cleanup Each Incident Liability Option 1']}
    ...  AND  Select Value From Dropdown  ${ST_PCCH_Onst_Clean_CS_Limit_Lia_Opt1}   ${test_data['Onsite_Cleanup Coverage Section Limit of Liability_Option_1']}
    ...  AND  Select Value From Dropdown  ${ST_PCCH_Onst_Clean_Deduct_Amount_Opt1}  ${test_data['Onsite_Cleanup Deductible Amount_Option_1']}
    Run Keyword If  "${test_data['Optional Coverage_Option_2']}"=="YES" and '${test_data['Each Incident Liability Option 2']}'!='nan'   run keywords
    ...  Select Value From Dropdown  ${ST_PCCH_Onst_Clean_Each_Inc_Lia_Opt2}    ${test_data['Onsite_Cleanup Each Incident Liability Option 2']}
    ...  AND  Select Value From Dropdown  ${ST_PCCH_Onst_Clean_CS_Limit_Lia_Opt2}    ${test_data['Onsite_Cleanup Coverage Section Limit of Liability_Option_2']}
    ...  AND  Select Value From Dropdown  ${ST_PCCH_Onst_Clean_Deduct_Amount_Opt2}   ${test_data['Onsite_Cleanup Deductible Amount_Option_2']}

Enter Onsite Cleanup Coverage Option2
    [Arguments]    &{test_data}
    Select Value From Dropdown  ${ST_PCCH_Onst_Clean_Each_Inc_Lia_Opt2}    ${test_data['Onsite_Cleanup Each Incident Liability Option 2']}
    Select Value From Dropdown  ${ST_PCCH_Onst_Clean_CS_Limit_Lia_Opt2}    ${test_data['Onsite_Cleanup Coverage Section Limit of Liability_Option_2']}
    Select Value From Dropdown  ${ST_PCCH_Onst_Clean_Deduct_Amount_Opt2}   ${test_data['Onsite_Cleanup Deductible Amount_Option_2']}
