*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot
Resource    Raven Coverages Validation.robot
Resource    ../Alternus_Res/BindEndorsement.robot
Resource    Upload_SOV_file.robot

*** Variables ***
${RB_TIV}=  id=Rows_0__Table_Corteges_0__3__Value
${Coverage_Flood}=    id=item594
${Coverage_SEVERECONVECTIVE}=    id=item598
${Coverage_Earthquake}=    id=item595
${Rate-Territory}=    //span[contains(text(),'OK')]
${Save-button}=    //input[@type='submit']
${ID-COV-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Coverage-BE-flood}=  //input[@coverageid='594']
${Coverage-BE-AOP}=  //input[@coverageid='593']
${Coverage-BE-EQ}=  //input[@coverageid='595']
${Coverage-BE-severconective}=  //input[@coverageid='598']
${ID-BE-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-BE-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-UMS-BIND/ISSUE-TAB}=  //a[contains(text(),'BIND/ISSUE')]
${ID-UMS-SOV}=    //a[contains(text(),'SOV Import')]
${ID-UMS-Issue/Reissue}=  //a[contains(text(),'Issue/Reissue')]
${UMS_Import_SOV}=  //button[@id='importSOV']
${Choose_file}=    //input[@name='Sov_File']
${SOV_Save}=    //span[contains(text(),'Save')]
${Coverage-AOP}=  //input[@coverageid='593']
${Refresh_Receivable}=  //input[@id='btnGnrtRcv']

*** Keywords ***
Endt by Modifying only the TIV, limits, premiums
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Rating Base page
    Check and enter input    ${RB_TIV}    344011200
    Log To Console    Modified TIV Value
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
    Check and enter input    //input[@id='Coverages_1__DesiredLimits_0__Value']    300
    Check and enter input    //input[@id='Coverages_1__DesiredLimits_0__AggregateValue']    300
    Check and enter input    //input[@id='Coverages_1__DesiredDeductibles_0__Value']    3
    Check and enter input    //input[@id='Coverages_2__DesiredLimits_0__Value']    300
    Check and enter input    //input[@id='Coverages_2__DesiredLimits_0__AggregateValue']    300
    Check and enter input    //input[@id='Coverages_2__DesiredDeductibles_0__Value']    3
    Log To Console    Modified Limit Values
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoad  100
    Log To Console    Navigated to Quote Options page
    wait until element is not visible   globalAjaxLoad  100
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${QO_Penchange}
    Wait Until Element Is Visible    ${Penchange_Save}     25
    Click Element    ${Penchange_Save}
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input    ${Penchange_premium}   150000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   100000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   25337
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Modified Primiums Values
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${Create_Bundle-link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Endorsement Option page
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Bind Endorsement page
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${Coverage-AOP}  10
    Select Checkbox    ${Coverage-BE-AOP}
    Select Checkbox    ${Coverage-BE-EQ}
    Select Checkbox    ${Coverage-BE-flood}
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
    wait until element is visible    ${ID-UMS-BIND/ISSUE-TAB}    60
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  60
    mouse over  ${ID-UMS-BIND/ISSUE-TAB}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  100
    Log To Console    Navigated to SOV Upload page
    Click Element  ${ID-UMS-SOV}
    wait until element is not visible   globalAjaxLoading  100
    Click Button    ${UMS_Import_SOV}
    wait until element is not visible   globalAjaxLoading  100
    set focus to element  ${Choose_file}
    mouse over    ${Choose_file}
    wait until element is enabled  ${Choose_file}   20
    choose file  ${Choose_file}  ${CURDIR}\\SOV6.xlsx
    wait until element is not visible   globalAjaxLoading  100
    Click Element    ${SOV_Save}
    log to console    Uploaded SOV file by adding location
    wait until element is not visible   globalAjaxLoading  100
    Adding Endorsement    ${test_data} 
    Bind
    wait until element is visible    ${Button_Next}  10s
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Select Endorsement Radio Button    ${test_data}
    log to console    Endorsement Created
    Verify Generated Document Name    ${test_data}

Endt by Modifying only the TIV, limits, premiums and upload an SOV by deleting a location
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Rating Base page
    Check and enter input    ${RB_TIV}    326998900
    Log To Console    Modified TIV Value
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
    Check and enter input    //input[@id='Coverages_1__DesiredLimits_0__Value']    300
    Check and enter input    //input[@id='Coverages_1__DesiredLimits_0__AggregateValue']    300
    Check and enter input    //input[@id='Coverages_1__DesiredDeductibles_0__Value']    3
    Check and enter input    //input[@id='Coverages_2__DesiredLimits_0__Value']    300
    Check and enter input    //input[@id='Coverages_2__DesiredLimits_0__AggregateValue']    300
    Check and enter input    //input[@id='Coverages_2__DesiredDeductibles_0__Value']    3
    #Check and enter input    //input[@id='Coverages_3__DesiredLimits_0__Value']    300
    #Check and enter input    //input[@id='Coverages_3__DesiredLimits_0__AggregateValue']    300
    #Check and enter input    //input[@id='Coverages_3__DesiredDeductibles_0__Value']    10
    Log To Console    Modified Limit Values
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoad  100
    Log To Console    Navigated to Quote Options page
    wait until element is not visible   globalAjaxLoad  100
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${QO_Penchange}
    Wait Until Element Is Visible    ${Penchange_Save}     25
    Click Element    ${Penchange_Save}
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input    ${Penchange_premium}   150000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   50000
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Penchange_premium}   57973
    Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    #Check and enter input    ${Penchange_premium}   7973
    #Click Link    ${Penchange_Save-link}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Modified Primiums Values
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${Create_Bundle-link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Endorsement Option page
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Bind Endorsement page
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${Coverage-AOP}  10
    Select Checkbox    ${Coverage-BE-AOP}
    Select Checkbox    ${Coverage-BE-EQ}
    Select Checkbox    ${Coverage-BE-flood}
    #Select Checkbox    ${Coverage-BE-severconective}
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
    wait until element is visible    ${ID-UMS-BIND/ISSUE-TAB}    60
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  60
    mouse over  ${ID-UMS-BIND/ISSUE-TAB}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  100
    Click Element  ${ID-UMS-SOV}
    Log To Console    Navigated to SOV Upload page
    wait until element is not visible   globalAjaxLoading  100
    Click Button    ${UMS_Import_SOV}
    wait until element is not visible   globalAjaxLoading  100
    set focus to element  ${Choose_file}
    mouse over    ${Choose_file}
    wait until element is enabled  ${Choose_file}   20
    choose file  ${Choose_file}  ${CURDIR}\\SOV8.xlsx
    wait until element is not visible   globalAjaxLoading  100
    Click Element    ${SOV_Save}
    log to console    upload an SOV by deleting a location
    wait until element is not visible   globalAjaxLoading  100
    Adding Endorsement    ${test_data}
    Bind
    wait until element is visible    ${Button_Next}  10s
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Select Endorsement Radio Button    ${test_data}
    log to console    Endorsement Created
    Verify Generated Document Name    ${test_data}