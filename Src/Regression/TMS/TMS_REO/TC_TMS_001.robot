*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  String
Library  Collections
Library  DateTime
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/Due_This_Month.robot
Resource  ../../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot

*** Keywords ***
Application Received_Pending
    [Arguments]    &{test_data}
    Login to UMS Edge
    Policy Search with Renewal Flag    ${test_data}
    ADD DOCUMENT   ${test_data}
    T-log Triggered  ${test_data}
    Pending to Quote
    Change Status Pending to Quote
    T-log Closed  ${test_data}