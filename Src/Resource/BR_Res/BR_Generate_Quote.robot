*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot


*** Variables ***
# text
${BR_GQ_WindDeductible}=    //tr//td[contains(text(),'Wind deductible:')]//following-sibling::td
# checkbox
${BR_GQ_QuoteOptionToIssue}=    quoteOptionToIssue
${BR_GQ_Selecttoissue}=    //input[@type='checkbox']
# button
${Value_ContinueBtn}=    (//input[@value='Continue'])[3]
${RefreshQuoteButton}=    //input[@value='Refresh Quote']
# validation
${BR_GQ_WindCovDect}=    //td[contains(text(),'Wind deductible:')]
${Hold_TextBR}=    The submission has been referred to a builders risk underwriter.
${BR_GQ_Continue}=  //button[text()='Continue']

*** Keywords ***
Generate Quote
    [Arguments]    ${test_data}
    sleep  7s
    Wait Until Page Contains   Generate Quote     120s
    click element    ${BR_GQ_Selecttoissue}
    Execute Javascript  window.scrollTo(0,1000)
    Click element   ${BR_GQ_Continue}
    sleep   2s
    #${Status_RefreshButton}=    run keyword and return status    wait until page contains    ${Hold_TextBR}    3
    #Run Keyword If    '${Status_RefreshButton}'=='True'    UMS Release hold
    #${WindText_Status}=    run keyword and return status    wait until element is visible    ${BR_GQ_WindCovDect}
    #Run Keyword If    '${WindText_Status}'=='True'    Wind Deductible Status
    #Run Keyword If   '${test_data['Select to Issue']}'=='YES'    run keywords    scroll element into view  ${BR_GQ_QuoteOptionToIssue}    AND    click element    ${BR_GQ_QuoteOptionToIssue}
    #...    ELSE    select checkbox    ${BR_GQ_TermOptionCheckbox}
    #log to console    NAVIGATED TO GENERATE QUOTE PAGE
    #wait until element is visible    ${Value_ContinueBtn}    timeout=10s
    #set focus to element    ${Value_ContinueBtn}
    #click element    ${Value_ContinueBtn}
    #One Moment Please Not Visible

Wind Deductible Status
    ${WindDed_Value}=    get text    ${BR_GQ_WindDeductible}
    Run Keyword If    '${WindDed_Value}'=='3.0%'    log to console    WIND DEDUCTIBLE % : ${WindDed_Value}, VERIFIED
