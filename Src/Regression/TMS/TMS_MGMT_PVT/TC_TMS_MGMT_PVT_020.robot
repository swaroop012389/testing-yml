*** Settings ***
Documentation    Generate Follo-Up task for Quoted status and Guided renewal flag and close it by  losing a quote
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot


*** Keywords ***
Follow-Up_Quoted
    [Arguments]    &{test_data}
    Login to UMS Edge
    Policy Search with Renewal Flag for MGMT PVT   ${test_data}
    Get Policy Status    ${test_data}
    Generate Follow Up Task    ${test_data}
    Verify After Triggering If the Task is Listed Under UMS Task Management  ${test_data}
    T-log Triggered    ${test_data}
    Navigate To Rating Page
    Get Policy Status  ${test_data}
    Verify Policy Status 1    ${test_data}
    Lose a quote  ${test_data}
    Get Policy Status  ${test_data}
    Verify Policy Status 2    ${test_data}
    T-log Closed    ${test_data}
