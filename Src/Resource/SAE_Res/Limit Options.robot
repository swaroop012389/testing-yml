*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../Generic.robot


*** Variables ***
${ID_Limit}=  id=Coverages_0__DesiredLimits_0__Value
${ID_AggregateLimit}=  id=Coverages_0__DesiredLimits_0__AggregateValue


*** Keywords ***
Limit Options
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-UMS-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-UMS-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Limit For KNR
    [Arguments]  ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${ID_Limit}  30
    Check and enter input   ${ID_Limit}  ${test_data['Limit']}
    Wait Until Element Is Visible    ${ID_AggregateLimit}  30
    Check and enter input   ${ID_AggregateLimit}  ${test_data['Agg Limit']}
    Limit Options

