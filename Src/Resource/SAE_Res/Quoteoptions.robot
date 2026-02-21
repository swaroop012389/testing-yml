*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${Name-QO-SelectedQuoteOption}=    (//input[@name='SelectedQuoteOptionIds'])

*** Keywords ***
SAE_Quote Options
    [Arguments]    &{test_data}
    wait until element is not visible   globalAjaxLoading  100
    ${Option_id}=    set variable  ${test_data['SelectedQuoteOptionIds']}
    select checkbox    ${Name-QO-SelectedQuoteOption}${Option_id}
    click element    ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-UMS-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-UMS-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100