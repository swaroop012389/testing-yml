*** Settings ***
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot



*** Keywords ***
To Search Real estate rules with all the fields selected
    [Arguments]  &{test_data}
    Login To UMS Edge
    UW Assignments Login Page   ${test_data}
    Search with UW Assignments Page     ${test_data}
    Search with UW Assignments Page results     ${test_data}





