*** Settings ***
Resource  ../../Resource/Global-variable/v2.robot
Test Teardown    Close Browser
Resource  ../../Resource/Upload_document.robot
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/CE_Res/CE_General_Information.robot
Resource  ../../Resource/CE_Res/CE_Claims_History.robot
Resource  ../../Resource/CE_Res/CE_Contractor_Information.robot
Resource  ../../Resource/CE_Res/CE_Equipment_Information.robot
Resource  ../../Resource/CE_Res/CE_Loss_Payee.robot
Resource  ../../Resource/CE_Res/CE_Quote_Options.robot
Resource  ../../Resource/CE_Res/CE_Billing&Contact_Information.robot
Resource  ../../Resource/CE_Res/CE_Issue_Policy.robot

*** Test Cases ***
TC_CE_003
    [Tags]    Contractors Equipment_Smoke_Test
    [Documentation]    Pieces_6 to 20_Claims_2.5k Deductible
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['ce']}${/}TC_CE_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_CE_003
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data CE  ${test_data}
    Set To Dictionary    ${test_data}  Program=CE
    Run Keyword And Continue On Failure   Pieces_6 to 20_Claims_2.5k Deductible   ${test_data}
    @{res_row} =  Create list  TC_CE_003   ${Work ID}  ${test_data['PolicyNumber']}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
Pieces_6 to 20_Claims_2.5k Deductible
    [Arguments]    ${test_data}
    Login to Victor page   ${test_data}
    Contractor Equipment Navigation
    Insurance Agency Information    &{test_data}
    CE General Information     ${test_data}
    CE Claims History     ${test_data}
    CE Contractor Information    ${test_data}
    CE Equipment Information    ${test_data}
    CE Additional Interests    ${test_data}
    Verify UW Hold Message on Quote Options Page
    Stop Execution Before Binding and Issue Policy  &{test_data}
    Select Quote Option    ${test_data}
    CE Billing and Contact Information    ${test_data}
    CE Issue Policy    ${test_data}
    Document verification
    Fetch Policy Number In UMS  ${test_data}