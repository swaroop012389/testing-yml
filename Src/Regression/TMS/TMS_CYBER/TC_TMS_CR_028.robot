*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  String
Library  Collections
Library  DateTime
Resource  ../../../Resource/Global-variable/v2.robot
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/Alternus_Res/Journal.robot
Resource  ../../../Resource/Alternus_Res/Alt_Generic.robot
Resource  ../../../Resource/TMS_RES/TMS_Dashboard.robot
Resource  ../../../Resource/TMS_RES/Due_This_Month.robot
Resource  ../../../Resource/TMS_RES/Edit_Task.robot
Resource  ../../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot
Resource  ../../../../Data Provider/DataProvider.robot

*** Keywords ***
Binder Request Received_Pending_Non-Renewal
    [Arguments]    &{test_data}
    Login to UMS Edge
    Policy Search with Renewal Flag    ${test_data}
    ADD DOCUMENT   ${test_data}
    T-log Triggered    ${test_data}
    TMS Dashboard   ${test_data}
    Select policy   ${test_data}
    Edit Task   ${test_data}
    Open Policy from TMS to UMS
    TMS_Journal
    Journal Verification    ${test_data}
    Edit Task2    ${test_data}
    T-log Closed    ${test_data}