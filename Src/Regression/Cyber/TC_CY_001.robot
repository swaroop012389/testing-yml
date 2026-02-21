*** Settings ***
Documentation    Get three quotes without holds i.e Basic Quote
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/Cyber_Res/Cyber_General_Information.robot
Resource  ../../Resource/Cyber_Res/Cyber_Basic_Company_Details.robot
Resource  ../../Resource/Cyber_Res/Cyber_Quote_Options.robot
Resource  ../../Resource/Cyber_Res/Cyber_Policy_Holds.robot
Resource  ../../Resource/UMS.robot
Resource    ../../Resource/Cyber_Res/Cyber_Billing_And_Contact_Information.robot
Resource  ../../Resource/Cyber_Res/Cyber_Issue_Policy.robot


*** Test Cases ***
TC_CY_001
    [Tags]   Cyber Smoke_Test
    [Documentation]   Basic Quote
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['cyber']}${/}TC_CY_001.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_CY_001
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data Cyber  ${test_data}
    Run Keyword And Continue On Failure   Basic Quote   &{test_data}
    Write Log  Policy issued. Work id: ${WorkID} and Policy Number: ${policy-no}
    @{res_row} =  Create list  TC_CY_001   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}

*** Keywords ***
Basic Quote
    [Arguments]    &{test_data}
    Login To V2 With Broker Email  ${test_data}
    Navigate to Cyber
    Cyber General Information  &{test_data}
    Cyber Basic Company Details    &{test_data}
    Cyber Coverage Selection    &{test_data}
    ${element-check_B}=  Run Keyword and Return status  Wait Until Page Contains Element   //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  50s
    Run Keyword If   ${element-check_B}    Logout as Broker and Login as Underwriter
    ${element-check}  Run Keyword and Return status  Wait Until Element Is Visible  //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  50s
    Run Keyword if   ${element-check}    UMS Release hold
    Verify, If Quote Options are Available Or Not
    Stop Execution Before Binding and Issue Policy  &{test_data}
    Cyber Select Quote Options    &{test_data}
    Cyber Billing and Contact Information    &{test_data}
    Cyber Issue Policy
    Verify policy Summary Details    &{test_data}
    Run Keyword If  '${element-check_B}'=='False'    Logout as Broker and Login as Underwriter
    Go to UMS
    Fetch Policy Number In UMS    ${test_data}
    Navigate To Policy Holds Page
    Fail, If CFC Policy Hold is triggered

Logout as Broker and Login as Underwriter
    Logout as Broker
    Login as an Underwriter
    Open Proposal From My Work