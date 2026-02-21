*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

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
${ID-COV-RetailBrokerName}=    id=BrokerName
${COV-RetroTypeId}=    id=RetroTypeId
${COV-CoverageDate_RetroDate}=    id=CoverageDate_RetroDate
${COV-CoverageDate_KnowledgeDate}=    id=CoverageDate_KnowledgeDate
${ID-COV-Quote-letter}=  link=Quote Letter
${ID-COV-retroDatepicker}=    id=retroDatepicker
${ID-COV-btnEditBroker}=    //button[contains(@id, 'btnEditBroker')]
${ID-COV-BrokerEntCode}=    id=BrokerEntCode
${ID-COV-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-COV-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-COV-ApplyFilter}=  //input[@value='Apply Filter']
${ID-Cov-ApplyBrokerSearch}=  //button[@id='applyButtonBrokerSearch']
${ID-COV-BrokerNexsureID}=  id=BrokerNexsureID
${COV-Select}=    //a[contains(@onclick, "assignRetailAgent")]
${ID-COV-CorrespondingContactId}=    id=CorrespondingContactId
${COV-OK}=    //button/span[text()='OK']
${COV-Save}=    (//button/span[text()='Save'])[last()]
${COV-insuredDatepicker}=    id=insuredDatepicker
${COV-datepicker1}=    id=datepicker1
${COV-datepicker2}=    id=datepicker2
${ID-RA-CorrespondingContactId}=    id=CorrespondingContactId
${Cov-Next}=    //input[@value='Next']
${Org-type-ID}=    //span[@class='k-input-value-text']
${Org-type-ID-name}=    (//input[@class='k-input-inner'])[8]
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
###K&R###
${Org-type-ID}=     //*[@id="OrganizationInfoModel_OrganizationTypeId_chosen"]
${Org-type-serachbox}=   //div[@class='chosen-drop']
${Org-type-ID-name}=    //input[@class='chosen-search-input']
${Org-Type-Class}=      //*[@id="OrganizationInfoModel_OrganizationTypeId_chosen"]
###ML-PRIVATE##

${ID-Cov-ERP-DNO}=    id=CoverageIDs_561
${ID-Cov-ERP-EPL}=    id=CoverageIDs_581
${ID-Cov-ERP-FDU}=    id=CoverageIDs_584
${ID-Cov-ERP2-DNO}=    id=CoverageIDs_562
${ID-Cov-ERP2-EPL}=    id=CoverageIDs_582
${ID-Cov-ERP2-FDU}=    id=CoverageIDs_585
${ID-Cov-ERP3-DNO}=    id=CoverageIDs_563
${ID-Cov-ERP3-EPL}=    id=CoverageIDs_583
${ID-Cov-ERP3-FDU}=    id=CoverageIDs_586
${ID-Cov-Runoff-DNO}=    id=CoverageIDs_571
${ID-Cov-Runoff-EPL}=    id=CoverageIDs_587
${ID-Cov-Runoff-FDU}=    id=CoverageIDs_590
${ID-Cov-Runoff3-DNO}=    id=CoverageIDs_572
${ID-Cov-Runoff3-EPL}=    id=CoverageIDs_588
${ID-Cov-Runoff3-FDU}=    id=CoverageIDs_591
${ID-Cov-Runoff6-DNO}=    id=CoverageIDs_573
${ID-Cov-Runoff6-EPL}=    id=CoverageIDs_589
${ID-Cov-Runoff6-FDU}=    id=CoverageIDs_592

*** Keywords ***
New Coverages
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[2]
    ${Coverage_Class}=    run keyword and return status  element should be visible    ${ID-COV-Class}
    run keyword if   ${Coverage_Class}    log to console   Navigated to Coverages page
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label   ${ID-COV-Class}    ${test_data['Class']}
    wait until element is not visible   globalAjaxLoading  100
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
    check and enter input   ${COV-insuredDatepicker}    ${test_data['Insured Since']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${COV-datepicker1}    ${test_data['Start Date']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${COV-datepicker2}    ${test_data['End Date']}
    wait until element is not visible   globalAjaxLoading  120
    check and enter input    ${ID-COV-retroDatepicker}    ${test_data['Retro Date']}
    wait until element is not visible   globalAjaxLoading  120
    wait until element is not visible   globalAjaxLoading  120
    Wait Until Element Is Visible    ${Org-type-ID}     100
    Mouse Over    ${Org-type-ID}
    Click Element    ${Org-type-ID}
    sleep  0.6s
    Set Selenium Speed  0.1s
#    Click Element   //input[@role='searchbox']
#    Wait Until Element Is Visible    //input[@role='searchbox']     5s
#    Input Text   //input[@role='searchbox']    ${test_data['Oraganization Type']}
    Press Keys    NONE  ${test_data['Oraganization Type']}
    wait until element is not visible   globalAjaxLoading  120
    wait until element is not visible   globalAjaxLoading  120
#    Wait Until Element Is Visible    (//li/span[contains(text(),'${test_data['Oraganization Type']}')])[8]    100
    Sleep    1s
#    Click Element    (//li/span[contains(text(),'${test_data['Oraganization Type']}')])[8]
#    wait until element is not visible   globalAjaxLoading  120
    Press Keys    NONE  RETURN
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-COV-btnEditBroker}
    wait until element is not visible   globalAjaxLoading  120
    check and enter input    ${ID-COV-RetailBrokerName}    ${test_data['Retail Agent Name']}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-Cov-ApplyBrokerSearch}
    wait until element is not visible   globalAjaxLoading  120
    wait until element is visible  ${COV-Select}
    click element    ${COV-Select}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-RA-CorrespondingContactId}
    wait until element is visible    (//select//option[contains(text(),'${test_data['Corresponding Contact']}')])[1]    30
    click element    (//select//option[contains(text(),'${test_data['Corresponding Contact']}')])[1]
    wait until element is not visible   globalAjaxLoading  100
    click element    ${COV-OK}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Coverages-Apply}
    run keyword if  '${test_data['KNR Checkbox']}' == 'Yes'  Coverages KNR  ${test_data}
    wait until element is not visible   globalAjaxLoading  200
    Sleep  1s
    run keyword if  '${test_data['COVERAGE CODE']}' == 'YES'  select checkbox  ${Name-COV-COVERAGECODE}
    wait until element is not visible   globalAjaxLoading  150
    run keyword if  '${test_data['ALL_RISK']}' == 'YES'  select checkbox  ${Name-COV-ALL_RISK}
    wait until element is not visible   globalAjaxLoading  150
    run keyword if  '${test_data['SINGLE_PERIL']}' == 'YES'  select checkbox  ${Name-COV-SINGLE_PERIL}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['TRIA']}' == 'YES'  run keywords    select checkbox  ${Name-COV-TRIA}    AND  TRIA  ${test_data}    ELSE    Without_TRIA
    wait until element is not visible   globalAjaxLoading  100

Coverages
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${Coverage_Class}=    run keyword and return status  element should be visible    ${ID-COV-Class}
    run keyword if   ${Coverage_Class}    log to console   Navigated to Coverages page
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label   ${ID-COV-Class}    ${test_data['Class']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label   ${ID-COV-RetroType}    ${test_data['Retro Type']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${COV-datepicker1}    ${test_data['Start Date']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${COV-datepicker2}    ${test_data['End Date']}
    wait until element is not visible   globalAjaxLoading  100
    ${Insured_Since}=  run keyword and return status    element should be visible    //input[@id='insuredDatepicker' and @type='text']
    run keyword if    ${Insured_Since}    check and enter input   ${COV-insuredDatepicker}    ${test_data['Insured Since']}
    wait until element is not visible   globalAjaxLoading  120
    check and enter input    ${ID-COV-retroDatepicker}    ${test_data['Retro Date']}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${Coverages-Apply}
    wait until element is not visible   globalAjaxLoading  120
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['COVERAGE CODE']}' == 'YES'  select checkbox  ${Name-COV-COVERAGECODE}
    wait until element is not visible   globalAjaxLoading  150
    run keyword if  '${test_data['ALL_RISK']}' == 'YES'  select checkbox  ${Name-COV-ALL_RISK}
    wait until element is not visible   globalAjaxLoading  150
    run keyword if  '${test_data['SINGLE_PERIL']}' == 'YES'  select checkbox  ${Name-COV-SINGLE_PERIL}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['TRIA']}' == 'YES'  run keywords    select checkbox  ${Name-COV-TRIA}    AND  TRIA  ${test_data}    ELSE    Without_TRIA
    wait until element is not visible   globalAjaxLoading  100

TRIA
    [Arguments]    ${test_data}
    click element    ${COV-EDIT}
    wait until element is not visible   globalAjaxLoading  100
    check and select from list by label    ${COV-RetroTypeId}  ${test_data['RetroTypeId']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${COV-CoverageDate_RetroDate}    ${test_data['CoverageDate_RetroDate']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${COV-CoverageDate_KnowledgeDate}   ${test_data['CoverageDate_KnowledgeDate']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${COV-Save}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  200
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Without_TRIA
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Endorsement Coverages
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${Coverage_Next}=    run keyword and return status  element should be visible    ${Cov-Next}
    run keyword if   ${Coverage_Next}    log to console   Navigated to Coverages page
    wait until element is not visible   globalAjaxLoading  350
    click element    ${Cov-Next}
    wait until element is not visible   globalAjaxLoading  100

### SAE_Res ####
Login to UMS_Coverages
    [Arguments]    &{test_data}
    Set selenium implicit wait  30
    ${App_ID}=    set variable   ${test_data['App-id']}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${disabled}    Create List    Chrome PDF Viewer
    ${disabled}    Create List    Chrome PDF Viewer
    ${prefs}    Create Dictionary    download.default_directory=${download directory}    plugins.always_open_pdf_externally=${False}   useAutomationExtension=${False}  plugins.plugins_disabled=${disabled}
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create WebDriver    Chrome    chrome_options=${options}
    go to  ${APP-ID-URL}${App_ID}
    maximize browser window

SAE Coverages
    [Arguments]    &{test_data}
    ${Coverage_Class}=    run keyword and return status  element should be visible    ${ID-COV-Class}
    run keyword if   ${Coverage_Class}    log to console   Navigated to Coverages page
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label  ${ID-COV-Total Billing Range}   ${test_data['Total Billing Range']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-RateTerritory}   ${test_data['Rate Territory']}
    wait until element is not visible   globalAjaxLoading  10
    check and enter input  ${ID-COV-retroDatepicker}  ${test_data['Retro_Date']}
    click element    ${Coverages-Apply}
    wait until element is not visible   globalAjaxLoading  120
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['Primary_Coverage']}' == 'PL'    select checkbox    ${Name-Cov-PL}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  200
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Insurance Date
    ${Insurance_Date}=    get value    //input[@id="insuredDatepicker"]
    input text    ${ID-COV-retroDatepicker}    ${Insurance_Date}

DNO_Private_New Coverages
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${Coverage_Class}=    run keyword and return status  element should be visible    ${ID-COV-Class}
    run keyword if   ${Coverage_Class}    log to console   Navigated to Coverages page
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label  ${ID-COV-RateTerritory}   ${test_data['Cov_Rate Territory']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label   ${ID-COV-Class}    ${test_data['Class']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label  ${ID-COV-Program}    ${test_data['Program']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-Division}   ${test_data['Division']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-PolicyTerm}    ${test_data['Policy Term']}
    wait until element is not visible   globalAjaxLoading  120
    Check and select from list by label  ${ID-COV-Total Billing Range}   ${test_data['Total Billing Range']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-COV-RetroType}    ${test_data['Retro Type']}
    wait until element is not visible   globalAjaxLoading  100
    click element  //span[text()='<please select>']
    wait until element is not visible   globalAjaxLoading  100
    click element  //input[@class="chosen-search-input"]
    press keys  //input[@class="chosen-search-input"]  ${test_data['Organization Type']}  RETURN
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${COV-insuredDatepicker}    ${test_data['Insured Since']}
    wait until element is not visible   globalAjaxLoading  100
    ${Date-current}=  get current date  result_format=%m-%d-%Y
    check and enter input   ${COV-datepicker1}    ${test_data['Start Date']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${COV-datepicker2}    ${test_data['End Date']}
    wait until element is not visible   globalAjaxLoading  120
    check and enter input    ${ID-COV-retroDatepicker}    ${test_data['Retro Date']}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-COV-btnEditBroker}
    wait until element is not visible   globalAjaxLoading  120
    check and enter input    ${ID-COV-BrokerNexsureID}    ${test_data['Retail Agent ID']}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-COV-ApplyFilter}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${COV-Select}
    wait until element is not visible   globalAjaxLoading  120
    click element    ${ID-RA-CorrespondingContactId}
    wait until element is visible    //select[@id='CorrespondingContactId']//option[3]    30
    click element    //select[@id='CorrespondingContactId']//option[3]
    wait until element is not visible   globalAjaxLoading  100
    click element    ${COV-OK}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Coverages-Apply}
    wait until element is not visible   globalAjaxLoading  200
    Sleep  1s
    run keyword if  '${test_data['COVERAGE CODE']}' == 'YES'  run keyword  select checkbox  ${ID-COV-COVERAGECODE}
    run keyword if  '${test_data['COV_NFP-DNO']}' == 'YES'  run keywords  select checkbox  ${Name_NFP-DNO}  AND   DNO_Private_P&PDate  ${test_data}  1
    run keyword if  '${test_data['COV_NFP-EPL']}' == 'YES'  run keywords  select checkbox  ${Name_NFP-EPL}  AND   DNO_Private_P&PDate  ${test_data}  2
    run keyword if  '${test_data['COV_NFP-FDU']}' == 'YES'  run keywords  select checkbox  ${Name_NFP-FDU}  AND   DNO_Private_P&PDate  ${test_data}  3
    run keyword if  '${test_data['COV_NFP-ELL']}' == 'YES'  run keywords  select checkbox  ${Name_NFP-ELL}  AND   DNO_Private_P&PDate  ${test_data}  4
    run keyword if  '${test_data['COV_NFP-CRIME']}' == 'YES'  select checkbox  ${Name_NFP-CRIME}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['COV_NFP-KNR']}' == 'YES'  select checkbox  ${Name_NFP-KNR}
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

DNO_Private_P&PDate
    [Arguments]  ${test_data}  ${number}
    click element  (//a[contains(@href, "javascript:editDate")])[${number}]
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  (//input[@name="PnPDate"])[1]  ${test_data['P&P Date']}
    wait until element is not visible   globalAjaxLoading  100
    click element  (//span[text()="Save"])[2]

Coverages KNR
    [Arguments]    ${test_data}
    IF      '${test_data['Oraganization Type']}' == 'ASRM Risk'
               ASRM Risk selected      ${test_data}
    ELSE IF    '${test_data['Oraganization Type']}' == 'ASRM K12 Risk'
               ASRM Risk selected      ${test_data}
    ELSE
               wait until element is not visible   globalAjaxLoading  100
               wait until element is visible   //input[@value='${test_data['1ExpressKidnap']}']
               Click Element    //input[@value='${test_data['1ExpressKidnap']}']
               wait until element is visible   //input[@value='${test_data['1ThreatExpense']}']
               Click Element   //input[@value='${test_data['1ThreatExpense']}']
               wait until element is visible   //input[@value='${test_data['1DissapEndorsement']}']
               Click Element   //input[@value='${test_data['1DissapEndorsement']}']
    END

    #Run Keyword If    '${test_data['Oraganization Type']}' == 'ASRM Risk'    ASRM Risk selected      ${test_data}
    #wait until element is visible  //input[@value='${test_data['1ExpSecEvacEndorsementE305']}']
    #Click Element  //input[@value='${test_data['1ExpSecEvacEndorsementE305']}']
    #wait until element is visible  //input[@value='${test_data['1TravEvacEndorsementE307']}']
    #Click Element  //input[@value='${test_data['1TravEvacEndorsementE307']}']
    #wait until element is visible   //input[@value='${test_data['1StandChildAbdEndorsementASRME308']}']
    #Click Element   //input[@value='${test_data['1StandChildAbdEndorsementASRME308']}']
    #wait until element is visible  //input[@value='${test_data['1AltLossEndorsementE315']}']
    #Click Element   //input[@value='${test_data['1AltLossEndorsementE315']}']
    #wait until element is visible  //input[@value='${test_data['1AssaultExpEndorsementASRME316']}']
    #Click Element   //input[@value='${test_data['1AssaultExpEndorsementASRME316']}']

NO Org type is sleceted
    [Arguments]    ${test_data}
    wait until element is visible  //input[@value='${test_data['1TravEvacEndorsementE306']}']
    Click Element  //input[@value='${test_data['1TravEvacEndorsementE306]}']
    wait until element is visible  //input[@value='${test_data['1TravEvacEndorsementE307']}']
    Click Element  //input[@value='${test_data['1TravEvacEndorsementE307']}']
    wait until element is visible   //input[@value='${test_data['1StandChildAbdEndorsementASRME308']}']
    Click Element   //input[@value='${test_data['1StandChildAbdEndorsementASRME308']}']
    wait until element is visible  //input[@value='${test_data['1AltLossEndorsementE315']}']
    Click Element   //input[@value='${test_data['1AltLossEndorsementE315']}']
    wait until element is visible  //input[@value='${test_data['1AssaultExpEndorsementASRME316']}']
    Click Element   //input[@value='${test_data['1AssaultExpEndorsementASRME316']}']

ASRM Risk selected
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible   //input[@value='${test_data['1ExpressKidnapASRM']}']
    Click Element    //input[@value='${test_data['1ExpressKidnapASRM']}']
    wait until element is visible   //input[@value='${test_data['1ThreatExpenseASRM']}']
    Click Element   //input[@value='${test_data['1ThreatExpenseASRM']}']
    wait until element is visible   //input[@value='${test_data['1DissapEndorsementASRM']}']
    Click Element   //input[@value='${test_data['1DissapEndorsementASRM']}']

ML-PRIVATE ERP
    [Arguments]    ${test_data}
    click element    ${ID-Cov-ERP-DNO}
    click element    ${ID-Cov-ERP-EPL}
    click element    ${ID-Cov-ERP-FDU}
    click element    ${ID-Cov-ERP2-DNO}
    click element    ${ID-Cov-ERP2-EPL}
    click element    ${ID-Cov-ERP2-FDU}
    click element    ${ID-Cov-ERP3-DNO}
    click element    ${ID-Cov-ERP3-EPL}
    click element    ${ID-Cov-ERP3-FDU}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

ML-PRIVATE Run-Off
    click element    ${ID-Cov-Runoff-DNO}
    click element    ${ID-Cov-Runoff-EPL}
    click element    ${ID-Cov-Runoff-FDU}
    click element    ${ID-Cov-Runoff3-DNO}
    click element    ${ID-Cov-Runoff3-EPL}
    click element    ${ID-Cov-Runoff3-FDU}
    click element    ${ID-Cov-Runoff6-DNO}
    click element    ${ID-Cov-Runoff6-EPL}
    click element    ${ID-Cov-Runoff6-FDU}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}