*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-EA-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-EA-Apply&Continue}=  //input[@value='Apply & Continue']

*** Keywords ***
EndorsementsToAttach
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-EA-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100