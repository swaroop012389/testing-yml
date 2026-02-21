*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***

${RE_CH_NumberOfClaims}=  //input[@name='ClaimsHistory_02']
${RE_CH_TotalIncurredAmount}=  //input[@name='ClaimsHistory_03']
${RE_CH_Addbutton}=  //button[text()='Add']
${RE_CH_dateOfClaim-0}=  //input[@name='tableInputs[0].ClaimHistory_Date']
${RE_CH_descOfClaim-0}=  //input[@name='tableInputs[0].ClaimHistory_Description']
${RE_CH_Open-Closed-0}=  //input[@role='combobox']
${RE_CH_Total-Incurred-0}=  //input[@name='tableInputs[0].ClaimHistory_TotalIncurred']
${RE_CH_dateOfClaim-1}=  //input[@name='tableInputs[1].ClaimHistory_Date']
${RE_CH_descOfClaim-1}=  //input[@name='tableInputs[1].ClaimHistory_Description']
${RE_CH_Open-Closed-1}=  //input[@role='combobox']
${RE_CH_Total-Incurred-1}=  //input[@name='tableInputs[1].ClaimHistory_TotalIncurred']
${RE_CH_dateOfClaim-2}=  //input[@name='tableInputs[2].ClaimHistory_Date']
${RE_CH_descOfClaim-2}=  //input[@name='tableInputs[2].ClaimHistory_Description']
${RE_CH_Open-Closed-2}=  //input[@role='combobox']
${RE_CH_Total-Incurred-2}=  //input[@name='tableInputs[2].ClaimHistory_TotalIncurred']
${RE_CH_dateOfClaim-3}=  //input[@name='tableInputs[3].ClaimHistory_Date']
${RE_CH_descOfClaim-3}=  //input[@name='tableInputs[3].ClaimHistory_Description']
${RE_CH_Open-Closed-3}=  //input[@role='combobox']
${RE_CH_Total-Incurred-3}=  //input[@name='tableInputs[3].ClaimHistory_TotalIncurred']
${RE_CH_dateOfClaim-4}=  //input[@name='tableInputs[4].ClaimHistory_Date']
${RE_CH_descOfClaim-4}=  //input[@name='tableInputs[4].ClaimHistory_Description']
${RE_CH_Open-Closed-4}=  //input[@role='combobox']
${RE_CH_Total-Incurred-4}=  //input[@name='tableInputs[4].ClaimHistory_TotalIncurred']
${RE_CH_Date_Circumstance_0}=  //input[@name='tableInputs[0].Circumstance_Date']
${RE_CH_Description_0}=  //input[@name='tableInputs[0].Circumstance_Description']
${RE_CH_Date_Circumstance_1}=  //input[@name='tableInputs[1].Circumstance_Date']
${RE_CH_Description_1}=  //input[@name='tableInputs[1].Circumstance_Description']
${RE_CH_Date_Circumstance_2}=  //input[@name='tableInputs[2].Circumstance_Date']
${RE_CH_Description_2}=  //input[@name='tableInputs[2].Circumstance_Description']
${RE_CH_LicenseRevokedDetails}=  //textarea[@name='LicenseRevoked_Explanation']
${RE_CH_OmmissionAddbutton}=     (//button[text()='Add'])[2]

*** Keywords ***
RE Claims History
    [Arguments]    &{test_data}
  #  Execute JavaScript    document.body.style.zoom = "100%"
    click element   //input[@name='AnyClaims' and @value='${test_data['Applicant Any claims in last 5 Years include voilation of fair housing board']}']
    run keyword if    '${test_data["Applicant Any claims in last 5 Years include voilation of fair housing board"]}' == 'YES'    Claims    &{test_data}
    click element  //input[@name='AwareOfEO' and @value='${test_data['Applicant Any Act, error and omission last 6 years']}']
    run keyword if    '${test_data["Applicant Any Act, error and omission last 6 years"]}' == 'YES'    Ommission act    &{test_data}
    click element   //input[@name='LicenseRevoked' and @value='${test_data['LicensedRevoked or Suspended in 6 Years']}']   
    run keyword if    '${test_data["LicensedRevoked or Suspended in 6 Years"]}' == 'YES'    Input text  ${RE_CH_LicenseRevokedDetails}    ${test_data['LicenseRevokedDetails']}
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30

Claims
    [Arguments]    &{test_data}
    Input text    ${RE_CH_NumberOfClaims}    ${test_data['Number of claims']}
    Input text    ${RE_CH_TotalIncurredAmount}    ${test_data['Total incurred amount']}
    Press Keys   ${RE_CH_TotalIncurredAmount}   TAB
    run keyword if    ${test_data['Number of claims']} > 2    Claimdate    &{test_data}

Claimdate
    [Arguments]    &{test_data}
    run keyword if  '${test_data['Claim Date-0']}' != 'nan'     Claim Details   0      &{test_data}
    run keyword if  '${test_data['Claim Date-1']}' != 'nan'     Claim Details   1      &{test_data}
    run keyword if  '${test_data['Claim Date-2']}' != 'nan'     Claim Details   2      &{test_data}
    run keyword if  '${test_data['Claim Date-3']}' != 'nan'     Claim Details   3      &{test_data}
    run keyword if  '${test_data['Claim Date-4']}' != 'nan'     Claim Details   4      &{test_data}

Claim Details
    [Arguments]   ${index}   &{test_data}
    click element     ${RE_CH_Addbutton}
    Press Keys    ${RE_CH_dateOfClaim-${index}}    ${test_data['Claim Date-${index}']}
    Press Keys    ${RE_CH_dateOfClaim-${index}}    TAB
    Input text    ${RE_CH_descOfClaim-${index}}    ${test_data['ClaimsDescription-${index}']}
    ${Loc_Value}=   evaluate  ${index}+1
    Execute Javascript  window.scrollTo(0,400)
    Input text    (${RE_CH_Open-Closed-${index}})[${Loc_Value}]     ${test_data['Open or Closed-${index}']}
    Press Keys    (${RE_CH_Open-Closed-${index}})[${Loc_Value}]   ARROW_DOWN
    Press Keys    (${RE_CH_Open-Closed-${index}})[${Loc_Value}]   RETURN
    Press Keys    (${RE_CH_Open-Closed-${index}})[${Loc_Value}]    TAB
    sleep  0.5s
   #IF  '${test_data['Open or Closed-${index}']}' == 'Open'
   #    Click Element   (//span[text()='${test_data['Open or Closed-${index}']}'])[${Loc_Value}]
   #ELSE
   #    Click Element   (//span[text()='${test_data['Open or Closed-${index}']}'])
   #END
    Input text    ${RE_CH_Total-Incurred-${index}}    ${test_data['Claims_Total incurred-${index}']}

Ommission act
    [Arguments]    &{test_data}
    run keyword if  '${test_data['Claim Date-4']}' != 'nan'   Execute Javascript  window.scrollTo(0,1300)
    IF  '${test_data["Date of circumstance-0"]}' != 'nan'
        #run keyword if    '${test_data['Number of claims']}' <= '2'  click element     ${RE_CH_Addbutton}  ELSE  click element   ${RE_CH_OmmissionAddbutton}
        Circumstance Details   0    &{test_data}
    END
    IF  '${test_data["Date of circumstance-1"]}' != 'nan'
        run keyword if  ${test_data['Total incurred amount']} < 10001   click element     ${RE_CH_Addbutton}  ELSE  click element   ${RE_CH_OmmissionAddbutton}
        sleep  0.5s
        Circumstance Details   1      &{test_data}
    END
    IF  '${test_data["Date of circumstance-2"]}' != 'nan'
        run keyword if  ${test_data['Total incurred amount']} < 10001  click element     ${RE_CH_Addbutton}  ELSE  click element   ${RE_CH_OmmissionAddbutton}
        Circumstance Details   2      &{test_data}
    END


Circumstance Details
    [Arguments]   ${index}   &{test_data}
    sleep  0.5s
    Input text    ${RE_CH_Description_${index}}    ${test_data['Ommission Description-${index}']}
    Press Keys    ${RE_CH_Date_Circumstance_${index}}    ${test_data['Date of circumstance-${index}']}




 #   IF  '${test_data['Date of circumstance-1']}' != 'nan'
 #       click element  ${RE_CH_Addbutton}
 #       click element  ${RE_CH_Addbutton}
 #       click element  ${RE_CH_Addbutton}
 #       Press Keys     ${RE_CH_Date_Circumstance_1}    ${test_data['Date of circumstance-1']}
 #       Input text    ${RE_CH_Description_1}    ${test_data['Ommission Description-1']}
 #   END
 #   IF  '${test_data['Date of circumstance-2']}' != 'nan'
 #       sleep  0.5s
 #       click element  ${RE_CH_Addbutton}
 #       Press Keys  ${RE_CH_Date_Circumstance_2}    ${test_data['Date of circumstance-2']}
 #       Input text    ${RE_CH_Description_2}    ${test_data['Ommission Description-2']}
 #   END