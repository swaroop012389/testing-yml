*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-UMS-Submit}=  id=Submit
${ID-UMS-ReviewAction}=   Action
${Create-Document}=    //a[contains(@href, 'javascript:CreateDocument();')]
${ID-Select-Documents-type}=    id=DocumentGenericId
${ID-Generateforreview}=   //button/span[text()='Generate for review']
${Document-Hourglass}=    //img[contains(@src, '../../images/viewIcon.png')]

*** Keywords ***
BillingNotice
    [Arguments]    ${testdata}
    click element    ${Create-Document}
    wait until element is not visible   globalAjaxLoading  100
    check and select from list by label  ${ID-Select-Documents-type}    ${test_data['Select document type for generation']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-Generateforreview}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    (//tr[td[text()='Billing Notice']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is enabled    (//tr[td[text()='Billing Notice']]//td//span[text()='Available for review'])[last()]    timeout=250
    wait until element is not visible   globalAjaxLoading  350
    ${BillingNotice_Status}=    get text    (//tr[td[text()='Billing Notice']]//td//span[text()='Available for review'])[last()]
    log to console    Billing Notice Generated - "${BillingNotice_Status}"
    ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}
    wait until element is not visible   globalAjaxLoading  350