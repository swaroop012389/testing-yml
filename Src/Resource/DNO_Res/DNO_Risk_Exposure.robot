*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${Name-RE-Applicant_Disabled_YesNo}=    CharitableFoundation
${Name-RE-AffordableHousing}=    AffordableHousing
${Name-RE-Aquarium}=    Aquarium
${Name-RE-DrugRehab}=    DrugRehab
${Name-RE-Adoption}=    Adoption
${Name-RE-Education}=    Education
${Name-RE-Association1}=    Association1
${Name-RE-Association2}=    Association2
${Name-RE-Association3}=    Association3
${Name-RE-Association4}=    Association4
${Name-RE-Association5}=    Association5
${Name-RE-Association6}=    Association6
${Name-RE-Association7}=    Association7
${Name-RE-Association8}=    Association8
${Name-RE-Association9}=    Association9
${Name-RE-MedicalResearchOrg1}=    MedicalResearchOrg1
${ID-FI-continue}=    //input[@id='continueButton']
${Name-RE-Under1M}=  name=Under1M
${Name-RE-1Mto5M}=  name=1Mto5M
${Name-RE-GreaterThan5M}=  name=GreaterThan5M
${ID-RE-CondoOwnersAssociation7}=  //input[@name='CondoOwnersAssociation10']
${Name-RE-CondoOwnersAssociation8}=  CondoOwnersAssociation8
${Name-RE-FoundationsPrivateFamily}=  FoundationsPrivateFamily
${ID-RE-NumberOfUnits}=  id=NumberOfUnits
${Name-RE-CommunityDevelopmentOrganization1}=  CommunityDevelopmentOrganization1
@{Non-profit}=    Membership Org   Trade Association - Local/Regional  Trade Association - National/Worldwide
@{homes/condos}=  Homeowners Association

*** Keywords ***
DNO Risk Exposure
        [Arguments]    &{test_data}
        Sleep    5s
        ${Numberofunits-check}=  run keyword and return status  page should contain  Number of units?
        run keyword if    ${Numberofunits-check}  Input text  ${ID-RE-NumberOfUnits}  ${test_data["Number of units?"]}
        run keyword if    '${test_data["Does the applicant have any programs directly involving children, the elderly or the developmentally disabled?"]}' != 'nan'    click element   //input[@name='CharitableFoundation' and @value='${test_data["Does the applicant have any programs directly involving children, the elderly or the developmentally disabled?"]}']
        run keyword if    '${test_data["Does the Applicant or any of it's subsidiaries derive 50% or more of their revenues from government sources?"]}' != 'nan'    click element    //input[@name='AffordableHousing' and @value='${test_data["Does the Applicant or any of it's subsidiaries derive 50% or more of their revenues from government sources?"]}']
        run keyword if    '${test_data["Does the applicant have any programs directly involving youth or children?"]}' != 'nan'    click element   //input[@name='Aquarium' and @value='${test_data['Does the applicant have any programs directly involving youth or children?']}']
        run keyword if    '${test_data["Does the applicant provide direct medical treatment?"]}' != 'nan'    click element    //input[@name='DrugRehab' and @value='${test_data["Does the applicant provide direct medical treatment?"]}']
        run keyword if    '${test_data["Does the Applicant provide Foster Care services?"]}' != 'nan'    click element    //input[@name='Adoption' and @value='${test_data["Does the Applicant provide Foster Care services?"]}']
        run keyword if    '${test_data["Does the Applicant fund their own research and development?"]}' != 'nan'    click element    //input[@name='MedicalResearchOrg1' and @value='${test_data["Does the Applicant fund their own research and development?"]}']
        run keyword if    '${test_data["Has there been any denial of accreditation or disciplinary/probationary action taken against the Applicant (or any programs of the Applicant) by any accrediting organization with in the past three (3) years?"]}' != 'nan'    click element    //input[@name='Education' and @value='${test_data["Has there been any denial of accreditation or disciplinary/probationary action taken against the Applicant (or any programs of the Applicant) by any accrediting organization with in the past three (3) years?"]}']
        run keyword if    '${test_data["Does the applicant or any of its subsidiaries provide lending or loan generation activities?"]}' != 'nan'    click element    //input[@name='CommunityDevelopmentOrganization1' and @value='${test_data["Does the applicant or any of its subsidiaries provide lending or loan generation activities?"]}']
        run keyword if    '${test_data["Does the Applicant derive 25% or more of their income from publishing articles or industry magazine?"]}' != 'nan'    click element   //input[@name='Association4' and @value='${test_data["Does the Applicant derive 25% or more of their income from publishing articles or industry magazine?"]}']
        wait until element is not visible   globalAjaxLoading  100
        ${Non-profit-check}=  run keyword and return status  page should contain  Does the Applicant engage in the development or administration of an accreditation program?
        run keyword if    ${Non-profit-check}  Associations    &{test_data}
        ${Home/condos-check}=  run keyword and return status  page should contain  Does the applicant operate a golf course?
        run keyword if    ${Home/condos-check}  Home-owners    &{test_data}
        ${Foundations-check}=  run keyword and return status  page should contain  Do family members represent 50% or more of the board of directors/trustees?
        run keyword if    ${Foundations-check}  Foundations-Private Family    &{test_data}
        continue Click RE
        sleep  3s

Associations
        [Arguments]    &{test_data}
        click element     //input[@name='Association1' and @value='${test_data["Does the Applicant engage in the development or administration of an accreditation program?"]}']
        click element     //input[@name='Association2' and @value='${test_data["Does the Applicant engage in the development or administration of a certification programs?"]}']
        click element     //input[@name='Association3' and @value='${test_data["Does the Applicant Engage in Standard Setting?"]}']
        click element     //input[@name='Association4' and @value='${test_data["Does the Applicant derive 25% or more of their income from publishing articles or industry magazine?"]}']
        click element     //input[@name='Association5' and @value='${test_data["Does the Applicant engage in the development or administration of ethics codes for it's members?"]}']
        click element     //input[@name='Association6' and @value='${test_data["Does the Applicant engage in member professional assessments, conduct peer review, or have a disciplinary board?"]}']
        click element     //input[@name='Association7' and @value='${test_data["Does the Applicant engage in the sponsorship of an insurance programs?"]}']
        click element     //input[@name='Association8' and @value='${test_data["Does the Applicant provide any Insurance Operations?"]}']
        run keyword if  '${test_data['Type of Non Profit']}'=='Trade Association - Local/Regional'  click element    //input[@name='Association9' and @value='${test_data["Does the Applicant own or control any political action committees?"]}']

Home-owners
        [Arguments]    &{test_data}
       # run keyword if    '${test_data['Under $1M']}' == 'YES'    select checkbox   ${Name-RE-Under1M}
        #run keyword if    '${test_data['$1M to $5M']}' == 'YES'    select checkbox   ${Name-RE-1Mto5M}
       # run keyword if    '${test_data['Greater than $5M']}' == 'YES'    select checkbox   ${Name-RE-GreaterThan5M}
        click element  //input[@name='CondoOwnersAssociation1' and @value='${test_data['Does the applicant operate a golf course?']}']
        click element  //input[@name='CondoOwnersAssociation2' and @value='${test_data['Does the applicant have any of the following amenities: boating, equestrian facilities, fitness facilities, lake(s), playgrounds, swimming pool(s), tennis courts?']}']
        click element  //input[@name='CondoOwnersAssociation3' and @value='${test_data['Is the property developer or sponsor represented on the board of directors/trustee?']}']
        run keyword if  '${test_data['Is the property developer or sponsor represented on the board of directors/trustee?']}' == 'YES'  click element  //input[@name='CondoOwnersAssociation4' and @value='${test_data['Has control of the association been transferred from the builder or developer to the association?']}']
        click element  //input[@name='CondoOwnersAssociation5' and @value='${test_data['Does the applicant contract with a professional management company?']}']
        run keyword if  '${test_data['Does the applicant contract with a professional management company?']}' == 'YES'  click element  //input[@name='CondoOwnersAssociation6' and @value='${test_data['Does the applicant want to extend coverage to their professional management company?']}']
        run keyword if  '${test_data['Does the applicant want to extend coverage to their professional management company?']}' == 'YES'
        ...  Run Keywords    Wait Until Element Is Visible  ${ID-RE-CondoOwnersAssociation7}  3s  AND    Input text  ${ID-RE-CondoOwnersAssociation7}  ${test_data['Management company']}
        run keyword if  '${test_data['Is there a provision that requires that disputes between property owners and the association be submitted to binding arbitration?']}' == 'YES'  click element  //input[@name='Association8' and @value='${test_data['Is there a provision that requires that disputes between property owners and the association be submitted to binding arbitration?']}']

Foundations-Private Family
       [Arguments]    &{test_data}
       click element  //input[@name='FoundationsPrivateFamily' and @value='${test_data['Do family members represent 50% or more of the board of directors/trustees?']}']