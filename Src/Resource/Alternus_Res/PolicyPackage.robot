*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../TMS_RES/UMS_PAGE.robot
Resource    ../Cyber_Res/Cyber_Policy_Holds.robot

*** Variables ***
${ID-PP-Submit}=    //input[@value='Submit']
${Name-ReviewAction}=   Action
${Document-Hourglass}=    //img[contains(@src, '../../images/viewIcon.png')]

*** Keywords ***
PolicyPackage
    wait until element is not visible   globalAjaxLoading  350
    ${PolciPackage-Submit}=    run keyword and return status  element should be visible    ${ID-PP-Submit}
    run keyword if   ${PolciPackage-Submit}    log to console   Navigated to PolicyPackage Tab
    select radio button  Action  Edit
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-PP-Submit}    60
    click element    ${ID-PP-Submit}
    wait until element is not visible   globalAjaxLoading  350
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  350
    wait until element is visible    (//tr[td[text()='Policy Package']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is enabled    (//tr[td[text()='Policy Package']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is not visible   globalAjaxLoading  350
    ${PolicyPackage_Status}=    get text    (//tr[td[text()='Policy Package']]//td[6])[last()]
    log to console    Policy Package Generated - "${PolicyPackage_Status}"
    ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}
    wait until element is not visible   globalAjaxLoading  350