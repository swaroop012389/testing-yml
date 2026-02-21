*** Settings ***
Documentation    TMS SAE Test Cases
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Resource    ../../../../Data Provider/DataProvider.robot
Resource    TC_TMS_SAE_001.robot
Resource    TC_TMS_SAE_002.robot
Resource    TC_TMS_SAE_003.robot
Resource    TC_TMS_SAE_004.robot
Resource    TC_TMS_SAE_005.robot
Resource    TC_TMS_SAE_006.robot
Resource    TC_TMS_SAE_007.robot
Resource    TC_TMS_SAE_008.robot
Resource    TC_TMS_SAE_009.robot
Resource    TC_TMS_SAE_010.robot
Resource    TC_TMS_SAE_011.robot
Resource    TC_TMS_SAE_012.robot
Resource    TC_TMS_SAE_013.robot
Resource    TC_TMS_SAE_014.robot
Resource    TC_TMS_SAE_015.robot
Resource    TC_TMS_SAE_016.robot
Resource    TC_TMS_SAE_017.robot
Resource    TC_TMS_SAE_018.robot
Resource    TC_TMS_SAE_019.robot
Resource    TC_TMS_SAE_020.robot
Resource    TC_TMS_SAE_021.robot
Resource    TC_TMS_SAE_022.robot
Resource    TC_TMS_SAE_023.robot
Resource    TC_TMS_SAE_024.robot
Resource    TC_TMS_SAE_025.robot
Resource    TC_TMS_SAE_026.robot
Resource    TC_TMS_SAE_027.robot
Resource    TC_TMS_SAE_028.robot
Resource    TC_TMS_SAE_029.robot
Resource    TC_TMS_SAE_030.robot
Resource    TC_TMS_SAE_031.robot
Resource    TC_TMS_SAE_032.robot
Resource    TC_TMS_SAE_033.robot
Resource    TC_TMS_SAE_034.robot
Resource    TC_TMS_SAE_035.robot
Resource    TC_TMS_SAE_036.robot
Resource    TC_TMS_SAE_037.robot
Resource    TC_TMS_SAE_038.robot
Resource    TC_TMS_SAE_039.robot
Resource    TC_TMS_SAE_040.robot
Resource    TC_TMS_SAE_041.robot
Resource    TC_TMS_SAE_042.robot
Resource    TC_TMS_SAE_043.robot
Resource    TC_TMS_SAE_044.robot
Resource    TC_TMS_SAE_045.robot
Resource    TC_TMS_SAE_046.robot
Resource    TC_TMS_SAE_047.robot
Resource    TC_TMS_SAE_048.robot
Resource    TC_TMS_SAE_049.robot
Resource    TC_TMS_SAE_050.robot
Resource    TC_TMS_SAE_051.robot
Resource    TC_TMS_SAE_052.robot
Resource    TC_TMS_SAE_053.robot
Resource    TC_TMS_SAE_054.robot
Resource    TC_TMS_SAE_055.robot
Suite Setup  Setup test data
#Test Teardown  close browser


*** Test Cases ***
TMS SAE Test
    FOR    ${tc_name}    IN  @{TC_INFO}
        log to console  ${tc_name}
        ${TMS_Policy_Number} =  Set variable  Nil
        ${file_path}=    set variable    ${CONFIG_DATA['Path']['tms_sae']}${/}${tc_name}.xlsx
        &{test_data_Value}=    Read TC Row Data    ${file_path}    ${tc_name}
        &{test_data} =  Get from dictionary  ${test_data_Value}  ${tc_name}
        Get Account executive Names  ${test_data}
        run keyword if  '${tc_name}' in ['TC_TMS_SAE_039','TC_TMS_SAE_040','TC_TMS_SAE_041','TC_TMS_SAE_042','TC_TMS_SAE_043']  Create dummy data  ${test_data}
        Run keyword    TMS SAE Test cases    ${tc_name}    &{test_data}
        @{res_row}=  Create list  ${tc_name}  ${TMS_Policy_Number}
        Update TMS_resource file  ${res_row}
        close all browsers
    END


*** Keywords ***
TMS SAE Test cases
    [Arguments]    ${test_name}    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_001"    run keyword and continue on failure    Application Received_Pending    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_002"    run keyword and continue on failure    Application Received_Quoted    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_003"    run keyword and continue on failure    Application Received_Bound    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_004"    run keyword and continue on failure    Application Received_Inforce    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_005"    run keyword and continue on failure    Application Received_Decline by Client   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_006"    run keyword and continue on failure    Application Received_Decline by Carrier   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_007"    run keyword and continue on failure    Binder Request Received_Pending_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_008"    run keyword and continue on failure    Binder Request Received_Quoted_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_009"    run keyword and continue on failure    Broker Inquiry_Pending_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_010"    run keyword and continue on failure    Broker Inquiry_Quoted_Classic   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_011"    run keyword and continue on failure    Broker Inquiry_Bound_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_012"    run keyword and continue on failure    Broker Inquiry_In Force_Classic   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_013"    run keyword and continue on failure    Name Ownership Change_Pending_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_014"    run keyword and continue on failure    Name Ownership Change_Quoted_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_015"    run keyword and continue on failure    Name Ownership Change_Bound_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_016"    run keyword and continue on failure    Name Ownership Change_In Force_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_017"    run keyword and continue on failure    Pending Cancellation    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_018"    run keyword and continue on failure    Pending Cancellation_Abandon    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_019"    run keyword and continue on failure    Pending Cancellation_Tomorrow    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_020"    run keyword and continue on failure    Pending Endorsement        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_021"    run keyword and continue on failure    Pending Endorsement 02        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_022"    run keyword and continue on failure    Review Non-Renewal Status_AutoClose        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_023"    run keyword and continue on failure    Review Non-Renewal Status_ManualClose        &{test_data}       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_024"    run keyword and continue on failure    Broker Inquiry_Pending_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_025"    run keyword and continue on failure    Broker Inquiry_Quoted_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_026"    run keyword and continue on failure    Broker Inquiry_Bound_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_027"    run keyword and continue on failure    Broker Inquiry_In Force_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_028"    run keyword and continue on failure    Binder Request Received_Pending_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_029"    run keyword and continue on failure    Binder Request Received_Pending_Endorsement_Classic        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_030"    run keyword and continue on failure    Binder Request Received_Quoted_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_031"    run keyword and continue on failure    Application Received_Decline by Client_Quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_032"    run keyword and continue on failure    Application Received_Decline by Client_Bound        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_033"    run keyword and continue on failure    Application Received_Decline by Client_UW Review        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_034"    run keyword and continue on failure    Application Received_Decline by Carrier_Quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_035"    run keyword and continue on failure    Application Received_Decline by Carrier_Bound        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_036"    run keyword and continue on failure    Application Received_Decline by Carrier_UW Review        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_037"    run keyword and continue on failure    TMS_Side_Testing        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_038"    run keyword and continue on failure    Bound Not Issued Quoted_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_039"    run keyword and continue on failure    V2 UW Review Decline Application      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_040"    run keyword and continue on failure    V2 UW Review Lose a quote      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_041"    run keyword and continue on failure    V2 UW Review Changing status to Quoted      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_042"    run keyword and continue on failure    V2 UW Review Changing status to pending info      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_043"    run keyword and continue on failure    V2 UW Review Changing status to pending      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_044"    run keyword and continue on failure    Renewal Expiration Pending      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_045"    run keyword and continue on failure    Renewal Expiration Quoted      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_046"    run keyword and continue on failure    Renewal Expiration Bound      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_047"    run keyword and continue on failure    Renewal Expiration UW Review      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_048"    run keyword and continue on failure    Renewal Expiration Pending-Info      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_049"    run keyword and continue on failure    Follow-Up_Pending_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_050"    run keyword and continue on failure    Follow-Up_Bound_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_051"    run keyword and continue on failure    Follow-Up_Quoted_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_052"    run keyword and continue on failure    Follow-Up_Bound_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_053"    run keyword and continue on failure    Follow-Up_Pending_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_054"    run keyword and continue on failure    Follow-Up_Quoted_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_SAE_055"    run keyword and continue on failure    Email Failed To Send      &{test_data}

Setup test data
    &{config_data}=  Read config data  config.txt
    Set global Variable  &{CONFIG_DATA}  &{config_data}
    log to console  ${CONFIG_DATA['Path']['tms_sae']}${/}
    ${master_file}=  Set variable  ${CONFIG_DATA['Path']['tms_sae']}${/}TMS_SAE_TestData.xlsx
    @{file_info}=  Read master file id  ${master_file}
    log to console    ${file_info}
    Set global Variable  @{TC_INFO}  @{file_info}

Create dummy data
        [Arguments]  ${test_data}
        ${FirmName} =  DummyBrokername
        ${FirstName} =  DummyFirstName
        ${Lastname} =  DummylastName
        ${Email} =  dummyemail
        ${AddressLine} =  Dummy st Address
        Set to dictionary  ${test_data}  Firm Name=${FirmName}  FirstName=${FirstName}  Lastname=${Lastname}  Email=${Email}  Address-Line=${AddressLine}

