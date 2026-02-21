*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-UMS-BIND/ISSUE-TAB}=  //a[contains(text(),'BIND/ISSUE')]
${ID-Issue/Reissue}=  //a[contains(text(),'Issue/Reissue')]
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Payments-Next}=    //input[@value='Next']
${Submit-button-value}=     //input[@value='Submit']


*** Keywords ***
Issue Reissue
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  60
    mouse over  ${ID-UMS-BIND/ISSUE-TAB}
    wait until element is not visible   globalAjaxLoading  120
    wait until element is visible    ${ID-Issue/Reissue}    60
    click element  ${ID-Issue/Reissue}
    wait until element is not visible   globalAjaxLoading  120