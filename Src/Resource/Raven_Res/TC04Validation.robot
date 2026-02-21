*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot

*** Variables ***
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Coverage_AOP}=    id=item593
${Coverage_NS}=    id=item596
${Coverage_TRIA}=    id=CoverageIDs_604
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
${Aop-Cov-checkbox}=  (//input[@type='checkbox'])[2]
${EQ-Cov-checkbox}=  (//input[@type='checkbox'])[3]
${Flood-Cov-checkbox}=  (//input[@type='checkbox'])[4]
${SEVERECONVECTIVE-Cov-checkbox}=  (//input[@type='checkbox'])[5]


*** Keywords ***
Coverages before Quote
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    Select Checkbox    ${Coverage_AOP}
    Select Checkbox    ${Coverage_NS}
    Select Checkbox    ${Coverage_TRIA}
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Rating Base page
    Check and enter input    ${RB_TIV}    ${test_data['TIV']}
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Modifiers page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Select Checkbox    ${Bundle_Coverages-checkbox}
    Check and enter input    //input[@id='Coverages_0__DesiredLimits_0__Value']   300
    Check and enter input    //input[@id='Coverages_0__DesiredLimits_0__AggregateValue']    200
    Check and enter input    //input[@id='Coverages_0__DesiredDeductibles_0__Value']    25
    Check and enter input    //input[@id='Coverages_1__DesiredLimits_0__Value']    300
    Check and enter input    //input[@id='Coverages_1__DesiredLimits_0__AggregateValue']    200
    Check and enter input    //input[@id='Coverages_1__DesiredDeductibles_0__Value']    0.03
    Check and enter input    //input[@id='Coverages_2__DesiredLimits_0__Value']   300
    Check and enter input    //input[@id='Coverages_2__DesiredLimits_0__AggregateValue']   200
    Check and enter input    //input[@id='Coverages_2__DesiredDeductibles_0__Value']   1
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoad  100
    Log To Console    Navigated to Quote Options page
    wait until element is not visible   globalAjaxLoad  100
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${QO_Penchange}
    Wait Until Element Is Visible    ${Penchange_Save}     25
    Click Element    ${Penchange_Save}
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input    ${Penchange_premium}   100000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   50000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   10000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[2]
    wait until element is not visible   globalAjaxLoading  20
    wait until element is enabled    ${ID-UW-UNDERWRITING}  20
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  20
    click element  ${Endrosements}
    wait until element is not visible   globalAjaxLoading  100
    Click Link    ${Autolink-Endos}
    Wait Until Element Is Visible    ${ID-UW-UNDERWRITING}  10
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${Rating}
    Wait Until Element Is Visible    ${QO_All_Coverage}  100
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${Create_Bundle-link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Endorsement Option page
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    Click Coverages Button
    wait until element is not visible   globalAjaxLoading  100
    Unselect Checkbox    ${Coverage_AOP}
    Unselect Checkbox    ${Coverage_NS}
    Unselect Checkbox    ${Coverage_TRIA}

Create Bundle for 4 Coverages
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${Aop-Cov-checkbox}     25
    Select Checkbox    ${Aop-Cov-checkbox}
    Wait Until Element Is Visible    ${EQ-Cov-checkbox}    25
    Select Checkbox    ${EQ-Cov-checkbox}
    Wait Until Element Is Visible    ${Flood-Cov-checkbox}     25
    Select Checkbox    ${Flood-Cov-checkbox}
    Wait Until Element Is Visible    ${SEVERECONVECTIVE-Cov-checkbox}     25
    Select Checkbox    ${SEVERECONVECTIVE-Cov-checkbox}
    Wait Until Element Is Visible    ${Create_Bundle-link}     25
    Click Link    ${Create_Bundle-link}

Select Bind Option
    Unselect Checkbox    //input[@id='Checked_1']
    select checkbox  //input[@id='Checked_2']
    
Get Policy number for Raven
    [Arguments]    ${test_data}
    ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
    log to console    Policy Details are: ${Policy_Header_Info}
    ${Policy_Status}=    Run Keyword If    '${test_data['Program']}'=='REALESTATE'    get substring  ${Policy_Header_Info}  64
    ...    ELSE IF    '${test_data['Program']}'=='VIMMPROPERTY'    get substring    ${Policy_Header_Info}  68
    ...    ELSE    get substring    ${Policy_Header_Info}    60
    set suite variable  ${Policy_Status}
    log to console    Policy Status is: ${Policy_Status}
    IF    '${test_data['Program']}'=='VIMMPROPERTY'
         ${policy-number} =  Get substring  ${Policy_Header_Info}    0  19
    ELSE
        ${policy-number} =  Get substring  ${Policy_Header_Info}    0  19
    END
    set test variable  ${policy-no}  ${policy-number}
    set to dictionary    ${test_data}    PolicyNumber=${policy-no}
    Log To Console    ${policy-no}