*** Settings ***
Documentation    TMS MGMT-LIAB NON PROFIT Test cases
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Resource    ../../../../Data Provider/DataProvider.robot

Resource    TC_TMS_MGMT_NFP_022.robot
Resource    TC_TMS_MGMT_NFP_024.robot
Resource    TC_TMS_MGMT_NFP_030.robot
Suite Setup  Setup test data
Test Teardown  close browser


*** Test Cases ***
TMS MGMT LIAB NON PROFIT
    FOR    ${tc_name}    IN  @{TC_INFO}
        log to console  ${tc_name}
        ${TMS_Policy_Number} =  Set variable  Nil
        ${file_path}=    set variable    ${CONFIG_DATA['Path']['tms_mgmt_np']}${/}${tc_name}.xlsx
        &{test_data_Value}=    Read TC Row Data    ${file_path}    ${tc_name}
        &{test_data} =  Get from dictionary  ${test_data_Value}  ${tc_name}
        Get Account executive Names  ${test_data}
        run keyword if  '${tc_name}' in ['TC_TMS_MGMT_NFP_061','TC_TMS_MGMT_NFP_062','TC_TMS_MGMT_NFP_063','TC_TMS_MGMT_NFP_064','TC_TMS_MGMT_NFP_065']  Create dummy data  ${test_data}
        Run keyword    TMS MGMT LIAB NON PROFIT Test Cases   ${tc_name}    &{test_data}
        @{res_row}=  Create list  ${tc_name}  ${TMS_Policy_Number}
        Update TMS_resource file  ${res_row}
        close all browsers
    END


*** Keywords ***
TMS MGMT LIAB NON PROFIT Test Cases
    [Arguments]    ${test_name}    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_NFP_022"    run keyword and continue on failure    Reminder Renewal in UW Review Declined by Client Express       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_NFP_024"    run keyword and continue on failure    Reminder Renewal in UW Review Declined by Carrier Express       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_NFP_030"    run keyword and continue on failure    Bound Not Issued Quoted_Guided       &{test_data}

Setup test data
    &{config_data}=  Read config data  config.txt
    Set global Variable  &{CONFIG_DATA}  &{config_data}
    log to console  ${CONFIG_DATA['Path']['tms_mgmt_np']}${/}
    ${master_file}=  Set variable  ${CONFIG_DATA['Path']['tms_mgmt_np']}${/}TMS_Non_Profit_TestData.xlsx
    @{file_info}=  Read master file id  ${master_file}
    log to console    ${file_info}
    Set global Variable  @{TC_INFO}  @{file_info}

Create dummy data
        [Arguments]  ${test_data}
        ${FirmName}=  DummyBrokername
        ${FirstName}=  DummyFirstName
        ${Lastname}=  DummylastName
        ${Email}=  dummyemail
        ${AddressLine}=  Dummy st Address
        Set to dictionary  ${test_data}  Applicant Name=${FirmName}  First Name=${FirstName}  Last Name=${Lastname}  Main Contact E-mail Address=${Email}  Address Line1=${AddressLine}

