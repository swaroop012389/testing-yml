*** Settings ***
Documentation    TMS Cyber Test Cases
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Resource    ../../../../Data Provider/DataProvider.robot
Resource     TC_TMS_CR_001.robot
Resource     TC_TMS_CR_002.robot
Resource     TC_TMS_CR_003.robot
Resource     TC_TMS_CR_004.robot
Resource     TC_TMS_CR_005.robot
Resource     TC_TMS_CR_006.robot
Resource     TC_TMS_CR_007.robot
Resource     TC_TMS_CR_008.robot
Resource     TC_TMS_CR_009.robot
Resource     TC_TMS_CR_010.robot
Resource     TC_TMS_CR_011.robot
Resource     TC_TMS_CR_012.robot
Resource     TC_TMS_CR_013.robot
Resource     TC_TMS_CR_014.robot
Resource     TC_TMS_CR_015.robot
Resource     TC_TMS_CR_016.robot
Resource     TC_TMS_CR_017.robot
Resource     TC_TMS_CR_018.robot
Resource     TC_TMS_CR_019.robot
Resource     TC_TMS_CR_020.robot
Resource     TC_TMS_CR_021.robot
Resource     TC_TMS_CR_022.robot
Resource     TC_TMS_CR_023.robot
Resource     TC_TMS_CR_024.robot
Resource     TC_TMS_CR_025.robot
Resource     TC_TMS_CR_026.robot
Resource     TC_TMS_CR_027.robot
Resource     TC_TMS_CR_028.robot
Resource     TC_TMS_CR_029.robot
Resource     TC_TMS_CR_030.robot
Resource     TC_TMS_CR_031.robot
Resource     TC_TMS_CR_032.robot
Resource     TC_TMS_CR_033.robot
Resource     TC_TMS_CR_034.robot
Resource     TC_TMS_CR_035.robot
Resource     TC_TMS_CR_036.robot
Resource     TC_TMS_CR_037.robot
Resource     TC_TMS_CR_038.robot
Resource     TC_TMS_CR_039.robot
Resource     TC_TMS_CR_040.robot
Resource     TC_TMS_CR_041.robot
Resource     TC_TMS_CR_042.robot
Resource     TC_TMS_CR_043.robot
Resource     TC_TMS_CR_044.robot
Resource     TC_TMS_CR_045.robot
Resource     TC_TMS_CR_046.robot
Resource     TC_TMS_CR_047.robot
Resource     TC_TMS_CR_048.robot
Resource     TC_TMS_CR_049.robot
Resource     TC_TMS_CR_050.robot
Resource     TC_TMS_CR_051.robot
Resource     TC_TMS_CR_052.robot
Resource     TC_TMS_CR_053.robot
Resource     TC_TMS_CR_054.robot
Resource     TC_TMS_CR_055.robot
Resource     TC_TMS_CR_056.robot
Resource     TC_TMS_CR_057.robot
Resource     TC_TMS_CR_058.robot
Resource     TC_TMS_CR_059.robot
Resource     TC_TMS_CR_060.robot
Resource     TC_TMS_CR_061.robot
Resource     TC_TMS_CR_063.robot
Resource     TC_TMS_CR_064.robot
Resource     TC_TMS_CR_065.robot
Resource    TC_TMS_CR_062.robot
Suite Setup  Setup test data
#Test Teardown  close browser


*** Test Cases ***

TMS Cyber
    FOR    ${tc_name}    IN  @{TC_INFO}
        log to console  ${tc_name}
        ${TMS_Policy_Number} =  Set variable  Nil
        ${file_path}=    set variable    ${CONFIG_DATA['Path']['tms_cr']}${/}${tc_name}.xlsx
        &{test_data_Value}=    Read TC Row Data    ${file_path}    ${tc_name}
        &{test_data} =  Get from dictionary  ${test_data_Value}  ${tc_name}
        Get Account executive Names  ${test_data}
        run keyword if  '${tc_name}' in ['TC_TMS_CR_049','TC_TMS_CR_050','TC_TMS_CR_051','TC_TMS_CR_052','TC_TMS_CR_053']  Create dummy data  ${test_data}
        Run keyword    TMS Cyber Test Cases    ${tc_name}    &{test_data}
        @{res_row}=  Create list  ${tc_name}  ${TMS_Policy_Number}
        Update TMS_resource file  ${res_row}
        #close all browsers
    END

*** Keywords ***
TMS Cyber Test Cases
    [Arguments]    ${test_name}    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_001"    run keyword and continue on failure    Application Received_Pending    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_002"    run keyword and continue on failure    Application Received_Quoted    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_003"    run keyword and continue on failure    Application Received_Bound    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_004"    run keyword and continue on failure    Application Received_Inforce    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_005"    run keyword and continue on failure    Application Received_Decline by Client   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_006"    run keyword and continue on failure    Application Received_Decline by Carrier   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_007"    run keyword and continue on failure    Binder Request Received_Pending_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_008"    run keyword and continue on failure    Binder Request Received_Quoted_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_009"    run keyword and continue on failure    Broker Inquiry_Pending_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_010"    run keyword and continue on failure    Broker Inquiry_Quoted_Classic   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_011"    run keyword and continue on failure    Broker Inquiry_Bound_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_012"    run keyword and continue on failure    Broker Inquiry_In Force_Classic   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_013"    run keyword and continue on failure    Pending Cancellation    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_014"    run keyword and continue on failure    Pending Cancellation_Tomorrow    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_015"    run keyword and continue on failure    Pending Endorsement        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_016"    run keyword and continue on failure    Pending Endorsement 02        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_017"    run keyword and continue on failure    Review Non-Renewal Status_AutoClose        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_018"    run keyword and continue on failure    Review Non-Renewal Status_ManualClose        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_019"    run keyword and continue on failure    Bound Not Issued        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_020"    run keyword and continue on failure    Broker Inquiry_Pending Non-Renewal Criteria      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_021"    run keyword and continue on failure    Broker Inquiry_Pending_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_022"    run keyword and continue on failure    Broker Inquiry_Quoted_Non-Renewal        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_023"    run keyword and continue on failure    Broker Inquiry_Quoted_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_024"    run keyword and continue on failure    Broker Inquiry_Bound_NonRenewal        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_025"    run keyword and continue on failure    Broker Inquiry_Bound_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_026"    run keyword and continue on failure    Broker Inquiry_In Force_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_027"    run keyword and continue on failure    Broker Inquiry_In Force_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_028"    run keyword and continue on failure    Binder Request Received_Pending_Non-Renewal        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_029"    run keyword and continue on failure    Binder Request Received_Pending_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_030"    run keyword and continue on failure    Binder Request Received_Pending_Endorsement_Classic        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_031"    run keyword and continue on failure    Binder Request Received_Pending_Endorsement_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_032"    run keyword and continue on failure    Binder Request Received_Quoted_Non-Renewal        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_033"    run keyword and continue on failure    Binder Request Received_Quoted_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_034"    run keyword and continue on failure    Application Received_Pending_Non-Renewal        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_035"    run keyword and continue on failure    Application Received_Pending_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_036"    run keyword and continue on failure    Application Received_Quoted_Non-Renewal        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_037"    run keyword and continue on failure    Application Received_Quoted_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_038"    run keyword and continue on failure    Application Received_Bound_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_039"    run keyword and continue on failure    Application Received_Bound_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_040"    run keyword and continue on failure    Application Received_In Force_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_041"    run keyword and continue on failure    Application Received_In Force_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_042"    run keyword and continue on failure    Application Received_Decline by Client_Quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_043"    run keyword and continue on failure    Application Received_Decline by Client_Bound        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_044"    run keyword and continue on failure    Application Received_Decline by Carrier_UW Review1        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_045"    run keyword and continue on failure    Application Received_Decline by Carrier_Quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_046"    run keyword and continue on failure    Application Received_Decline by Carrier_Bound        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_047"    run keyword and continue on failure    Application Received_Decline by Carrier_UW Review        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_048"    run keyword and continue on failure    TMS_Side_Testing        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_049"    run keyword and continue on failure    V2 UW Review Decline Application       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_050"    run keyword and continue on failure    V2 UW Review Lose a quote       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_051"    run keyword and continue on failure    V2 UW Review Changing stauts to quoted       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_052"    run keyword and continue on failure    V2 UW Review Changing stauts to pending info       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_053"    run keyword and continue on failure    V2 UW Review Changing stauts to pending        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_054"    run keyword and continue on failure    Follow-Up_Pending_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_055"    run keyword and continue on failure    Follow-Up_Bound_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_056"    run keyword and continue on failure    Follow-Up_Quoted_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_057"    run keyword and continue on failure    Follow-Up_Bound_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_058"    run keyword and continue on failure    Follow-Up_Pending_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_059"    run keyword and continue on failure    Follow-Up_Quoted_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_060"    run keyword and continue on failure    Email Failed To Send        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_061"    run keyword and continue on failure    Renewal Expiration Pending       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_062"    run keyword and continue on failure    Renewal Expiration Quoted       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_063"    run keyword and continue on failure    Renewal Expiration Bound       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_064"    run keyword and continue on failure    Renewal Expiration UW Review       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_CR_065"    run keyword and continue on failure    Renewal Expiration Pending-Info       &{test_data}


Setup test data
    &{config_data}=  Read config data  config.txt
    Set global Variable  &{CONFIG_DATA}  &{config_data}
    log to console  ${CONFIG_DATA['Path']['tms_cr']}${/}
    ${master_file}=  Set variable  ${CONFIG_DATA['Path']['tms_cr']}${/}TMS_CR_TestData.xlsx
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
    Set to dictionary  ${test_data}  Firm Name=${FirmName}  FirstName=${FirstName}  Lastname=${Lastname}  Email=${Email}  AddressLine=${AddressLine}
