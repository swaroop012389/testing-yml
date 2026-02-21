*** Settings ***
Documentation    TMS Real Estate Test Cases
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Resource    ../../../../Data Provider/DataProvider.robot
Resource    TC_TMS_001.robot
Resource    TC_TMS_002.robot
Resource    TC_TMS_003.robot
Resource    TC_TMS_004.robot
Resource    TC_TMS_005.robot
Resource    TC_TMS_006.robot
Resource    TC_TMS_007.robot
Resource    TC_TMS_008.robot
Resource    TC_TMS_009.robot
Resource    TC_TMS_010.robot
Resource    TC_TMS_011.robot
Resource    TC_TMS_012.robot
Resource    TC_TMS_013.robot
Resource    TC_TMS_014.robot
Resource    TC_TMS_015.robot
Resource    TC_TMS_016.robot
Resource    TC_TMS_017.robot
Resource    TC_TMS_018.robot
Resource    TC_TMS_019.robot
Resource    TC_TMS_020.robot
Resource    TC_TMS_021.robot
Resource    TC_TMS_022.robot
Resource    TC_TMS_023.robot
Resource    TC_TMS_024.robot
Resource    TC_TMS_025.robot
Resource    TC_TMS_026.robot
Resource    TC_TMS_027.robot
Resource    TC_TMS_028.robot
Resource    TC_TMS_029.robot
Resource    TC_TMS_030.robot
Resource    TC_TMS_031.robot
Resource    TC_TMS_032.robot
Resource    TC_TMS_033.robot
Resource    TC_TMS_034.robot
Resource    TC_TMS_035.robot
Resource    TC_TMS_036.robot
Resource    TC_TMS_037.robot
Resource    TC_TMS_038.robot
Resource    TC_TMS_039.robot
Resource    TC_TMS_040.robot
Resource    TC_TMS_041.robot
Resource    TC_TMS_042.robot
Resource    TC_TMS_043.robot
Resource    TC_TMS_044.robot
Resource    TC_TMS_045.robot
Resource    TC_TMS_046.robot
Resource    TC_TMS_047.robot
Resource    TC_TMS_048.robot
Resource    TC_TMS_049.robot
Resource    TC_TMS_050.robot
Resource    TC_TMS_051.robot
Resource    TC_TMS_052.robot
Resource    TC_TMS_053.robot
Resource    TC_TMS_054.robot
Resource    TC_TMS_055.robot
Resource    TC_TMS_056.robot
Resource    TC_TMS_057.robot
Resource    TC_TMS_058.robot
Resource    TC_TMS_059.robot
Resource    TC_TMS_060.robot
Resource    TC_TMS_061.robot
Resource    TC_TMS_062.robot
Resource    TC_TMS_063.robot
Resource    TC_TMS_064.robot
Resource    TC_TMS_065.robot
Resource    TC_TMS_066.robot
Resource    TC_TMS_067.robot
Resource    TC_TMS_068.robot
Resource    TC_TMS_069.robot
Resource    TC_TMS_070.robot
Resource    TC_TMS_071.robot
Resource    TC_TMS_072.robot
Resource    TC_TMS_073.robot
Resource    TC_TMS_074.robot
Resource    TC_TMS_075.robot
Resource    TC_TMS_076.robot
Resource    TC_TMS_077.robot
Resource    TC_TMS_078.robot
Resource    TC_TMS_079.robot
Resource    TC_TMS_080.robot
Resource    TC_TMS_081.robot
Resource    TC_TMS_082.robot
Resource    TC_TMS_083.robot
Resource    TC_TMS_084.robot
Resource    TC_TMS_085.robot
Resource    TC_TMS_086.robot
Resource    TC_TMS_087.robot
Suite Setup  Setup test data
#Test Teardown  close browser

*** Test Cases ***
TMS Real Estate
    #Create TMS resource file
    FOR    ${tc_name}    IN  @{TC_INFO}
        log to console  ${tc_name}
        ${TMS_Policy_Number} =  Set variable  Nil
        ${file_path}=    set variable    ${CONFIG_DATA['Path']['tms']}${/}${tc_name}.xlsx
        &{test_data_Value}=    Read TC Row Data    ${file_path}    ${tc_name}
        &{test_data} =  Get from dictionary  ${test_data_Value}  ${tc_name}
        Get Account executive Names  ${test_data}
        Run keyword    TMS Real Estate Test Cases    ${tc_name}    &{test_data}
        @{res_row}=  Create list  ${tc_name}  ${TMS_Policy_Number}
        Update TMS_resource file  ${res_row}
        close all browsers
    END

*** Keywords ***
TMS Real Estate Test Cases
    [Arguments]    ${test_name}    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_001"    run keyword and continue on failure    Application Received_Pending    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_002"    run keyword and continue on failure    Application Received_Quoted    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_003"    run keyword and continue on failure    Application Received_Bound    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_004"    run keyword and continue on failure    Application Received_Inforce    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_005"    run keyword and continue on failure    Application Received_Decline by Client   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_006"    run keyword and continue on failure    Application Received_Decline by Carrier   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_007"    run keyword and continue on failure    Binder Request Received_Pending_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_008"    run keyword and continue on failure    Binder Request Received_Quoted_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_009"    run keyword and continue on failure    Broker Inquiry_Pending_Classic    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_010"    run keyword and continue on failure    Broker Inquiry_Quoted_Classic   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_011"    run keyword and continue on failure    Broker Inquiry_Bound_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_012"    run keyword and continue on failure    Broker Inquiry_In Force_Classic   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_013"    run keyword and continue on failure    Name Ownership Change_Pending_Classic      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_014"    run keyword and continue on failure    Name Ownership Change_Quoted_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_015"    run keyword and continue on failure    Name Ownership Change_Bound_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_016"    run keyword and continue on failure    Name Ownership Change_In Force_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_017"    run keyword and continue on failure    Pending Cancellation    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_018"    run keyword and continue on failure    Pending Cancellation_Abandon    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_019"    run keyword and continue on failure    Pending Cancellation_Tomorrow    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_020"    run keyword and continue on failure    Pending Endorsement        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_021"    run keyword and continue on failure    Pending Endorsement 02        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_022"    run keyword and continue on failure    Pending Renewal Record_Guided    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_023"    run keyword and continue on failure    Pending Renewal Record_Express   &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_024"    run keyword and continue on failure    Reminder Renewal in UW Review Status Quoted Express       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_025"    run keyword and continue on failure    Reminder Renewal in UW Review Status Quoted Guided      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_026"    run keyword and continue on failure    Reminder Renewal in UW Review Declined by Client Express       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_027"    run keyword and continue on failure    Reminder Renewal in UW Review Declined by Client Guided       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_028"    run keyword and continue on failure    Reminder Renewal in UW Review Declined by Carrier Express       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_029"    run keyword and continue on failure    Reminder Renewal in UW Review Declined by Carrier Guided       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_030"    run keyword and continue on failure    Renewal Record in Quoted status with Guided holds    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_031"    run keyword and continue on failure    Renewal Record in Quoted status with Express holds    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_032"    run keyword and continue on failure    Review Non-Renewal Status_AutoClose        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_033"    run keyword and continue on failure    Review Non-Renewal Status_ManualClose        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_034"    run keyword and continue on failure    Bound Not Issued Quoted_Guided       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_035"    run keyword and continue on failure    Broker Inquiry_Pending_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_036"    run keyword and continue on failure    Broker Inquiry_Pending_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_037"    run keyword and continue on failure    Broker Inquiry_Quoted_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_038"    run keyword and continue on failure    Broker Inquiry_Quoted_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_039"    run keyword and continue on failure    Broker Inquiry_Bound_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_040"    run keyword and continue on failure    Broker Inquiry_Bound_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_041"    run keyword and continue on failure    Broker Inquiry_In Force_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_042"    run keyword and continue on failure    Broker Inquiry_In Force_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_043"    run keyword and continue on failure    Name Ownership Change_Pending_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_044"    run keyword and continue on failure    Name Ownership Change_Pending_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_045"    run keyword and continue on failure    Name Ownership Change_Quoted_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_046"    run keyword and continue on failure    Name Ownership Change_Quoted_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_047"    run keyword and continue on failure    Name Ownership Change_Bound_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_048"    run keyword and continue on failure    Name Ownership Change_Bound_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_049"    run keyword and continue on failure    Name Ownership Change_In Force_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_050"    run keyword and continue on failure    Name Ownership Change_In Force_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_051"    run keyword and continue on failure    Binder Request Received_Pending_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_052"    run keyword and continue on failure    Binder Request Received_Pending_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_053"    run keyword and continue on failure    Binder Request Received_Pending_Endorsement_Classic        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_054"    run keyword and continue on failure    Binder Request Received_Pending_Endorsement_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_055"    run keyword and continue on failure    Binder Request Received_Quoted_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_056"    run keyword and continue on failure    Binder Request Received_Quoted_Conditional        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_057"    run keyword and continue on failure    Application Received_Pending_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_058"    run keyword and continue on failure    Application Received_Pending_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_059"    run keyword and continue on failure    Application Received_Quoted_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_060"    run keyword and continue on failure    Application Received_Quoted_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_061"    run keyword and continue on failure    Application Received_Bound_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_062"    run keyword and continue on failure    Application Received_Bound_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_063"    run keyword and continue on failure    Application Received_In Force_Express        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_064"    run keyword and continue on failure    Application Received_In Force_Guided        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_065"    run keyword and continue on failure    Application Received_Decline by Client_Quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_066"    run keyword and continue on failure    Application Received_Decline by Client_Bound        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_067"    run keyword and continue on failure    Application Received_Decline by Client_UW Review        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_068"    run keyword and continue on failure    Application Received_Decline by Carrier_Quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_069"    run keyword and continue on failure    Application Received_Decline by Carrier_Bound        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_070"    run keyword and continue on failure    Application Received_Decline by Carrier_UW Review        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_071"    run keyword and continue on failure    TMS_Side_Testing        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_072"    run keyword and continue on failure    Bound Not Issued Quoted_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_073"    run keyword and continue on failure    Follow-Up_Pending_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_074"    run keyword and continue on failure    Follow-Up_Quoted_Guided       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_075"    run keyword and continue on failure    Follow-Up_Bound_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_076"    run keyword and continue on failure    Follow-Up_Pending_Guided       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_077"    run keyword and continue on failure    Follow-Up_Quoted_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_078"    run keyword and continue on failure    Follow-Up_Bound_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_079"    run keyword and continue on failure    Follow-Up_Pending_Conditional       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_080"    run keyword and continue on failure    Follow-Up_Quoted_Classic       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_081"    run keyword and continue on failure    Follow-Up_Bound_Guided       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_082"    run keyword and continue on failure    Email Failed to Send       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_083"    run keyword and continue on failure    Renewal Expiration Pending       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_084"    run keyword and continue on failure    Renewal Expiration Quoted       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_085"    run keyword and continue on failure    Renewal Expiration Bound       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_086"    run keyword and continue on failure    Renewal Expiration UW Review       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_087"    run keyword and continue on failure    Renewal Expiration Pending-Info       &{test_data}

Setup test data
    &{config_data}=  Read config data  config.txt
    Set global Variable  &{CONFIG_DATA}  &{config_data}
    log to console  ${CONFIG_DATA['Path']['tms']}${/}
    ${master_file}=  Set variable  ${CONFIG_DATA['Path']['tms']}${/}TMS_TestData.xlsx
    @{file_info}=  Read master file id  ${master_file}
    log to console    ${file_info}
    Set global Variable  @{TC_INFO}  @{file_info}