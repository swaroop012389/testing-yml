*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot


*** Variables ***
${Link_QO_UMS}=    //a[contains(@href,'/Rating')]
${ID_QuoteOption1}=    (//input[@type='checkbox'])[1]
${ID_QuoteOption2}=    (//input[@type='checkbox'])[2]
${ID_QuoteOption3}=    (//input[@type='checkbox'])[3]
${ID_QuoteOption4}=    (//input[@type='checkbox'])[4]
${Value_RefreshQuote}=    //input[@value='Refresh Quote']
${ContinueButton_Name}=    (//input[@name='Continue'])[2]


*** Keywords ***
Click QO UMS Link
    log to console    Reached CE QUOTE OPTIONS PAGE
    wait until element is visible    ${Link_QO_UMS}
    click element    ${Link_QO_UMS}

CE Coverage Option Only
    [Arguments]    ${test_data}
    Click QO UMS Link
    ${title} =    get window titles
    Switch Window    title=${title}[1]
    Click Coverages Button
    Uncheck TRIA Checkbox
    UMS Quote Flow    ${test_data}
    Check Quote Option One

CE With TRIA Coverage Only
    [Arguments]    ${test_data}
    Click QO UMS Link
    ${title} =    get window titles
    Switch Window    title=${title}[1]
    Click Coverages Button
    Check TRIA Checkbox
    UMS Quote Flow    ${test_data}
    Check Quote Option One

CE With EQ Coverage Only
    [Arguments]    ${test_data}
    Click QO UMS Link
    ${title} =    get window titles
    Switch Window    title=${title}[1]
    Click Coverages Button
    Uncheck TRIA Checkbox
    Check EQ Checkbox
    UMS Quote Flow    ${test_data}
    Check Quote Option One

UMS Quote Flow
    [Arguments]    ${test_data}
    UMS Click on Apply & Continue
    Apply Changes Button Confirmation
    UMS Click on Apply & Continue
    #Care Condition of Equipmemt CE    ${test_data}
    #Cooperation of Owners CE    ${test_data}
    UMS Click on Apply & Continue
    #Apply Changes Button Confirmation
    wait until element is not visible   globalAjaxLoading  10
    UMS Click on Apply & Continue
    Check All Checkbox Quote Options
    UMS Click on Apply & Continue
    Sleep    2s
    #Apply Changes Button Confirmation
    Check All Checkbox Endorsement Options
    UMS Click on Apply & Continue
    Sleep    2s
    Apply Changes Button Confirmation
    UMS Review button and submit
    Verify Ready for Sending
    Close UMS window

Check Quote Option One
    Wait Until Element Is Visible    ${Value_RefreshQuote}
    scroll element into view    ${Value_RefreshQuote}
    click element    ${Value_RefreshQuote}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID_QuoteOption1}
    scroll element into view    ${ID_QuoteOption1}
    click element    ${ID_QuoteOption1}
    wait until element is visible    ${ContinueButton_Name}
    scroll element into view    ${ContinueButton_Name}
    click element    ${ContinueButton_Name}
    One Moment Please Not Visible

Select Quote Option
    [Arguments]    ${test_data}
    Wait Until Page Contains Element    //div[text()='Based on the information provided, the quote options below are available for your client:']  20s
    Execute Javascript    window.scrollTo(0, 1000)
    Run Keyword If    '${test_data['Quote Option']}'=='1k'    run keywords    scroll element into view    ${ID_QuoteOption1}    AND
    ...    click element    ${ID_QuoteOption1}
    Run Keyword If    '${test_data['Quote Option']}'=='2.5k'    run keywords    scroll element into view    ${ID_QuoteOption2}    AND
    ...    click element    ${ID_QuoteOption2}
    Run Keyword If    '${test_data['Quote Option']}'=='5k'    run keywords    scroll element into view    ${ID_QuoteOption3}    AND
    ...    click element    ${ID_QuoteOption3}
    Run Keyword If    '${test_data['Quote Option']}'=='10k'    run keywords    scroll element into view    ${ID_QuoteOption4}    AND
    ...    click element    ${ID_QuoteOption4}
    Continue Click Generate Quote

