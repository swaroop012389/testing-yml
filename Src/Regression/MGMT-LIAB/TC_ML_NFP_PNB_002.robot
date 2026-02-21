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
Resource  ../../Resource/Alternus_Res/BindEndorsement.robot

*** Test Cases ***
TC_ML_NFP_PNB_002
    [Tags]   MGMT-LIAB_NFP_Smoke_Test
    [Documentation]    ML FEIN Pennsylvania Midterm Premium Endorsement
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['mgmt-liab_nfp_pnb']}${/}TC_ML_NFP_PNB_002.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_ML_NFP_PNB_002
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data MGMT NFP  ${test_data}
    Run Keyword And Continue On Failure  ML FEIN Pennsylvania Midterm Premium Endorsement   &{test_data}
    @{res_row} =  Create list  TC_ML_NFP_PNB_002   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
ML FEIN Pennsylvania Midterm Premium Endorsement
    [Arguments]    &{test_data}
    Login to Victor page   ${test_data}
    Navigate to Non-Profit_Management_Liability
    Insurance Agency Information    &{test_data}
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
    Get Policy Status    ${test_data}
    Verify Policy Status 1    ${test_data}
    Servicing
    MT Endorsement    ${test_data}
    Get Policy Status for Endrosement    ${test_data}
    Verify Policy Status 2    ${test_data}
    Get Policy Stage for Endrosement    ${test_data}
    Verify Policy Stage 1    ${test_data}
    Adding Endorsement    ${test_data}
    Endorsement Bind No Additional Premium    ${test_data}
    Verify Generated Document Name    ${test_data}

