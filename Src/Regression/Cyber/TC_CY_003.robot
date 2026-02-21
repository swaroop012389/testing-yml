*** Settings ***
Documentation    Get three quotes without holds i.e Basic Quote
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/Cyber_Res/Cyber_General_Information.robot
Resource  ../../Resource/Cyber_Res/Cyber_Basic_Company_Details.robot
Resource  ../../Resource/Cyber_Res/Cyber_Quote_Options.robot
Resource  ../../Resource/Cyber_Res/Cyber_Policy_Holds.robot
Resource  ../../Resource/Cyber_Res/Cyber_Issue_Policy.robot
Resource  ../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../Resource/UMS.robot
Resource    ../../Resource/Cyber_Res/Cyber_Billing_And_Contact_Information.robot
Resource    ../../Resource/Cyber_Res/Cyber UMS.robot

*** Test Cases ***
TC_CY_003
    [Tags]   Cyber Smoke_Test
    [Documentation]   Select Quote Option 1 and Issue Policy, Basic Quote
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['cyber']}${/}TC_CY_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_CY_003
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data Cyber  ${test_data}
    Run Keyword And Continue On Failure   Select Quote Option 1 and Issue Policy, Basic Quote   &{test_data}
    Write Log  Policy issued. Work id: ${WorkID} and Policy Number: ${policy-no}
    @{res_row} =  Create list  TC_CY_003   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
Select Quote Option 1 and Issue Policy, Basic Quote
     [Arguments]    &{test_data}
     Login to Victor page   ${test_data}
     Navigate to Cyber
     Close Cyber Cookies
     Insurance Agency Information    &{test_data}
     Cyber General Information    &{test_data}
     Cyber Basic Company Details    &{test_data}
     Cyber Coverage Selection    &{test_data}
     Run Keyword If    ${Pop-up}  Cyber UMS Release hold
     Stop Execution Before Binding and Issue Policy  &{test_data}
     Verify, If Quote Options are Available Or Not
     Cyber Select Quote Options    &{test_data}
     Cyber Billing and Contact Information    &{test_data}
     Cyber Issue Policy
     Verify policy Summary Details    &{test_data}
     Go to UMS
     Fetch Policy Number In UMS    ${test_data}
     Get Policy Status    ${test_data}
     Verify Policy Status 3    ${test_data}
#     Navigate To Portal Questions Page
#     Verify V2 General Information Details Matches On UMS Side    &{test_data}
#     Verify V2 Basic Company Details Matches On UMS Side    &{test_data}
#     Verify Disclaimer Question Answers on UMS Portal Question Page    &{test_data}

     Policy Cancellation
     Get Policy Status    ${test_data}
     Verify Policy Status 1    ${test_data}
     Complete Cancellation    ${test_data}
     Get Policy Status    ${test_data}
     Verify Policy Status 2    ${test_data}
     Reinstatement
     Get Policy Status    ${test_data}
     Verify Policy Status 3    ${test_data}
