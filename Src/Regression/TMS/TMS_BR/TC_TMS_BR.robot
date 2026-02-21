*** Settings ***
Documentation    TMS Builders risk test cases
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Resource    ../../../../Data Provider/DataProvider.robot
Resource    TC_TMS_BR_001.robot
Resource    TC_TMS_BR_002.robot
Resource    TC_TMS_BR_003.robot
Resource    TC_TMS_BR_004.robot
Resource    TC_TMS_BR_005.robot
Resource    TC_TMS_BR_006.robot
Resource    TC_TMS_BR_007.robot
Resource    TC_TMS_BR_008.robot
Resource    TC_TMS_BR_009.robot
Resource    TC_TMS_BR_010.robot
Resource    TC_TMS_BR_011.robot
Resource    TC_TMS_BR_012.robot
Resource    TC_TMS_BR_013.robot
Resource    TC_TMS_BR_014.robot
Resource    TC_TMS_BR_015.robot
Resource    TC_TMS_BR_016.robot
Resource    TC_TMS_BR_017.robot
Resource    TC_TMS_BR_018.robot
Resource    TC_TMS_BR_019.robot
Resource    TC_TMS_BR_020.robot
Resource    TC_TMS_BR_021.robot
Resource    TC_TMS_BR_022.robot
Resource    TC_TMS_BR_023.robot
Resource    TC_TMS_BR_024.robot
Resource    TC_TMS_BR_025.robot
Resource    TC_TMS_BR_026.robot
Resource    TC_TMS_BR_027.robot




Suite Setup  Setup test data
#Test Teardown  close browser

*** Test Cases ***
TMS Builders Risk
    FOR    ${tc_name}    IN  @{TC_INFO}
        log to console  ${tc_name}
        ${TMS_Policy_Number} =  Set variable  Nil
        ${file_path}=    set variable    ${CONFIG_DATA['Path']['tms_br']}${/}${tc_name}.xlsx
        &{test_data_Value}=    Read TC Row Data    ${file_path}    ${tc_name}
        &{test_data} =  Get from dictionary  ${test_data_Value}  ${tc_name}
        Get Account executive Names  ${test_data}
        #Run Keyword If  '${test_data['Dummy']}'=='YES'  Create Dummy Data BR  ${test_data}
        Run keyword    TMS Builders Risk test Cases    ${tc_name}    &{test_data}
        @{res_row}=  Create list  ${tc_name}  ${TMS_Policy_Number}
        Update TMS_resource file  ${res_row}
        #close all browsers
    END


*** Keywords ***
TMS Builders Risk test Cases
    [Arguments]    ${test_name}    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_001"    run keyword and continue on failure    Application Received_Pending        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_002"    run keyword and continue on failure    Application Received_Quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_003"    run keyword and continue on failure    Application Received_Bound        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_004"    run keyword and continue on failure    Application Received_Inforce       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_005"    run keyword and continue on failure    Application Received_Decline by Client       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_006"    run keyword and continue on failure    Application Received_Decline by Carrier        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_007"    run keyword and continue on failure    Binder Request Received_Pending        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_008"    run keyword and continue on failure    Binder Request Received_Quoted        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_009"    run keyword and continue on failure    Broker Inquiry_Pending        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_010"    run keyword and continue on failure    Broker Inquiry_Quoted     &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_011"    run keyword and continue on failure    Broker Inquiry_Bound      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_012"    run keyword and continue on failure    Broker Inquiry_In Force        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_013"    run keyword and continue on failure    Pending Cancellation       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_014"    run keyword and continue on failure    Pending Cancellation_Abandon       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_015"    run keyword and continue on failure    Pending Cancellation_Tomorrow       &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_016"    run keyword and continue on failure    Pending Endorsement     &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_017"    run keyword and continue on failure    Pending Endorsement 02      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_018"    run keyword and continue on failure    Bound Not Issued Quoted    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_019"    run keyword and continue on failure    Follow Up Pending     &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_020"    run keyword and continue on failure    Follow Up Quoted      &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_021"    run keyword and continue on failure    Follow Up Bound    &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_022"    run keyword and continue on failure    Email Failed to Send        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_023"    run keyword and continue on failure    V2 UW Review Decline_Application        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_024"    run keyword and continue on failure    V2 UW Review Lose a quote        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_025"    run keyword and continue on failure    V2 UW Review Changing status to Pending Info        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_026"    run keyword and continue on failure    V2 UW Review Changing status to Pending        &{test_data}
    run keyword if    "${test_name}"=="TC_TMS_BR_027"    run keyword and continue on failure    V2 UW Review Changing stauts to quoted        &{test_data}

Setup test data
    &{config_data}=  Read config data  config.txt
    Set global Variable  &{CONFIG_DATA}  &{config_data}
    log to console  ${CONFIG_DATA['Path']['tms_br']}${/}
    ${master_file}=  Set variable  ${CONFIG_DATA['Path']['tms_br']}${/}TMS_BR_TestData.xlsx
    @{file_info}=  Read master file id  ${master_file}
    log to console    ${file_info}
    Set global Variable  @{TC_INFO}  @{file_info}

Create Dummy Data BR
    [Arguments]    ${test_data}
    ${InsuredName}=  DummyBrokername
    ${FirstName}=  DummyFirstName
    ${LastName}=  DummyLastName
    ${E-mail}=  dummyemail
    ${Address}=  Dummy st Address
    ${BuilderName}=  DummyBrokername
    ${Address}=  Dummy st Address
    Set to dictionary  ${test_data}  Insured Name=${InsuredName}  First Name=${FirstName}  Last Name=${LastName}
    ...    E-mail=${E-mail}  Mailing Street Address=${Address}  Builder Name=${BuilderName}  Builder Address=${Address}
    ...    Property-Street Address=${Address}