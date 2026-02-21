*** Settings ***
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/REO_Res/REO_General_Information.robot
Resource  ../../Resource/REO_Res/REO_General_Questions.robot
Resource  ../../Resource/REO_Res/REO_Claims_History.robot
Resource  ../../Resource/REO_Res/REO_Staff_Information.robot
Resource  ../../Resource/REO_Res/REO_Income_Alternative_Services.robot
Resource  ../../Resource/REO_Res/REO_Owned_Properties.robot
Resource  ../../Resource/REO_Res/REO_Applicant_Income.robot
Resource  ../../Resource/REO_Res/REO_Additional_Income_Information.robot
Resource  ../../Resource/REO_Res/REO_Risk_Management.robot
Resource  ../../Resource/REO_Res/REO_Prior_Coverage.robot
Resource  ../../Resource/REO_Res/REO_Quote_Options.robot
Resource  ../../Resource/Generate_Quote.robot
Resource  ../../Resource/Billing&ContactInformation.robot
Resource  ../../Resource/Issue_policy.robot
Resource  ../../Resource/Upload_document.robot


*** Test Cases ***
TC_RE_001
    [Tags]   Real Estate_Smoke_Test
    [Documentation]    AK New Business Long Form Owned properties with payment plan Quarterly Installment
    #&{TC_INFO}=  RE Setup test data
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['re']}${/}TC_RE_001.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_RE_001
    run keyword if  '${test_data['Dummy']}' == 'YES'  RE Create Dummy Data  ${test_data}
    Set To Dictionary    ${test_data}  Program=REALESTATE
    Run Keyword And Continue On Failure   AK New Business Long Form Owned properties with payment plan Quarterly Installment   &{test_data}
    @{res_row} =  Create list  TC_RE_001   ${WorkID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
AK New Business Long Form Owned properties with payment plan Quarterly Installment
       [Arguments]    &{test_data}
       Login To V2 With Broker Email  ${test_data}
       Login Real Estate E&O
       Close Cyber Cookies
       RE General Information    &{test_data}
       RE General Questions    &{test_data}
       RE Claims History    &{test_data}
       RE Staff Information    &{test_data}
       RE Income from Alternative Services    &{test_data}
       RE Owned Properties    &{test_data}
       RE Applicant Income    &{test_data}
       RE Additional Income Information    &{test_data}
       RE Risk Management    &{test_data}
       RE Prior Coverage    &{test_data}
       RE Quote Options    &{test_data}
       ${element-check}  Run Keyword and Return status  Wait Until Page Contains Element   //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  50s
       Logout as Broker
       Login as an Underwriter
       Open Proposal From My Work
#       RE Quote Options    &{test_data}
       ${element-check}  Run Keyword and Return status  Wait Until Element Is Visible  //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  50s
       Run Keyword if   ${element-check}    UMS Release hold
       Stop Execution Before Binding and Issue Policy  &{test_data}
       RE Generate Quote    &{test_data}
       RE Billing and Contact Information    &{test_data}
       RE Issue Policy
       sleep  12s
       Upload Document     ${test_data}
       Document verification
