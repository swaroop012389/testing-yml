*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot

*** Variables ***
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Coverage_Earthquake}=    id=item595
${Coverage_CA-Earthquake}=    id=CoverageIDs_600
${Coverage_New-Madrid-Earthquake}=    id=CoverageIDs_601
${Coverage_Other-Earthquake}=    id=CoverageIDs_603
${Coverage_Pacific-NW-Earthquake}=    id=CoverageIDs_602
${Cov_AOP_Error-message}=   //div[contains(text(),'Please select mandatory coverage AOP')]
${Limit_EQ_Error-message}=   //div[contains(text(),'All standard earthquake deductibles must be the same.')]
${Deductible_Hazard_EQ_Error-message}=   //div[contains(text(),'All high hazard earthquake coverages must have the same deductibles.')]


*** Keywords ***
Validation for AOP Coverage
    [Arguments]    ${test_data}
    Log To Console    Checking for error message without the selection of AOP coverage.
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Earthquake Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_Earthquake}
    END
    IF    '${test_data['CA Earthquake Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_CA-Earthquake}
    END
    IF    '${test_data['New Madrid Earthquake Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_New-Madrid-Earthquake}
    END
    IF    '${test_data['Other Earthquake Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_Other-Earthquake}
    END
    IF    '${test_data['Pacific NW Earthquake Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_Pacific-NW-Earthquake}
    END
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  200
    Wait Until Element Is Visible    ${Cov_AOP_Error-message}   10
    ${Error message}=  Get Text    ${Cov_AOP_Error-message}
    IF    '${Error message}' == 'Please select mandatory coverage AOP'
        Log To Console    Error message without the selection of AOP coverage: ${Error message}
    ELSE
    Close Browser
    END

Validation for EQ deductibles
    [Arguments]    ${test_data}
    Log To Console    Checking for error message when EQ & Other EQ deductibles are not same
    IF    '${test_data['AOP']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Aop Coverage index']}__DesiredLimits_0__Value']   ${testdata['AOP_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Aop Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['AOP_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Aop Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['AOP_Deductibles limit']}
    END
    IF    '${test_data['Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Earthquake Coverage index']}__DesiredDeductibles_0__Value']    1
    END
    IF    '${test_data['Flood']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Flood Coverage index']}__DesiredLimits_0__Value']    ${testdata['Flood_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Flood Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Flood_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Flood Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['Flood_Deductibles limit']}
    END
    IF    '${test_data['NAMEDWINDSTORM']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Namedwindstorm Coverage index']}__DesiredLimits_0__Value']    ${testdata['NAMEDWINDSTORM_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Namedwindstorm Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['NAMEDWINDSTORM_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Namedwindstorm Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['NAMEDWINDSTORM_Deductibles limit']}
    END
    IF    '${test_data['SEVERECONVECTIVE']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Severeconvective Coverage index']}__DesiredLimits_0__Value']     ${testdata['SEVERECONVECTIVE_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Severeconvective Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['SEVERECONVECTIVE_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Severeconvective Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['SEVERECONVECTIVE_Deductibles limit']}
    END
    IF    '${test_data['Wildfire']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Wildfire Coverage index']}__DesiredLimits_0__Value']    ${testdata['Wildfire_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Wildfire Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Wildfire_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Wildfire Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['Wildfire_Deductibles limit']}
    END
    IF    '${test_data['CA Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['CA Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['CA-Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['CA Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['CA-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['CA Earthquake Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['CA-Earthquake_Deductibles limit']}
    END
    IF    '${test_data['New Madrid Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['New-Madrid-Earthquake_limit']}
    Wait Until Element Is Visible    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']  10
    Check and enter input    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['New-Madrid-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['New-Madrid-Earthquake_Deductibles limit']}
    END
    IF    '${test_data['Other Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Other Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['Other-Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Other Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Other-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Other Earthquake Coverage index']}__DesiredDeductibles_0__Value']    3
    END
    IF    '${test_data['Pacific NW Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Pacific NW Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['Pacific-NW-Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Pacific NW Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Pacific-NW-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Pacific NW Earthquake Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['Pacific-NW-Earthquake_Deductibles limit']}
    END
    IF    '${test_data['Special Hazard Flood']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Special Hazard Flood Coverage index']}__DesiredLimits_0__Value']    ${testdata['Special-Hazard-Flood_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Special Hazard Flood Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Special-Hazard-Flood_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Special Hazard Flood Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['Special-Hazard-Flood_Deductibles limit']}
    END
    IF    '${test_data['TRIA']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Tria Coverage index']}__DesiredLimits_0__Value']   ${testdata['TRIA_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Tria Coverage index']}__DesiredLimits_0__AggregateValue']   ${testdata['TRIA_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Tria Coverage index']}__DesiredDeductibles_0__Value']   ${testdata['TRIA_Deductibles limit']}
    END
    IF    '${test_data['TRIA REJECTED']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['TRIA Rejected Coverage index']}__DesiredLimits_0__Value']   ${testdata['TRIA-REJECTED_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['TRIA Rejected Coverage index']}__DesiredLimits_0__AggregateValue']   ${testdata['TRIA-REJECTED_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['TRIA Rejected Coverage index']}__DesiredDeductibles_0__Value']   ${testdata['TRIA-REJECTED_Deductibles limit']}
    END
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoad  100
    Wait Until Element Is Visible    ${Limit_EQ_Error-message}   10
    ${Error message}=  Get Text    ${Limit_EQ_Error-message}
    IF    '${Error message}' == 'All standard earthquake deductibles must be the same.'
        Log To Console    Error message when EQ & Other EQ deductibles are not same: ${Error message}
    ELSE
    Close Browser
    END
    click element   ${ID-UMS-Apply&Continue}
    Log To Console    Checking for error message when CA EQ,Pacific EQ & New Madrid EQ deductibles are not same
    IF    '${test_data['CA Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['CA Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['CA-Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['CA Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['CA-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['CA Earthquake Coverage index']}__DesiredDeductibles_0__Value']    0.1
    END
    IF    '${test_data['New Madrid Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['New-Madrid-Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['New-Madrid-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredDeductibles_0__Value']    0.1
    END
    IF    '${test_data['Pacific NW Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Pacific NW Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['Pacific-NW-Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Pacific NW Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Pacific-NW-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Pacific NW Earthquake Coverage index']}__DesiredDeductibles_0__Value']    0.1
    END
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoad  100
    Wait Until Element Is Visible    ${Limit_EQ_Error-message}   10
    ${Error message}=  Get Text    ${Limit_EQ_Error-message}
    IF    '${Error message}' == 'All standard earthquake deductibles must be the same.'
        Log To Console    Error message when CA EQ,Pacific EQ & New Madrid EQ deductibles are not same: ${Error message}
    ELSE
    Close Browser
    END

Validation for CA Policynumber
    [Arguments]    ${test_data}
    ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
    ${PN} =  Get substring  ${Policy_Header_Info}    0  3
    IF    '${PN}' == '04'
        Log To Console    For CA state the Policy number should start with : ${policy-number}
    ELSE
    Close Browser
    END

    
