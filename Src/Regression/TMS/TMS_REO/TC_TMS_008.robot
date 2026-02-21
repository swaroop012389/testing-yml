*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  String
Library  Collections
Library  DateTime
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot

*** Keywords ***
Binder Request Received_Quoted_Classic
    [Arguments]    &{test_data}
    Login to UMS Edge
    Policy Search with Renewal Flag    ${test_data}
    ADD DOCUMENT   ${test_data}
    T-log Triggered    ${test_data}
    Change the Policy Status from Quoted to Bound
    T-log Closed    ${test_data}