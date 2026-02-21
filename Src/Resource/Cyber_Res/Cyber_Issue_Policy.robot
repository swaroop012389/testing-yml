*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String


*** Variables ***
${Issue_Policy_Button}=             //button[normalize-space()='Continue']
${CY_Policy_Summary_Status}=        //td[text()='Policy Issued']
${CY_Policy_Summary_PageHeader}=    //p[text()='Policy Summary']
${CY_PS_Policy_Number}=             //td[text()='Policy Number']/following-sibling::td
${CY_PS_Policy_EffDate_&_ExpDate}=  //td[text()='Policy Term']/following-sibling::td
${CY_PS_Policy_LimitOfLiability}=   (//table/tbody/tr/td/strong)[4]
${CY_PS_Policy_Deductible}=         //td[text()='Deductible']/following-sibling::td


*** Keywords ***
Cyber Issue Policy
    [Arguments]    &{test_data}
    Wait Until Element Is Visible    (//p[text()='Issue Policy'])[2]  20s
    ${page_Name}=  Get Text    (//p[text()='Issue Policy'])[2]
#    FOR    ${i}   IN RANGE    50
#        Press Keys    NONE    ARROW_DOWN
#    END
    Wait Until Page Contains Element    //input[@name='policyCFCunderwriter' and @value='NO']   10s
    Click Element    //input[@name='policyCFCunderwriter' and @value='NO']
    #Above 3 lines are added temperory becaus of bug as no button should be by default selected
    scroll element into view  ${Issue_Policy_Button}
    click element  ${Issue_Policy_Button}

Verify policy Summary Details
    [Arguments]    &{test_data}
    Wait Until Page Contains Element   ${CY_Policy_Summary_PageHeader}    30s
    ${Policy_Summary_Page_header}=  Get Text    ${CY_Policy_Summary_PageHeader}
    Wait Until Element Is Visible   ${CY_Policy_Summary_Status}  60s
    scroll element into view    ${CY_Policy_Summary_Status}
    ${Policy_StatusText}=    get text    ${CY_Policy_Summary_Status}
    run keyword if    '${Policy_StatusText}'=='${test_data['Policy Summary Status']}'    log to console    Policy status on policy summary page is ${Policy_StatusText}, Matches and verified.
    ...    ELSE    run keywords    log to console    Policy status on policy summary page is ${Policy_StatusText} & it is not matching with the requirement expected status is ${test_data['Policy Summary Status']}     AND    close browser
    ${Policy_Number_Text}=    get text    ${CY_PS_Policy_Number}
    log to console  Generated Policy Number is : ${Policy_Number_Text}
#    ${Policy_EffDate_&_ExpDate_Text}=    get text    ${CY_PS_Policy_EffDate_&_ExpDate}
#    log to console  Policy Term is: ${Policy_EffDate_&_ExpDate_Text}
#    ${Policy_LimitOfLiability_Text}=    get text    ${CY_PS_Policy_LimitOfLiability}
#    run keyword if    '${Policy_LimitOfLiability_Text}'=='${test_data['Limit Of Liability']}'    log to console    Limit Of Liability on policy summary page is matches with the input given in V2 and verified
#    ...    ELSE    run keywords    log to console    Limit Of Liability on policy summary page is ${Policy_LimitOfLiability_Text} & it is not matching with the inputs given in V2.    AND    close browser
#    ${Policy_Deductible_Text}=    get text    ${CY_PS_Policy_Deductible}
#    run keyword if    '${Policy_Deductible_Text}'=='${test_data['Deductible']}'    log to console    Deductible value on policy summary page is matches with the input given in V2 and verified
#    ...    ELSE    run keywords    log to console    Deductible value on policy summary page is ${Policy_Deductible_Text} & it is not matching with the inputs given in V2.    AND    close browser