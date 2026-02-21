*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  String
Library  Collections
Library  DateTime
Resource  ../../../Resource/Global-variable/v2.robot
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot
Resource  ../../../../Data Provider/DataProvider.robot
Resource  ../../../Resource/Alternus_RES/Servicing.robot
Resource  ../../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../../Resource/TMS_RES/Due_This_Month.robot

*** Keywords ***
Reminder Renewal in UW Review Declined by Client Express
    [Arguments]    &{test_data}
    Login to UMS
    Policy Search with Renewal Flag    ${test_data}
    TMS_MGMT_LIAB_NFP Pick Renewal Date
    Set Application Date to Current Date at Start
    change Application Date
    Set UMS Date 119 Days Prior to Effective Renewal Date for MGMT LIAB NFP
    UMS Click Background process
    UMS Choose Job  ${testdata['Job Name']}
    UMS Choose Job with Texas time+1min  ${testdata['Texas Time+1min']}
    switch window   title=TASK MANAGEMENT
    Underwriter Rating
    T-log Triggered    ${test_data}
    Lose a quote    ${test_data}
    T-log Closed    ${test_data}
    TMS Dashboard   ${test_data}
    Select policy with close status  ${test_data}