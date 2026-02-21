*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/Storage_Tank/ST_General_Information.resource
Resource  ../../Resource/Storage_Tank/Facility_Storage_Tank_Info.resource
Resource  ../../Resource/Storage_Tank/Prior_Coverage_Claim_History.resource
Resource  ../../Resource/Storage_Tank/Coverage_Selection.resource
Resource  ../../Resource/Storage_Tank/Facility_Storage_Tank_Schedule_Info.robot
Resource  ../../Resource/Storage_Tank/Surplus_License_Info.resource
Resource  ../../Resource/Upload_document.robot


*** Test Cases ***
TC_Storage_Tank_001
    [Tags]   Storage_Tank_Smoke_Test
    [Documentation]    Clearance hold
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['st']}${/}TC_ST_001.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_ST_001
    run keyword if  '${test_data['Dummy']}' == 'YES'  RE Create Dummy Data  ${test_data}
    Set To Dictionary    ${test_data}  Program=StorageTank
    Run Keyword And Continue On Failure   Manual entry basic Flow  &{test_data}
    @{res_row} =  Create list  TC_ST_001   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}


*** Keywords ***
Manual entry basic Flow
    [Arguments]    &{test_data}
    Login To V2 With Broker Email   ${test_data}
    Navigate To Storage Tank LOB
    ST General Information    &{test_data}
    ST Facility Storage Tank Info   &{test_data}
    ST Prior Coverage and Claim History  &{test_data}
    ST Coverage Selection   &{test_data}
    Run Keyword If    '${test_data['How do you want to provide your Facility and Storage Tank Schedule?']}'=='EnterSchedule'
    ...  run keyword  ST Facility Schedule  &{test_data}
     Run Keyword If    '${test_data['How do you want to provide your Facility and Storage Tank Schedule?']}'=='EnterSchedule'
    ...   ST Storage Tank Schedule  &{test_data}
    Run Keyword If  '${test_data['How do you want to provide your Facility and Storage Tank Schedule?']}'=='UploadSchedule'
    ...  ST CE Upload Document  Storage_Tank_Facility_and_Tank_Schedule.xlsx   Schedule of Facility and Tanks
    Sleep    15s
    Logout as Broker
    Login as an Underwriter
    Open Proposal From My Work
#    Continue Click Generate Quote
    Verify UW Hold and Release
    Stop Execution Before Binding and Issue Policy  &{test_data}
    ST Quote Option   &{test_data}
    ST Billing Inormation    &{test_data}
    ST Surplus Lines License Information  &{test_data}
    ST Issue Policy
    Policy Exit  ${Work ID}  ${test_data}