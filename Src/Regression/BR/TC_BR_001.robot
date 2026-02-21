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
Resource    ../../Resource/BR_Res/BR_Wind_Coverages.robot
Resource    ../../Resource/BR_Res/BR_Additional_Interests.robot
Resource    ../../Resource/UMS.robot
Resource    ../../Resource/BR_Res/BR_Billing_Information.robot
Resource    ../../Resource/BR_Res/BR_Generate_Quote.robot
Resource    ../../Resource/BR_Res/BR_Issue_Policy.robot
Resource    ../../Resource/BR_Res/BR_Quick_Cover_Eligibility.robot

*** Test Cases ***
TC_BR_001
    [Tags]   Builders Risk_Smoke_Test
    [Documentation]    Masonry non-combustible_Wind Deductible_Texas
    #&{TC_INFO}=  BR Setup test data
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['br']}${/}TC_BR_001.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_BR_001
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data BR  ${test_data}
    Set To Dictionary    ${test_data}  Program=BUILDERSRISK
    Run Keyword And Continue On Failure  Masonry non-combustible_Wind Deductible_Texas    ${test_data}
    @{res_row} =  Create list  TC_BR_001   ${Work ID}  ${policy-no}
    Update resource file  ${res_row}

*** Keywords ***
Masonry non-combustible_Wind Deductible_Texas
    [Arguments]     ${test_data}
    Login To V2 With Broker Email  ${test_data}
    Builders Risk Navigation
    Close Cyber Cookies
    BR Quick Cover Eligibility      ${test_data}
    BR General Information    ${test_data}
    BR Builder Information    ${test_data}
    Property Under Construction    ${test_data}
    Project Information    ${test_data}
    Base And Automatic Coverages    ${test_data}
    Wind Coverages    ${test_data}
    Additional Interests
    wait until Page contains element  //div[contains(text(),'The submission is held for underwriting review.')]  60s
    Logout as Broker
    Login as an Underwriter
    Open Proposal From My Work
    UMS Release hold
    Reload Page
    Stop Execution Before Binding and Issue Policy  &{test_data}
    Generate Quote    ${test_data}
    Billing Information    ${test_data}
    Issue Policy    ${test_data}
    Upload Document    ${test_data}
    Document verification