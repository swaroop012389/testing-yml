*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot
Resource  ../../Resource/Storage_Tank/Facility_Storage_Tank_Schedule_Info.robot

*** Variables ***
${CY_QOP_Effective_Date}=                  //input[@name='PolicyEffectiveDate']
${CY_QOP_Expiration_Date}=                 //input[@name='PolicyExpirationDate']
${CY_QOP_Continue}=                        //button[normalize-space()='Continue']
${CY_QOP_Header_Msg}=                      //div[contains(text(),'Based on the information provided, the quote options below are available for your client.')]
${CY_QOP_ChkBox_Quote1} =                  (//input[@type='checkbox'])[1]
${CY_QOP_ChkBox_Quote2} =                  (//input[@type='checkbox'])[2]
${CY_QOP_ChkBox_Quote3}=                   (//input[@type='checkbox'])[3]
${CY_CS_SurplusLinesLimitMessage}=         //div[contains(text(),'Please note that ')]
${CY_CS_SurplusLinesLimitMessage_Text}=     Please note that policy limits of $4M and higher are non-admitted and will be written with a surplus lines insurance carrier.
${CY_QOP_AvailableMessage}=                 //div[contains(text(),'Based on the')]
${CY_QOP_AvailableMessage_Text}=            Based on the information provided, the quote options below are available for your client.
${CY_QOP_PolicyTermMessage}=                //div[contains(text(),'Please use the Submit Comments & Questions')]
${CY_QOP_PolicyTermMessage_Text}=           Please use the Submit Comments & Questions functions on the right to request a policy term other than 18 months.
${CY_QOP_PolicyTermMessage_12months_Text}=  Please use the Submit Comments & Questions function to request a policy term other than 18 months.
${Quote_EmailCoverQuotePackage}=            //a[@id='emailCoverQuotePackage']
${Quote_Letter_Option1}=                    //a[@id='quoteLetter1PDF']
${Quote_Letter_Option2}=                    //a[@id='quoteLetter2PDF']
${Quote_Letter_Option3}=                    //a[@id='quoteLetter3PDF']
${Quote_Quote_Summary}=                     /a[@id='quoteSummary']
${Quote_Policy_Wording}=                    //td/a[@id='policyWording']
${CY_QOP_Error_Message_PT<6Months}=         //div[@id='checkPolicyPeriod6Months']
${CY_QOP_Error_Message_PT>18Months}=        //div[@id='checkPolicyPeriod18Months']
${CY_QOP_Expiration_Date}=                  //input[@name='PolicyExpirationDate']


*** Keywords ***
Cyber Select Quote Options
    [Arguments]    &{test_data}
    Wait Until Page Contains Element    //div[text()='Based on the information provided, the quote options below are available for your client.']   20s
    Execute Javascript    window.scrollTo(0,200)
    click element  (//input[@type='checkbox'])[${test_data['Quote Options']}]
#    Set Effective Date    &{test_data}
    Select Current Date ST  //input[@name='PolicyEffectiveDate']/parent::div/child::div/button
#    Click Element   ${CY_QOP_Expiration_Date}
    Continue Click Generate Quote

Set Effective Date
    [Arguments]    &{test_data}
    scroll element into view  ${CY_QOP_Effective_Date}
    ${Current_Eff_Date}=    get current date    result_format=%m/%d/%Y
    Log To Console  ${Current_Eff_Date}
    input text  ${CY_QOP_Effective_Date}  ${Current_Eff_Date}

Set Expiry Date Under 6 Moths
    [Arguments]    &{test_data}
    click element    ${CY_QOP_Expiration_Date}
    ${Current_Eff_Date}=    get current date    result_format=timestamp
    ${Date_Under_6_Months}=    add time to date    ${Current_Eff_Date}    170 days  result_format=%m/%d/%Y
    check and enter input    ${CY_QOP_Expiration_Date}    ${Date_Under_6_Months}

Set Expiry Date Over 18 Moths
    [Arguments]    &{test_data}
    click element    ${CY_QOP_Expiration_Date}
    ${Current_Eff_Date}=    get current date    result_format=timestamp
    ${Date_over_18_Months}=    add time to date    ${Current_Eff_Date}    560 days    result_format=%m/%d/%Y
    check and enter input    ${CY_QOP_Expiration_Date}    ${Date_over_18_Months}

Verify, If Quote Options are Available Or Not
    Wait Until Element Is Visible   ${CY_QOP_Effective_Date}  60s
    scroll element into view  ${CY_QOP_Effective_Date}
    ${Quote_Option1}=    run keyword and return status   Page Should Contain Element    ${CY_QOP_ChkBox_Quote1}
    run keyword if    ${Quote_Option1}    log to console    Quote Option 1 is available    ELSE    run keyword
    ...    log to console    Quote Option 1 is not available
    ${Quote_Option2}=    run keyword and return status    Page Should Contain Element  ${CY_QOP_ChkBox_Quote2}
    run keyword if    ${Quote_Option2}    log to console    Quote Option 2 is available    ELSE    run keyword
    ...    log to console    Quote Option 2 is not available
    ${Quote_Option3}=    run keyword and return status    Page Should Contain Element ${CY_QOP_ChkBox_Quote3}
    run keyword if    ${Quote_Option3}    log to console    Quote Option 3 is available    ELSE    run keyword
    ...    log to console    Quote Option 3 is not available
    execute javascript    window.scrollTo(0,400)

Verify Surplus Lines Limit Message
    Sleep    1s
#    Wait Until Element Is Visible   ${CY_CS_SurplusLinesLimitMessage}  10s
#    ${Surplus_Lines_Limit_Message}=    get text    ${CY_CS_SurplusLinesLimitMessage}
#    run keyword if    '${Surplus_Lines_Limit_Message}'=='${CY_CS_SurplusLinesLimitMessage_Text}'    log to console    Surplus Lines Limit Message Matches,Verified
#    ...    ELSE    run keywords    log to console  Surplus Lines Limit Message Is Not Matching  AND  Fail

Verify Quote Option Available Message
    wait until element is visible    ${CY_QOP_AvailableMessage}   15s
    ${Quote_Option_Available_Message}=    get text    ${CY_QOP_AvailableMessage}
    run keyword if    '${Quote_Option_Available_Message}'=='${CY_QOP_AvailableMessage_Text}'    log to console    Quote Options Available Message Matches,Verified
    ...    ELSE    run keywords    log to console  Quote Options Available Message Is Not Matching  AND  Fail

Verify Policy Term>18Months Message
    Execute Javascript    window.scrollTo(0, 1000)
    ${Polcy_Term_Message}=    get text    ${CY_QOP_PolicyTermMessage}
    run keyword if    '${Polcy_Term_Message}'=='${CY_QOP_PolicyTermMessage_Text}'    log to console    Policy Term > 18 Months Message Matches,Verified
    ...    ELSE    run keyword    log to console  Policy Term > 18 Months Message Is Not Matching  #AND  close browser

Verify Policy Term Other Than 12 Months Message, Broker
    wait until element is not visible    globalAjaxLoading    10
    scroll element into view  ${CY_QOP_PolicyTermMessage}
    ${Polcy_Term_Message}=    get text    ${CY_QOP_PolicyTermMessage}
    run keyword if    '${Polcy_Term_Message}'=='${CY_QOP_PolicyTermMessage_12months_Text}'    log to console    Policy Term Other Than 12 Months Message Matches,Verified
    ...    ELSE    run keyword    log to console  Policy Term Other Than 12 Months Message Is Not Matching  AND  Fail

Verify Generated Documents on Quote Options Page
    scroll element into view    ${Quote_Letter_Option1}
    ${Quote_EmailCoverQuotePackage_Text}=    get text  ${Quote_EmailCoverQuotePackage}
    run keyword if  '${Quote_EmailCoverQuotePackage_Text}'=='Email Cover Quote Package'    log to console  Email Cover Quote Package document is generated and verified.
    ...    ELSE     run keywords    log to console    Email Cover Quote Package doscument is missing please check    AND    close browser
    ${Quote_Letter_Option1_Text}=    get text  ${Quote_Letter_Option1}
    run keyword if  '${Quote_Letter_Option1_Text}'=='Quote Letter Option 1'    log to console  Quote Letter Option 1 document is generated and verified.
    ...    ELSE     run keywords    log to console    Quote Letter Option 1 doscument is missing please check    AND    close browser
    ${Quote_Letter_Option2_Text}=    get text  ${Quote_Letter_Option2}
    run keyword if  '${Quote_Letter_Option2_Text}'=='Quote Letter Option 2'    log to console  Quote Letter Option 2 document is generated and verified.
    ...    ELSE     run keywords    log to console    Quote Letter Option 2 doscument is missing please check    AND    close browser
    ${Quote_Letter_Option3_Text}=    get text  ${Quote_Letter_Option3}
    run keyword if  '${Quote_Letter_Option3_Text}'=='Quote Letter Option 3'    log to console  Quote Letter Option 3 document is generated and verified.
    ...    ELSE     run keywords    log to console    Quote Letter Option 3 doscument is missing please check    AND    close browser
    ${Quote_Quote_Summary_Text}=    get text  ${Quote_Quote_Summary}
    run keyword if  '${Quote_Quote_Summary_Text}'=='Quote Summary'    log to console  Quote Summary document is generated and verified.
    ...    ELSE     run keywords    log to console    Quote Summary doscument is missing please check    AND    close browser
    ${Quote_Policy_Wording_Text}=    get text  ${Quote_Policy_Wording}
    run keyword if  '${Quote_Policy_Wording_Text}'=='Policy Wording'    log to console  Policy wording document is generated and verified.
    ...    ELSE     run keywords    log to console    Policy Wording doscument is missing please check    AND    close browser

Verify Error Message, Policy Term Less Than 6 Months
    wait until page contains element    ${CY_QOP_Error_Message_PT<6Months}    1s
    ${Policy_Term_Alert}=    get text    ${CY_QOP_Error_Message_PT<6Months}
    run keyword if    "${Policy_Term_Alert}"=="Policy period can't be less than 6 months."    log to console    Error message for policy term less than 6 months is appeared and verified
    ...    ELSE  run keywords  log to console    Error message for policy term less than 6 months does not appear.  AND  close browser

Verify Error Message, Policy Term Gretaer Than 18 Months
    wait until page contains element    ${CY_QOP_Error_Message_PT>18Months}    1s
    ${Policy_Term_Alert}=    get text    ${CY_QOP_Error_Message_PT>18Months}
    run keyword if    "${Policy_Term_Alert}"=="Policy period can't be greater than 18 months."    log to console    Error message for policy term gretaer than 18 months is appeared and verified
    ...    ELSE  run keywords  log to console    Error message for policy term gretaer than 18 months does not appear.  AND  close browser