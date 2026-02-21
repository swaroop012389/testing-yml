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
    Binder Letter Generation    ${test_data}

Binder Letter Generation for K&R
    [Arguments]     ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    select radio button  Action  Review
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-Submit}    60
    click element    ${ID-UMS-Submit}
    wait until element is not visible   globalAjaxLoading  100
    ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
    log to console    Policy Details are: ${Policy_Header_Info}
    ${Policy_Status}=    IF    '${test_data['Program']}'=='REALESTATE'    get substring  ${Policy_Header_Info}  64
    ...    ELSE IF    '${test_data['Program']}'=='K&R'    get substring    ${Policy_Header_Info}  65
    ...    ELSE    get substring    ${Policy_Header_Info}    60
    set suite variable  ${Policy_Status}
    log to console    Policy Status is: ${Policy_Status}
    run keyword and continue on failure    run keyword if     '${Policy_Status}'=='${test_data['Policy Status1']}'     log to console    Policy Status Matches and Verified
    ...    ELSE    run keywords    log to console    Policy Status is not matching    AND    Close Browser




