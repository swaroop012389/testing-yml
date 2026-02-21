*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-PI-PolicyInfo-TAb}=  link=Policy Info
${ID-PI-Edit}=    //input[@value='Edit']
${ID-PI-PolicyInfo_SlLinesState}=    id=PolicyInfo_SlLinesState
${PI-Search}=    //input[@value='Search']
${Name-PI-SPLradio}=    SPLradio
${ID-PI-Ok}=    //button//span[text()='Ok']
${ID-PI-SIGNED_SLA}=    id=PolicyInfo_SIGNED_SLA_DATEString
${ID-PI-SIGNED_TRIA}=    id=PolicyInfo_SIGNED_TRIA_DATEString
${ID-PI-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-PI-PolicyReceivedDateString0}=    //tr[td[contains(text(), 'Layer 0')]]//input[@class='datepicker hasDatepicker']       #id=Layers_0__PolicyReceivedDateString
${ID-PI-PolicyReceivedDateString1}=    //tr[td[contains(text(), 'Layer 1')]]//input[@class='datepicker hasDatepicker']      #id=Layers_1__PolicyReceivedDateString

*** Keywords ***
PolicyInfo Reissue Surplus
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  100
    ${PI-Reissue}=    run keyword and return status  element should be visible    ${ID-PI-PolicyInfo_SlLinesState}
    run keyword if   ${PI-Reissue}    log to console   Navigated to Policy-Info Tab
    check and enter input    ${ID-PI-PolicyInfo_SlLinesState}    ${test_data['Surplus Lines State']}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${PI-Search}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-PI-Ok}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${PI-Search}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Name-PI-SPLradio}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-PI-Ok}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-PI-SIGNED_SLA}    ${test_data['Sign SLA']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-PI-SIGNED_TRIA}   ${test_data['Signed TRIA']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-PI-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

PolicyInfo Reissue
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  100
    ${PI-Reissue}=    run keyword and return status  element should be visible    ${ID-PI-PolicyInfo_SlLinesState}
    run keyword if   ${PI-Reissue}    log to console   Navigated to Policy-Info Tab
    check and enter input   ${ID-PI-SIGNED_SLA}    ${test_data['Sign SLA']}
    wait until element is not visible   globalAjaxLoading  100
    ${Layer_0}=  run keyword and return status    element should be visible    ${ID-PI-PolicyReceivedDateString0}
    run keyword if    ${Layer_0}  Layer0    ${testdata}    ELSE    Layer1    ${testdata}
    Policy Reissue

Policy Reissue
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-PI-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Layer0
    [Arguments]    ${testdata}
    check and enter input   ${ID-PI-PolicyReceivedDateString0}    ${test_data['First Layer']}

Layer1
    [Arguments]    ${testdata}
    check and enter input   ${ID-PI-PolicyReceivedDateString1}    ${test_data['First Layer']}