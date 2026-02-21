*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${Name-AII-ErrorsAndOmissionsLineBusiness_YES}=    //input[contains(@id,"ErrorsAndOmissionsLineBusiness.QuestionAnswer[QuestionCd='WrittenPMAgreement'].YesNoCd_0")]
${Name-AII-ErrorsAndOmissionsLineBusiness_No}=    //input[contains(@id, "ErrorsAndOmissionsLineBusiness.QuestionAnswer[QuestionCd='WrittenPMAgreement'].YesNoCd_1")]
${RE_AII_avgSalePrcResProp}=    //input[@name='ResidentialBrokerage_01']
${RE_AII_prcntHomeProtPrgm}=   //input[@name='HomeProtectionWarranty']
${RE_AII_prctResPropSold}=    //input[@name='SignedPropDisclosure']
${RE_AII_byrSllrPrcnt}=    //input[@name='BuyerAndSeller']
${RE_AII_sameAgntbyrSllrPrcnt}=    //input[@name='SameAgentBuyerAndSeller']
${RE_AII_forclosurePrcnt}=    //input[@name='Foreclosures']
${RE_AII_singleFamResPrcnt}=    //input[@name='SingleFamily']
${RE_AII_multiFamResPrcnt}=    //input[@name='MultiFamily']
${RE_AII_lotsVacantLandPrcnt}=    //input[@name='LotsVacantLand']
${RE_AII_commIndusPropPrcnt}=    //input[@name='CommlIndustryProp']
${RE_AII_farmsRnchsForstPrcnt}=    //input[@name='FarmRanchesForestry']
${RE_AII_estTaxPrpsPrcnt}=    //input[@name='EstateTaxPurposes']
${RE_AII_lanDevSubdivPrcnt}=    //input[@name='LandDevSubDivions']
${RE_AII_contructionPhasePrcnt}=    //input[@name='ConstrPhaseInspection']
${RE_AII_rightOfWayPrcnt}=    //input[@name='RightOfWay']
${RE_AII_personalPropPrcnt}=    //input[@name='PersonalProp']
${RE_AII_floodZoneCertPrcnt}=    //input[@name='FloodZoneCert']
${RE_AII_otherPrcnt}=    //input[@name='Other_REappraisal']
${RE_AII_originationPrcnt}=    //input[@name='Origination']
${RE_AII_servicingPrcnt}=    //input[@name='Servicing']
${RE_AII_underwritingPrcnt}=    //input[@name='Underwriting']
${RE_AII_loanFundingWarehousingPrcnt}=    //input[@name='LoanFundingWarehousing']
${RE_AII_solicitingPrcnt}=    //input[@name='Soliciting']
${RE_AII_repurchasingPrcnt}=    //input[@name='Repurchasing']
${RE_AII_residentialExistingPrcnt}=    //input[@name='ResidentialExisting']
${RE_AII_residentialNewPrcnt}=    //input[@name='ResidentialNew']
${RE_AII_commercialExistingPrcnt}=    //input[@name='CommercialExisting']
${RE_AII_commercialNewPrcnt}=    //input[@name='CommercialNew']
${RE_AII_otherExistingPrcnt}=    //input[@name='OtherExisting']
${RE_AII_otherNewPrcnt}=    //input[@name='OtherNew']
${RE_AII_otherMortgageDescribe}=   //textarea[@name='Other_MBDescribe']
${Name-AII-writtenPolYesNo}=    writtenPolYesNo
${RE_AII_polProcExplntn}=    //textarea[@name='WrittenPoliciesProcedures_Explanation']
${RE_AII_Add}=    //button[text()='Add']


*** Keywords ***
RE Additional Income Information
    [Arguments]    &{test_data}
    Sleep  0.5s
    Execute Javascript  window.scrollTo(0,90)
    #${property_management}=    run keyword and return status    Page Should Contain    Property Management
    #run keyword if    ${property_management}    click element   //input[@name='WrittenPMAgreement' and @value='${test_data['Does the applicant use a written property management agreement for all managed properties?']}']
    run keyword if  '${test_data['ResPropMgmtFees Income']}' != 'nan' or '${test_data['ComHabPropMgmtFees Income']}' != 'nan'   click element   //input[@name='WrittenPMAgreement' and @value='${test_data['Does the applicant use a written property management agreement for all managed properties?']}']
    wait until element is not visible  globalAjaxloading  80s
    run keyword if  '${test_data["ResidentialBrokerage Income"]}' != 'nan'   Residential Brokerage   &{test_data}
    ${Real_Estate_Appraisal}=    run keyword and return status   element should be visible    ${RE_AII_singleFamResPrcnt}
    run keyword if     ${Real_Estate_Appraisal}      Real Estate Appraisal    &{test_data}
    run keyword if  '${test_data["MrtgBrkr Income"]}' != 'nan'   Mortgage Brokerage   &{test_data}
    ${Brokerage_Services}=    run keyword and return status   Page Should Contain    Business Brokerage Services
    run keyword if     ${Brokerage_Services}      RE Business Brokerage Services   &{test_data}
    Execute Javascript  window.scrollTo(0,1000)
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30

Residential Brokerage
    [Arguments]    &{test_data}
    Input text   ${RE_AII_avgSalePrcResProp}    ${test_data['What was the average sale price of residential properties sold by the applicant?']}
    Input text    ${RE_AII_prctResPropSold}    ${test_data['What percentage of residential properties sold included a signed property disclosure form?']}
    Input text    ${RE_AII_prcntHomeProtPrgm}    ${test_data['What percentage of residential properties sold included a home protection or warranty program?']}
    Input text    ${RE_AII_byrSllrPrcnt}    ${test_data['In what percentage of transactions did the applicant represent both the buyer and the seller?']}
    Input text    ${RE_AII_sameAgntbyrSllrPrcnt}    ${test_data['In what percentage of transactions did the same agent represent both the buyer and the seller?']}
    Input text    ${RE_AII_forclosurePrcnt}    ${test_data['What percentage of residential properties sold were foreclosure or short sales transactions?']}

RE Business Brokerage Services
    [Arguments]    &{test_data}
     #run keyword if  '${test_data["ResidentialBrokerage Income"]}' != 'nan'   Execute Javascript  window.scrollTo(0,1500)
     click element   //input[@name='BusinessBroker3YrsExp' and @value='${test_data['Business broker with a minimum of 3 years of experience?']}']
     run keyword if  '${test_data['TypeofBus0']}' != 'nan'     RE Add Business Transactions   0      &{test_data}
     run keyword if  '${test_data['TypeofBus1']}' != 'nan'     run keywords   click element   ${RE_AII_Add}  AND  RE Add Business Transactions   1      &{test_data}
     run keyword if  '${test_data['TypeofBus2']}' != 'nan'     run keywords   click element   ${RE_AII_Add}  AND  RE Add Business Transactions   2      &{test_data}
     click element   //input[@name='WrittenPoliciesProcedures' and @value='${test_data['Does the applicant have written policies and procedures for their agents regarding business sales?']}']
     run keyword if    '${test_data['Does the applicant have written policies and procedures for their agents regarding business sales?']}' == 'NO'    Input text    ${RE_AII_polProcExplntn}    ${test_data['Procedure Explanation']}
     click element   //input[@name='ValuationBusinessSold' and @value='${test_data['Is the applicant involved in the valuation of the business being sold?']}']
     click element   //input[@name='DiscloseAssertion' and @value='${test_data['Does the applicant disclose to the purchaser in writing that there is no certainty or assertion of any future business value or income?']}']

RE Add Business Transactions
    [Arguments]   ${index}   &{test_data}
    Input text    //input[@name='tableInputs[${index}].BusinessBrokerage_TypeOfBusiness']        ${test_data['TypeofBus${index}']}
    Input text    //input[@name='tableInputs[${index}].BusinessBrokerage_ValueOfBusinessSold']   ${test_data['ValueofBus${index}']}
    Input text    //input[@name='tableInputs[${index}].BusinessBrokerage_CommissionFromSale']    ${test_data['CommissionfromSale${index}']}

Real Estate Appraisal
    [Arguments]  &{test_data}
    run keyword if   '${test_data['Single Family Residences']}' != 'nan'      Input text    ${RE_AII_singleFamResPrcnt}    ${test_data['Single Family Residences']}
    run keyword if   '${test_data['Multi- Family Residences']}' != 'nan'      Input text    ${RE_AII_multiFamResPrcnt}     ${test_data['Multi- Family Residences']}
    run keyword if   '${test_data['Lots&Vacant Land']}' != 'nan'      Input text    ${RE_AII_lotsVacantLandPrcnt}    ${test_data['Lots&Vacant Land']}
    run keyword if   '${test_data['Commercial&Industry Property']}' != 'nan'      Input text    ${RE_AII_commIndusPropPrcnt}    ${test_data['Commercial&Industry Property']}
    run keyword if   '${test_data['Farms&Ranches&Forestry']}' != 'nan'      Input text    ${RE_AII_farmsRnchsForstPrcnt}    ${test_data['Farms&Ranches&Forestry']}
    run keyword if   '${test_data['Estate or Tax Purposes']}' != 'nan'      Input text    ${RE_AII_estTaxPrpsPrcnt}        ${test_data['Estate or Tax Purposes']}
    run keyword if   '${test_data['Land Development&Subdivisions']}' != 'nan'      Input text    ${RE_AII_lanDevSubdivPrcnt}      ${test_data['Land Development&Subdivisions']}
    run keyword if   '${test_data['Construction Phase Inspections']}' != 'nan'      Input text    ${RE_AII_contructionPhasePrcnt}    ${test_data['Construction Phase Inspections']}
    run keyword if   '${test_data['Right-of-Way']}' != 'nan'      Input text    ${RE_AII_rightOfWayPrcnt}         ${test_data['Right-of-Way']}
    run keyword if   '${test_data['Personal Property']}' != 'nan'      Input text    ${RE_AII_personalPropPrcnt}      ${test_data['Personal Property']}
    run keyword if   '${test_data['Flood Zone Certifications']}' != 'nan'      Input text    ${RE_AII_floodZoneCertPrcnt}      ${test_data['Flood Zone Certifications']}
    run keyword if   '${test_data['OtherPrcnt']}' != 'nan'      Input text    ${RE_AII_otherPrcnt}            ${test_data['OtherPrcnt']}

Mortgage Brokerage
    [Arguments]  &{test_data}
    Input text    ${RE_AII_originationPrcnt}    ${test_data['Origination']}
    Input text    ${RE_AII_servicingPrcnt}    ${test_data['Servicing']}
    Input text    ${RE_AII_underwritingPrcnt}    ${test_data['Underwriting']}
    Input text    ${RE_AII_loanFundingWarehousingPrcnt}    ${test_data['Loan Funding or Warehousing Credit']}
    Input text    ${RE_AII_solicitingPrcnt}    ${test_data['Soliciting']}
    Input text    ${RE_AII_repurchasingPrcnt}    ${test_data['Repurchasing']}
    Input text    ${RE_AII_residentialExistingPrcnt}    ${test_data['Residential Existing']}
    Input text    ${RE_AII_residentialNewPrcnt}    ${test_data['Residential New Construction']}
    Input text    ${RE_AII_commercialExistingPrcnt}    ${test_data['Commercial Existing']}
    Input text    ${RE_AII_commercialNewPrcnt}    ${test_data['Commercial New Construction']}
    Input text    ${RE_AII_otherExistingPrcnt}    ${test_data['Other Existing']}
    Input text    ${RE_AII_otherNewPrcnt}    ${test_data['Other New Construction']}
    sleep  2s
    run keyword if    '${test_data['Other New Construction']}' != 'nan'    Input text    ${RE_AII_otherMortgageDescribe}   ${test_data['If other please describe:']}
    ${lownItsOwnFunds}=    run keyword and return status    Page Should Contain    Does the applicant’s firm loan its own funds?
    run keyword if    ${lownItsOwnFunds}    click element   //input[@name='LoanOwnFunds' and @value='${test_data['Does the applicant loan its own funds?']}']
