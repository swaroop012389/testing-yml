*** Settings ***

Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot


*** Keywords ***
To Search a rule based on the Retail agent by name and edit a rule
    [Arguments]  &{test_data}
    Login To UMS Edge
    UW Assignments Login Page   ${test_data}
    Search with UW Assignments Page     ${test_data}
    Edit UW Rules   ${test_data}
    Add New Rule in UW Assignments      ${test_data}





