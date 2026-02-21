*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource  ../../Resource/UMS.robot

*** Variables ***
${UMS-Servicing} =    //a[contains(text(),'SERVICING')]
${ID-Serv-PolicyDescription} =    id=PolicyDescription
${ID-Serv-EndorsementEffectiveDate}=    id=EndorsementEffectiveDate
${Serv-Submit}=    //input[@value='Submit']
${Cov-Next} =    //input[@value='Next']
${ID-Serv-Apply} =    //input[@value='Apply']
${ID-Serv-ApplyFilter} =  //input[@value='Apply Filter']
${ID-Serv-ApplyChanges} =    //button/span[text()='Apply Changes']
${ID-Serv-Apply&Continue} =  //input[@value='Apply & Continue']
${Serv-MidtermEndorsement} =    //a[contains(@href,'/Nexus/MidtermEndorsement/Index/')]
${Serv-CancellationProcess}=    //a[contains(@href,'/Nexus/CancellationProcess/ProposeToCancel/')]
${Cancellation-OK}=    //button/span[text()='OK']
${ID-Application_CancelDate}=    id=Application_CancelDate
${ID-CancellationMethod}=    id=CancellationMethod
${ID-ReasonForCancellation}=    id=ReasonForCancellation
${ID-Reinstatement}=    //a[contains(@href,'/Nexus/Reinstatement/Index/')]
${ID-Reinstate}=    //input[@value='Reinstate']
${ID-Button-Reinstate}=    //button/span[text()='Reinstate']
## SAE_Res ###
${Serv-Renewal} =    //a[contains(@href,'/Nexus/Renewal/Index/')]
#Administration Page
${SetApplicationDate}=  //a[text()='Set Application Date']
${ChangeDatetextField}=  //input[@id='txtSelectedDate']
${ChangeDateRadioBtn}=  //input[@id='rdSelectDate']
###ERP###
${Endorsement_Type_ERP}=    //select[@id='EndorsementCode']

*** Keywords ***
Servicing
    Wait Until Element Is Not Visible    globalajaxLoading  100
    ${title} =    get window titles
    Switch Window    title=${title}[2]
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${UMS-Servicing}  40
    wait until element is enabled    ${UMS-Servicing}  40
    mouse over  ${UMS-Servicing}

KNR Servicing
    Wait Until Element Is Not Visible    globalajaxLoading  100
    ${title} =    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${UMS-Servicing}  40
    wait until element is enabled    ${UMS-Servicing}  40
    mouse over  ${UMS-Servicing}

Mid-Term Endorsement
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  200
    wait until element is visible    ${Serv-MidtermEndorsement}    100
    click element  ${Serv-MidtermEndorsement}
    wait until element is not visible   globalAjaxLoading  200
    ${Endorsement_Description} =    run keyword and return status  element should be visible    ${ID-Serv-PolicyDescription}
    run keyword if   ${Endorsement_Description}    log to console   Navigated to Mid-Term Endorsement Page
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input  ${ID-Serv-PolicyDescription}  ${test_data['Endorsement_Description']}
    wait until element is not visible   globalAjaxLoading  200
    ${Endorsement_date}=    Endorsement/Cancellation Date    ${testdata}
    input text    ${ID-Serv-EndorsementEffectiveDate}   ${Endorsement_date}
    wait until element is not visible   globalAjaxLoading  200
    click element    ${Serv-Submit}
    wait until element is not visible   globalAjaxLoading  200

Endorsement/Cancellation Date
    [Arguments]    ${testdata}
    ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    ${Substring_element}=    Get Substring Value    ${element}  14  24
    ${Final_date}=    Add Number of Days to the Date  ${Substring_element}  5
    RETURN    ${Final_date}

Cancellation Process
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  200
    wait until element is visible    ${Serv-CancellationProcess}    100
    click element  ${Serv-CancellationProcess}
    wait until element is not visible   globalAjaxLoading  200
    click element    ${Cancellation-OK}
    ${Cancellation_Description} =    run keyword and return status  element should be visible    ${ID-Application_CancelDate}
    run keyword if   ${Cancellation_Description}    log to console   Navigated to Cancellation Page
    wait until element is not visible   globalAjaxLoading  200
    ${Cancellation_date}=    Endorsement/Cancellation Date    ${testdata}
    input text    ${ID-Application_CancelDate}   ${Cancellation_date}
    check and select from list by label    ${ID-CancellationMethod}    ${test_data['Cancellation Method']}
    check and select from list by label    ${ID-ReasonForCancellation}    ${test_data['Reason for cancellation']}
    click element    ${ID-Serv-Apply}
    wait until element is not visible   globalAjaxLoading  100
    ${Policy_Status} =    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}
    ${Premium}=    get text    //th[label[text()='Premium:']]//following-sibling::td
    log to console    Premium:${Premium}
    ${Earned Factor}=    get text    //th[label[text()='Earned Factor:']]//following-sibling::td[1]
    log to console    Earned Factor:${Earned Factor}
    ${Unearned Factor}=    get text    //th[label[text()='Unearned Factor:']]//following-sibling::td[1]
    log to console    Unearned Factor:${Unearned Factor}
    ${Earned Premium}=    get text    //th[label[text()='Earned Premium:']]//following-sibling::td[1]
    log to console    Earned Premium:${Earned Premium}
    ${Unearned Premium}=    get text    //th[label[text()='Unearned Premium:']]//following-sibling::td[1]
    log to console    Unearned Premium:${Unearned Premium}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-Serv-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  200

Reinstatement
    Servicing
    wait until element is not visible   globalAjaxLoading  200
    wait until element is visible    ${ID-Reinstatement}    100
    click element  ${ID-Reinstatement}
    wait until element is not visible   globalAjaxLoading  300
    ${Reinstatement_Description} =    run keyword and return status  element should be visible    ${ID-Reinstate}
    run keyword if   ${Reinstatement_Description}    log to console   Navigated to Reinstatement Page
    wait until element is not visible   globalAjaxLoading  200
    click element    ${ID-Reinstate}
    wait until element is not visible   globalAjaxLoading  200
    click element    ${ID-Button-Reinstate}
    ${Policy_Status} =    get text    //td[b[text()='POLICY:']]//following-sibling::td
    log to console  ${Policy_Status}

## TMS SAE_Res ##
Servicing Renewal
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${UMS-Servicing}  40
    wait until element is enabled    ${UMS-Servicing}  40
    mouse over  ${UMS-Servicing}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Serv-Renewal}    100
    click element  ${Serv-Renewal}
    wait until element is not visible   globalAjaxLoading  200
    click element    ${Serv-Submit}
    handle alert    action=ACCEPT
    handle alert    action=ACCEPT

MT Endorsement
    [Arguments]    ${testdata}
    wait until element is visible    ${Serv-MidtermEndorsement}    100
    click element  ${Serv-MidtermEndorsement}
    wait until element is not visible   globalAjaxLoading  200
    ${Endorsement_Description} =    run keyword and return status  element should be visible    ${ID-Serv-PolicyDescription}
    run keyword if   ${Endorsement_Description}    log to console   Navigated to Mid-Term Endorsement Page
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input  ${ID-Serv-PolicyDescription}  ${testdata['Endorsement Description']}
    wait until element is not visible   globalAjaxLoading  200
    Run Keyword If    '${test_data['Program']}'=='BUILDERSRISK'    Pick Renewal Date BR
    Run Keyword If    '${test_data['Program']}'=='MGMT-LIAB'    Pick Renewal Date MGMT-LIAB
    Run Keyword If    '${test_data['Program']}'=='CYBER PVT ENT'    Pick Renewal Date for CYBER_PVT_ENT
    Run Keyword If    '${test_data['Program']}'=='SAE'    Pick Renewal Date SAE
    Run Keyword If    '${test_data['Program']}'=='REALESTATE'    Pick Renewal Date
    Run Keyword If    '${test_data['Program']}'=='IA'    Pick Renewal Date
    Run Keyword If    '${test_data['Program']}'=='K&R'    Pick Renewal Date SAE
    Run Keyword If    '${test_data['Program']}'=='CONTEQUIPT'    Pick Renewal Date BR
    Run Keyword If    '${test_data['Program']}'=='VIMMPROPERTY'    Pick Renewal Raven
    Run Keyword If    '${test_data['Program']}'=='ML-PRIVATE'    Pick Renewal Date MGMT-LIAB
    input text  ${ID-Serv-EndorsementEffectiveDate}  ${Renewal_Substring_element}
    wait until element is not visible   globalAjaxLoading  200
    click element    ${Serv-Submit}
    wait until element is not visible   globalAjaxLoading  200

Administration
    log to console  Reached Administration page
    wait until element is not visible   globalAjaxLoading  200
    UMS Click in ADMINISTRATION
    wait until element is visible   ${SetApplicationDate}
    click element   ${SetApplicationDate}
    wait until element is not visible   globalAjaxLoading  200
    Select Radio Button  IsTodayDate  False
    wait until element is not visible   globalAjaxLoading  200
    click element   ${Serv-Submit}

Abandon Endorsement
    wait until element is not visible   globalAjaxLoading  200
    wait until element is enabled    ${UMS-Servicing}  40
    mouse over  ${UMS-Servicing}
    click element   //a[contains(text(),'Abandon')]
    handle alert    action=ACCEPT

MT Endorsement With Expiration Date
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  200
    wait until element is visible    ${Serv-MidtermEndorsement}    100
    click element  ${Serv-MidtermEndorsement}
    wait until element is not visible   globalAjaxLoading  200
    ${Endorsement_Description} =    run keyword and return status  element should be visible    ${ID-Serv-PolicyDescription}
    run keyword if   ${Endorsement_Description}    log to console   Navigated to Mid-Term Endorsement Page
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input  ${ID-Serv-PolicyDescription}  ${testdata['Endorsement Description']}
    wait until element is not visible   globalAjaxLoading  200
    Run Keyword If    '${test_data['Program']}'=='BUILDERSRISK'    Pick Expiration Date BR
    Run Keyword If    '${test_data['Program']}' in ['REALESTATE', 'IA']    Pick Expiry Date
    Run Keyword If    '${test_data['Program']}'=='ML-PRIVATE'    Pick Expiry Date
    input text  ${ID-Serv-EndorsementEffectiveDate}  ${Substring_element}
    wait until element is not visible   globalAjaxLoading  200
    Run Keyword If    '${test_data['Program']}' in ['REALESTATE', 'IA']       Select From List By Label    ${Endorsement_Type_ERP}    ERP
    Run Keyword If    '${test_data['Program']}'=='ML-PRIVATE'       Select From List By Label    ${Endorsement_Type_ERP}    ${testdata['Endorsement Type']}
    click element    ${Serv-Submit}
    wait until element is not visible   globalAjaxLoading  200

MT Endorsement for K&R
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  200
    wait until element is visible    ${Serv-MidtermEndorsement}    100
    click element  ${Serv-MidtermEndorsement}
    wait until element is not visible   globalAjaxLoading  200
    ${Endorsement_Description} =    run keyword and return status  element should be visible    ${ID-Serv-PolicyDescription}
    run keyword if   ${Endorsement_Description}    log to console   Navigated to Mid-Term Endorsement Page
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input  ${ID-Serv-PolicyDescription}  ${testdata['Endorsement Description']}
    wait until element is not visible   globalAjaxLoading  200
    ${Endorsement_date}=    Select a Random Date TMS_SAE
    input text  ${ID-Serv-EndorsementEffectiveDate}  ${Endorsement_date}
    wait until element is not visible   globalAjaxLoading  200
    click element    ${Serv-Submit}
    wait until element is not visible   globalAjaxLoading  300

MT Endorsement for REO
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  200
    wait until element is visible    ${Serv-MidtermEndorsement}    100
    click element  ${Serv-MidtermEndorsement}
    wait until element is not visible   globalAjaxLoading  200
    ${Endorsement_Description} =    run keyword and return status  element should be visible    ${ID-Serv-PolicyDescription}
    run keyword if   ${Endorsement_Description}    log to console   Navigated to Mid-Term Endorsement Page
    wait until element is not visible   globalAjaxLoading  200
    Check and enter input  ${ID-Serv-PolicyDescription}  ${testdata['Endorsement Description']}
    wait until element is not visible   globalAjaxLoading  200
    ${Endorsement_date}=    Select a Random Date
    input text  ${ID-Serv-EndorsementEffectiveDate}  ${Endorsement_date}
    wait until element is not visible   globalAjaxLoading  200
    click element    ${Serv-Submit}
    wait until element is not visible   globalAjaxLoading  300
