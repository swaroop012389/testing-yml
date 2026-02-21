*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${QuoteLetter}=    //a[contains(@href, '/Nexus/RatingQuoteLetter/ViewSendQuoteLetter/')]
${ID-UMS-Submit}=  id=Submit
${ID-UMS-ReviewAction}=   Action
${Document-Hourglass}=    //img[contains(@src, '../../images/viewIcon.png')]

*** Keywords ***
Quote Letter
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${QuoteLetter}  60
    wait until element is enabled    ${QuoteLetter}  60
    click element   ${QuoteLetter}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    Quote Letter Generation

Quote Letter Generation
    wait until element is not visible   globalAjaxLoading  100
    select radio button  Action  Review
    wait until element is not visible   globalAjaxLoading  100
    ${Quoteletter-Submit}=    run keyword and return status  element should be visible    ${ID-UMS-Submit}
    run keyword if   ${Quoteletter-Submit}    log to console   Navigated to Quote letter Tab
    ${QPolicy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${QPolicy_Status}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-Submit}    60
    click element    ${ID-UMS-Submit}
    Quote letter status check

Quote letter status check
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    (//tr[td[text()='Quote Letter']]//td//span[text()='Ready for sending'])[last()]    timeout=250
    wait until element is enabled    (//tr[td[text()='Quote Letter']]//td//span[text()='Ready for sending'])[last()]    timeout=250
    wait until element is not visible   globalAjaxLoading  350
    ${QuoteLetter_Status}=    get text    (//tr[td[text()='Quote Letter']]//td//span[text()='Ready for sending'])[last()]
     log to console    Quote Letter Generated - "${QuoteLetter_Status}"
    ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}
    wait until element is not visible   globalAjaxLoading  350