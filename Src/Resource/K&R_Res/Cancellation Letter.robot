*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-Submit}=  id=Submit
${Name-ReviewAction}=   Action
${Document-Hourglass}=    //img[contains(@src, '../../images/viewIcon.png')]

*** Keywords ***
CancellationLetter
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    ${CancellationLetter-Submit}=    run keyword and return status  element should be visible    ${ID-UMS-Submit}
    run keyword if   ${CancellationLetter-Submit}    log to console   Navigated to CompleteCancellation Tab
    wait until element is not visible   globalAjaxLoading  100
    select radio button  Action  Edit
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-Submit}    60
    click element    ${ID-UMS-Submit}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is visible    (//tr[td[text()='Cancellation Letter']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is enabled    (//tr[td[text()='Cancellation Letter']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is not visible   globalAjaxLoading  350
    ${CancellationLetter_Status}=    get text    (//tr[td[text()='Cancellation Letter']]//td//span[text()='Available for review'])[last()]
    log to console  Cancellation Letter Generated - "${CancellationLetter_Status}"
    ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}
    wait until element is not visible   globalAjaxLoading  350