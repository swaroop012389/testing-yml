*** Settings ***
Documentation    Creating a basic policy
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot

*** Test Cases ***
TC_ML_PVT_002
    [Tags]   Private_MGMT-LIAB_Smoke_Test
    [Documentation]    ML PVT Natural Gas Liquid Extraction--211112 (Decline Org type)
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['ml-private']}${/}TC_ML_PVT_002.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_ML_PVT_002
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data ML Private  ${test_data}
    Run Keyword And Continue On Failure   ML PVT Natural Gas Liquid Extraction--211112 (Decline Org type)   ${test_data}
    @{res_row} =  Create list  TC_ML_PVT_002   ${WorkID}  NA
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
ML PVT Natural Gas Liquid Extraction--211112 (Decline Org type)
     [Arguments]    ${test_data}
     Login to Victor page   ${test_data}
     Navigate to Private_Company_Management_Liability
     Insurance Agency Information    &{test_data}
     Private Org Type check    &{test_data}