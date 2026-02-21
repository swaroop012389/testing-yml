*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Keywords ***
Modifiers
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible  ${ID-UMS-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-UMS-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Layers
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible  ${ID-UMS-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-UMS-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Limit/Deductible Options
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible  ${ID-UMS-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-UMS-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
