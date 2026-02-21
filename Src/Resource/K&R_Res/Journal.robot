*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../../Resource/TMS_Res/TMS_Dashboard.robot

*** Variables ***
${UMS-JOURNAL}=    //a[contains(text(),'JOURNAL')]
${Journal-create-entry}=    //a[contains(@href, 'javascript:CreateJournalEntry();')]
${ID-JournalTypeId}=    id=JournalTypeId
${ID-Description}=    id=Description
${ID-Details}=    id=Details
${Journal-create}=    //input[@value=' Create ']

*** Keywords ***
Journal
    [Arguments]    ${test_data}
    wait until element is visible    ${UMS-JOURNAL}  100
    wait until element is enabled    ${UMS-JOURNAL}  100
    mouse over  ${UMS-JOURNAL}
    click element    ${UMS-JOURNAL}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Journal-create-entry}
    wait until element is not visible   globalAjaxLoading  100
    ${JOURNAL_Page}=    run keyword and return status  element should be visible    ${ID-JournalTypeId}
    run keyword if   ${JOURNAL_Page}    log to console   Navigated to Journal Screen
    check and select from list by label    ${ID-JournalTypeId}    ${test_data['Journal Type']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input    ${ID-Description}    ${test_data['Journal_Description']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input    ${ID-Details}    ${test_data['Journal_Details']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Journal-create}

### TMS ###
Journal Verification
    [Arguments]    ${test_data}
    click element    (//a[text()="View"])[1]
    wait until element is not visible   globalAjaxLoading  100
    ${Journal_DateTime}=    get text    ((//table[@class="DischargedTable"])//tbody//td)[10]
    ${Conv_Date}=    TMS Current Date Conversion
    ${Date}=    fetch from left    ${Journal_DateTime}    ${space}
    log to console    Journal_Date:${Date}
    run keyword if  '${Conv_Date}' == '${Date}'  log to console    "Journal Date matches and is verified"
    ${Entered_By}=    get text    ((//table[@class="DischargedTable"])//tbody//td)[8]
    log to console    Entered_By:${Entered_By}
    ${Name}=    UMS Username
    run keyword if    '${Name}' == '${Entered By}'    log to console    "Entered By Name matches and is verified"
    ${Journal_Description}=    get text    //textarea[@id="Description"]
    log to console    Journal_Description:${Journal_Description}
    run keyword if    'Application Received task updated' == '${Journal_Description}'    log to console    "Journal description matches and is verified"
    ${Journal_Details}=    get text    //textarea[@id="Details"]
    log to console    Journal_Details:${Journal_Details}
    run keyword if    '${test_data["Comment"]}' == '${Journal_Details}'    log to console    "Journal Details matches and is verified"
    click element    //input[@value=" Cancel "]
    Back to TMS

TMS_Journal
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${UMS-JOURNAL}  100
    wait until element is enabled    ${UMS-JOURNAL}  100
    mouse over  ${UMS-JOURNAL}
    click element    ${UMS-JOURNAL}
    wait until element is not visible   globalAjaxLoading  100

UMS_Journal
    wait until element is not visible   globalAjaxLoading  100
    switch browser  1
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${UMS-JOURNAL}  100
    wait until element is enabled    ${UMS-JOURNAL}  100
    mouse over  ${UMS-JOURNAL}
    click element    ${UMS-JOURNAL}
    wait until element is not visible   globalAjaxLoading  100