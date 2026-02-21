*** Settings ***
Documentation    TMS MGMT-LIAB NON PROFIT Test cases
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Resource    ../../../../Data Provider/DataProvider.robot
Resource    TC_TMS_MGMT_PVT_001.robot
Resource    TC_TMS_MGMT_PVT_002.robot
Resource    TC_TMS_MGMT_PVT_003.robot
Resource    TC_TMS_MGMT_PVT_004.robot
Resource    TC_TMS_MGMT_PVT_005.robot
Resource    TC_TMS_MGMT_PVT_006.robot
Resource    TC_TMS_MGMT_PVT_007.robot
Resource    TC_TMS_MGMT_PVT_008.robot
Resource    TC_TMS_MGMT_PVT_009.robot
Resource    TC_TMS_MGMT_PVT_010.robot
Resource    TC_TMS_MGMT_PVT_011.robot
Resource    TC_TMS_MGMT_PVT_012.robot
Resource    TC_TMS_MGMT_PVT_013.robot
Resource    TC_TMS_MGMT_PVT_014.robot
Resource    TC_TMS_MGMT_PVT_015.robot
Resource    TC_TMS_MGMT_PVT_016.robot
Resource    TC_TMS_MGMT_PVT_017.robot
Resource    TC_TMS_MGMT_PVT_018.robot
Resource    TC_TMS_MGMT_PVT_019.robot
Resource    TC_TMS_MGMT_PVT_020.robot
Resource    TC_TMS_MGMT_PVT_021.robot
Resource    TC_TMS_MGMT_PVT_022.robot
Resource    TC_TMS_MGMT_PVT_023.robot
Resource    TC_TMS_MGMT_PVT_024.robot
Resource    TC_TMS_MGMT_PVT_025.robot
Resource    TC_TMS_MGMT_PVT_026.robot

Suite Setup  Setup test data
Test Teardown  close browser


*** Test Cases ***
TMS MGMT LIAB PVT
    FOR    ${tc_name}    IN  @{TC_INFO}
        log to console  ${tc_name}
        ${TMS_Policy_Number} =  Set variable  Nil
        ${file_path}=    set variable    ${CONFIG_DATA['Path']['tms_mgmt_pvt']}${/}${tc_name}.xlsx
        &{test_data_Value}=    Read TC Row Data    ${file_path}    ${tc_name}
        &{test_data} =  Get from dictionary  ${test_data_Value}  ${tc_name}
        Get Account executive Names  ${test_data}
        run keyword if  '${tc_name}' in ['TC_TMS_MGMT_PVT_029','TC_TMS_MGMT_NFP_030','TC_TMS_MGMT_NFP_031','TC_TMS_MGMT_NFP_032','TC_TMS_MGMT_NFP_033']  Create dummy data  ${test_data}
        Run keyword    TMS MGMT LIAB PVT Test Cases   ${tc_name}    &{test_data}
        @{res_row}=  Create list  ${tc_name}  ${TMS_Policy_Number}
        Update TMS_resource file  ${res_row}
        close all browsers
    END


*** Keywords ***
TMS MGMT LIAB PVT Test Cases
    [Arguments]    ${test_name}    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_001"    run keyword and continue on failure    Application Received_Pending    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_002"    run keyword and continue on failure    Application Received_Quoted    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_003"    run keyword and continue on failure    Application Received_Bound    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_004"    run keyword and continue on failure    Application Received_Inforce    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_005"    run keyword and continue on failure    Application Received_Decline by Client   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_006"    run keyword and continue on failure    Application Received_Decline by Carrier   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_007"    run keyword and continue on failure    Binder Request Received_Pending_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_008"    run keyword and continue on failure    Binder Request Received_Quoted_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_009"    run keyword and continue on failure    Broker Inquiry_Pending_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_010"    run keyword and continue on failure    Broker Inquiry_Quoted_Classic   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_011"    run keyword and continue on failure    Broker Inquiry_Bound_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_012"    run keyword and continue on failure    Broker Inquiry_In Force_Classic   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_013"    run keyword and continue on failure    Pending Cancellation    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_014"    run keyword and continue on failure    Pending Cancellation_Abandon    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_015"    run keyword and continue on failure    Pending Cancellation_Tomorrow    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_016"    run keyword and continue on failure    Pending Endorsement        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_017"    run keyword and continue on failure    Pending Endorsement 02        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_018"    run keyword and continue on failure    Bound Not Issued       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_022"    run keyword and continue on failure    V2 UW Review_Decline application        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_023"    run keyword and continue on failure    V2 UW Lose a Quote        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_024"    run keyword and continue on failure    V2 UW Review Changing stauts to quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_025"    run keyword and continue on failure    V2 UW Review Changing stauts to Pending_Info        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_026"    run keyword and continue on failure    V2 UW Review Changing stauts to Pending      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_019"    run keyword and continue on failure    Follow-Up_Pending       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_020"    run keyword and continue on failure    Follow-Up_Quoted       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_MGMT_PVT_021"    run keyword and continue on failure    Follow-Up_Bound       &{test_data}

Setup test data
    &{config_data}=  Read config data  config.txt
    Set global Variable  &{CONFIG_DATA}  &{config_data}
    log to console  ${CONFIG_DATA['Path']['tms_mgmt_pvt']}${/}
    ${master_file}=  Set variable  ${CONFIG_DATA['Path']['tms_mgmt_pvt']}${/}TMS_Private_TestData.xlsx
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

