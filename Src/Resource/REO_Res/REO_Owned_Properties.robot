*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***

${RE_OP_constructDevelopPropYesNo}=    (//input[@type='checkbox'])[1]
${RE_OP_sellPropDevOth}=   (//input[@type='checkbox'])[1]
${RE_OP_develoeprName0}=    //input[@name='OwnedProperties_03']
${RE_OP_ownershipPct0}=    //input[@name='OwnedProperties_04']
${RE_OP_annualComm0}=    //input[@name='OwnedProperties_05']
${RE_OP_typeOfService0}=    //input[@name='OwnedProperties_06']
${RE_OP_desc0}=    //input[@name='OwnedProperties_07']
${RE_OP_numUnits0}=    //input[@name='OwnedProperties_08']
${RE_OP_Own25PctLeaseYesNo}=    (//input[@type='checkbox'])[3]
${RE_OP_Own25PctLeaseExplanation}=     //input[@name='Own25PctLease_Explanation']
${RE_OP_Own25PctSellYesNo}=    (//input[@type='checkbox'])[2]
${RE_OP_Own25PctSellExplanation}=    //input[@name='Own25PctSell_Explanation']
${RE_OP_Own25PctManageYesNo}=    (//input[@type='checkbox'])[4]
${RE_OP_Own25PctManageExplanation}=    //input[@name='Own25PctManage_Explanation']
${RE_OP_DeriveMorethan25PctYesNo}=    (//input[@type='checkbox'])[5]
${RE_OP_DeriveMorethan25PctExplanation}=    //textarea[@name='DeriveMorethan25Pct_Explanation']
${RE_OP_ExclusiveListingYesNo}=    (//input[@type='checkbox'])[6]
${RE_OP_ExclusiveListingExplanation}=    //textarea[@name='ExclusiveListing_Explanation']

*** Keywords ***
RE Owned Properties
    [Arguments]    &{test_data}
    #Execute JavaScript    document.body.style.zoom = "100%"
    Execute Javascript  window.scrollTo(0,0)
    wait until page contains   Is the applicant involved in any of the services listed below?   30s
    click element  //input[@name='OwnedPropServices' and @value='${test_data['Is the applicant involved in any of the services listed below?']}']
    run keyword if    '${test_data['Is the applicant involved in any of the services listed below?']}' == 'YES'    OwnProperties    &{test_data}
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30

OwnProperties
     [Arguments]    &{test_data}
    # Execute Javascript  window.scrollTo(0,700)
     run keyword if    '${test_data['Construct or develop properties']}' == 'YES'   run keywords   click element   ${RE_OP_constructDevelopPropYesNo}    AND  Construct_Details    &{test_data}
     run keyword if    '${test_data['Own 25% more than sell']}' == 'YES'   run keywords   click element   ${RE_OP_Own25PctSellYesNo}    AND  input text    ${RE_OP_Own25PctSellExplanation}    ${test_data['Sell Revenue percentage']}
     run keyword if    '${test_data['Own 25% more than sell']}' == 'YES'   Execute Javascript  window.scrollTo(0,900)
     run keyword if    '${test_data['Own 25% more than lease']}' == 'YES'   run keywords   click element   ${RE_OP_Own25PctLeaseYesNo}    AND  input text    ${RE_OP_Own25PctLeaseExplanation}    ${test_data['LeaseRevenue percentage']}
     run keyword if    '${test_data['Own 25% more than manage']}' == 'YES'   run keywords   click element   ${RE_OP_Own25PctManageYesNo}    AND  input text    ${RE_OP_Own25PctManageExplanation}    ${test_data['Manage Revenue percentage']}
     run keyword if    '${test_data['More than 25% from a single client']}' == 'YES'   run keywords   click element   ${RE_OP_DeriveMorethan25PctYesNo}    AND  input text    ${RE_OP_DeriveMorethan25PctExplanation}    ${test_data['Single client Explanation']}
     run keyword if    '${test_data['Exclusive listing agreement-OP']}' == 'YES'    run keywords   click element   ${RE_OP_ExclusiveListingYesNo}    AND  input text    ${RE_OP_ExclusiveListingExplanation}    ${test_data['Agreement Explanation']}

Construct_Details
    [Arguments]    &{test_data}
    click element   //input[@name='SellPropDevOth' and @value='${test_data['Sell properties']}']
    input text    ${RE_OP_develoeprName0}    ${test_data['Developer name']}
    input text    ${RE_OP_ownershipPct0}    ${test_data['Owner']}
    input text    ${RE_OP_annualComm0}    ${test_data['Annual Commission']}
    input text    ${RE_OP_typeOfService0}    ${test_data['Type of service']}
    input text    ${RE_OP_desc0}    ${test_data['Properties description']}
    input text    ${RE_OP_numUnits0}     ${test_data['Units sold per year']}