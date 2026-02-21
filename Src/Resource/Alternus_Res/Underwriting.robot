*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-UW-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${ID-UW-Rating}=  //a[contains(text(),'Rating')]
${ID-UW-Quote Letter Paragraphs}=  //a[contains(text(),'Quote Letter Paragraphs')]
${ID-UW-Endorsements}=  //a[contains(text(),'Endorsements')]
${ID-UW-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-UW-Apply&Continue}=  //input[@value='Apply & Continue']

*** Keywords ***
UnderWriting Rating
    wait until element is enabled    ${ID-UW-UNDERWRITING}  60
    wait until element is visible    ${ID-UW-UNDERWRITING}    60
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-UW-Rating}    60
    wait until element is enabled    ${ID-UW-Rating}  60
    click element  ${ID-UW-Rating}
    wait until element is not visible   globalAjaxLoading  100