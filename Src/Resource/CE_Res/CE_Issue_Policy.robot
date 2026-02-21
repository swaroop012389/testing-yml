*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Generic.robot


*** Variables ***
# text field
${ID_EffectiveDate}=    //input[@name='PolicyEffectiveDate']
${ID_WorkItemId}=    workItemId
# texts
${Text_PolicyNumber}=    //tr//td[text()='Policy Number']//following-sibling::td
# button
${Value_IssuePolicy}=    //input[@value='Issue Policy']
${Value_Exit}=    //input[@value='Exit']
${ID_SearchBtn}=    searchBtn
${ID_ClearAll}=    reset-filter-button
# dropdown
${ID_Search_Options}=    dropdown-advanced
# validation
${POLICY_ISSUED_TEXT}=    Policy Issued


*** Keywords ***
CE Issue Policy
    [Arguments]    ${test_data}
    log to console    NAVIGATED TO ISSUE POLICY PAGE
    Wait Until Page Contains Element    (//p[text()='Issue Policy'])[2]  10s
    wait until element is visible    ${ID_EffectiveDate}
    ${EffDate}=    Add X Days To Current Date    ${test_data}
    ${EffDate1}=    remove string    ${EffDate}    -
    Press Keys    ${ID_EffectiveDate}    ${EffDate1}
    Press Keys    NONE  TAB
    Sleep    2s
    Continue Click Generate Quote
    Wait Until Page Contains Element    (//p[text()='Policy Summary'])[2]  200s
#    ${WorkID_Number}=    Assign Work ID Into Testdata    ${test_data}
#    ${PolicyIssuedText}=    run keyword and return status    page should contain    ${POLICY_ISSUED_TEXT}
#    ${UMS_PolicyNumber}=    get text    ${Text_PolicyNumber}
#    log to console  Policy number : ${UMS_PolicyNumber}
#    Set to dictionary  ${test_data}  PolicyNumber=${UMS_PolicyNumber}
#    Run Keyword If    '${PolicyIssuedText}'=='True'    click element    ${Value_Exit}

CE Policy Filter
    [Arguments]    ${test_data}
    wait until element is visible    ${ID_ClearAll}
    click element    ${ID_ClearAll}
    wait until element is visible    ${ID_Search_Options}
    mouse over    ${ID_Search_Options}
    click element    ${ID_Search_Options}
    wait until element is visible    ${ID_WorkItemId}
    check and enter input    ${ID_WorkItemId}    ${test_data['WorkID']}
    wait until element is visible    ${ID_SearchBtn}
    set focus to element    ${ID_SearchBtn}
    click element    ${ID_SearchBtn}
    wait until element is visible    ${Text_PolicyNumber}    timeout=20s


