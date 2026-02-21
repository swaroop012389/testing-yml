*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot
Resource    Raven Coverages Validation.robot
Resource    ../Alternus_Res/BindEndorsement.robot
Resource    Upload_SOV_file.robot

*** Variables ***
${Coverage_Flood}=    id=item594
${Coverage_SEVERECONVECTIVE}=    id=item598
${Coverage_Earthquake}=    id=item595
${Rate-Territory}=    //span[contains(text(),'OK')]
${Save-button}=    //input[@type='submit']
${ID-COV-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Coverage-flood}=  //input[@coverageid='594']
${Coverage-AOP}=  //input[@coverageid='593']
${Coverage-TRIA}=  //input[@coverageid='604']
${ID-BE-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-BE-Apply&Continue}=  //input[@value='Apply & Continue']
${Refresh_Receivable}=  //input[@id='btnGnrtRcv']

*** Keywords ***
Adding Coverage for Endorsements
    log to console    Adding Coverage
    Select Checkbox    ${Coverage_Flood}
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Rating Base page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Modifiers page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Limit&Deductibles page
    Select Checkbox    ${Bundle_Coverages-checkbox}
    Check and enter input    //input[@id='Coverages_2__DesiredLimits_0__Value']    300
    Check and enter input    //input[@id='Coverages_2__DesiredLimits_0__AggregateValue']    200
    Check and enter input    //input[@id='Coverages_2__DesiredDeductibles_0__Value']    1
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
    Check and enter input    ${Penchange_premium}   10000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   50000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   50000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   35000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   20000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   8672
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${Create_Bundle-link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Endorsement Option page
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    Log To Console    Bind Endorsement page
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${Coverage-flood}  10
    Select Checkbox    ${Coverage-flood}
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}
    Scroll Element Into View    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Endorsements To Attach
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Add_Receivable_Option}=    run keyword and return status    element should be visible    ${Button_AddReceivable}
    run keyword if    ${Add_Receivable_Option}    Add Receivable    ${test_data}
    log to console    Navigated to Payments
    wait until element is visible    ${Button_Next}  10s
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Select Endorsement Radio Button    ${test_data}
    log to console    Endorsement Created
    Verify Generated Document Name    ${test_data}

Removing Coverage for Endorsements
    log to console    Removing Coverage
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Rating Base page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Modifiers page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Limit&Deductibles page
    Select Checkbox    ${Bundle_Coverages-checkbox}
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
    Check and enter input    ${Penchange_premium}   10000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${Create_Bundle-link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Endorsement Option page
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    Adding Endorsement    ${test_data}
    Bind
    Log To Console    Bind Endorsement page
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${Coverage-AOP}  10
    Select Checkbox    ${Coverage-AOP}
    Select Checkbox    ${Coverage-TRIA}
    select radio button    Selected    False
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}
    Scroll Element Into View    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Endorsements To Attach
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Add_Receivable_Option}=    run keyword and return status    element should be visible    ${Button_AddReceivable}
    run keyword if    ${Add_Receivable_Option}    Add Receivable    ${test_data}
    log to console    Navigated to Payments
    wait until element is visible    ${Button_Next}  10s
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Select Endorsement Radio Button    ${test_data}
    log to console    Endorsement Created
    Verify Generated Document Name    ${test_data}

Selecting Specific Coverage for Primium Bearing Endorsement
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Rating Base page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Modifiers page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Limit&Deductibles page
    Select Checkbox    ${Bundle_Coverages-checkbox}
    Check and enter input    //input[@id='Coverages_0__DesiredLimits_0__Value']    300
    Check and enter input    //input[@id='Coverages_0__DesiredLimits_0__AggregateValue']    300
    Check and enter input    //input[@id='Coverages_0__DesiredDeductibles_0__Value']    10
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoad  100
    Log To Console    Navigated to Quote Options page
    wait until element is not visible   globalAjaxLoad  100
    Select Checkbox    (//input[@type='checkbox'])[2]
    Click Link    ${QO_Penchange}
    Wait Until Element Is Visible    ${Penchange_Save}     25
    Click Element    ${Penchange_Save}
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input    ${Penchange_premium}   150000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Select Checkbox    (//input[@type='checkbox'])[2]
    Click Link    ${Create_Bundle-link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Endorsement Option page
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    Upload_SOV_file  ${test_data}
    log to console    Uploaded SOV file
    wait until element is not visible   globalAjaxLoading  100
    Adding Endorsement    ${test_data}
    Bind
    Log To Console    Bind Endorsement page
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${Coverage-AOP}  10
    Select Checkbox    ${Coverage-AOP}
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}
    Scroll Element Into View    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Endorsements To Attach
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Add_Receivable_Option}=    run keyword and return status    element should be visible    ${Button_AddReceivable}
    run keyword if    ${Add_Receivable_Option}    Add Receivable    ${test_data}
    log to console    Navigated to Payments
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${Refresh_Receivable}  100
    Click Element    ${Refresh_Receivable}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Button_Next}  10s
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Select Endorsement Radio Button    ${test_data}
    log to console    Endorsement Created
    Verify Generated Document Name    ${test_data}

