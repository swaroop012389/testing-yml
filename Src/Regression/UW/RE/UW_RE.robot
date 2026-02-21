*** Settings ***

Library  Collections
Library  String
Library  DateTime
Resource  ../../../Resource/Global-variable/v2.robot
Resource  ../../../Resource/UMS.robot
Resource  ../../../../Data Provider/DataProvider.robot
Resource    TC_UW_RE_001.robot
Resource    TC_UW_RE_002.robot
Resource    TC_UW_RE_003.robot
Resource    TC_UW_RE_004.robot
Resource    TC_UW_RE_005.robot
Suite Setup  Setup test data
#Test Teardown  close browser

*** Test Cases ***
Execute Test cases
    &{TC_INFO}=  Setup test data
    #Create resource file
    FOR    ${tc_name}  ${tc_file}  IN  &{TC_INFO}
    ${policy-no} =  Set variable  Nil
    log to console  TestcaseName:${tc_name}
    log to console  TestcaseId:${tc_file}
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['uw']}${/}${tc_file}.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Run Keyword And Continue On Failure    ${tc_name}    &{test_data}
    @{res_row} =  Create list  ${tc_file}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser
    END

*** Keywords ***
RunTestCase
    [Arguments]    ${test_name}    &{test_data}
    IF    "${test_name}"=="TC_UW_RE_001"    run keyword and continue on failure   To Search Real estate rules with all the fields selected   &{test_data}
    IF    "${test_name}"=="TC_UW_RE_002"    run keyword and continue on failure   To Create a rule with an Account Executive    &{test_data}
    IF    "${test_name}"=="TC_UW_RE_003"    run keyword and continue on failure   To Create a rule with Account Executive with dates  &{test_data}
    IF    "${test_name}"=="TC_UW_RE_004"    run keyword and continue on failure   To Search a rule based on the Retail agent by name and edit a rule  &{test_data}
    IF    "${test_name}"=="TC_UW_RE_005"    run keyword and continue on failure   To Search a rule based on the Retail agent by id and edit a rule  &{test_data}
Setup test data
       &{config_data}=  Read config data  config.txt
       ${master_file}=  Set variable  ${config_data['Path']['uw']}${/}UW_RE_MasterSheet.xlsx
       &{file_info}=  Read master file  ${master_file}
       RETURN  &{file_info}