*** Settings ***
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot



*** Keywords ***
To Create a rule with Account Executive with dates
    [Arguments]  &{test_data}
    Login To UMS Edge
    UW Assignments Login Page   ${test_data}
    Search with UW Assignments Page     ${test_data}
    Add New Rule in UW Assignments      ${test_data}














