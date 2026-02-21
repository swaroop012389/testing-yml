*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../../Resource/Alternus_Res/Coverages.robot
Resource    ../../Resource/Alternus_Res/Endorsements.robot
Resource    ../../Resource/Alternus_Res/Underwriting.robot

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

*** Keywords ***
Bind
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-UMS-BIND/ISSUE-TAB}    60
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  60
    mouse over  ${ID-UMS-BIND/ISSUE-TAB}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-UMS-Bind}    100
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  100
    click element  ${ID-UMS-Bind}
    wait until element is not visible   globalAjaxLoading  100

Quote Options
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Endorsement Options
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

ChosenQuoteOptions
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue}=    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    run keyword if   ${Applycontinue}    log to console   Navigated to ChosenQuoteOptions Tab
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Policy Info
    wait until element is not visible   globalAjaxLoading  100
    ${Edit}=    run keyword and return status  element should be visible    ${PI-Edit}
    run keyword if   ${Edit}    log to console   Navigated to PolicyInfo Tab
    wait until element is visible    ${PI-Edit}    60
    click element    ${PI-Edit}
    wait until element is not visible   globalAjaxLoading  100
    Get Policy Number
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${PI-Save}    60
    click element    ${PI-Save}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Get Policy Number
    ${Policy_No}=    get text    //span[contains(@id,'PolicyNumberInHeader')]
    Set global Variable  ${Policy_Number}  ${Policy_No}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Updated policy number:${Policy_Number}

Payments
    wait until element is not visible   globalAjaxLoading  100
    ${Next}=    run keyword and return status  element should be visible    ${Payments-Next}
    run keyword if   ${Next}    log to console   Navigated to Payments Tab
    ${Refresh_enabled}=    run keyword and return status    element should be enabled    ${Refresh Receivables}
    run keyword if   ${Refresh_enabled}    click element    ${Refresh Receivables}
    wait until element is not visible   globalAjaxLoading  100
    scroll element into view    ${Payments-Next}
    wait until page contains element    ${Payments-Next}    timeout=40s
    wait until element is enabled    ${Payments-Next}    60
    Wait Until Element Is Visible   ${Payments-Next}    timeout=40s
    set focus to element    ${Payments-Next}
    Element Should Be Visible    ${Payments-Next}
    click element    ${Payments-Next}
    wait until element is not visible   globalAjaxLoading  100

SAE PolicyInfo
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Get Status
    ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}

NFP_DNO Quote Options
    Add Endorsements
    Add Autolink Endorsements
    UnderWriting Rating
    Create Bundle
    Quote Options

Create Bundle
    click element  ${Bundle}
    click element  ${Create Bundle}

Bind Quote Options to Bind
    wait until element is not visible   globalAjaxLoading  200
    #wait until element is visible   ${QuoteOptionsFirstCheckBox}
    run keyword and ignore error  select checkbox  ${QuoteOptionsFirstCheckBox}
    run keyword and ignore error  select checkbox  //input[@id='Checked_1']
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    click element  ${ID-Apply&Continue}
    log to console  Navigated to Chosen quote options page
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    click element  ${ID-Apply&Continue}
    log to console  Navigated to Policy Info page
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    click element  ${ID-Apply&Continue}
    #${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    #click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible  ${Payments-Next}    timeout=40s
    click element  ${Payments-Next}
    wait until element is not visible   globalAjaxLoading  500
    ${Payments_Next} =    run keyword and return status  element should be visible    ${Payments-Next}
    run keyword if  ${Payments_Next}  click element  ${Payments-Next}
    #wait until element is visible   ${ID-Email-CC}
    #click element  ${Payments-Next}
    #wait until element is not visible   globalAjaxLoading  500
    #clear element text  ${ID-Email-CC}
    wait until element is not visible   globalAjaxLoading  500
    select radio button  Action  Review
    wait until element is not visible   globalAjaxLoading  500
    wait until element is visible   ${ID-Submit-Button}
    click element   ${ID-Submit-Button}

#TMS_CYBER
Bind Quote Options to Bind for Cyber
    wait until element is not visible   globalAjaxLoading  200
    #wait until element is visible   ${QuoteOptionsFirstCheckBox}
    run keyword and ignore error  select checkbox  ${QuoteOptionsFirstCheckBox}
    run keyword and ignore error  select checkbox  //input[@id='Checkbox1']
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    click element  ${ID-Apply&Continue}
    log to console  Navigated to Endorsement options page
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    click element  ${ID-Apply&Continue}
    log to console  Navigated to Chosen quote options page
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    click element  ${ID-Apply&Continue}
    log to console  Navigated to Policy Info page
    wait until element is not visible   globalAjaxLoading  100
    ${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    click element  ${ID-Apply&Continue}
    #${Applycontinue} =    run keyword and return status  element should be visible    ${ID-Apply&Continue}
    #click element  ${ID-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible  ${Payments-Next}    timeout=40s
    click element  ${Payments-Next}
    wait until element is not visible   globalAjaxLoading  500
    ${Payments_Next} =    run keyword and return status  element should be visible    ${Payments-Next}
    run keyword if  ${Payments_Next}  click element  ${Payments-Next}
    #wait until element is visible   ${ID-Email-CC}
    #click element  ${Payments-Next}
    #wait until element is not visible   globalAjaxLoading  500
    #clear element text  ${ID-Email-CC}
    wait until element is not visible   globalAjaxLoading  500
    select radio button  Action  Review
    wait until element is not visible   globalAjaxLoading  500
    wait until element is visible   ${ID-Submit-Button}
    click element   ${ID-Submit-Button}
