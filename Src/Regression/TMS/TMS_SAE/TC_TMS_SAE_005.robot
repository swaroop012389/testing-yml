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
Application Received_Decline by Client
    [Arguments]    &{test_data}
    Login to UMS Edge
    Policy Search with Renewal Flag    ${test_data}
    ADD DOCUMENT   ${test_data}
    T-log Triggered    ${test_data}
    Decline Application  ${test_data}
    T-log Closed    ${test_data}