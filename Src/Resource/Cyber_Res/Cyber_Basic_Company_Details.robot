*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot


*** Variables ***
${CY_BCD_NAIC_Code}=            //span[@id='select2-chosen-1']
${CY_BCD_NAIC_Code_SearchBox}=  //input[@data-label='NAIC code|NAICCode']
${CY_BCD_No_Of_Employees}=  //input[@name="NumberOfEmployees"]
${CY_BCD_12Month_Gross_Revenue}=  //input[@name="GrossRevenue"]
${CY_BCD_Business_Description}=  //textarea[@data-label="Description of Business Activities|BusinessActivities"]
${CY_BCD_Client_DFL_$10,000}=  CyberEvent
${CY_BCD_Client_LegalActionn_DRCE}=  LegalAction
${CY_BCD_Client_RegulatoryActionn_DRCE}=  RegulatoryAction
${CY_BCD_Client_DSGS_Cryptocurrency}=  IneligibleClass
${CY_CS_Limit_Of_Liability}=  //input[@name='LimitOfLiability']
${CY_CS_Deductible}=  //input[@name='Deductible']
${CY_BCD_Blank_Emp_Error_Pop-Up}=    //p[contains(text(),'This field is required')]
${CY_BCD_Zero_Emp_Error_Pop-Up}=    //p[contains(text(),'Please enter Number')]
${CY_BCD_$0_Revenue_Error_Pop-Up}=    //p[contains(text(),'Please enter Last 12')]


*** Keywords ***
Cyber Basic Company Details
    [Arguments]    &{test_data}
    Wait Until Page Contains Element  ${CY_BCD_NAIC_Code_SearchBox}  15s
    Input Text   ${CY_BCD_NAIC_Code_SearchBox}    ${test_data['NAIC Code']}
    sleep  5s
    Press Keys   ${CY_BCD_NAIC_Code_SearchBox}   ALT  ARROW_DOWN
    press keys  NONE  RETURN
    Check and enter input    ${CY_BCD_No_Of_Employees}    ${test_data['No. Of Employees']}
    Check and enter input    ${CY_BCD_12Month_Gross_Revenue}    ${test_data['Last 12 Months Gross Revenue']}
    Check and enter input    ${CY_BCD_Business_Description}    ${test_data['Description Of Business Activities']}
    press keys    NONE    TAB
    scroll element into view  ${CY_BCD_Client_DSGS_Cryptocurrency}
    select radio button    ${CY_BCD_Client__DFL_$10,000}    ${test_data['Has your client experienced a cyber event in the past three years that has resulted in a direct financial loss of more than $10,000?']}
    select radio button    ${CY_BCD_Client_LegalActionn_DRCE}    ${test_data['Has your client had any legal action brought or threatened against them in the last five years as a direct result of a cyber event?']}
    select radio button    ${CY_BCD_Client_RegulatoryActionn_DRCE}    ${test_data['Has your client had a regulatory action initiated against them in the last five years as a direct result of a cyber event?']}
    select radio button    ${CY_BCD_Client_DSGS_Cryptocurrency}    ${test_data['Has your client been involved in the direct supply of goods or services to the cannabis industry, nor are they involved directly in the use or supply of cryptocurrency?']}
    continue Click RE

Cyber Coverage Selection
    [Arguments]    &{test_data}
    Execute Javascript    window.scrollTo(0, 100)
    Wait Until Element Is Visible    ${CY_CS_Limit_Of_Liability}
#    Click Element       ${CY_CS_Limit_Of_Liability}
#    sleep  1s
#    Wait Until Element Is Visible    //li[normalize-space()='${test_data['Limit Of Liability']}']
#    Click Element    //li[normalize-space()='${test_data['Limit Of Liability']}']
    Select Value From Dropdown  ${CY_CS_Limit_Of_Liability}  ${test_data['Limit Of Liability']}
    Select Value From Dropdown  ${CY_CS_Deductible}  ${test_data['Deductible']}
#    Click Element    ${CY_CS_Deductible}
#    Wait Until Element Is Visible   //li[normalize-space()='${test_data['Deductible']}']
#    Click Element    //li[normalize-space()='${test_data['Deductible']}']
    continue Click RE
    ${UW_Hold_Check}=  Run Keyword And Return Status    Wait Until Element Is Visible    //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  10s
    Sleep    6s

Enter Info upto Business Description
    [Arguments]    &{test_data}
    wait until element is visible  ${CY_BCD_NAIC_Code_SearchBox}
    Input Text    ${CY_BCD_NAIC_Code_SearchBox}    ${test_data['NAIC Code']}
    sleep  2s
    Press Keys   ${CY_BCD_NAIC_Code_SearchBox}  ALT  ARROW_DOWN
    press keys  NONE  RETURN
    Check and enter input    ${CY_BCD_No_Of_Employees}     ${test_data['No. Of Employees']}
    Check and enter input    ${CY_BCD_12Month_Gross_Revenue}   ${test_data['Last 12 Months Gross Revenue']}
    Check and enter input    ${CY_BCD_Business_Description}    ${test_data['Description Of Business Activities']}

Verify, Blank Number Employees Error Message
    [Arguments]    &{test_data}
    Enter Info upto Business Description  &{test_data}
    scroll element into view    ${CY_BCD_No_Of_Employees}
    Click Element    ${CY_BCD_No_Of_Employees}
    Press Keys    NONE  TAB
    wait until page contains element    ${CY_BCD_Blank_Emp_Error_Pop-Up}    15s
    ${Blank_Emp_Error_Message}=    get text  ${CY_BCD_Blank_Emp_Error_Pop-Up}
    run keyword if    '${Blank_Emp_Error_Message}'=='This field is required'    log to console
    ...    Blank Employee Error Message Appeared, Matches and Verified    ELSE    run keywords    log to console
    ...    Blank Employee Error Message is Not Matching    AND    Fail

Verify, Zero Number Employees Error Message
    [Arguments]    &{test_data}
    Enter Info upto Business Description  &{test_data}
    scroll element into view   ${CY_BCD_No_Of_Employees}
    ${Zero_Emp_Error_Message}=    get text  ${CY_BCD_Zero_Emp_Error_Pop-Up}
    run keyword if    '${Zero_Emp_Error_Message}'=='Please enter Number of Employees greater than 0 proceed.'    log to console
    ...    Zero Employee Error Message Appeared, Matches and Verified    ELSE    run keywords    log to console
    ...    Zero Employee Error Message is Not Matching    AND    Fail

Verify, $0 Revenue Error Message
    [Arguments]    &{test_data}
    Enter Info upto Business Description  &{test_data}
    scroll element into view    ${CY_BCD_No_Of_Employees}
    wait until page contains element    ${CY_BCD_$0_Revenue_Error_Pop-Up}    1s
    ${$0_Revenue_Error_Message}=    get text  ${CY_BCD_$0_Revenue_Error_Pop-Up}
    run keyword if    '${$0_Revenue_Error_Message}'=='Please enter Last 12 Months Gross Revenue Greater than 0 proceed.'    log to console
    ...    $0 Revenue Error Message Appeared, Matches and Verified    ELSE    run keywords    log to console
    ...    $0 Revenue Error Message is Not Matching    AND    Fail

Edit Basic Company Details
    [Arguments]    &{test_data}
    Wait Until Element Is Visible  ${CY_BCD_No_Of_Employees}
    Clear Element Text   ${CY_BCD_No_Of_Employees}
    Clear Element Text   ${CY_BCD_12Month_Gross_Revenue}
    Input Text        ${CY_BCD_No_Of_Employees}    ${test_data['Edited No. Of Employees']}
    Input Text     ${CY_BCD_12Month_Gross_Revenue}    ${test_data['Edited Last 12 Months Gross Revenue']}
    scroll element into view  ${CY_BCD_Client_DSGS_Cryptocurrency}
    select radio button    ${CY_BCD_Client_DFL_$10,000}  ${test_data['Edited First Q ans']}
    select radio button    ${CY_BCD_Client_LegalActionn_DRCE}  ${test_data['Edited Second Q ans']}
    select radio button    ${CY_BCD_Client_RegulatoryActionn_DRCE}    ${test_data['Edited Third Q ans']}
    select radio button    ${CY_BCD_Client_DSGS_Cryptocurrency}  ${test_data['Edited Fourth Q ans']}
    continue Click RE

Change Coverage Limit
    [Arguments]    &{test_data}
    Wait Until Element Is Visible    ${CY_CS_Limit_Of_Liability}
    Click Element       ${CY_CS_Limit_Of_Liability}
    sleep  1s
    Wait Until Element Is Visible    //li[normalize-space()='${test_data['Edited Limit Of Liability']}']
    Click Element    //li[normalize-space()='${test_data['Edited Limit Of Liability']}']
    continue Click RE