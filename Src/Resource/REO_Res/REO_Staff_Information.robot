*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${RE_SI_LicenseTermAgent}=    //input[@name='ApplicantDetails_03']
${RE_SI_LicenseTermBroker}=    //input[@name='ApplicantDetails_04']
${RE_SI_ProducerInfoLicenseLicenseTermOtherClass}=  //input[@name='ApplicantDetails_06']
${RE_SI_LicenseTermOther}=  //input[@name='ApplicantDetails_05']
${RE_SI_Principals-partners-directors_FT}=  //input[@name='ApplicantDetails_09']
${RE_SI_REagents_brokers_independent_contractors_FT}=  //input[@name='ApplicantDetails_10']
${RE_SI_REagents_brokers_independent_contractors_PT}=  //input[@name='ApplicantDetails_11']
${RE_SI_Property_managers_FT}=  //input[@name='ApplicantDetails_12']
${RE_SI_Property_managers_PT}=  //input[@name='ApplicantDetails_13']
${RE_SI_Total-Maintenance_FT}=  //input[@name='ApplicantDetails_14']
${RE_SI_Appraisers_FT}=  //input[@name='ApplicantDetails_15']
${RE_SI_Appraisers_PT}=  //input[@name='ApplicantDetails_16']
${RE_SI_Referral_FT}=  //input[@name='ApplicantDetails_17']
${RE_SI_Referral_PT}=  //input[@name='ApplicantDetails_18']
${RE_SI_Clerical/administrative_FT}=  //input[@name='ApplicantDetails_19']
${RE_SI_Clerical/administrative_PT}=  //input[@name='ApplicantDetails_20']
${RE_SI_Other_FT}=  //input[@name='ApplicantDetails_21']
${RE_SI_Other_PT}=  //input[@name='ApplicantDetails_22']
${IFAS}=  Revenue
${check}=  YesNo
${AI_TNum}=  TransactionNum
${AI_Inc}=  Income
${RE_SI_Please-describe}=    //input[@name='ApplicantDetails_23']

*** Keywords ***
RE Staff Information
    [Arguments]  &{test_data}
    Input text  ${RE_SI_LicenseTermAgent}  ${test_data['Years applicant held a license as an agent']}
    Input text    ${RE_SI_LicenseTermBroker}    ${test_data['Years applicant held a license as a Broker']}
    click element    //input[@name='LicenseTermOther' and @value='${test_data['Applicant Hold any other professional license']}']
    run keyword if    '${test_data['Applicant Hold any other professional license']}' == 'YES'    Professional License    &{test_data}
    Input text    ${RE_SI_Principals-partners-directors_FT}    ${test_data['Principal Fulltime']}
    Input text    ${RE_SI_REagents_brokers_independent_contractors_FT}    ${test_data['Contractors Full Time']}
    Input text    ${RE_SI_REagents_brokers_independent_contractors_PT}    ${test_data['Contractors Part Time']}
    Input text    ${RE_SI_Property_managers_FT}    ${test_data['Property managers Full Time']}
    Input text    ${RE_SI_Property_managers_PT}    ${test_data['Property managers Part Time']}
    run keyword if   '${test_data['Property managers Part Time']}' != 'nan'  Input text    ${RE_SI_Total-Maintenance_FT}    ${test_data['Maintenance Full Time']}
    Input text    ${RE_SI_Appraisers_FT}    ${test_data['Appraisers Full Time']}
    Input text    ${RE_SI_Appraisers_PT}    ${test_data['Appraisers Part Time']}
    Input text    ${RE_SI_Referral_FT}    ${test_data['Referral agents Full Time']}
    Input text    ${RE_SI_Referral_PT}    ${test_data['Referral agents Part Time']}
    Input text    ${RE_SI_Clerical/administrative_FT}    ${test_data['Clerical Full Time']}
    Input text    ${RE_SI_Clerical/administrative_PT}    ${test_data['Clerical Part Time']}
    Input text    ${RE_SI_Other_FT}    ${test_data['Other Full Time']}
    Input text    ${RE_SI_Other_PT}    ${test_data['Other Part Time']}
    Sleep    2s
    ${OthersDescription}=    run keyword and return status    element should be visible    ${RE_SI_Please-describe}
    run keyword if    ${OthersDescription}    Input text    ${RE_SI_Please-describe}    ${test_data['SI-Describe']}
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30

Professional License
       [Arguments]  &{test_data}
       Input text    ${RE_SI_ProducerInfoLicenseLicenseTermOtherClass}    ${test_data['list the others license(s) held:']}
       Input text    ${RE_SI_LicenseTermOther}    ${test_data['How many years has the applicant held these real estate licenses?']}