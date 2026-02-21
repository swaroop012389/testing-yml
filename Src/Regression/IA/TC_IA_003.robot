*** Settings ***
Test Teardown  Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/IA_Res/IA.robot
Resource  ../../Resource/Upload_document.robot
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot

*** Test Cases ***
TC_IA_003
    [Tags]    Individual Appraisers_Smoke_Test
    [Documentation]  Residential Trainee State DE with Claims as Include violation of fair housing laws
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['ia']}${/}TC_IA_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  Program=IA
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_IA_003
    IA Create dummy data  ${test_data}
    Sleep    5s
    run keyword if  '${data['General Information'][0]}' == 'YES'  Run keywords  Create dummy data  TC_IA_002  @{data['General Information']}  AND  Set to dictionary  ${data}  General Information  ${dummy_data}
    Run Keyword And Continue On Failure  Residential Trainee State DE with Claims as Include violation of fair housing laws  &{test_data}
    @{res_row} =  Create list  TC_IA_003   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}

*** Keywords ***
Residential Trainee State DE with Claims as Include violation of fair housing laws
    [Arguments]  &{test_data}
    Login to Victor page   ${test_data}
    Navigate to Individual Appraisers
    Insurance Agency Information  &{test_data}
    IA General Information  ${test_data}
    IA General Questions   ${test_data}
    IA Prior Coverage and Claims History  ${test_data}
    IA Applicant Income  ${test_data}
    Stop Execution Before Binding and Issue Policy  &{test_data}
    IA Quote options   ${test_data}
    IA Generate Quote  ${test_data}
    IA Billing and Contact Information  ${test_data}
    IA Issue policy
    IA Policy Summary
    Upload Document     ${test_data}
    Document verification
    Policy Cancellation
    Get Policy Status    ${test_data}
    Verify Policy Status 1    ${test_data}
    Complete Cancellation  ${test_data}
    Get Policy Status    ${test_data}
    Verify Policy Status 2    ${test_data}
    Reinstatement
    Get Policy Status     ${test_data}
    Verify Policy Status 3    ${test_data}

