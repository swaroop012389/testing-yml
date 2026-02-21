*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${RE_GQ_ExclusiveListingAgreement_Explanation}=    //textarea[@name='ExclusiveListingAgreement_Explanation']
@{GI_States}=    Alaska  Colorado   Hawaii   Idaho   Iowa  Kentucky   Louisiana   Mississippi   Nebraska   New Mexico    North Dakota   Rhode Island   South Dakota   Tennessee


*** Keywords ***
RE General Questions
     [Arguments]  &{test_data}
#     Execute JavaScript    document.body.style.zoom = "80%"
     Fetch V2 Work ID
     click element  //input[@name='LicenseLessThan3' and @value='${test_data['Licensed as real estate Broker as less than 3 years']}']
     wait until element is not visible   globalAjaxLoading  100
     ${State_check} =  run keyword and return status  list should not contain value  ${GI_States}  ${test_data['State']}
     run keyword if    ${State_check}    GQ_Check   &{test_data}
     continue Click RE
     wait until element is not visible  ${ID_wait-One-moment-please}  30
     wait until element is not visible  ${ID_Pleasewait}   30

GQ_Check
    [Arguments]   &{test_data}
    IF   '${test_data["Is the applicant's firm a (an)"]}' != 'Other' and '${test_data["Is the applicant's firm a (an)"]}' != 'Independent Contractor'
        Other General Questions    &{test_data}
    END

Other General Questions
     [Arguments]   &{test_data}
     Run Keyword If   '${test_data['Licensed as real estate Broker as less than 3 years']}' == 'NO'   click element   //input[@name='GrossCommision' and @value='${test_data['Gross Income more than $100,000']}']
     Run Keyword If   '${test_data['Gross Income more than $100,000']}' == 'NO'   click element   //input[@name='ApplicantProvideServices' and @value='${test_data['Service provider as Real estate, Property Management, Commerical, Business,Appraisal construction and mortgage']}']
     Run Keyword If   '${test_data['Service provider as Real estate, Property Management, Commerical, Business,Appraisal construction and mortgage']}' == 'NO'    click element   //input[@name='MoreThan5Agents' and @value='${test_data['Employs more than 5 Real Estate agent']}']
     Run Keyword If   '${test_data['Employs more than 5 Real Estate agent']}' == 'NO'   click element   //input[@name='MoreThan25PctRevenueSingleClient' and @value='${test_data['Earns more than 25% income from 1 client']}']
     Run Keyword If   '${test_data['Earns more than 25% income from 1 client']}' == 'NO'   click element   //input[@name='ExclusiveListingAgreement' and @value='${test_data['Exclusive listing agreement-GQ']}']
     Run Keyword If   '${test_data['Exclusive listing agreement-GQ']}' == 'YES'    Input text     ${RE_GQ_ExclusiveListingAgreement_Explanation}    ${test_data['Details-GQ']}

