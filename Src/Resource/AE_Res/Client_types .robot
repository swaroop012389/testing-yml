*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${AE_CT_Commercial_companies_&_entities}=  //input[@name='CT_CommercialCompaniesEntitiesPct']
${AE_CT_Design-build_contractors}=  //input[@name='CT_DesignBuildContractorsPct']
${AE_CT_Design_professional}=  //input[@name='CT_DesignProfessionalsPct']
${AE_CT_Financial_institutions}=  //input[@name='CT_FinancialInstitutionsPct']
${AE_CT_General/speciality contractors}=  //input[@name='CT_GeneralSpecialtyContractorsPct']
${AE_CT_Government-federal}=  //input[@name='CT_GovernmentFederalPct']
${AE_CT_Government-foreign}=  //input[@name='CT_GovernmentForeignPct']
${AE_CT_Government-local}=  //input[@name='CT_GovernmentLocalPct']
${AE_CT_Government-state}=  //input[@name='CT_GovernmentStatePct']
${AE_CT_Institutional_entities_(non-public)}=  //input[@name='CT_InstitutionalEntitiesPct']
${AE_CT_Manufacturing/industrial_entities}=  //input[@name='CT_ManufacturingIndustrialEntitiesPct']
${AE_CT_Real_estate_developers}=  //input[@name='CT_RealEstateDevelopersPct']
${AE_CT_Other_(please provide %)}=  //input[@name='CT_OtherPct']
${AE_CT_Other_description}=   //input[@name='CT_OtherDescription']
${AE_CT_Total_gross_billigs_is_from_repeat_clients}=  //input[@name='CT_RepeatClientsPct']


*** Keywords ***
AE Client Types
        [Arguments]    &{test_data}
        Wait Until Page Contains Element   ${AE_CT_Commercial_companies_&_entities}  10s
        Input text    ${AE_CT_Commercial_companies_&_entities}   ${test_data['Commercial companies & entities']}
        Input text    ${AE_CT_Design-build_contractors}   ${test_data['Design-build contractors']}
        Input text    ${AE_CT_Design_professional}   ${test_data['Design professional']}
        Input text    ${AE_CT_Financial_institutions}   ${test_data['Financial institutions']}
        Input text    ${AE_CT_General/speciality contractors}   ${test_data['General/speciality contractors']}
        Input text    ${AE_CT_Government-federal}   ${test_data['Government-federal']}
        Input text    ${AE_CT_Government-foreign}   ${test_data['Government-foreign']}
        Input text    ${AE_CT_Government-local}   ${test_data['Government-local']}
        Input text    ${AE_CT_Government-state}   ${test_data['Government-state']}
        Input text    ${AE_CT_Institutional_entities_(non-public)}   ${test_data['Institutional entities (non-public)']}
        Input text    ${AE_CT_Manufacturing/industrial_entities}   ${test_data['Manufacturing/industrial entities']}
        Input text    ${AE_CT_Real_estate_developers}   ${test_data['Real estate developers']}
        Input text    ${AE_CT_Other_(please provide %)}   ${test_data['Other (please provide %)']}
        run keyword if  '${test_data['Other (please provide %)']}' != 'nan'  Input text    ${AE_CT_Other_description}   ${test_data['Other (please provide description)']}
        Input text    ${AE_CT_Total_gross_billigs_is_from_repeat_clients}   ${test_data['Total gross billigs is from repeat clients?']}
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
