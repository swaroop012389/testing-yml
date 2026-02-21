*** Settings ***
Documentation    Creating a basic policy
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/DNO_Res/DNO_General_Questions.robot
Resource  ../../Resource/DNO_Res/DNO_General_Information.robot
Resource  ../../Resource/TMS_RES/UMS_PAGE.robot

*** Test Cases ***
TC_ML_NFP_PNB_003
    [Tags]   MGMT-LIAB_NFP_Smoke_Test
    [Documentation]    ML Iowa Auto-declination
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['mgmt-liab_nfp_pnb']}${/}TC_ML_NFP_PNB_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_ML_NFP_PNB_003
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data MGMT NFP  ${test_data}
    Run Keyword And Continue On Failure  ML Iowa Auto-declination   &{test_data}
    @{res_row} =  Create list  TC_ML_NFP_PNB_003   ${WorkID}  NA
    Update resource file  ${res_row}

*** Keywords ***
ML Iowa Auto-declination
    [Arguments]    &{test_data}
    Login to Victor page   ${test_data}
    Navigate to Non-Profit_Management_Liability
    Insurance Agency Information    &{test_data}
    Close Cyber Cookies
    General FEIN Information    &{test_data}
    DNO General Information    &{test_data}
    NFP Decline check    &{test_data}
    Decline Policy Summary  &{test_data}
    Go to UMS
    Get Policy Status    ${test_data}
    Verify Policy Status 1    ${test_data}
    Underwriter Rating
    Decline Reasons  &{test_data}
