*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-EL-Submit}=  id=Submit
${ID-EL-ReviewAction}=   Action
${Document-Hourglass}=    //img[contains(@src, '../../images/viewIcon.png')]

*** Keywords ***
Endorsement Letter
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    select radio button  Action  Review
    wait until element is not visible   globalAjaxLoading  100
    ${Endorsementletter-Submit}=    run keyword and return status  element should be visible    ${ID-EL-Submit}
    run keyword if   ${Endorsementletter-Submit}    log to console   Navigated to Bind Tab
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-EL-Submit}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    (//tr[td[text()='Endorsement Letter']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is enabled    (//tr[td[text()='Endorsement Letter']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is not visible   globalAjaxLoading  350
    ${EndorsementLetter_Status}=    get text    (//tr[td[text()='Endorsement Letter']]//td//span[text()='Available for review'])[last()]
    log to console    Endorsement Letter Generated - "${EndorsementLetter_Status}"
    ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}
    wait until element is not visible   globalAjaxLoading  350