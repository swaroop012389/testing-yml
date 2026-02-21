*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot


*** Variables ***
${RE_GI_FirmName}=  //input[@name='FirmName']
${RE_GI_FirstName}=  //input[@name='PrimaryContactFirstName']
${RE_GI_LastName}=  //input[@name='PrimaryContactLastName']
${RE_GI_EmailAddress}=  //input[@name='ApplicantEmail']
${RE_GI_MemberNRDSExplanation}=   //input[@name='MemberNRDS_Explanation']
${RE_GI_PartOfRealEstateFranchiseName}=    //input[@name='PartOfRealEstateFranchise_Explanation']
${RE_GI_ApplicationFirm}=   //input[@name='ApplicantDetails_01']
${RE_GI_LegalEntityTitleRelationshipDesc}=    //textarea[@name='ApplicantDetails_02']
${RE_GI_EffectiveDate}=   //input[@name='EffectiveDate']
${RE_GI_Applicant_Address}=   //input[@name='applicantGoogleAddress']

*** Keywords ***
RE General Information
        [Arguments]    &{test_data}
        ${Accept}    run keyword and return status  element should be visible    ${Accept_Button}
        run keyword if   ${Accept}    click element  ${Accept_Button}
        Wait Until Page Contains Element       ${RE_GI_FirmName}  60s
        Input text    ${RE_GI_FirmName}    ${test_data['Firm Name']}
        Input text    ${RE_GI_FirstName}    ${test_data['First Name']}
        Input text    ${RE_GI_LastName}    ${test_data['Last Name']}
        Input text    ${RE_GI_EmailAddress}    ${test_data['Email']}
        click element   //input[@name='MemberNRDS' and @value='${test_data["Is the applicant a member of the National Association of REALTORS?"]}']
        run keyword if    '${test_data["Is the applicant a member of the National Association of REALTORS?"]}' == 'YES'    Input text    ${RE_GI_MemberNRDSExplanation}    ${test_data["Provide the applicant's Member ID:"]}
        #run keyword if    '${test_data["Is the applicant a member of the National Association of REALTORS?"]}' == 'YES'   Execute Javascript  window.scrollTo(0,800)
        click element   //input[@name='PartOfRealEstateFranchise' and @value='${test_data["Is the applicant part of a real estate franchise?"]}']
       # run keyword if    '${test_data["Is the applicant part of a real estate franchise?"]}' == 'YES'    Execute Javascript  window.scrollTo(0,850)
        IF   '${test_data["Is the applicant part of a real estate franchise?"]}' == 'YES'
            Execute Javascript  window.scrollTo(0,650)
            #click element    ${RE_GI_PartOfRealEstateFranchiseName}
            #sleep  0.5s
           # click element     (//div[@tabindex='-1'])[1]
          #  Scroll Element Into View    //input[@value='${test_data["Select the applicant's franchise:"]}']
             Input Text    ${RE_GI_PartOfRealEstateFranchiseName}    ${test_data["Select the applicant's franchise:"]}
             sleep  0.7s
             Press Keys    ${RE_GI_PartOfRealEstateFranchiseName}   ARROW_DOWN
             Press Keys    ${RE_GI_PartOfRealEstateFranchiseName}   RETURN
            #click element   (//input[@value='${test_data["Select the applicant's franchise:"]}'])
        END
        sleep  1.5s
        #run keyword if    '${test_data["Is the applicant part of a real estate franchise?"]}' == 'NO'
       # IF    '${test_data["Is the applicant part of a real estate franchise?"]}' == 'YES'
       #        click element    (//div[@role='combobox'])[2]
       # ELSE
       #        click element    (//div[@role='combobox'])[1]
       # END
        Input Text   ${RE_GI_ApplicationFirm}    ${test_data["Is the applicant's firm a (an)"]}
        sleep  0.7s
        Press Keys    ${RE_GI_ApplicationFirm}   ARROW_DOWN
        Press Keys    ${RE_GI_ApplicationFirm}   RETURN
       # run keyword if    '${test_data["Is the applicant's firm a (an)"]}' == 'Other'   Click Element    (//span[text()='${test_data["Is the applicant's firm a (an)"]}'])  ELSE   click element   //span[text()='${test_data["Is the applicant's firm a (an)"]}']
       #run keyword if    '${test_data["Is the applicant's firm a (an)"]}' == 'Other'   Click Element    (//span[text()='${test_data["Is the applicant's firm a (an)"]}'])[2]  ELSE   click element   //span[text()='${test_data["Is the applicant's firm a (an)"]}']
       # run keyword if    '${test_data["Is the applicant's firm a (an)"]}' == 'Other'   Click Element    (//span[@data-value='CORP'])[2]  ELSE   click element   //span[@data-value='CORP']
        run keyword if    '${test_data["Is the applicant's firm a (an)"]}' == 'Other'    Input text    ${RE_GI_LegalEntityTitleRelationshipDesc}    ${test_data["Other Entity type"]}
        Sleep  2s
        ${Date}  timelocal
       ${Current_Eff_Date}=    get current date    result_format=%m/%d/%Y
        Press Keys    ${RE_GI_EffectiveDate}      ${Current_Eff_Date}
        Press Keys   ${RE_GI_EffectiveDate}   TAB
        Input Text   ${RE_GI_Applicant_Address}  ${test_data['Applicant Address']}
        sleep  0.7s
        Press Keys    ${RE_GI_Applicant_Address}   ARROW_DOWN
        Press Keys    ${RE_GI_Applicant_Address}   RETURN
        sleep  1s
        Execute Javascript  window.scrollTo(0,1800)
       # run keyword if   '${test_data['Broker-id']}' == '10115'    Press Keys   ${RE_GI_ExpirationDate}    ${test_data['Expiry Date']}    ELSE    Default Expiration-Date    &{test_data}
        continue Click RE
        Accept Clearance Popup
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        ${Pop-up}=  run keyword and return status    element should be visible    ${RE_GI_IsUserRetainingEnteredData}
        run keyword if    ${Pop-up}  run keyword  To continue
        Set Test Variable   ${Pop-up}
        wait until element is not visible   globalAjaxLoading  250

Default Expiration-Date
        [Arguments]    &{test_data}
        ${exp-date}=  Get value  ${RE_GI_ExpirationDate}
        ${calc-date}=  Add time to date  ${test_data['Effective Date']}  365 days  date_format=%m-%d-%Y
        ${format-calc-date}=  Convert date  ${calc-date}  result_format=%m-%d-%Y
        Run Keyword if  '${format-calc-date}' == '${exp-date}'  Write Log  Expiry date check successful.Effective date is ${test_data['Effective Date']} and Expiry date is ${exp-date}  ELSE  Write Log  Expiry date check failed.Effective date is ${test_data['Effective Date']} and Expiry date is ${exp-date}
        set test variable  ${policy-exp-date}  ${exp-date}