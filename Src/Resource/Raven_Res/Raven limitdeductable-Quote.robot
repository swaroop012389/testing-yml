*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot
Resource    Raven Coverages Validation.robot
Resource    Raven Inspetion fees.robot
Resource    TC02 Validation.robot
Resource    TC03 Validation.robot
Resource    TC04Validation.robot

*** Variables ***
${ID-COV-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Bundle_Coverages-checkbox}=   //input[@name='isCoverageBundle']
${Create_Bundle-link}=  //a[contains(text(),'Create Bundle')]
${ID-UW-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${Endrosements}=  //a[contains(text(),'Endorsements')]
${Autolink-Endos}=  //a[contains(text(),'Autolink Endorsements')]
${Rating}=  //a[contains(text(),'Rating')]
${Submit}=   id=Submit
${QO_All_Coverage}=    (//input[@type='checkbox'])[1]
${QO_Zero-link}=    //a[contains(text(),'Show zero columns')]
${QO_Edit-ES-Fees}=     (//a[@class='editEsFee read-only-link'])[1]
${AOP-ES-Fees}=   //input[@class='formated']
${QO_Penchange}=  //a[contains(text(),'Pen Change')]
${Penchange_Save}=  //input[@type='submit']
${Penchange_premium}=  (//input[@type='text'])[1]
${Penchange_Save-link}=  //a[contains(text(),'Save')]
${ID-Submit-Button}=    //input[@id='Submit']

*** Keywords ***
Raven Limitdeductibles to Quote
    [Arguments]    ${test_data}
    Log To Console    Navigated to Limit&Deductibles page
    Select Checkbox    ${Bundle_Coverages-checkbox}
#    Run Keyword If    '${test_data['TC_ID']}' in ['TC_Raven_001']    Validation for EQ deductibles   ${test_data}
    IF    '${test_data['AOP']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Aop Coverage index']}__DesiredLimits_0__Value']   ${testdata['AOP_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Aop Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['AOP_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Aop Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['AOP_Deductibles limit']}
    END
    IF    '${test_data['Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Earthquake Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['Earthquake_Deductibles limit']}
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
#    IF    '${test_data['SEVERECONVECTIVE']}' == 'YES'
#    Check and enter input    //input[@id='Coverages_${testdata['Severeconvective Coverage index']}__DesiredLimits_0__Value']     ${testdata['SEVERECONVECTIVE_limit']}
#    Check and enter input    //input[@id='Coverages_${testdata['Severeconvective Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['SEVERECONVECTIVE_Agg limit']}
#    Check and enter input    //input[@id='Coverages_${testdata['Severeconvective Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['SEVERECONVECTIVE_Deductibles limit']}
#    END
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
    Check and enter input    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['New-Madrid-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['New Madrid Earthquake Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['New-Madrid-Earthquake_Deductibles limit']}
    END
    IF    '${test_data['Other Earthquake']}' == 'YES'
    Check and enter input    //input[@id='Coverages_${testdata['Other Earthquake Coverage index']}__DesiredLimits_0__Value']    ${testdata['Other-Earthquake_limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Other Earthquake Coverage index']}__DesiredLimits_0__AggregateValue']    ${testdata['Other-Earthquake_Agg limit']}
    Check and enter input    //input[@id='Coverages_${testdata['Other Earthquake Coverage index']}__DesiredDeductibles_0__Value']    ${testdata['Other-Earthquake_Deductibles limit']}
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
    Log To Console    Navigated to Quote Options page
    Run Keyword If    '${test_data['Aop Inspection fees']}' == 'YES'    Inspection fees     ${test_data}
    wait until element is not visible   globalAjaxLoad  100
    Select Checkbox    ${QO_All_Coverage}
    Wait Until Element Is Visible    ${QO_Penchange}    25
    Click Link    ${QO_Penchange}
    Wait Until Element Is Visible    ${Penchange_Save}     25
    Click Element    ${Penchange_Save}
    wait until element is not visible   globalAjaxLoading  200
#    Run Keyword If    '${test_data['TC_ID']}' in ['TC_Raven_003']    Incorrect premium and TIV Error message    ${test_data}
    IF    '${test_data['Aop Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Aop Penchane value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Earthquake Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Earthquake penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Flood Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Flood penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Namedwindstorm Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Namedwindstorm penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Severeconvective Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Severeconvective penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Wildfire Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Wildfire penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['CA Earthquake Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['CA Earthquake penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['New Madrid Earthquake Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['New Madrid Earthquake penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Other Earthquake Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Other Earthquake penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Pacific NW Earthquake Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Pacific NW Earthquake penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Special Hazard Flood Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Special Hazard Flood penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Tria Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Tria penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Tria rejected Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   ${testdata['Tria rejected penchange value']}
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    Run Keyword If    '${test_data['TC_ID']}' in ['TC_Raven_002']    Endorsement missing from record
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  20
    wait until element is enabled    ${ID-UW-UNDERWRITING}  20
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  20
    click element  ${Endrosements}
    wait until element is not visible   globalAjaxLoading  100
    Click Link    ${Autolink-Endos}
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  20
    click element  ${Rating}
    IF    '${test_data['TC_ID']}' == 'TC_Raven_004'
        Create Bundle for 4 Coverages
    ELSE
        Select Checkbox    ${QO_All_Coverage}
        Click Link    ${Create_Bundle-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100 
    Log To Console    Navigated to Endorsement Option page     
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    Log To Console    Navigated to Quote letter page
    select radio button  Action  Review
    click element  ${Submit}
    wait until element is not visible   globalAjaxLoading  100


Bind quote page
    wait until element is not visible   globalAjaxLoading  500
    select radio button  Action  Review
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible   ${ID-Submit-Button}
    click element   ${ID-Submit-Button}
