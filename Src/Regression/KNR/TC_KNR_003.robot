*** Settings ***
Documentation    Creating a basic policy
Library    SeleniumLibrary
Resource    ../../Resource/Global-variable/v2.robot
Resource    ../../Resource/K&R_Res/KNR_Keywords.resource

*** Test Cases ***
TC_KNR_Smoke_Test_003
    [Tags]    KNR_Smoke_Test
    [Documentation]    Policy Creation with Cancellation and Reinstatement.
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['kr']}${/}TC_K&R_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data KNR  ${test_data}
    Run Keyword And Continue On Failure  Policy Creation with Cancellation and Reinstatement  &{test_data}
    @{res_row} =  Create list  TC_K&R_003   NA  ${policy-no}
    Update resource file  ${res_row}
    Close Browser
