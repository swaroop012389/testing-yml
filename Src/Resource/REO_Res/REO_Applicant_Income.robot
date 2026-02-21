*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${ID_AI_ApplicantFiscalDate}=    //input[@name='EIS_FiscalDate']
${ID_AI_residentialBrokerageTransactionNum}=    //input[@name='RB_Transaction']
${ID_AI_residentialBrokerageIncome}=    //input[@name='RB']
${ID_AI_commercialIndTransactionNum}=    //input[@name='CI_Transaction']
${ID_AI_commercialIndIncome}=    //input[@name='CI']
${ID_AI_landLotTransactionNum}=    //input[@name='LL_Transaction']
${ID_AI_landLotIncome}=    //input[@name='LL']
${ID_AI_farmAgriTransactionNum}=    //input[@name='farmAgriTransactionNum']
${ID_AI_farmAgriIncome}=    //input[@name='FA_Transaction']
${ID_AI_ResReaEstAppTransactionNum}=    //input[@name='RR_Transaction']
${ID_AI_ResReaEstAppIncome}=    //input[@name='RR']
${ID_AI_ComReaEstAppTransactionNum}=    //input[@name='CR_Transaction']
${ID_AI_ComReaEstAppIncome}=    //input[@name='CR']
${ID_AI_ReaEstLeasFeesTransactionNum}=    //input[@name='RL_Transaction']
${ID_AI_ReaEstLeasFeesIncome}=    //input[@name='RL']
${ID_AI_ResPropMgmtFeesTransactionNum}=    //input[@name='RP_Transaction']
${ID_AI_ResPropMgmtFeesIncome}=    //input[@name='RP']
${ID_AI_ComHabPropMgmtFeesTransactionNum}=    //input[@name='CH_Transaction']
${ID_AI_ComHabPropMgmtFeesIncome}=    //input[@name='CH']
${ID_AI_MgmtAssocTransactionNum}=    //input[@name='MA_Transaction']
${ID_AI_MgmtAssocIncome}=    //input[@name='MA']
${ID_AI_MrtgBrkrTransactionNum}=    //input[@name='MB_Transaction']
${ID_AI_MrtgBrkrIncome}=    //input[@name='MB_FinancialType']
${ID_AI_BusOppBrkgTransactionNum}=    //input[@name='BO_Transaction']
${ID_AI_BusOppBrkgIncome}=    //input[@name='BO']
${ID_AI_RealEstConsTransactionNum}=    //input[@name='CC_Transaction']
${ID_AI_RealEstConsIncome}=    //input[@name='CC']
${ID_AI_AuctnTransactionNum}=    //input[@name='AU_Transaction']
${ID_AI_AuctnIncome}=    //input[@name='AU']
${ID_AI_ReferralsTransactionNum}=    //input[@name='RF_Transaction']
${ID_AI_ReferralsIncome}=    //input[@name='RF']
${ID_AI_BPOTransactionNum}=    //input[@name='BP_Transaction']
${ID_AI_BPOIncome}=    //input[@name='BP']
${ID_AI_OtherTransactionNum}=    //input[@name='OT_Transaction']
${ID_AI_OtherIncome}=    //input[@name='OT']
${ID_AI_othersDescription}=    //textarea[@name='DESCRIPTION']
${ID_AI_RealEstateDESCRIPTION}=  //textarea[@name='RealEstateDESCRIPTION']

*** Keywords ***
RE Applicant Income
    [Arguments]    &{test_data}
    Wait Until Page Contains     Provide the applicant's total gross income, including fees and commissions, before any splits or deductions for the past fiscal year. If the applicant is a startup, provide a 12 month estimate.  30s
    sleep  0.5s
    Press keys     ${ID_AI_ApplicantFiscalDate}    ${test_data['Fiscal date']}
    Press keys    ${ID_AI_ApplicantFiscalDate}    TAB
    Input text    ${ID_AI_residentialBrokerageTransactionNum}    ${test_data['ResidentialBrokerage']}
    Input text    ${ID_AI_residentialBrokerageIncome}    ${test_data['ResidentialBrokerage Income']}
    Input text    ${ID_AI_commercialIndTransactionNum}  ${test_data['CommercialInd']}
    Input text    ${ID_AI_commercialIndIncome}    ${test_data['CommercialInd Income']}
    Input text    ${ID_AI_landLotTransactionNum}    ${test_data['LandLot']}
    Input text    ${ID_AI_landLotIncome}    ${test_data['LandLot Income']}
    Input text    ${ID_AI_farmAgriTransactionNum}  ${test_data['FarmAgri']}
    wait until element is enabled    ${ID_AI_farmAgriIncome}    60
    Input text    ${ID_AI_farmAgriIncome}    ${test_data['FarmAgri Income']}
    Input text    ${ID_AI_ResReaEstAppTransactionNum}    ${test_data['ResReaEstApp']}
    Input text    ${ID_AI_ResReaEstAppIncome}    ${test_data['ResReaEstApp Income']}
    Input text    ${ID_AI_ComReaEstAppTransactionNum}    ${test_data['ComReaEstApp']}
    Input text    ${ID_AI_ComReaEstAppIncome}    ${test_data['ComReaEstApp Income']}
    Wait Until Element Is Visible  ${ID_AI_ReaEstLeasFeesTransactionNum}  5s
    Input text    ${ID_AI_ReaEstLeasFeesTransactionNum}  ${test_data['ReaEstLeasFees']}
    Input text    ${ID_AI_ReaEstLeasFeesIncome}    ${test_data['ReaEstLeasFees Income']}
    Input text    ${ID_AI_ResPropMgmtFeesTransactionNum}    ${test_data['ResPropMgmtFees']}
    Input text    ${ID_AI_ResPropMgmtFeesIncome}    ${test_data['ResPropMgmtFees Income']}
    Input text    ${ID_AI_ComHabPropMgmtFeesTransactionNum}    ${test_data['ComHabPropMgmtFees']}
    Input text    ${ID_AI_ComHabPropMgmtFeesIncome}    ${test_data['ComHabPropMgmtFees Income']}
    Input text    ${ID_AI_MgmtAssocTransactionNum}    ${test_data['MgmtAssoc']}
    Input text    ${ID_AI_MgmtAssocIncome}    ${test_data['MgmtAssoc Income']}
    Input text    ${ID_AI_MrtgBrkrTransactionNum}    ${test_data['MrtgBrkr']}
    Input text    ${ID_AI_MrtgBrkrIncome}    ${test_data['MrtgBrkr Income']}
    Execute Javascript  window.scrollTo(0,1200)
    Input text    ${ID_AI_BusOppBrkgTransactionNum}    ${test_data['BusOppBrkg']}
    Input text    ${ID_AI_BusOppBrkgIncome}    ${test_data['BusOppBrkg Income']}
    Input text    ${ID_AI_RealEstConsTransactionNum}    ${test_data['RealEstCons']}
    Input text    ${ID_AI_RealEstConsIncome}    ${test_data['RealEstCons Income']}
    Execute Javascript  window.scrollTo(0,1400)
    Input text    ${ID_AI_AuctnTransactionNum}    ${test_data['Auctn']}
    Input text    ${ID_AI_AuctnIncome}    ${test_data['Auctn Income']}
    Input text    ${ID_AI_ReferralsTransactionNum}    ${test_data['Referrals']}
    Input text    ${ID_AI_ReferralsIncome}    ${test_data['Referrals Income']}
    Input text    ${ID_AI_BPOTransactionNum}    ${test_data['BPO']}
    Input text    ${ID_AI_BPOIncome}    ${test_data['BPO Income']}
    Input text    ${ID_AI_OtherTransactionNum}    ${test_data['Other']}
    Input text    ${ID_AI_OtherIncome}    ${test_data['Other Income']}
    run keyword if    '${test_data['Other']}' != 'nan'    Input text    ${ID_AI_othersDescription}   ${test_data['Other-Description']}    ELSE    run keyword if  '${test_data['Other Income']}' != 'nan'    Input text    ${ID_AI_othersDescription}   ${test_data['Other-Description']}
    wait until element is not visible   globalAjaxLoading  250
  #  Execute Javascript  window.scrollTo(0,1800)
    run keyword if    '${test_data['RealEstCons']}' != 'nan'    Input text    ${ID_AI_RealEstateDESCRIPTION}   ${test_data['Other-Description']}
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30