*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Keywords ***
RE Risk Management
    [Arguments]    &{test_data}
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Page Contains    Does the applicant have an in-house policies/ procedures manual in place?    30s
    click element   //input[@name='InhousePolicy' and @value='${test_data['Applicant Has in house policies']}']
    click element   //input[@name='StateApprovedForms' and @value='${test_data['Applicant uses any local board to approve it']}']
    click element  //input[@name='NatlAssociationOfRealtors' and @value='${test_data['Applicant last 12 years 75% taking educational course to reduce omission']}']
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30