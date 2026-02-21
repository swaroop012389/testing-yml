*** Settings ***
Library    SeleniumLibrary
Library    ../Global-variable/login.py
Resource    ../Generic.robot


*** Variables ***
# Text fields
${BR_GI_Insured_Name}=              //input[@name='Client_Name']
${BR_GI_Insured_Address}=    //input[@name='GoogleAddressInsured_Explanation']
${BR_GI_Contact_FirstName}=         //input[@name='ContactFirst_LastName']
${BR_GI_Contact_LastName}=          //input[@name='ContactLastName']
${BR_GI_Applicant_Email}=           //input[@name='Client_EmailAddr']
${BR_GI_GI_County}=                 id=Insured-administrative_area_level_2
# Checkbox
${BR_GI_TermsAndConditions}=    //input[@type='checkbox']

*** Keywords ***
BR General Information
    [Arguments]    ${test_data}
    log to console    NAVIGATED TO GENERAL INFORMATION PAGE
    Execute Javascript    window.scrollTo(0,50)
    wait until element is visible    ${BR_GI_Insured_Name}
    Fetch V2 Work ID
    Input text    ${BR_GI_Insured_Name}    ${test_data['Insured Name']}
    Input text    ${BR_GI_Insured_Address}  ${test_data['Applicant Address']}
    Sleep   1.5s
    Press Keys    ${BR_GI_Insured_Address}   ARROW_DOWN
    Sleep   1.5s
    Press Keys    ${BR_GI_Insured_Address}   RETURN
    Execute Javascript    window.scrollTo(100, 400)
    wait until element is visible    ${BR_GI_Contact_FirstName}
    Input text    ${BR_GI_Contact_FirstName}    ${test_data['First Name']}
    Accept Clearance Popup
    sleep  0.5s
    wait until element is visible    ${BR_GI_Contact_LastName}
    Input text    ${BR_GI_Contact_LastName}    ${test_data['Last Name']}
    wait until element is visible    ${BR_GI_Applicant_Email}
    Input text    ${BR_GI_Applicant_Email}    ${test_data['E-mail']}
    wait until element is not visible   globalAjaxLoading  50
    Execute Javascript  window.scrollTo(0,1000)
    click element  ${BR_GI_TermsAndConditions}
    Click Continue Button


