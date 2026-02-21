*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-Submit}=  id=Submit
${Name-ReviewAction}=   Action
${Document-Hourglass}=    //img[contains(@src, '../../images/viewIcon.png')]
${ID-BinderLetterDateString}=    id=BinderLetterDateString
${ID-BinderTerminateDateString}=    id=BinderTerminateDateString
${ID-Donotgenerate}=    //input[@value='DoNotGenerate']
${Submit_Error}=  //div[@id="PostSendMessages" and text()="No Receivable generated. Please generate Receivable and try to Bind again"]
${Payments_Bubble}=  //a[contains(@href, '/Nexus/BindingIssuance/Payments/')]
${ID-PaymentPlan}=  //select[@id="PaymentPlan"]
${Refresh Receivables}=    //input[@value='Refresh Receivables']
${Payments-Next}=    //input[@value='Next']
${msg}=  //div[@id="PostSendMessages"]

*** Keywords ***
BinderLetter Amend
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    ${Binderletter-Submit}=    run keyword and return status  element should be visible    ${ID-UMS-Submit}
    run keyword if   ${Binderletter-Submit}    log to console   Navigated to Bind Tab
    ${element}=    get element attribute    ${ID-BinderLetterDateString}    value
    ${Terminate_date}=    Add Number of Days to the Date    ${element}    60
    input text    ${ID-BinderTerminateDateString}   ${Terminate_date}
    Binder Letter Generation

Binder Letter Generation
    wait until element is not visible   globalAjaxLoading  100
    select radio button  Action  Edit
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-Submit}    60
    click element    ${ID-UMS-Submit}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is visible    (//tr[td[text()='Binder Letter']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is enabled    (//tr[td[text()='Binder Letter']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is not visible   globalAjaxLoading  350
    ${BinderLetter_Status}=    get text    (//tr[td[text()='Binder Letter']]//td//span[text()='Available for review'])[last()]
    log to console  Binder Letter Generated - "${BinderLetter_Status}"
    ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}
    wait until element is not visible   globalAjaxLoading  100

BinderLetter
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    ${Binderletter-Submit}=    run keyword and return status  element should be visible    ${ID-UMS-Submit}
    run keyword if   ${Binderletter-Submit}    log to console   Navigated to Bind Tab
    wait until element is not visible   globalAjaxLoading  100
    select radio button  Action  Edit
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-Submit}    60
    click element    ${ID-UMS-Submit}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is visible    (//tr[td[text()='Binder Letter']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is enabled    (//tr[td[text()='Binder Letter']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is not visible   globalAjaxLoading  350
    ${BinderLetter_Status}=    get text    (//tr[td[text()='Binder Letter']]//td//span[text()='Available for review'])[last()]
    log to console  Binder Letter Generated - "${BinderLetter_Status}"
    ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}
    wait until element is not visible   globalAjaxLoading  100

### SAE ###
SAE Binder Letter
    [Arguments]    &{test_data}
    click element    ${ID-Donotgenerate}
    wait until element is not visible   globalAjaxLoading  100
    ${Error_msg}=  run keyword and return status  page should contain element  ${msg}
    run keyword if  ${Error_msg}  Submit_Error_Resolve  &{test_data}  ELSE  SAE_Display message
    wait until element is not visible   globalAjaxLoading  100
    ${Policy_Details}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Details}
    ${Policy_Number}=    fetch from left    ${Policy_Details}    ,
    ${Final_Policy_Number}    remove string   ${Policy_Number}    ${SPACE}
    log to console    ${Final_Policy_Number}
    ${Final_Status}=    fetch from right    ${Policy_Details}    STATUS:${SPACE}
    log to console    ${Final_Status}
    set test variable    ${policy-no}    ${Final_Policy_Number}
    set test variable    ${Status}  ${Final_Status}

Submit_Error_Resolve
    [Arguments]    &{test_data}
    click element  ${Payments_Bubble}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label  ${ID-PaymentPlan}  ${test_data['Payment Plan']}
    click element  ${Refresh Receivables}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${Payments-Next}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-Donotgenerate}
    wait until element is enabled    ${ID-UMS-Submit}    60
    click element    ${ID-UMS-Submit}

SAE_Display message
    ${Submit_button}=  run keyword and return status  element should not be visible  ${ID-UMS-Submit}
    ${Message}=  run keyword if  ${Submit_button}  get text     ${msg}  ELSE  click element    ${ID-UMS-Submit}
    log to console   ${Message}