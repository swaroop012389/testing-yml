*** Settings ***
Test Teardown  Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/IA_Res/IA.robot
Resource  ../../Resource/Upload_document.robot
Resource  ../../Resource/Generic.robot

*** Test Cases ***
TC_IA_001
    [Tags]    Individual Appraisers_Smoke_Test
    [Documentation]  Residential Trainee State HI with all Claims
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['ia']}${/}TC_IA_001.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  Program=IA
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_IA_001
    IA Create dummy data  ${test_data}
    Run Keyword And Continue On Failure   Residential Trainee State HI with all Claims  &{test_data}
    @{res_row} =  Create list  TC_IA_001   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}


*** Keywords ***
Residential Trainee State HI with all Claims
    [Arguments]  &{test_data}
    Login To V2 With Broker Email  ${test_data}
    Navigate to Individual Appraisers
    IA General Information  ${test_data}
    IA General Questions   ${test_data}
    IA Prior Coverage and Claims History  ${test_data}
    IA Applicant Income  ${test_data}
    IA Quote options   ${test_data}
    Sleep    10s
    Logout as Broker
    Login as an Underwriter
    Open Proposal From My Work
    Stop Execution Before Binding and Issue Policy  &{test_data}
    IA Generate Quote  ${test_data}
    IA Billing and Contact Information  ${test_data}
    IA Issue policy
    IA Policy Summary
    Upload Document     ${test_data}
    Document verification

