*** Settings ***
Test Teardown  Close Browser
Library    SeleniumLibrary
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/IA_Res/IA.robot
Resource  ../../Resource/Upload_document.robot
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Alternus_Res/BindEndorsement.robot
Resource    ../../Resource/TMS_RES/UMS_PAGE.robot
Resource    ../../Resource/Alternus_Res/Servicing.robot

*** Test Cases ***
TC_IA_002
    [Tags]    Individual Appraisers_Smoke_Test
    [Documentation]   Residential Trainee Appraiser No ownership and claims history
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['ia']}${/}TC_IA_002.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  Program=IA
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_IA_002
    IA Create dummy data  ${test_data}
    Run Keyword And Continue On Failure   Residential Trainee Appraiser No ownership and claims history  &{test_data}
    @{res_row} =  Create list  TC_IA_002   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}

*** Keywords ***
Residential Trainee Appraiser No ownership and claims history
    [Arguments]  &{test_data}
    Login to Victor page   ${test_data}
    Navigate to Individual Appraisers
    Insurance Agency Information  &{test_data}
    IA General Information  ${test_data}
    IA General Questions   ${test_data}
    IA Prior Coverage and Claims History  ${test_data}
    IA Applicant Income    ${test_data}
    Stop Execution Before Binding and Issue Policy  &{test_data}
    IA Quote options   ${test_data}
    IA Generate Quote  ${test_data}
    IA Billing and Contact Information  ${test_data}
    IA Issue policy
    IA Policy Summary
    Upload Document     ${test_data}
    Document verification
    Get Policy Status    ${test_data}
    Servicing
    MT Endorsement   ${test_data}
    Adding Endorsement   ${test_data}
    Endorsement Bind No Additional Premium    ${test_data}
    Verify Generated Document Name    ${test_data}

