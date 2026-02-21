*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Resource  ../../../Data Provider/DataProvider.robot
Resource    TC_ALT_001.robot
Resource    TC_ALT_002.robot
Resource    TC_ALT_003.robot
Resource    TC_ALT_004.robot
Resource    TC_ALT_005.robot
Resource    TC_ALT_006.robot
Resource    TC_ALT_007.robot
Resource    TC_ALT_008.robot
Resource    TC_ALT_009.robot
Resource    TC_ALT_010.robot
Resource    TC_ALT_011.robot
Resource    TC_ALT_012.robot
Resource    TC_ALT_013.robot
Resource    TC_ALT_014.robot
Resource    TC_ALT_015.robot
Resource    TC_ALT_016.robot
Resource    TC_ALT_017.robot
Resource    TC_ALT_018.robot
Resource    TC_ALT_019.robot
Resource    TC_ALT_020.robot
Resource    TC_ALT_021.robot
Resource    TC_ALT_022.robot
Resource    TC_ALT_023.robot
Resource    TC_ALT_024.robot
Resource    TC_ALT_025.robot
Resource    TC_ALT_026.robot
Resource    TC_ALT_027.robot
Resource    TC_ALT_028.robot
Resource    TC_ALT_029.robot
Resource    TC_ALT_030.robot
Resource    TC_ALT_031.robot
Suite Setup  Setup test data
#Test Teardown  Close browser

*** Test Cases ***
Test title
    @{TC_INFO}=  Setup test data
    FOR    ${tc_name}    IN  @{TC_INFO}
    Create Alternus resource file
    log to console  ${tc_name}
    &{config_data}=  Read config data  config.txt
    ${file_path}=    set variable    ${config_data['Path']['alt']}${/}${tc_name}.xlsx
    &{test_data_Value}=    Read TC Row Data    ${file_path}    ${tc_name}
    &{test_data}=  Get from dictionary  ${test_data_Value}  ${tc_name}
    ${Testcase}=  set variable  ${test_data['TestCase Name']}
    log to console  ${Testcase}
    log to console    ${test_data}
    Run keyword    RunTestCase    ${tc_name}    &{test_data}
    @{res_row}=  Create list  ${tc_name}  ${Testcase}  ${Policy_Number}
    Update Alt_resource file  ${res_row}
   #close browser
    END

*** Keywords ***
RunTestCase
    [Arguments]    ${test_name}    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_001"    run keyword and continue on failure    Market Follow On Primary Existing Policy with TRIA    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_002"    run keyword and continue on failure    Market Follow On Primary Existing Policy without TRIA    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_003"    run keyword and continue on failure    Market Follow On Primary New Record with TRIA    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_004"    run keyword and continue on failure    Market Follow On Primary New Record without TRIA    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_005"    run keyword and continue on failure    Market Follow On Excess Existing Policy with TRIA    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_006"    run keyword and continue on failure    Market Follow On Excess Existing Policy without TRIA    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_007"    run keyword and continue on failure    Market Follow On Excess New Record with TRIA   &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_008"    run keyword and continue on failure    Market Follow On Excess New Record without TRIA    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_009"    run keyword and continue on failure    Primary/Excess with TRIA Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_010"    run keyword and continue on failure    Primary/Excess without TRIA Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_011"    run keyword and continue on failure    Primary/Excess Manual Entry with TRIA Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_012"    run keyword and continue on failure    Primary/Excess Manual Entry without TRIA Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_013"    run keyword and continue on failure    Primary/Excess with Reinsurance required Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_014"    run keyword and continue on failure    Primary/Excess with TRIA Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_015"    run keyword and continue on failure    Primary/Excess without TRIA Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_016"    run keyword and continue on failure    Primary/Excesss Manual Entry without TRIA Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_017"    run keyword and continue on failure    Primary/Excess without TRIA and with Reinsurance Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_018"    run keyword and continue on failure    Reinsurance with TRIA Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_019"    run keyword and continue on failure    Reinsurance without TRIA Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_020"    run keyword and continue on failure    Reinsurance with TRIA Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_021"    run keyword and continue on failure    Reinsurance without TRIA Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_022"    run keyword and continue on failure    Endorsement with New/Renewal Issuance    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_023"    run keyword and continue on failure    Endorsement without New/Renewal Issuance    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_024"    run keyword and continue on failure    Market Follow On Primary Cancellation and Re-Instatement    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_025"    run keyword and continue on failure    Primary/Excesss Manual Entry with TRIA Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_026"    run keyword and continue on failure    Reinsurance without Manual Entry and with Reinsurance required Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_027"    run keyword and continue on failure    Reinsurance without TRIA and Reinsurance required Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_028"    run keyword and continue on failure    Reinsurance with TRIA and without Manual Entry Primary    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_029"    run keyword and continue on failure    Reinsurance with TRIA and Reinsurance required Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_030"    run keyword and continue on failure    Reinsurance without TRIA and Reinsurance required Excess    &{test_data}
    run keyword if    "${test_name}"=="TC_ALT_031"    run keyword and continue on failure    Reinsurance with TRIA and without Manual Entry Excess    &{test_data}

Setup test data
    &{config_data}=  Read config data  config.txt
    ${master_file}=  Set variable  ${config_data['Path']['alt']}${/}Alternus_TestData.xlsx
    @{file_info}=  Read Execution Master  ${master_file}
    log to console    ${file_info}
    RETURN  @{file_info}