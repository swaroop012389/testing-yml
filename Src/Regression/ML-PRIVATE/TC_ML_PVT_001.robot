*** Settings ***
Documentation    Creating a basic policy
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../Resource/DNO_Res/DNO_General_Questions.robot
Resource  ../../Resource/DNO_Res/DNO_General_Information.robot
Resource  ../../Resource/DNO_Res/DNO_Applicant_Information.robot
Resource  ../../Resource/DNO_Res/DNO_Financial_Information.robot
Resource  ../../Resource/DNO_Res/DNO_Fiduciary_Liability.robot
Resource  ../../Resource/DNO_Res/Crime Liability.robot
Resource  ../../Resource/DNO_Res/Terms and Conditions.robot
Resource  ../../Resource/Generate_Quote.robot
Resource  ../../Resource/Billing&ContactInformation.robot
Resource  ../../Resource/Issue_policy.robot
Resource  ../../Resource/Upload_document.robot
Resource    ../../Resource/DNO_Res/Director&Officers Liability.robot
Resource    ../../Resource/DNO_Res/Sublimit Coverages.robot
Resource  ../../Resource/Alternus_RES/Servicing.robot

*** Test Cases ***
TC_ML_PVT_001
    [Tags]   Private_MGMT-LIAB_Smoke_Test
    [Documentation]    ML PVT California Metal Tank (Heavy Gauge) Manufacturing--332420 with Cancellation and Reinstatement.
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['ml-private']}${/}TC_ML_PVT_001.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_ML_PVT_001
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data ML Private  ${test_data}
    Run Keyword And Continue On Failure   ML PVT California Metal Tank (Heavy Gauge) Manufacturing--332420 with Cancellation and Reinstatement   ${test_data}
    @{res_row} =  Create list  TC_ML_PVT_001   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
ML PVT California Metal Tank (Heavy Gauge) Manufacturing--332420 with Cancellation and Reinstatement
    [Arguments]    ${test_data}
    Login To V2 With Broker Email  ${test_data}
    Navigate to Private_Company_Management_Liability
    Close Cyber Cookies
    Private Org Type check  &{test_data}
    DNO General Information  &{test_data}
    ML Private Financial Information    &{test_data}
    DNO General Questions    &{test_data}
    Director and Officers Liability  &{test_data}
    Private Employment Officers Liability  &{test_data}
    DNO Fiduciary Liability  &{test_data}
    Crime Liability  &{test_data}
    Private Sublimit Coverages Page  &{test_data}
    ${hold_msg}=  Run Keyword And Return Status    Wait Until Page Contains Element    //div[contains(text(),'The submission is held for underwriting review.')]  120s
#    Sleep   100s
    Run Keyword If   ${hold_msg}  Sleep    1s
    Logout as Broker
    Login as an Underwriter
    Open Proposal From My Work
    ${UW-check}=    Run Keyword and Return status    Wait Until Page Contains Element   //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  20s
    run keyword if    '${UW-check}' == 'True'    run keyword    UMS Release hold
    Reload Page
    Stop Execution Before Binding and Issue Policy  &{test_data}
    DNO Quote options    &{test_data}
    DNO Generate Quote    &{test_data}
    DNO Billing    &{test_data}
    DNO Issue Binder    &{test_data}
    sleep  40s
    Upload Document    ${test_data}
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