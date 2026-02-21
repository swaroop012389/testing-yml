*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot

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
${Name-COV-COVERAGECODE}=    name=chkMasterSelectCovereage
${ID-COV-COVERAGECODE}=    id=chkMasterSelectCovereage
${Name-COV-ALL_RISK}=    name=ParentCoverageIDs
${Name-COV-SINGLE_PERIL}=    //td[@id='SINGLE_PERIL']//input[@value='472']
${Name-COV-TRIA}=    name=CoverageIDs
${COV-EDIT}=    //a[@id='coverageDate455']
${COV-RetroTypeId}=    id=RetroTypeId
${COV-CoverageDate_RetroDate}=    id=CoverageDate_RetroDate
${COV-CoverageDate_KnowledgeDate}=    id=CoverageDate_KnowledgeDate
${ID-COV-Quote-letter}=  link=Quote Letter
${ID-COV-retroDatepicker}=    id=retroDatepicker
${ID-COV-btnEditBroker}=    //button[contains(@id, 'btnEditBroker')]
${ID-COV-BrokerEntCode}=    id=BrokerEntCode
${ID-COV-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-COV-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-COV-KR-ApplyFilter}=  //span[contains(text(),'Apply Filter')]
${ID-COV-BrokerNexsureID}=  id=BrokerNexsureID
${KR-COV-Select}=    (//a[contains(@onclick, "assignRetailAgent")])[2]
${ID-COV-CorrespondingContactId}=    id=CorrespondingContactId
${KR-COV-OK}=    //button/span[text()='OK']
${KR-COV-Save}=    (//button/span[text()='Save'])[last()]
${KR-COV-insuredDatepicker}=    id=insuredDatepicker
${KR-COV-datepicker1}=    id=datepicker1
${KR-COV-datepicker2}=    id=datepicker2
${ID-RA-CorrespondingContactId}=    id=CorrespondingContactId
${KR-Cov-Next}=    //input[@value='Next']
### SAE_Res ###
${APP-ID-URL}=   http://model.ums.us.victorinsurance.com/Nexus/RatingCoverages/ViewCoverages/
${Name-Cov-PL}=    //input[@name='ParentCoverageIDs']
${please select}=  <please select>
${ID-Cov-OrganizationType}=  id=OrganizationInfoModel_OrganizationTypeId
${Name_NFP-DNO}=  (//input[@name='ParentCoverageIDs'])[1]
${Name_NFP-EPL}=  (//input[@name='ParentCoverageIDs'])[2]
${Name_NFP-FDU}=  (//input[@name='ParentCoverageIDs'])[3]
${Name_NFP-ELL}=  (//input[@name='ParentCoverageIDs'])[4]
${Name_NFP-CRIME}=  (//input[@name='ParentCoverageIDs'])[5]
${Name_NFP-KNR}=  (//input[@name='ParentCoverageIDs'])[6]

${Coverage-Option2}=    id=item153
${Express1kidnap-Option1}=    id=CoverageIDs_156
${Express1kidnap-Option1}=    id=CoverageIDs_176
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${RB-Refer}=    id=Rows_0__Table_Corteges_0__3__Value
${RB-Revenue-Baseprimium}=    id=Rows_0__Table_Corteges_1__3__Value
${RB-Total-Revenue}=    id=Rows_0__Table_Corteges_2__3__Value
${K&R_limit0}=  id=Coverages_0__DesiredLimits_0__Value
${K&R_Agg_limit0}=  id=Coverages_0__DesiredLimits_0__AggregateValue
${K&R_Deductibles_limit0}=  id=Coverages_0__DesiredDeductibles_0__Value
${K&R_limit1}=  id=Coverages_1__DesiredLimits_0__Value
${K&R_Agg_limit1}=  id=Coverages_1__DesiredLimits_0__AggregateValue
${K&R_Deductibles_limit1}=  id=Coverages_1__DesiredDeductibles_0__Value
${QuoteOption-checkbox}=    (//input[@type='checkbox'])[1]
${ID-UW-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${Endrosements}=  //a[contains(text(),'Endorsements')]
${Autolink-Endos}=  //a[contains(text(),'Autolink Endorsements')]
${Rating}=  //a[contains(text(),'Rating')]
${Submit}=   id=Submit
${Org-type-ID}=    //*[@id="organizationPanel"]/table/tbody/tr[1]/td[3]/table/tbody/tr[7]/td/span
${Org-type-serachbox}=   //div[@class='chosen-drop']
${Org-type-ID-name}=    (//input[@class='k-input-inner'])[8]
${Org-Type-Class}=      //*[@id="OrganizationInfoModel_OrganizationTypeId_chosen"]


*** Keywords ***
New Coverages for K&R
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
    Check and select from list by label  ${ID-COV-Total Billing Range}   ${test_data['Total Billing Range']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-RetroType}    ${test_data['Retro Type']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${KR-COV-insuredDatepicker}    ${test_data['Insured Since']}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is not visible   globalAjaxLoading  100
    #click element  //span[text()='<please select>']
    wait until element is not visible   globalAjaxLoading  120
    Wait Until Element Is Visible    ${Org-type-ID}     100
    Mouse Over    ${Org-type-ID}
    Click Element    ${Org-type-ID}
    sleep  1s
    Set Selenium Speed  0.1s
    Press Keys  NONE  OTHER type of Risk
    wait until element is not visible  globalAjaxLoading  120
    wait until element is not visible   globalAjaxLoading  120
#    Wait Until Element Is Visible  (//li/span[contains(text(),'OTHER type of Risk')])[1]  100
    Sleep    3s
    Press Keys    NONE  TAB
#    Click Element    (//li/span[contains(text(),'OTHER type of Risk')])[1]
    wait until element is not visible   globalAjaxLoading  120
    check and enter input    ${ID-COV-retroDatepicker}    ${test_data['Retro Date']}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-COV-btnEditBroker}
    wait until element is not visible   globalAjaxLoading  120
    check and enter input    ${ID-COV-BrokerEntCode}    ${test_data['PAS/Broker ID']}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-COV-KR-ApplyFilter}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${KR-COV-Select}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-RA-CorrespondingContactId}
    Press Keys    NONE  ARROW_DOWN
    Press Keys    NONE  RETURN
#    wait until element is visible    //select[@id='CorrespondingContactId']//option[3]    30
#    click element    //select[@id='CorrespondingContactId']//option[3]
    wait until element is not visible   globalAjaxLoading  100
    click element    ${KR-COV-OK}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Coverages-Apply}
    wait until element is not visible   globalAjaxLoading  200
    Sleep  1s
    Select Checkbox    ${Coverage-Option2}
    Select Checkbox    ${Express1kidnap-Option1}
    Select Checkbox    ${Express1kidnap-Option1}
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Rating Base page
    Check and enter input    ${RB-Refer}    ${test_data['Referral']}
    Clear Element Text    ${RB-Total-Revenue}
    Check and enter input    ${RB-Total-Revenue}    ${test_data['Revenue ($)']}
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Modifiers page
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Limit&Deductibles page
    Check and enter input    ${K&R_limit0}    ${testdata['limit0 Value0']}
    Check and enter input    ${K&R_Agg_limit0}    ${testdata['Agg limit0']}
    Check and enter input    ${K&R_Deductibles_limit0}     ${testdata['Deductibles limit0']}
    Check and enter input    ${K&R_limit1}    ${testdata['limit1 Value1']}
    Check and enter input    ${K&R_Agg_limit1}    ${testdata['Agg limit1']}
    Check and enter input    ${K&R_Deductibles_limit1}     ${testdata['Deductibles limit1']}
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Quote Options page
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
    Select Checkbox    ${QuoteOption-checkbox}
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Endorsement Option page
    Select Checkbox    ${QuoteOption-checkbox}
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    Log To Console    Navigated to Quote letter page
    select radio button  Action  Review
    click element  ${Submit}
    wait until element is not visible   globalAjaxLoading  100


    
