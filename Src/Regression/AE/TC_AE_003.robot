*** Settings ***
Library     SeleniumLibrary
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/UMS.robot
Resource    ../../Resource/AE_Res/AE_General_Information.robot
Resource    ../../Resource/AE_Res/AE_Firm_Type-Service_Type.robot
Resource    ../../Resource/AE_Res/Project_types.robot
Resource    ../../Resource/AE_Res/Client_types .robot
Resource    ../../Resource/AE_Res/Staff_Information.robot
Resource    ../../Resource/AE_Res/Financial_Information.robot
Resource    ../../Resource/AE_Res/Business Information.robot
Resource    ../../Resource/AE_Res/Risk_Management_and_Loss_Prevention.robot
Resource    ../../Resource/AE_Res/AE_Prior_Coverage.robot
Resource    ../../Resource/AE_Res/AE_Claims_History.robot
Resource    ../../Resource/AE_Res/AE_Quote_Options.robot
Resource    ../../Resource/AE_Res/AE_Generate_Quote.robot
Resource    ../../Resource/AE_Res/AE_Billing_Information.robot
Resource    ../../Resource/AE_Res/AE_Issue_Policy.robot
Resource    ../../Resource/AE_Res/AE_Optional_Coverages.robot
Resource    ../../Resource/Upload_document.robot

*** Test Cases ***
TC_AE_003
    [Tags]    A&E_Smoke_Test
    [Documentation]   Architect Cancellation and Reinstatment
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['ae']}${/}TC_AE_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
     Set To Dictionary    ${test_data}  TestCaseNumber=TC_AE_003
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create dummy data  ${test_data}
    Set To Dictionary    ${test_data}  Program=SAE
    Run Keyword And Continue On Failure   Architect Cancellation and Reinstatment   &{test_data}
    @{res_row} =  Create list  TC_AE_003  ${WorkID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser


*** Keywords ***
Architect Cancellation and Reinstatment
        [Arguments]    &{test_data}
        Login to Victor page   ${test_data}
        Navigate to Architects Engineers & Consultants
        Insurance Agency Information    &{test_data}
        AE General Information  &{test_data}
        AE Firm Type/Service Type    &{test_data}
        AE Project Types   &{test_data}
        AE Client Types    &{test_data}
        AE Staff Information  &{test_data}
        AE Financial Information  &{test_data}
        AE Business Information  &{test_data}
        AE Risk Management and Loss Prevention  &{test_data}
        AE Prior Coverage  &{test_data}
        AE Claims History  &{test_data}
        AE Optional Coverages  &{test_data}
        Wait Until Page Contains Element    //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  40
        UMS Release hold
        Verify SAE Optional Coverages  &{test_data}
        Stop Execution Before Binding and Issue Policy  &{test_data}
        AE Quote Options    &{test_data}
        AE Generate Quote    &{test_data}
        AE Billing and Contact Information  &{test_data}
        AE Issue Policy
        Upload Document    ${test_data}
        Document verification