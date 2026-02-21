*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource  ../../Resource/Global-variable/v2.robot


*** Variables ***
${CE_GI_ApplicantName}=         //input[@name='CompanyName']
${CE_GI_Applicant_Address}=     //input[@name='ApplicantGoogleAddress_Explanation']
${CE_GI_ContactFirstName}=      //input[@name='FirstName']
${CE_GI_ContactLastName}=       //input[@name='LastName']
${CE_GI_EmailAddress}=          //input[@name='EmailAddress']
${CE_GI_YearsInBusiness}=       //input[@name='YearsInBusiness']
${CE_GI_Name_RejectTerrorism}=  RejectTerrorism
${CE_GI_TermsAndConditions}=    id=TermsAndConditions
${CE_GI_Select_GQCheckbox}=     //input[@type='checkbox']


*** Keywords ***
CE General Information
    [Arguments]    ${test_data}
    log to console    Reached GENERAL INFORMATION PAGE
    wait until element is visible    ${CE_GI_ApplicantName}  20s
    Fetch V2 Work ID
    Input Text    ${CE_GI_ApplicantName}    ${test_data['Applicant Name']}
    Input Text    ${CE_GI_Applicant_Address}  ${test_data['Applicant Address']}
    Sleep    2s
    Press Keys    ${CE_GI_Applicant_Address}   ARROW_DOWN
    Press Keys    ${CE_GI_Applicant_Address}   RETURN
    wait until element is visible    ${CE_GI_ContactFirstName}
    Input Text    ${CE_GI_ContactFirstName}    ${test_data['FirstName']}
    wait until element is visible    ${CE_GI_ContactLastName}
    clear element text    ${CE_GI_ContactLastName}
    input text    ${CE_GI_ContactLastName}    ${test_data['LastName']}
    wait until element is visible    ${CE_GI_EmailAddress}
    Input Text    ${CE_GI_EmailAddress}    ${test_data['Email']}
    wait until element is visible    ${CE_GI_YearsInBusiness}
    Input Text    ${CE_GI_YearsInBusiness}    ${test_data['Years in Business']}
    Click Element    //input[@name='TRIA' and @value='${test_data['Do you want to reject terrorism coverage?']}']
    Scroll Element Into View    ${CE_GI_Select_GQCheckbox}
    Click Element     ${CE_GI_Select_GQCheckbox}
    Continue Click RE
    Accept Clearance Popup