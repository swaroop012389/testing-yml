*** Settings ***
Documentation    Creating a basic policy
Library    SeleniumLibrary
Resource    ../../Resource/Global-variable/v2.robot
Resource    ../../Resource/Raven_Res/Raven_Keywords.resource

*** Test Cases ***
TC_Raven_Smoke_Test_003
    [Tags]    Raven_Smoke_Test
    [Documentation]    AOP+Windstorm+Severe Convective storm+TRIA policy generation
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['raven']}${/}TC_Raven_003.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
#    run keyword if  '${test_data['Dummy']}' == 'YES'  RE Create Dummy Data  ${test_data}
    Run Keyword And Continue On Failure  Cancellation by Flat  &{test_data}
    @{res_row} =  Create list  TC_Raven_003   NA  ${policy-no}
    Update resource file  ${res_row}
    Close Browser
