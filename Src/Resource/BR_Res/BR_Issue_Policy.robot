*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Generic.robot


*** Variables ***
# text field
${BR_IP_EffectiveDate}=    //input[@name='PolicyEffectiveDate']
${BR_IP_WorkItemId}=    workItemId
${BR_IP_Continue}=  //button[text()='Continue']
# texts
${Text_PolicyNmbr}=    //li[contains(text(),'Policy Number:')]
# button
${BR_IP_IssuePolicy}=    //input[@value='Issue Policy']
${BR_IP_Exit}=    //input[@value='Exit']
${BR_IP_SearchBtn}=    searchBtn
${BR_IP_ClearAll}=    reset-filter-button
# dropdown
${BR_IP_Search_Options}=    dropdown-advanced
# validation
${POLICY_ISSUED_TEXT}=    The policy has been issued. The policy package has been emailed to you. Additional policy documents are available here.


*** Keywords ***
Issue Policy
    [Arguments]    ${test_data}
    wait until element is visible    ${BR_IP_EffectiveDate}
   # ${EffDate}=    Add X Days To Current Date    ${test_data}
    #${EffDate1}=    remove string    ${EffDate}    -
    ${Cur_date}=  Get Current Date    result_format=%m/%d/%Y
    Press Keys    ${BR_IP_EffectiveDate}    ${Cur_date}
    sleep  2s
    Press keys    ${BR_IP_EffectiveDate}    TAB
    sleep  2s
    log to console    NAVIGATED TO ISSUE POLICY PAGE
    Click element  ${BR_IP_Continue}
    sleep  2s
    Wait Until Page Contains Element    //p[text()='Client Information']  120s
   # wait until element is visible    ${BR_IP_IssuePolicy}
   # click element    ${BR_IP_IssuePolicy}
   # One Moment Please Not Visible
   # ${PolicyIssuedText}=    run keyword and return status    page should contain    ${POLICY_ISSUED_TEXT}
   # Run Keyword If    '${PolicyIssuedText}'=='True'    click element    ${BR_IP_Exit}
   # log to console    NAVIGATED TO POLICY SUMMARY PAGE
   # One Moment Please Not Visible
   # wait until element is visible    ${BR_IP_ClearAll}    7
   # click element    ${BR_IP_ClearAll}
   # sleep    1s
   # wait until element is visible    ${BR_IP_Search_Options}
   # mouse over    ${BR_IP_Search_Options}
   # click element    ${BR_IP_Search_Options}
   # sleep    1.6s
   # wait until element is visible    ${BR_IP_WorkItemId}    7
   # Check and enter input    ${BR_IP_WorkItemId}    ${test_data['WorkID']}
   # wait until element is visible    ${BR_IP_SearchBtn}
   # scroll element into view    ${BR_IP_SearchBtn}
   # set focus to element    ${BR_IP_SearchBtn}
   # click element    ${BR_IP_SearchBtn}
   # wait until element is visible  //*[@id="${test_data['WorkID']}"]/div[3]/table/tbody/tr/td[1]/ul/li[2]  10s
   # set focus to element  //*[@id="${test_data['WorkID']}"]/div[3]/table/tbody/tr/td[1]/ul/li[2]
   # ${policy-number} =  Get text  //*[@id="${test_data['WorkID']}"]/div[3]/table/tbody/tr/td[1]/ul/li[2]
   # Write Log  Policy issued. Work id: ${test_data['WorkID']} and ${policy-number}
   # ${ext-policy-number} =   Replace string  ${policy-number}  Policy Number:${SPACE}  ${EMPTY}
   # set test variable  ${policy-no}  ${ext-policy-number}
   # set to dictionary    ${test_data}    PolicyNumber=${ext-policy-number}
