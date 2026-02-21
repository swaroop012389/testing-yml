*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot


*** Variables ***
${AE_GI_FirmName}=  //input[@name='FirmName']
${AE_GI_Applicantaddress}=  //input[@name='ApplicantGoogleAddress_Explanation']
${AE_GI_AddressLine1}=  //input[@name='MailingAddress']
${AE_GI_Physical_address}=    //input[@name='MailingAddressYN']
${AE_GI_Year_firm_established}=  //input[@name='YearFirmEstablished']
${AE_GI_FirstName}=  //input[@name='ContactFirstName']
${AE_GI_LastName}=  //input[@name='ContactLastName']
${AE_GI_EmailAddress}=  //input[@name='Contactemail']
${AE_GI_EffectiveDate}=  //input[@name='EffectiveDate']
${AE_Is_this_applicant_individual_or_business entity?}=     //input[@name='IndividualEntityYN']
${AE_GI_MailingAddress}=  //input[@name='applicantMailingGoogleAddress']
${AE_GI_Addnew}=  //button[text()='Add New']
${AE_GI_Add}=  //button[text()='Add']
${AE_GI_Individual_Entity}=  //input[@name='NamedInsured_EntityName']
${AE_AI_IndvidualProfessionalDesc}=     //textarea[@name='NamedInsured_IndvidualProfessionalServiceDesc']
${AE_AI_NamedInsured_EntityProfessionalServiceDesc}=    //textarea[@name='NamedInsured_EntityProfessionalServiceDesc']
${AE_AI_NamedInsured_OwnershipPct}=   //input[@name='NamedInsured_OwnershipPct']
${AE_AI_NamedInsured_FirmInsuredRelation}=   //input[@name='NamedInsured_FirmInsuredRelation']


*** Keywords ***
AE General Information
        [Arguments]    &{test_data}
        Wait Until Element Is Visible   ${AE_GI_FirmName}  10s
        Wait Until Element Is Enabled   ${AE_GI_FirmName}  10s
        sleep  1s
        Fetch V2 Work ID
        Check and enter input    ${AE_GI_FirmName}    ${test_data['Firm Name']}
        Wait Until Element Is Visible   ${AE_GI_Applicantaddress}  10s
        Wait Until Element Is Enabled    ${AE_GI_Applicantaddress}  10s
        Check And Enter Input    ${AE_GI_Applicantaddress}  ${test_data['Applicant Address']}
        Sleep   1s
        Press Keys    ${AE_GI_Applicantaddress}   ARROW_DOWN
        Sleep   2s
        Press Keys    ${AE_GI_Applicantaddress}   RETURN
        sleep  1s
        Scroll Element Into View   ${AE_GI_Year_firm_established}
        Wait Until Element Is Visible    ${AE_GI_Year_firm_established}    3s
        Wait Until Element Is Enabled    ${AE_GI_Year_firm_established}    3s
        Check and enter input    ${AE_GI_Year_firm_established}    ${test_data["Year firm established"]}
        Scroll Element Into View   ${AE_GI_Physical_address}
        Wait Until Element Is Enabled    ${AE_GI_Physical_address}   10s
        click element   //input[@name='MailingAddressYN' and @value='${test_data["Is your mailing address the same as your physical address?"]}']
        Run Keyword If    '${test_data["Is your mailing address the same as your physical address?"]}' == 'NO'    Applicant mailing address  &{test_data}
        Check and enter input    ${AE_GI_FirstName}    ${test_data['FirstName']}
        Check and enter input    ${AE_GI_LastName}    ${test_data['Lastname']}
        Check and enter input    ${AE_GI_EmailAddress}    ${test_data['Email']}
        ${Current_Eff_Date}=    get current date    result_format=%m/%d/%Y
        Check and enter input  ${AE_GI_EffectiveDate}  ${Current_Eff_Date}
        Press Keys  ${AE_GI_EffectiveDate}  RETURN
        click element  //input[@name='IndividualEntityYN' and @value='${test_data["Are there any other individuals or entities that should be added to the policy as a named insured?"]}']
        continue Click RE
        Accept Clearance Popup
        Run Keyword If    '${test_data["Are there any other individuals or entities that should be added to the policy as a named insured?"]}' == 'YES'
        ...    Additional Named Insureds  ${test_data}



Applicant mailing address
        [Arguments]  &{test_data}
        Wait Until Element Is Visible   ${AE_GI_MailingAddress}  10s
        Wait Until Element Is Enabled    ${AE_GI_MailingAddress}  10s
        Check And Enter Input     ${AE_GI_MailingAddress}  ${test_data['Mailing applicant address']}
        Sleep   1s
        Press Keys    ${AE_GI_MailingAddress}   ARROW_DOWN
        Sleep   2s
        Press Keys    ${AE_GI_MailingAddress}   RETURN
       # Wait Until Element Is Visible    ${AE_GI_Year_firm_established}    3s
       # Wait Until Element Is Enabled    ${AE_GI_Year_firm_established}    3s
       # Check and enter input    ${AE_GI_Year_firm_established}    ${test_data["Year firm established"]}

Additional Named Insureds
        [Arguments]    ${test_data}
       # sleep  10s
       # sleep  1s
       # ${Pop-up}=  run keyword and return status    element should be visible    ${AE_GI_IsUserRetainingEnteredData}  15s
       # run keyword if    ${Pop-up}  run keyword  To continue
       # run keyword if  '${Pop-up}'=='FALSE'    Recheck Popup
        Wait Until Page Contains Element   ${AE_GI_Addnew}
        Scroll Element Into View    ${AE_GI_Addnew}
        wait until element is not visible   globalAjaxLoading  50
        click element    ${AE_GI_Addnew}
        Check and enter input    ${AE_GI_Individual_Entity}    ${test_data['Please provide the name of the individual or entity']}
        run keyword if  '${test_Data['Is this applicant an individual or business entity?']}' == 'Individual'   Individual Entity  &{test_data}  ELSE  Business Entity  &{test_data}
        Scroll Element Into View    ${AE_GI_Add}
        Click element   ${AE_GI_Add}
        continue Click RE

Individual Entity
        [Arguments]    &{test_data}
        click element  //input[@name='NamedInsured_InsuredType' and @value='${test_Data['Is this applicant an individual or business entity?']}']
        click element  //input[@name='NamedInsured_PrincipalOwner' and @value='${test_Data['Is this person a principal or owner of the firm?']}']
        IF  '${test_Data['Is this person a principal or owner of the firm?']}' == 'NO'
        input text  //textarea[@name='NamedInsured_IndvidualInsuredRelation' ]  ${test_data['Please describe the relationship of this individual to the first named insured']}
        click element  //input[@name='NamedInsured_IndvidualProfessionalService' and @value='${test_data['Is this person providing any professional services outside of their employment for the first named insured?']}']
        run keyword if   '${test_data['Is this person providing any professional services outside of their employment for the first named insured?']}' == 'YES'  input text     ${AE_AI_IndvidualProfessionalDesc}   ${test_data['Please explain']}
        END

Business Entity
        [Arguments]    &{test_data}
        click element  //input[@name='NamedInsured_InsuredType' and @value='${test_Data['Is this applicant an individual or business entity?']}']
        click element  //input[@name='NamedInsured_DirectPredecessor' and @value='${test_data['Is this a direct predecessor firm?']}']
        IF  '${test_data['Is this a direct predecessor firm?']}' == 'YES'
        click element  //input[@name='NamedInsured_EntityProfessionalService' and @value='{test_data['Are you currently providing any professional services under this name?']}']
        run keyword if  '{test_data['Are you currently providing any professional services under this name?']}' == 'YES'   input text  ${AE_AI_NamedInsured_EntityProfessionalServiceDesc}   ${test_data['Please explain.']
        ELSE
        click element  //input[@name='NamedInsured_JointVenture' and @value='${test_data['Is this a joint venture?']}']
        run keyword if  '${test_data['Is this a joint venture?']}' == 'YES'  click element   //input[@name='NamedInsured_InsuredOwn51Pct' and @value='${test_data['Does the insured own 51% or more in the joint venture?']}']  ELSE  click element  //input[@name='NamedInsured_FirmInsuredServices' and @value='${test_data['Are the services of this firm the same as those of the first named insured?']}']
        run keyword if  '${test_data['Are the services of this firm the same as those of the first named insured?']}' == 'NO'  input text  //input[@name='NamedInsured_EntityServices']  ${test_data['What services is the entity performing?']}  ELSE  click element  //input[@name='NamedInsured_FirmInsuredOwnership' and @value='${test_data['Does this firm have the same majority ownership group as the first named insured?']}']
        run keyword if  '${test_data['Does this firm have the same majority ownership group as the first named insured?']}' == 'NO'  run keywords   input text  ${AE_AI_NamedInsured_OwnershipPct}  ${test_data['What is the ownership percentage breakdown?']}   AND   input text  ${AE_AI_NamedInsured_FirmInsuredRelation}  ${test_data['What is the relationship between the first named insured and this firm?']}
        END

Recheck Popup
        sleep  1s
        ${Pop-up}=  run keyword and return status    element should be visible    ${AE_GI_IsUserRetainingEnteredData}
        run keyword if    ${Pop-up}  run keyword  To continue

To continue
        scroll element into view    ${AE_GI_IsUserRetainingEnteredData}
        wait until page contains element    ${AE_GI_IsUserRetainingEnteredData}    timeout=20s
        Wait Until Element Is Visible   ${AE_GI_IsUserRetainingEnteredData}    timeout=30s
        set focus to element    ${AE_GI_IsUserRetainingEnteredData}
        Element Should Be Visible    ${AE_GI_IsUserRetainingEnteredData}
        select checkbox    ${AE_GI_IsUserRetainingEnteredData}
        Wait Until Element Is Visible   //div[@id='mr_buttons_continueButton']
        wait until page contains element    //div[@id='mr_buttons_continueButton']    timeout=20s
        Wait Until Element Is Visible   //div[@id='mr_buttons_continueButton']    timeout=20s
        click element    //div[@id='mr_buttons_continueButton']

Add Button
        Wait Until Element Is Visible  ${AE_ADD_Button}
        Click Button    ${AE_ADD_Button}
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  100
        wait until element is not visible  ${ID_Pleasewait}   100
        ${Pop-up}=  run keyword and return status    element should be visible    ${AE_GI_IsUserRetainingEnteredData}
        run keyword if    ${Pop-up}  run keyword  To continue
        wait until element is not visible   globalAjaxLoading  50





