*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot
Resource    ../UMS.robot

*** Variables ***
${Checkbox_NoAdditionalPremium}=    //input[@id='NoAdditionalPremium']
${ID-BE-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-BE-Apply&Continue}=  //input[@value='Apply & Continue']
${Checkbox_AllCoverages}=    //td[@class='td1']//input[@type='checkbox']
${Button_Next}=    //input[@value='Next']
${Button_AddReceivable}=    //input[@value='Add Receivable']
${Button_Add_Receivable2}=    (//input[@value='Add Receivable'])[2]
${Field_Amount}=    //input[@name='Ammount']
${Button_Save}=    //input[@value='Save']
${Button_Submit}=    //input[@id='Submit']

*** Keywords ***
Bind Endorsement
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  100
    Set Selenium Speed    0.2s
    wait until element is visible    ${Checkbox_NoAdditionalPremium}
    click element    ${Checkbox_NoAdditionalPremium}
    wait until element is visible    ${Checkbox_AllCoverages}
    click element    ${Checkbox_AllCoverages}
    select radio button  Selected  False
    wait until element is visible    ${ID-BE-Apply&Continue}
    scroll element into view    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Endorsements To Attach
    click element    ${ID-BE-Apply&Continue}
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}  5s
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Payments
    Click Element    ${Button_AddReceivable}
    Wait Until Element Is Visible   ${Field_Amount}  10s
    Check and enter input   ${Field_Amount}    ${test_data['Endorsement Premium']}
    Click Element    ${Button_Add_Receivable2}
    Click Element    ${Button_Save}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Wait Until Element Is Visible    ${Button_Submit}
    select radio button    Action    Send
    Scroll Element Into View    ${Button_Submit}
    Wait Until Element Is Visible    ${Button_Submit}
    click element    ${Button_Submit}
    Get Policy Status for Endrosement   ${test_data}
    Verify Policy Status 3    ${test_data}







