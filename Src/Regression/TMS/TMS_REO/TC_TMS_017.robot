*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  String
Library  Collections
Library  DateTime
Library  ../../../Resource/Global-variable/login.py
Resource  ../../../Resource/Global-variable/v2.robot
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot

*** Keywords ***
Pending Cancellation
    [Arguments]    &{test_data}
    Login to UMS Edge
    Policy Search with Renewal Flag    ${test_data}
    Set Application Date to Current Date at Start
    Policy Cancellation
    Pick Expiry Date
    change Application Date
    Set UMS date X Number of Days Prior Exp Date  125 days
    UMS Configure Background Process  ${test_data}
    T-log Triggered  ${test_data}
    Set Application Date to Current Date
    Complete Cancellation  ${test_data}
    T-log Closed  ${test_data}
    Reinstatement
    T Log Page    ${test_data}