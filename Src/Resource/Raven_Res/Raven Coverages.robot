*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot
Resource    Raven Coverages Validation.robot
Resource    TC02 Validation.robot
Resource    TC03 Validation.robot
Resource    TC04Validation.robot

*** Variables ***
${ID-COV-Search-PolicyNumber}=  id=PolicyNumber
${COV-ClientSearch}=    //a[contains(@href, '/Nexus/ClientSearch')]
${ID-COV-Program}=    id=OrganizationInfoModel_ProgramId
${ID-COV-Division}=    id=OrganizationInfoModel_DivisionId
${ID-COV-RateTerritory}=    id=OrganizationInfoModel_RateTerritoryId
${ID-COV-PolicyTerm}=   id=OrganizationInfoModel_PolicyTermLenghtId
${ID-COV-Class}=   id=OrganizationInfoModel_FirmTypeId
${ID-COV-Total Billing Range}=    id=OrganizationInfoModel_TotalBillingRangeId
${ID-COV-RetroType}=    id=OrganizationInfoModel_RetroTypeId
${Coverages-Apply}=  id=applyButton
${ID-COV-RetroType} =    id=RetroTypeId
${ID-COV-btnEditBroker}=    //button[contains(@id, 'btnEditBroker')]
${ID-COV-BrokerEntCode}=    id=BrokerEntCode
${ID-COV-Raven-ApplyFilter}=  //span[contains(text(),'Apply Filter')]
${Raven-COV-Select}=    (//a[contains(@onclick, "assignRetailAgent")])
${Raven-COV-OK}=    //button/span[text()='OK']
${KR-COV-insuredDatepicker}=    id=insuredDatepicker
${ID-RA-CorrespondingContactId}=    id=CorrespondingContactId
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Coverage_AOP}=    id=item593
${Coverage_Earthquake}=    id=item595
${Coverage_Flood}=    id=item594
${Coverage_NAMEDWINDSTORM}=    id=item596
${Coverage_SEVERECONVECTIVE}=    id=CoverageIDs_598
${Coverage_Wildfire}=    id=CoverageIDs_598
${Coverage_CA-Earthquake}=    id=CoverageIDs_600
${Coverage_New-Madrid-Earthquake}=    id=CoverageIDs_601
${Coverage_Other-Earthquake}=    id=CoverageIDs_603
${Coverage_Pacific-NW-Earthquake}=    id=CoverageIDs_602
${Coverage_Special-Hazard-Flood}=    id=CoverageIDs_599
${Coverage_TRIA}=    id=CoverageIDs_604
${Coverage_TRIA-Rejected}=    id=CoverageIDs_605
${RB_TIV}=  id=Rows_0__Table_Corteges_0__3__Value
${Rate-Territory}=    //span[contains(text(),'OK')]
${Save-button}=    //input[@type='submit']
${KR-COV-insuredDatepicker}=    id=insuredDatepicker
${COV-datepicker1}=    id=datepicker1
${COV-datepicker2}=    id=datepicker2

*** Keywords ***
New Coverages for Raven
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${Coverage_Class}=    run keyword and return status  element should be visible    ${ID-COV-Class}
    run keyword if   ${Coverage_Class}    log to console   Navigated to Coverages page
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label   ${ID-COV-Class}    ${test_data['Class']}
    wait until element is not visible   globalAjaxLoading  200
    Check and select from list by label  ${ID-COV-Program}    ${test_data['Program']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-Division}   ${test_data['Division']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-RateTerritory}   ${test_data['Cov_Rate Territory']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-PolicyTerm}    ${test_data['Policy Term']}
    wait until element is not visible   globalAjaxLoading  120
#    ${Current_Eff_Date}=    get current date
#    ${Formated_current_date}=   Get Current Date    result_format=%m/%d/%Y
#    ${End_date}=    Add Time To Date    ${Current_Eff_Date}    365 days
#    ${Formatdate}=      Convert Date    ${End_date}     result_format=%m/%d/%Y
#    check and enter input   ${KR-COV-insuredDatepicker}    ${Formated_current_date}
#    wait until element is not visible   globalAjaxLoading  100
#    check and enter input   ${COV-datepicker1}    ${Formated_current_date}
#    wait until element is not visible   globalAjaxLoading  100
#    check and enter input   ${COV-datepicker2}    ${Formatdate}
#    wait until element is not visible   globalAjaxLoading  100
#    Run Keyword If    '${test_data['TC_ID']}' in ['TC_Raven_002']    Multi year term   ${test_data}
    Check and select from list by label  ${ID-COV-Total Billing Range}   ${test_data['Total Billing Range']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-RetroType}    ${test_data['Retro Type']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${KR-COV-insuredDatepicker}    ${test_data['Insured Since']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-btnEditBroker}
    wait until element is not visible   globalAjaxLoading  120
    check and enter input    ${ID-COV-BrokerEntCode}    ${test_data['PAS/Broker ID']}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-COV-Raven-ApplyFilter}
    wait until element is not visible   globalAjaxLoading  120
    Wait Until Element Is Visible    ${Raven-COV-Select}    50
    click element    ${Raven-COV-Select}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-RA-CorrespondingContactId}
    wait until element is visible    //select[@id='CorrespondingContactId']/option[2]   50
    click element    //select[@id="CorrespondingContactId"]/option[2]
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Raven-COV-OK}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Coverages-Apply}
    wait until element is not visible   globalAjaxLoading  400
    ${Different-Rate-territory}=  run keyword and return status    element should be visible   ${Rate-Territory}
    run keyword if    ${Different-Rate-territory}    click element    ${Rate-Territory}
    Sleep    2s
    ${Save}=  run keyword and return status    element should be visible   ${Save-button}
    run keyword if    ${Save}    click element    ${Save-button}
    wait until element is not visible   globalAjaxLoading  100
    Run Keyword If    '${test_data['TC_ID']}' in ['TC_Raven_001']    Validation for AOP Coverage   ${test_data}
    Run Keyword If    '${test_data['TC_ID']}' in ['TC_Raven_004']    Coverages before Quote   ${test_data}
    IF    '${test_data['Aop Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_AOP}
    END
    IF    '${test_data['Earthquake Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_Earthquake}
    END
    IF    '${test_data['Flood Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_Flood}
    END
    IF    '${test_data['Namedwindstorm Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_NAMEDWINDSTORM}
    END
#    IF    '${test_data['Severeconvective Coverage']}' == 'YES'
#    Select Checkbox    ${Coverage_SEVERECONVECTIVE}
#    END
    IF    '${test_data['Wildfire Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_Wildfire}
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
    IF    '${test_data['Special Hazard Flood Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_Special-Hazard-Flood}
    END
    IF    '${test_data['Tria Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_TRIA}
    END
    IF    '${test_data['Tria rejected Coverage']}' == 'YES'
    Select Checkbox    ${Coverage_TRIA-Rejected}
    END
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Rating Base page
    Run Keyword If    '${test_data['TC_ID']}' in ['TC_Raven_003']    TIV Error message
    Check and enter input    ${RB_TIV}    ${test_data['TIV']}
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Modifiers page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100




    
