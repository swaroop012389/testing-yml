*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource    ../../Resource/Global-variable/v2.robot
Resource    ../../Resource/Generic.robot
Resource    ../../Resource/BR_Res/BR_General_Information.robot
Resource    ../../Resource/BR_Res/BR_Builder_Information.robot
Resource    ../../Resource/BR_Res/BR_Property_Under_Construction.robot
Resource    ../../Resource/BR_Res/BR_Project_Information.robot
Resource    ../../Resource/BR_Res/BR_Base_Automatic_Coverages.robot
Resource    ../../Resource/BR_Res/BR_Additional_Interests.robot
Resource    ../../Resource/BR_Res/BR_Billing_Information.robot
Resource    ../../Resource/BR_Res/BR_Generate_Quote.robot
Resource    ../../Resource/BR_Res/BR_Issue_Policy.robot
Resource    ../../Resource/UMS.robot
Resource    ../../Resource/TMS_RES/UMS_PAGE.robot
Resource    ../../Resource/BR_Res/BR_Quick_Cover_Eligibility.robot

*** Test Cases ***
TC_BR_003
    [Tags]    Builders Risk_Smoke_Test
    [Documentation]    Frame_New Construction_Flat Cancellation and Reinstatement, Broker Login
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['br']}${/}TC_BR_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_BR_003
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data BR  ${test_data}
    Set To Dictionary    ${test_data}  Program=BUILDERSRISK
    Run Keyword And Continue On Failure  Frame_New Construction_Flat Cancellation and Reinstatement  ${test_data}
    @{res_row} =  Create list  TC_BR_003   ${Work ID}  ${policy-no}
    Update resource file  ${res_row}

*** Keywords ***
Frame_New Construction_Flat Cancellation and Reinstatement
    [Arguments]     ${test_data}
    Login to Victor page   ${test_data}
    Builders Risk Navigation
    Insurance Agency Information    &{test_data}
    Close Cyber Cookies
    BR Quick Cover Eligibility      ${test_data}
    BR General Information    ${test_data}
    BR Builder Information    ${test_data}
    Property Under Construction    ${test_data}
    Project Information    ${test_data}
    Base And Automatic Coverages    ${test_data}
    Additional Interests
    wait until Page contains   The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.   20s
    UMS Release hold
    Reload Page
    Stop Execution Before Binding and Issue Policy  &{test_data}
    Generate Quote    ${test_data}
    Billing Information    ${test_data}
    Issue Policy    ${test_data}
    Sleep  15s
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
