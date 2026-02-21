*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${UMS-Assignments}=    //a[contains(text(),'ASSIGNMENTS')]
${ID-UMS-CorrespondingContactId}=    id=CorrespondingContactId
${Empty-CorrespondingContactId}=    //select[@id='CorrespondingContactId']//option[@value='0']
${ID-UMS-PolicyAssignment}=  //a[contains(text(),'Policy Assignment')]
${ID-UMS-Apply}=    //input[@value='Apply']
${ID-UMS-ApplyFilter}=  //input[@value='Apply Filter']
${ID-UMS-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']

*** Keywords ***
Assignments
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${UMS-Assignments}    60
    wait until element is enabled    ${UMS-Assignments}    60
    mouse over  ${UMS-Assignments}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    link=Retail Agent Assignments    70
    wait until element is enabled    link=Retail Agent Assignments    70
    click element  link=Retail Agent Assignments
    ${Corresponding-contact}=    run keyword and return status  element should be visible    ${ID-UMS-CorrespondingContactId}
    run keyword if   ${Corresponding-contact}    log to console   Navigated to Assignment Tab
    wait until element is not visible   globalAjaxLoading  200
    ${A-CorrespondingContact}=    run keyword and return status    element should be visible    ${Empty-CorrespondingContactId}
    run keyword if    ${A-CorrespondingContact}    CorrespondingContact
    wait until element is not visible   globalAjaxLoading  60
    click element    ${ID-UMS-Apply}
    wait until element is not visible   globalAjaxLoading  100

CorrespondingContact
    click element    ${ID-UMS-CorrespondingContactId}
    wait until element is visible    //select[@id='CorrespondingContactId']//option[3]    30
    click element    //select[@id='CorrespondingContactId']//option[3]