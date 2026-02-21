*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${ID-UMS-BIND/ISSUE-TAB}=  //a[contains(text(),'BIND/ISSUE')]
${ID-UMS-Bind}=    //a[contains(@href, '/Nexus/BindingIssuance/Bind/')]
${ID-UMS-Issue/Reissue}=  //a[contains(text(),'Issue/Reissue')]
${ID-Apply&Continue}=  //input[@value='Apply & Continue']
${Refresh Receivables}=    //input[@value='Refresh Receivables']
${Payments-Next}=    //input[@value='Next']
${PI-Edit}=    //input[@value='Edit']
${PI-Save}=    //button/span[text()='Save']
${PI-PolicyPrefix}=    id=PolicyPrefix
${PI-PolicyNumber}=    //input[@id="PolicyNumber"]
${PI-PolicySuffix}=    id=PolicySuffix
${ID-Submit-Button}=    //input[@id='Submit']
${Bundle}=  //input[@onclick="checkAllAs('OptionsTable', this.checked)"]
${Create Bundle}=  //a[contains(@href,"javascript:createBundle();")]
${Bind-Quoteoption-checkbox1}=  id=Checkbox1
${Endros-option-checkbox}=  (//input[@type='checkbox'])[6]
${ApplyChanges-Button}=  //button//span[contains(text(),'Apply Changes')]

*** Keywords ***
Bind for K&R
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-UMS-BIND/ISSUE-TAB}    60
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  60
    mouse over  ${ID-UMS-BIND/ISSUE-TAB}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-UMS-Bind}    100
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  100
    click element  ${ID-UMS-Bind}
    wait until element is not visible   globalAjaxLoading  100
    Select Checkbox    ${Bind-Quoteoption-checkbox1}
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Endorsement Options for K&R
    wait until element is not visible   globalAjaxLoading  100
    Select Checkbox    ${Endros-option-checkbox}
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ApplyChanges-Button}
    run keyword if    ${Apply_changes}    click element    ${ApplyChanges-Button}

ChosenQuoteOptions for K&R
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue}=    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    run keyword if   ${Applycontinue}    log to console   Navigated to ChosenQuoteOptions Tab
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Policy Info for K&R
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    ${Edit}=    run keyword and return status  element should be visible    ${PI-Edit}
    run keyword if   ${Edit}    log to console   Navigated to PolicyInfo Tab
    wait until element is visible    ${PI-Edit}    60
    click element    ${PI-Edit}
    wait until element is not visible   globalAjaxLoading  100
#    Wait Until Element Is Visible    //input[@id='PolicyNumber']  5s
#    Clear Element Text    //input[@id='PolicyNumber']
#    Input Text    //input[@id='PolicyNumber']  ${test_data['RandomNumber']}
    Get Policy Number for K&R       ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${PI-Save}    60
    click element    ${PI-Save}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Get Policy Number for K&R
    [Arguments]    ${test_data}
    ${Policy_No}=    get text    //span[contains(@id,'PolicyNumberInHeader')]
    wait until element is not visible   globalAjaxLoading  100
    log to console    Updated policy number:$${Policy_No}
    Set To Dictionary    ${test_data}    PolicyNumber=${Policy_No}
    log to console    PN:${test_data['PolicyNumber']}

Payments for K&R
    wait until element is not visible   globalAjaxLoading  100
    ${Next}=    run keyword and return status  element should be visible    ${Payments-Next}
    run keyword if   ${Next}    log to console   Navigated to Payments Tab
    wait until element is not visible   globalAjaxLoading  100
    scroll element into view    ${Payments-Next}
    wait until page contains element    ${Payments-Next}    timeout=40s
    wait until element is enabled    ${Payments-Next}    60
    Wait Until Element Is Visible   ${Payments-Next}    timeout=40s
    set focus to element    ${Payments-Next}
    Element Should Be Visible    ${Payments-Next}
    click element    ${Payments-Next}
    wait until element is not visible   globalAjaxLoading  100

