*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${AE_FI_Date_of_reporting_Last_12_months}=  //input[@name='Lastt12MFromDate']
${AE_FI_Date_of_reporting_Next_12_months(Projected)}=  //input[@name='Next12MFromDate']
${AE_FI_Gross_billings_Last_12_months}=  //input[@name='Lastt12MGrossBillings']
${AE_FI_Gross_billings_12_months(Projected)}=  //input[@name='Next12MGrossBillings']
${Are_you_employed_elsewhere?}=  EmployedElsewhere
${AE_FI_Direct_reimbursableP_Last_12_months}=  //input[@name="Lastt12MDirectReimbursable"]
${AE_FI_Direct_reimbursableP_next_12_months}=  //input[@name="Next12MDirectReimbursable"]
${AE_FI_Abandoned_projects_last_12_months}=  //input[@name="Lastt12MAbandonedProjects"]
${AE_FI_Abandoned_projects_next_12_months}=  //input[@name="Next12MAbandonedProjects"]
${AE_FI_International_work_last_12_months}=  //input[@name="Lastt12MInternationalWork"]
${AE_FI_International_work_next_12_months}=  //input[@name="Next12MInternationalWork"]
${AE_FI_Separately_insured_projects_last_12_months}=  //input[@name="Lastt12MSeparatelyInsuredProjects"]
${AE_FI_Separately_insured_projects_next_12_months}=  //input[@name="Next12MSeparatelyInsuredProjects"]
${AE_FI_Sub-consultants_last_12_months}=  //input[@name="Lastt12MSubConsultants"]
${AE_FI_Sub-consultants_work_next_12_months}=  //input[@name="Next12MSubConsultants"]

*** Keywords ***
AE Financial Information
        [Arguments]    &{test_data}
        ${Current_Eff_Date}=    get current date
        ${Formated_current_date}=   Get Current Date    result_format=%m/%d/%Y
        ${Last12months}=    Subtract Time From Date    ${Current_Eff_Date}    366 days
        ${Formatdate}=      Convert Date    ${Last12months}     result_format=%m/%d/%Y
        Press Keys    ${AE_FI_Date_of_reporting_Last_12_months}   ${Formatdate}
        Press Keys    ${AE_FI_Date_of_reporting_Next_12_months(Projected)}   ${Formated_current_date}
        Input Text    ${AE_FI_Gross_billings_Last_12_months}   ${test_data['Gross billings last 12 months']}
        Input Text    ${AE_FI_Gross_billings_12_months(Projected)}   ${test_data['Gross billings next 12 months']}
        Input Text    ${AE_FI_Direct_reimbursableP_Last_12_months}   ${test_data['Direct reimbursable last 12 months']}
        Input Text    ${AE_FI_Direct_reimbursableP_next_12_months}   ${test_data['Direct reimbursable next 12 months']}
        Input Text    ${AE_FI_Abandoned_projects_last_12_months}   ${test_data['Abandoned projects last 12 months']}
        Input Text    ${AE_FI_Abandoned_projects_next_12_months}   ${test_data['Abandoned projects next 12 months']}
        Input Text    ${AE_FI_International_work_last_12_months}   ${test_data['International work last 12 months']}
        Input Text    ${AE_FI_International_work_next_12_months}   ${test_data['International work next 12 months']}
        Input Text    ${AE_FI_Separately_insured_projects_last_12_months}   ${test_data['Separately insured projects last 12 months']}
        Input Text    ${AE_FI_Separately_insured_projects_next_12_months}   ${test_data['Separately insured projects next 12 months']}
        Input Text    ${AE_FI_Sub-consultants_last_12_months}   ${test_data['Sub-consultants last 12 months']}
        Input Text    ${AE_FI_Sub-consultants_work_next_12_months}   ${test_data['Sub-consultants next 12 months']}
        run keyword if   ${test_data['Gross billings last 12 months']} < 20000  Click Element    //input[@name='OtherEmplyedYN' and @value='${test_data["Are you employed elsewhere?"]}']
        #${Are_you_employed}=    run keyword and return status    element should be visible    ${Are_you_employed_elsewhere?}
        #run keyword if    ${Are_you_employed}    select radio button    ${Are_you_employed_elsewhere?}    ${test_data["Are you employed elsewhere?"]}
        continue Click RE

