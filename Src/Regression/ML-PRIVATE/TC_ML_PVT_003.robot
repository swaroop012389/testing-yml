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
Resource  ../../Resource/Alternus_Res/BindEndorsement.robot
Resource  ../../Resource/Alternus_Res/Coverages.robot
Resource  ../../Resource/SAE_Res/Ratingbase.robot
Resource  ../../Resource/SAE_Res/Modifiers.robot
Resource  ../../Resource/Alternus_Res/Bind-Issue.robot
Resource  ../../Resource/Alternus_Res/QuoteLetter.robot

*** Test Cases ***
TC_ML_PVT_003
    [Tags]   Private_MGMT-LIAB_Smoke_Test
    [Documentation]    ML PVT Indiana Soybean Farming--111110 with ERP Endorsement
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['ml-private']}${/}TC_ML_PVT_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_ML_PVT_003
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data ML Private  ${test_data}
    Run Keyword And Continue On Failure   ML PVT Indiana Soybean Farming--111110 with ERP Endorsement   ${test_data}
    @{res_row} =  Create list  TC_ML_PVT_003   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
ML PVT Indiana Soybean Farming--111110 with ERP Endorsement
    [Arguments]    ${test_data}
    Login to Victor page   ${test_data}
    Navigate to Private_Company_Management_Liability
    Insurance Agency Information    &{test_data}
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
    sleep   85s
    ${UW-check}=    Run Keyword and Return status    Page should contain    The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.
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
    Get Policy Status    ${test_data}
    Servicing
    MT Endorsement With Expiration Date    ${test_data}
    ML-PRIVATE ERP   ${test_data}
    Private ERP Validation   ${test_data}
    Modifiers
    Limit/Deductible Options
    Create Bundle
    Quote Options
    Endorsement Options
    Quote Letter Generation
    Private Bind Endorsement  ${test_data}




