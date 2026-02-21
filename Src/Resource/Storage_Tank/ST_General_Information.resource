*** Settings ***
Resource  ../../Resource/Global-variable/v2.robot


*** Variables ***
${ST_GI_Applicant_Name}         //input[@name='Insured']
${ST_GI_Applicant_Address}      //input[@name='ApplicantGoogleAddress']
${ST_GI_Year_Established}       //input[@name='YearEstablished']
${ST_GI_First_Name}             //input[@name='PrimaryContactFirstName']
${ST_GI_Last_Name}              //input[@name='PrimaryContactLastName']
${ST_GI_Email_Address}          //input[@name='InsuredEmailAddr']
${ST_GI_Entity_Type}            //input[@name='LegalEntityCd']
${ST_GI_NAIC_Code}              //input[@name='NAICSCd']

*** Keywords ***
ST General Information
    [Arguments]    &{test_data}
    Wait Until Element Is Visible  ${ST_GI_Applicant_Name}  10s
    Fetch V2 Work ID
    Input Text  ${ST_GI_Applicant_Name}  ${test_data['Firm Name']}
    Input Text    ${ST_GI_Applicant_Address}    ${test_data['Applicant Address']}
    sleep  1s
    Press Keys   ${ST_GI_Applicant_Address}  ARROW_DOWN
    Press Keys    ${ST_GI_Applicant_Address}   RETURN
    Input Text    ${ST_GI_Year_Established}  ${test_data['Year Established']}
    Input Text  ${ST_GI_First_Name}  ${test_data['First Name']}
    Input Text  ${ST_GI_Last_Name}   ${test_data['Last Name']}
    Input Text  ${ST_GI_Email_Address}   ${test_data['Email']}
    Select Value From Dropdown  ${ST_GI_Entity_Type}    ${test_data['Entity Type']}
    Select Value From Dropdown  ${ST_GI_NAIC_Code}  ${test_data['NAIC Code']}
    Continue Click RE
    Accept Clearance Popup



Scroll Until Element Is Visible for NP
    [Arguments]    ${Drop_locator}  ${locator}    ${max_scrolls}=1000
    Click Element    ${Drop_locator}
    Sleep    1s
    ${index}=    Set Variable    0
    WHILE    ${index} < ${max_scrolls}
        ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
        IF    ${visible}
            Click Element    ${locator}
            Exit For Loop
        ELSE
            Press Keys    None    PAGE_DOWN
            Sleep    1s
        END
        ${index}=    Evaluate    ${index} + 1
    END
#    Run Keyword Unless    ${visible}    Fail    Element '${locator}' not found after ${max_scrolls} scrolls
