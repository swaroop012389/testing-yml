*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/DNO_Res/DNO_General_Information.robot


*** Variables ***
${CY_GI-ApplicantName}=                 //input[@name='CompanyName']
${CY_GI_AddressLine1}=                  //input[@name="StreetAddress"]
${CY_GI_ApplicantWebsite}=              //input[@name="ApplicantWebsite"]
${CY_GI_FirstName}=                     //input[@name="FirstName"]
${CY_GI_LastName}=                      //input[@name="LastName"]
${CY_GI_EmailAddress}=                  //input[@name='EmailAddress']
${CY_GI_EditButton}=                    id=editButton
${CY_GI_IsUserRetainingEnteredData}=    //input[@id='IsUserRetainingEnteredData']
${CY_GI_SurplusLinesStateMessage}=      //div[contains(text(),'Please note that ')]
${CY_GI_SurplusLinesState_Text}=        Please note that risks located in AK or WA are non-admitted and will be written with a surplus lines insurance carrier.
${CY_Cookies_Button}=                   //button[@id='truste-consent-button']
${Insurance_Agency_link}=               //li[@id='agencyInformationPageCYBR_menuLink']
${CY_GI_County}=                        //input[@name='ApplicantMailingCounty']
${CY_Applicant_Address}=                //input[@name="applicantGoogleAddress"]
${Cookies_close_button}=                //button[@class=' osano-cm-dialog__close osano-cm-close ']//*[name()='svg']

*** Keywords ***
Close Cyber Cookies
    sleep  0.1s
    ${Cookie_Status}=  Run Keyword And Return Status    Element Should Be Visible  ${Cookies_close_button}
    Run Keyword If  ${Cookie_Status}    Click Element    ${Cookies_close_button}

Cyber General Information
    [Arguments]    &{test_data}
    Wait Until Element Is Visible   ${CY_GI-ApplicantName}  30s
    Fetch V2 Work ID
#    Execute Javascript    document.body.style.zoom="70%"
    Scroll Element Into View    ${CY_GI-ApplicantName}
    Input Text   ${CY_GI-ApplicantName}    ${test_data['Firm Name']}
    Input Text    ${CY_Applicant_Address}  ${test_data['Applicant Address']}
    sleep  1s
    Press Keys   ${CY_Applicant_Address}   ARROW_DOWN
    Press Keys    ${CY_Applicant_Address}   RETURN
    Input Text    ${CY_GI_ApplicantWebsite}    ${test_data['Applicant Website']}
    Input Text    ${CY_GI_FirstName}   ${test_data['FirstName']}
    Input Text    ${CY_GI_LastName}    ${test_data['Lastname']}
    Input Text    ${CY_GI_EmailAddress}   ${test_data['Email']}
    continue Click RE
    Accept Clearance Popup

Default Expiration-Date
    [Arguments]    &{test_data}
    ${exp-date}=  Get value  ${ID-GI-ExpirationDate}
    ${calc-date}=  Add time to date  ${test_data['Effective Date']}  365 days  date_format=%m-%d-%Y
    ${format-calc-date}=  Convert date  ${calc-date}  result_format=%m-%d-%Y
    Run Keyword if  '${format-calc-date}' == '${exp-date}'  Write Log  Expiry date check successful.Effective date is ${test_data['Effective Date']} and Expiry date is ${exp-date}  ELSE  Write Log  Expiry date check failed.Effective date is ${test_data['Effective Date']} and Expiry date is ${exp-date}
    set test variable  ${policy-exp-date}  ${exp-date}

Verify Surplus Lines State Message
    Wait Until Element Is Visible  ${CY_GI-ApplicantName}
#    ${Surplus_Lines_State_Message}=    get text   ${CY_GI_SurplusLinesStateMessage}
#    run keyword if    '${Surplus_Lines_State_Message}'=='${CY_GI_SurplusLinesState_Text}'    log to console    Surplus Lines State Message Matches,Verified
#    ...    ELSE    run keywords    log to console  Surplus Lines State Message Is Not Matching  AND  FAIL

Click on Insurance Agency Information Link
    click element    ${Insurance_Agency_link}

Click General Information Page From Left Panel
    Wait Until Element Is Visible    //p[text()='General Information']  5s
    Click Element    //p[text()='General Information']

Change Broker Name and Continue
    [Arguments]    &{test_data}
    input text  ${ID-Brokerage-Number}  ${test_data['Broker-id']}
    Press Keys  ${ID-Brokerage-Number}  RETURN
    click element  ${All_LOB_IA_Brok_Num_Search}
    wait until element is not visible  ${ID_Pleasewait}   30
    click element  ${ID-broker-contact}
    select from list by label  ${ID-broker-contact}  ${test_data['Changed Broker Email']}
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30

Edit General Information Details
    [Arguments]    &{test_data}
    wait until element is visible  ${CY_GI_AddressLine1}   10s
    Check and enter input    ${CY_GI_AddressLine1}   ${test_data['Edited AddressLine']}
    Check and enter input    ${CY_GI_ApplicantWebsite}     ${test_data['Edited Applicant Website']}
    continue Click RE
