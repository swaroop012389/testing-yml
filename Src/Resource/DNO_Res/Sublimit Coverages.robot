*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../Resource/DNO_Res/DNO_General_Information.robot

*** Variables ***
${MLP_SC_DNOInvestigativeCosts}=    //input[@name='DNOInvestigativeCosts']
${MLP_SC_DNOAssetProtectionCosts}=    //input[@name='DNOAssetProtectionCosts']
${MLP_SC_DNOPublicRelationsCosts}=    //input[@name='DNOPublicRelationsCosts']
${MLP_SC_DNOAdditionalLimit}=    //input[@name='DNOAdditionalSideALimit']
${MLP_SC_DNOSeparateDefenseCost}=    //input[@name='DNOSeparateDefenseCost']
${MLP_SC_DNOCrisisExpenses}=    //input[@name='DNOCrisisExpenses']
${MLP_SC_EPLCrisisExpenses}=    //input[@name='EPLCrisisExpenses']
${MLP_SC_EPLImmigrationDefense}=    //input[@name='EPLImmigrationDefense']
${MLP_SC_EPLDefenseCost}=    //input[@name='EPLSeparateDefenseCost']
${MLP_SC_EPLWageHourDefenseCosts}=    //input[@name='EPLWageandHourDefenseCosts']
${MLP_SC_EPLWageHour}=    //input[@name='EPLWageandHourDefenseCosts']
${MLP_SC_EPLViolenceExpenses}=    //input[@name='EPLWorkplaceViolenceExpenses']
${MLP_SC_EPLWorkplaceViolenceExpenses}=   //input[@name='EPLWorkplaceViolenceExpenses']
${MLP_SC_FDUVoluntaryCompliance}=   //input[@name='FDUVoluntaryComplianceProgramCosts']
${MLP_SC_FDUPrivacyProvisions}=    //input[@name='FDUHIPAA']
${MLP_SC_FDUSection502}=    //input[@name='FDUERISA']
${MLP_SC_FDUActof2006}=    //input[@name='FDUPensionProtectionAct']
${MLP_SC_FDUCareAct}=    //input[@name='FDUAffordableCare']
${MLP_SC_FDUSection4975}=    //input[@name='FDUIRCSection4975']
${MLP_SC_FDUDefenseCost}=    //input[@name='FDUSeparateDefenseCost']
${MLP_SC_CRIMEExpenseCoverageLimit}=    //input[@name='ExpenseCoverageLimit']
${MLP_SC_CRIMEExpenseCoverage}=    //input[@name='ExpenseCoverageDed']
${MLP_SC_CRIMESocialEngineeringFraudLimit}=    //input[@name='SocialEngLimit']
${MLP_SC_CRIMESocialEngineeringFraudDeductible}=    //input[@name='SocialEngFraudDed']
${MLP_SC_CRIMETollFraud}=    //input[@name='TelephoneTollFraud']
${MLP_SC_DNOEmployedLawyers}=  //input[@name='ELLEndorsement']

*** Variables ***
@{EPLViolenceExpenses}=    Louisiana   Kentucky  Kansas
@{EPLWageHour}=  Texas   California  Kansas

*** Keywords ***
Private Sublimit Coverages Page
     [Arguments]  &{test_data}
     sleep  5s
     wait until page contains  Investigative Costs  10s
     Run Keyword If  '${test_data['Program']}' == 'ML-PRIVATE' and '${test_data["DNO"]}' == 'YES'   DNO Default Sublimit Validation   &{test_data}
     Run Keyword If  '${test_data['Program']}' == 'ML-PRIVATE' and '${test_data["Are you Interested in ELL coverage?"]}' == 'YES'   ELL Default Sublimit Validation   &{test_data}
     Run Keyword If  '${test_data['Program']}' == 'ML-PRIVATE' and '${test_data["EPL"]}' == 'YES'   EPL Default Sublimit Validation   &{test_data}
     Run Keyword If  '${test_data['Program']}' == 'ML-PRIVATE' and '${test_data["Fiduciary"]}' == 'YES'   Fiduciary Default Sublimit Validation   &{test_data}
     Run Keyword If  '${test_data['Program']}' == 'ML-PRIVATE' and '${test_data["Crime Coverage"]}' == 'YES'   Crime Default Sublimit Validation   &{test_data}
     Scroll Element Into View    ${IDcontinue}
     continue Click RE
     sleep  10s
     ${Broker_Terms_Checkbox}=  Run Keyword And Return Status   Page Should Contain Element     //input[@type='checkbox']
     Run Keyword If   ${Broker_Terms_Checkbox}  Click Element  //input[@type='checkbox']
     Run Keyword If   ${Broker_Terms_Checkbox}  continue Click RE

DNO Default Sublimit Validation
    [Arguments]  &{test_data}
    Log To Console   "Directors and Officers Liability Coverage Sublimits"
    ${Value-SC-DNOInvestigativeCosts}=  Get Value   ${MLP_SC_DNOInvestigativeCosts}
    run keyword if  '${Value-SC-DNOInvestigativeCosts}' == '${test_data["Investigative Costs"]}'  Log To Console   ${Value-SC-DNOInvestigativeCosts}-"The default value for "Investigation costs is correct"  ELSE  Log to console  ${Value-SC-DNOInvestigativeCosts}-"The default value for "Investigation costs" is wrong."
    ${Value-SC-DNOAssetProtectionCosts}=  Get Value   ${MLP_SC_DNOAssetProtectionCosts}
    run keyword if  '${Value-SC-DNOAssetProtectionCosts}' == '${test_data["Asset Protection Costs"]}'    Log To Console   ${Value-SC-DNOAssetProtectionCosts}-"The default value for "Asset Protection Costs" is correct"  ELSE  Log to console  ${Value-SC-DNOAssetProtectionCosts}-"The default value for "Asset Protection Costs" is wrong."
    ${Value-SC-DNOPublicRelationsCosts}=  Get Value  ${MLP_SC_DNOPublicRelationsCosts}
    run keyword if  '${Value-SC-DNOPublicRelationsCosts}' == '${test_data["Public Relations Costs"]}'   Log To Console   ${Value-SC-DNOPublicRelationsCosts}-"The default value for "Public Relations Costs" is correct"  ELSE  Log to console  ${Value-SC-DNOPublicRelationsCosts}-"The default value for "Public Relations Costs" is wrong."
    ${Value-SC-DNOAdditionalLimit}=  Get Value   ${MLP_SC_DNOAdditionalLimit}
    run keyword if  '${Value-SC-DNOAdditionalLimit}' == '${test_data["Additional Side A Limit for Directors and Officers Liability"]}'  Log To Console   ${Value-SC-DNOAdditionalLimit}-"The default value for "Additional Side A Limit for Directors and Officers Liability" is correct"  ELSE  Log to console  ${Value-SC-DNOAdditionalLimit}-"The default value for "Additional Side A Limit for Directors and Officers Liability" is wrong."
    ${Value-SC-DNOSeparateDefenseCost}=  Get Value   ${MLP_SC_DNOSeparateDefenseCost}
    run keyword if  '${Value-SC-DNOSeparateDefenseCost}' == '${test_data["Separate Defense Cost Coverage Limit"]}'   Log To Console   ${Value-SC-DNOSeparateDefenseCost}-"The default value for "Separate Defense Cost Coverage Limit" is correct"  ELSE  Log to console  ${Value-SC-DNOSeparateDefenseCost}-"The default value for "Separate Defense Cost Coverage Limit" is wrong."
    ${Value-SC-DNOCrisisExpenses}=  Get Value   ${MLP_SC_DNOCrisisExpenses}
    run keyword if  '${Value-SC-DNOCrisisExpenses}' == '${test_data["D&O Crisis Expenses"]}'   Log To Console   ${Value-SC-DNOCrisisExpenses}-"The default value for "D&O Crisis Expenses" is correct"  ELSE  Log to console  ${Value-SC-DNOCrisisExpenses}-"The default value for "D&O Crisis Expenses" is wrong."

EPL Default Sublimit Validation
    [Arguments]  &{test_data}
    Log To Console   ***********************************************
    Log To Console   "Employment Practices Liability Coverage Sublimits"
    ${Value-SC-EPLCrisisExpenses}=  Get Value   ${MLP_SC_EPLCrisisExpenses}
    run keyword if  '${Value-SC-EPLCrisisExpenses}' == '${test_data["EPL Crisis Expenses"]}'   Log To Console  ${Value-SC-EPLCrisisExpenses}-"The default value for 'EPL Crisis Expenses' is correct"  ELSE   Log To Console  ${Value-SC-EPLCrisisExpenses}-"The default value for 'EPL Crisis Expenses' is wrong."
    ${Value-SC-EPLImmigrationDefense}=  Get Value   ${MLP_SC_EPLImmigrationDefense}
    run keyword if  '${Value-SC-EPLImmigrationDefense}' == '${test_data["Immigration Defense"]}'  Log To Console  ${Value-SC-EPLImmigrationDefense}-"The default value for 'Immigration Defense' is correct"  ELSE   Log To Console  ${Value-SC-EPLCrisisExpenses}-"The default value for 'Immigration Defense' is wrong."
    ${Value-SC-EPLDefenseCost}=  Get Value   ${MLP_SC_EPLDefenseCost}
    run keyword if  '${Value-SC-EPLDefenseCost}' == '${test_data["Separate Defense Cost Coverage Limit"]}'  Log To Console  ${Value-SC-EPLDefenseCost}-"The default value for 'Separate Defense Cost Coverage Limit' is correct"  ELSE   Log To Console  ${Value-SC-EPLCrisisExpenses}-"The default value for 'Separate Defense Cost Coverage Limit' is wrong."
    ${EPLWageHour-check} =  run keyword and return status  list should contain value  ${EPLWageHour}  ${test_data['State']}
    ${Value-SC-EPLWageHour}=  run keyword if    ${EPLWageHour-check}    Get Value   ${MLP_SC_EPLWageHourDefenseCosts}  ELSE   Get Value   ${MLP_SC_EPLWageHour}
    run keyword if  '${Value-SC-EPLWageHour}' == '${test_data["Wage and Hour Defense Costs"]}'   Log To Console  ${Value-SC-EPLWageHour}-"The default value for 'Wage and Hour Defense Costs' is correct"  ELSE   Log To Console  ${Value-SC-EPLCrisisExpenses}-"The default value for 'Wage and Hour Defense Costs' is wrong."
    ${EPLViolenceExpenses-check} =  run keyword and return status  list should contain value  ${EPLViolenceExpenses}  ${test_data['State']}
    ${Value-SC-EPLViolenceExpenses}=  run keyword if    ${EPLViolenceExpenses-check}    Get Value  ${MLP_SC_EPLWorkplaceViolenceExpenses}  ELSE  Get Value   ${MLP_SC_EPLViolenceExpenses}
   # ${Value-SC-EPLViolenceExpenses}=  run keyword if  '${test_data["State"]}' == 'Louisiana'  Get Value  ${MLP_SC_EPLWorkplaceViolenceExpenses}  ELSE  Get Value   ${MLP_SC_EPLViolenceExpenses}
    run keyword if  '${Value-SC-EPLViolenceExpenses}' == '${test_data["Workplace Violence Expenses"]}'  Log To Console  ${Value-SC-EPLViolenceExpenses}-"The default value for 'Workplace Violence Expenses' is correct"  ELSE   Log To Console  ${Value-SC-EPLCrisisExpenses}-"The default value for 'Workplace Violence Expenses' is wrong."

Fiduciary Default Sublimit Validation
    [Arguments]  &{test_data}
    Log To Console   ***********************************************      
    Log To Console   "Fiduciary Liability Coverage Sublimits"
    ${Value-SC-FDUVoluntaryCompliance}=  Get Value  ${MLP_SC_FDUVoluntaryCompliance}
    run keyword if   '${Value-SC-FDUVoluntaryCompliance}' == '${test_data["Voluntary Compliance Program Costs"]}'  Log to Console  ${Value-SC-FDUVoluntaryCompliance}-"The default value for 'Voluntary Compliance Program Costs' is correct"  ELSE  Log to Console  ${Value-SC-FDUVoluntaryCompliance}-"The default value for 'Voluntary Compliance Program Costs' is wrong"
    ${Value-SC-FDUPrivacyProvisions}=  Get Value  ${MLP_SC_FDUPrivacyProvisions}
    run keyword if   '${Value-SC-FDUPrivacyProvisions}' == '${test_data["Penalties For Violations of HIPAA Privacy Provisions"]}'  Log to Console  ${Value-SC-FDUPrivacyProvisions}-"The default value for 'Penalties For Violations of HIPAA Privacy Provisions' is correct"  ELSE  Log to Console  ${Value-SC-FDUPrivacyProvisions}-"The default value for 'Penalties For Violations of HIPAA Privacy Provisions' is wrong"
    ${Value-SC-FDUSection502}=  Get Value  ${MLP_SC_FDUSection502}
    run keyword if   '${Value-SC-FDUSection502}' == '${test_data["Penalties under Section 502(c) of ERISA"]}'  Log to Console  ${Value-SC-FDUSection502}-"The default value for 'Penalties under Section 502(c) of ERISA' is correct"  ELSE  Log to Console  ${Value-SC-FDUSection502}-"The default value for 'Penalties under Section 502(c) of ERISA' is wrong"
    ${Value-SC-FDUActof2006}=  Get Value  ${MLP_SC_FDUActof2006}
    run keyword if   '${Value-SC-FDUActof2006}' == '${test_data["Penalties under the Pension Protection Act of 2006"]}'  Log to Console  ${Value-SC-FDUActof2006}-"The default value for 'Penalties under the Pension Protection Act of 2006' is correct"   ELSE  Log to Console  ${Value-SC-FDUActof2006}-"The default value for 'Penalties under the Pension Protection Act of 2006' is wrong"
    ${Value-SC-FDUCareAct}=  Get Value  ${MLP_SC_FDUCareAct}
    run keyword if   '${Value-SC-FDUCareAct}' == '${test_data["Penalties under the Affordable Care Act"]}'  Log to Console  ${Value-SC-FDUCareAct}-"The default value for 'Penalties under the Affordable Care Act' is correct"  ELSE  Log to Console  ${Value-SC-FDUCareAct}-"The default value for 'Penalties under the Affordable Care Act' is wrong"
    ${Value-SC-FDUSection4975}=  Get Value  ${MLP_SC_FDUSection4975}
    run keyword if   '${Value-SC-FDUSection4975}' == '${test_data["Penalty under IRC Section 4975"]}'  Log to Console  ${Value-SC-FDUSection4975}-"The default value for 'Penalty under IRC Section 4975' is correct"  ELSE  Log to Console  ${Value-SC-FDUSection4975}-"The default value for 'Penalty under IRC Section 4975' is wrong"
    ${Value-SC-FDUDefenseCost}=  Get Value  ${MLP_SC_FDUDefenseCost}
    run keyword if   '${Value-SC-FDUDefenseCost}' == '${test_data["Separate Defense Cost Coverage Limit"]}'  Log to Console  ${Value-SC-FDUDefenseCost}-"The default value for 'Separate Defense Cost Coverage Limit' is correct"  ELSE  Log to Console  ${Value-SC-FDUDefenseCost}-"The default value for 'Separate Defense Cost Coverage Limit' is wrong"

Crime Default Sublimit Validation
    [Arguments]  &{test_data}
    Log To Console   *********************************************** 
    Log To Console   "Crime Insuring Agreements"
    ${Value-SC-CRIMEExpenseCoverageLimit}=  Get Value  ${MLP_SC_CRIMEExpenseCoverageLimit}
    run keyword if  '${Value-SC-CRIMEExpenseCoverageLimit}' == '${test_data["Expense Coverage (Limit)"]}'   Log to Console   ${Value-SC-CRIMEExpenseCoverageLimit}-"The default value for 'Expense Coverage (Limit)' is correct"  ELSE  Log to Console  ${Value-SC-CRIMEExpenseCoverageLimit}-"The default value for 'Expense Coverage (Limit)' is wrong"
    ${Value-SC-CRIMEExpenseCoverage}=  Get Value  ${MLP_SC_CRIMEExpenseCoverage}
    run keyword if  '${Value-SC-CRIMEExpenseCoverage}' == '${test_data["Expense Coverage (Deductible)"]}'    Log to Console   ${Value-SC-CRIMEExpenseCoverage}-"The default value for 'Expense Coverage (Deductible)' is correct"  ELSE  Log to Console  ${Value-SC-CRIMEExpenseCoverage}-"The default value for 'Expense Coverage (Deductible)' is wrong"
    ${Value-SC-CRIMESocialEngineeringFraudLimit}=  Get Value  ${MLP_SC_CRIMESocialEngineeringFraudLimit}
    run keyword if  '${Value-SC-CRIMESocialEngineeringFraudLimit}' == '${test_data["Social Engineering Fraud Coverage (Limit)"]}'   Log to Console  ${Value-SC-CRIMESocialEngineeringFraudLimit}-"The default value for 'Social Engineering Fraud Coverage (Limit)' is correct"  ELSE  Log to Console  ${Value-SC-CRIMESocialEngineeringFraudLimit}-"The default value for 'Social Engineering Fraud Coverage (Limit)' is wrong"
    ${Value-SC-CRIMESocialEngineeringFraudDeductible}=  Get Value  ${MLP_SC_CRIMESocialEngineeringFraudDeductible}
    run keyword if  '${Value-SC-CRIMESocialEngineeringFraudDeductible}' == '${test_data["Social Engineering Fraud Coverage (Deductible)"]}'  Log to Console  ${Value-SC-CRIMESocialEngineeringFraudDeductible}-"The default value for 'Social Engineering Fraud Coverage (Deductible)' is correct"  ELSE  Log to Console  ${Value-SC-CRIMESocialEngineeringFraudDeductible}-"The default value for 'Social Engineering Fraud Coverage (Deductible)' is wrong"
    ${Value-SC-CRIMETollFraud}=  Get Value  ${MLP_SC_CRIMETollFraud}
    run keyword if  '${Value-SC-CRIMETollFraud}' == '${test_data["Telephone Toll Fraud"]}'  Log to Console  ${Value-SC-CRIMETollFraud}-"The default value for 'Telephone Toll Fraud' is correct"  ELSE  Log to Console  ${Value-SC-CRIMETollFraud}-"The default value for 'Telephone Toll Fraud' is wrong"

ELL Default Sublimit Validation
    [Arguments]  &{test_data}
    ${Value-SC-DNOEmployedLawyers}=  Get Value  ${MLP_SC_DNOEmployedLawyers}
    run keyword if  '${Value-SC-DNOEmployedLawyers}' == '${test_data["Employed Lawyers"]}'  Log to Console  ${Value-SC-DNOEmployedLawyers}-"The default value for 'DNO Employed Lawyers' is correct"  ELSE  Log to Console  ${Value-SC-DNOEmployedLawyers}-"The default value for 'DNO Employed Lawyers' is wrong"

































