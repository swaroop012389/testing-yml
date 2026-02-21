*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot
Resource    Upload_SOV_file.robot


*** Variables ***
${RB_TIV}=  id=Rows_0__Table_Corteges_0__3__Value
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${TIV_Error-message}=   //li[contains(text(),'The exposure TIV cannot be less than 1.')]
${Penchange_premium}=  (//input[@type='text'])[1]
${Penchange_Save-link}=  //a[contains(text(),'Save')]
${ID-COV-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Bundle_Coverages-checkbox}=   //input[@name='isCoverageBundle']
${Create_Bundle-link}=  //a[contains(text(),'Create Bundle')]
${ID-UW-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${Endrosements}=  //a[contains(text(),'Endorsements')]
${Autolink-Endos}=  //a[contains(text(),'Autolink Endorsements')]
${Rating}=  //a[contains(text(),'Rating')]
${Submit}=   id=Submit
${QO_All_Coverage}=    (//input[@type='checkbox'])[1]
${SOV-premium_Error-message}=   //span[contains(text(),'ERROR: Total premium from uploaded sheet of $273,672.00 does not match the bound premium $30,000.00')]
${Cancel}=  (//span[contains(text(),'Cancel')])[1]
${Rating}=    (//a[contains(@href, '/Nexus/Rating/Index/')])[2]
${Modifiers}=   //a[contains(text(),'Modifiers')]
${QO_Penchange}=  //a[contains(text(),'Pen Change')]
${Penchange_Save}=  //input[@type='submit']
${Penchange_premium}=  (//input[@type='text'])[1]
${Penchange_Save-link}=  //a[contains(text(),'Save')]
${AOP-Cov}=  (//input[@name='SelectedQuoteOptionIds'])[4]
${EQ-Cov}=  (//input[@name='SelectedQuoteOptionIds'])[5]
${Flood-Cov}=  (//input[@name='SelectedQuoteOptionIds'])[6]


*** Keywords ***
TIV Error message
    Check and enter input    ${RB_TIV}    0
    click element   ${ID-UMS-Apply&Continue}
    Log To Console    Checking TIV eroor message
    wait until element is not visible   globalAjaxLoad  100
    Wait Until Element Is Visible    ${TIV_Error-message}   10
    ${Error message}=  Get Text    ${TIV_Error-message}
    IF    '${Error message}' == 'The exposure TIV cannot be less than 1.'
        Log To Console    Error message : ${Error message}
    ELSE
    Close Browser
    END

Incorrect premium and TIV Error message
    [Arguments]  ${test_data}
    wait until element is not visible   globalAjaxLoading  200
    IF    '${test_data['Aop Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   10000
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Earthquake Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   10000
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Flood Coverage']}' == 'YES'
    Check and enter input    ${Penchange_premium}   10000
    Click Link    ${Penchange_Save-link}
    END
    wait until element is not visible   globalAjaxLoading  100
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  20
    wait until element is enabled    ${ID-UW-UNDERWRITING}  20
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  20
    click element  ${Endrosements}
    wait until element is not visible   globalAjaxLoading  100
    Click Link    ${Autolink-Endos}
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  20
    click element  ${Rating}
    Select Checkbox    ${QO_All_Coverage}
    Click Link    ${Create_Bundle-link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    Log To Console    Navigated to Endorsement Option page
    click element   ${ID-UMS-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    Log To Console    Navigated to Quote letter page
    select radio button  Action  Review
    click element  ${Submit}
    wait until element is not visible   globalAjaxLoading  100
    Bind
    Bind Quote Options to Bind   ${test_data}
    Upload_SOV_file   ${test_data}
    Log To Console    Checking Uploaded file does not match the bound premium eroor message
    wait until element is not visible   globalAjaxLoad  100
    Wait Until Element Is Visible    ${SOV-premium_Error-message}   10
    ${Error message}=  Get Text    ${SOV-premium_Error-message}
    IF    '${Error message}' == 'ERROR: Total premium from uploaded sheet of $273,672.00 does not match the bound premium $30,000.00'
        Log To Console    Error message : ${Error message}
    ELSE
    Close Browser
    END
    wait until element is not visible   globalAjaxLoad  100
    Wait Until Element Is Visible    ${Cancel}  50
    Click Element    ${Cancel}
    wait until element is not visible   globalAjaxLoading  20
    wait until element is enabled    ${ID-UW-UNDERWRITING}  20
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is enabled    ${Rating}  100
    click element  ${Rating}
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${Modifiers}   100
    Click Element    ${Modifiers}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Select Checkbox    ${AOP-Cov}
    Select Checkbox    ${EQ-Cov}
    Select Checkbox    ${Flood-Cov}
    Click Link    ${QO_Penchange}
    Wait Until Element Is Visible    ${Penchange_Save}     25
    Click Element    ${Penchange_Save}
    wait until element is not visible   globalAjaxLoading  200




