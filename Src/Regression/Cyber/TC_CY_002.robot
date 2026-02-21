*** Settings ***
Documentation    Obtain atleast 1 surplus quote without holds or referals
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/Cyber_Res/Cyber_General_Information.robot
Resource  ../../Resource/Cyber_Res/Cyber_Basic_Company_Details.robot
Resource  ../../Resource/Cyber_Res/Cyber_Quote_Options.robot
Resource  ../../Resource/Cyber_Res/Cyber_Billing_And_Contact_Information.robot
Resource  ../../Resource/Cyber_Res/Cyber_Policy_Holds.robot
Resource  ../../Resource/Cyber_Res/Cyber UMS.robot


*** Test Cases ***
TC_CY_002
    [Tags]   Cyber Smoke_Test
    [Documentation]   Surplus Quote Without Holds
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['cyber']}${/}TC_CY_002.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_CY_002
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data Cyber  ${test_data}
    Run Keyword And Continue On Failure   Surplus Quote Without Holds   &{test_data}
    Write Log  Policy issued. Work id: ${WorkID} and Policy Number: ${policy-no}
    @{res_row} =  Create list  TC_CY_002   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
Surplus Quote Without Holds
    [Arguments]    &{test_data}
    Login to Victor page   ${test_data}
    Navigate to Cyber
    Close Cyber Cookies
    Insurance Agency Information    &{test_data}
    Cyber General Information    &{test_data}
    Cyber Basic Company Details    &{test_data}
    Cyber Coverage Selection    &{test_data}
    ${Hold-check}  Run Keyword and Return status  Wait Until Element Is Visible  //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  20s
    run keyword if    '${Hold-check}' == 'True'  Cyber UMS Release hold
    Stop Execution Before Binding and Issue Policy  &{test_data}
    Verify, If Quote Options are Available Or Not
    Cyber Select Quote Options   &{test_data}
    Surplus Lines Liscence Information    &{test_data}
    Go to UMS
    Fetch Policy Number In UMS  ${test_data}
    Navigate To Policy Holds Page
    Fail, If CFC Policy Hold is triggered

