*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${AE_GQ_Continue}=  //button[text()='Continue']
${AE_GQ_QOP_1}=  //input[@name='AE Professional Liability_1_AE Professional Liability']

*** Keywords ***
AE Generate Quote
    [Arguments]    &{test_data}
    sleep  10s
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Page Contains Element    ${AE_GQ_QOP_1}  15s
    ${checkbox}=  Run Keyword And Return Status  Page Should Contain Element   ${AE_GQ_QOP_1}
    Sleep    2s
    Click Element    ${AE_GQ_QOP_1}
#    run keyword if    '${test_data['SALE1']}' == 'YES' or '${test_data['SALE2']}' == 'YES' or '${test_data['SALE3']}' == 'YES'
#    ...    Click Element    (//input[@type='checkbox'])[2]
#    Run Keyword If    '${test_data['Per claim policy limit']}' in ['25', '50']  Click Element    //p[text()='Defense Outside the Limits']/parent::div/child::div/table/tbody/tr[2]/td/label/span/input
    click element  ${AE_GQ_Continue}



