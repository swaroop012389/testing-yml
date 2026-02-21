*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${ID-SI-InvoluntarilyTerminatedEmp}=    //input[@id='InvoluntarilyTerminatedEmployeeCount']
${name-SI-AnticipatedReductionsInStaff}=    AnticipatedReductionsInStaff
${name-SI-AntiDiscriminationPolicies}=    AntiDiscriminationPolicies
${name-SI-HumanResourcesManager}=    HumanResourcesManager
${ID-FI-continue}=    //input[@id='continueButton']

*** Keywords ***
DNO Staff Information
        [Arguments]    &{test_data}
        check and enter input    ${ID-SI-InvoluntarilyTerminatedEmp}    ${test_data['How many employees have been involuntarily terminated in the last year?']}
        select radio button    AnticipatedReductionsInStaff    ${test_data["Are there any anticipated reductions in staff over the next year?"]}
        ${AntiDiscriminationPolicies_Exists}=  run keyword and return status    element should be visible    AntiDiscriminationPolicies
        run keyword if    ${AntiDiscriminationPolicies_Exists}    select radio button    AntiDiscriminationPolicies    ${test_data["Does the applicant have written anti-discrimination and anti-sexual harassment policies in place?"]}
        ${HumanResourcesManager_Exists}=  run keyword and return status    element should be visible    HumanResourcesManager
        run keyword if    ${HumanResourcesManager_Exists}    select radio button    HumanResourcesManager    ${test_data["Does the applicant have a Human Resources manager (or equivalent)?"]}
        continue Click RE