*** Settings ***
Documentation    Creating a basic policy
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/DNO_Res/DNO_General_Questions.robot
Resource  ../../Resource/DNO_Res/DNO_General_Information.robot
Resource  ../../Resource/DNO_Res/DNO_Applicant_Information.robot
Resource  ../../Resource/DNO_Res/DNO_Financial_Information.robot
Resource  ../../Resource/DNO_Res/DNO_Risk_Exposure.robot
Resource  ../../Resource/DNO_Res/DNO_Fiduciary_Liability.robot
Resource  ../../Resource/DNO_Res/Crime Liability.robot
Resource  ../../Resource/Generate_Quote.robot
Resource  ../../Resource/Billing&ContactInformation.robot
Resource  ../../Resource/Issue_policy.robot
Resource  ../../Resource/Upload_document.robot
Resource  ../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../Resource/Alternus_Res/Servicing.robot

*** Test Cases ***
TC_ML_NFP_PNB_001
    [Tags]   MGMT-LIAB_NFP_Smoke_Test
    [Documentation]    ML Florida Pro-Rata Cancellation and Reinstatement
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['mgmt-liab_nfp_pnb']}${/}TC_ML_NFP_PNB_001.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_ML_NFP_PNB_001
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data MGMT NFP  ${test_data}
    Run Keyword And Continue On Failure   ML Florida Pro-Rata Cancellation and Reinstatement   &{test_data}
    @{res_row} =  Create list  TC_ML_NFP_PNB_001   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
ML Florida Pro-Rata Cancellation and Reinstatement
    [Arguments]    &{test_data}
    Login To V2 With Broker Email  ${test_data}
    Navigate to Non-Profit_Management_Liability
    Close Cyber Cookies
    General FEIN Information    &{test_data}
    DNO General Information    &{test_data}
    DNO General Questions    &{test_data}
    Sublimit Coverages Page
    DNO Applicant Information    &{test_data}
    run keyword if    '${test_data['Fiduciary']}' == 'YES'    DNO Fiduciary Liability    &{test_data}
    run keyword if    '${test_data['Crime Coverage']}' == 'YES'    Crime Liability  &{test_data}
    DNO Risk Exposure    &{test_data}
    DNO Financial Information    &{test_data}
    Sleep   30s
    Logout as Broker
    Login as an Underwriter
    Open Proposal From My Work
    ${element-check}  Run Keyword and Return status  Wait Until Element Is Visible  //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  20s
    Run Keyword if  ${element-check}  UMS Release hold
    Reload Page
    Stop Execution Before Binding and Issue Policy  &{test_data}
    DNO Quote options    &{test_data}
    DNO Generate Quote    &{test_data}
    DNO Billing    &{test_data}
    Upload Document    ${test_data}
    DNO Issue Binder    &{test_data}
    Document verification
    Policy Cancellation
    Get Policy Status    ${test_data}
    Verify Policy Status 1    ${test_data}
    Complete Cancellation  ${test_data}
    Get Policy Status    ${test_data}
    Verify Policy Status 2    ${test_data}
    Reinstatement
    Get Policy Status    ${test_data}
    Verify Policy Status 3    ${test_data}
