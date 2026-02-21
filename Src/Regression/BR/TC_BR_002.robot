*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource    ../../Resource/Global-variable/v2.robot
Resource    ../../Resource/Generic.robot
Resource    ../../Resource/BR_Res/BR_General_Information.robot
Resource    ../../Resource/BR_Res/BR_Builder_Information.robot
Resource    ../../Resource/BR_Res/BR_Property_Under_Construction.robot
Resource    ../../Resource/BR_Res/BR_Renovation_Information.robot
Resource    ../../Resource/BR_Res/BR_Project_Information.robot
Resource    ../../Resource/BR_Res/BR_Base_Automatic_Coverages.robot
Resource    ../../Resource/BR_Res/BR_Wind_Coverages.robot
Resource    ../../Resource/BR_Res/BR_Additional_Interests.robot
Resource    ../../Resource/BR_Res/BR_Billing_Information.robot
Resource    ../../Resource/BR_Res/BR_Generate_Quote.robot
Resource    ../../Resource/BR_Res/BR_Issue_Policy.robot
Resource    ../../Resource/UMS.robot
Resource    ../../Resource/TMS_RES/UMS_PAGE.robot
Resource    ../../Resource/Alternus_Res/BindEndorsement.robot
Resource    ../../Resource/BR_Res/BR_Quick_Cover_Eligibility.robot

*** Test Cases ***
TC_BR_002
    [Tags]    Builders Risk_Smoke_Test
    [Documentation]  Joisted Masonry Remodel Minor Structural
    #&{TC_INFO}=  BR Setup test data
    &{config_data}=  Read config data  config.txt
    ${file_path}=  Set variable  ${config_data['Path']['br']}${/}TC_BR_002.xlsx
    &{data}=  Read Column Data file  ${file_path}  Value1
    &{checks} =  Read validation steps  ${file_path}  Value1
    set global variable  &{test_data}  &{data}
    set global variable  &{test_checks}  &{checks}
    Set To Dictionary    ${test_data}  TestCaseNumber=TC_BR_002
    run keyword if  '${test_data['Dummy']}' == 'YES'  Create Dummy Data BR  ${test_data}
    Set To Dictionary    ${test_data}  Program=BUILDERSRISK
    Run Keyword And Continue On Failure   Joisted Masonry Remodel Minor Structural    ${test_data}
    sleep  8s
    @{res_row} =  Create list  TC_BR_002   ${Work ID}  ${policy-no}
    Update resource file  ${res_row}
    Close Browser

*** Keywords ***
Joisted Masonry Remodel Minor Structural
    [Arguments]      ${test_data}
    Login to Victor page   ${test_data}
    Builders Risk Navigation
    Insurance Agency Information    &{test_data}
    Close Cyber Cookies
    BR Quick Cover Eligibility      ${test_data}
    BR General Information    ${test_data}
    BR Builder Information    ${test_data}
    Property Under Construction    ${test_data}
    Renovation Information    ${test_data}
    Project Information    ${test_data}
    Base And Automatic Coverages    ${test_data}
    Wind Coverages    ${test_data}
    Additional Interests
    wait until Page contains   The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.   20s
    UMS Release hold
    Reload Page
    Stop Execution Before Binding and Issue Policy  &{test_data}
    Generate Quote    ${test_data}
    Billing Information    ${test_data}
    Issue Policy    ${test_data}
    Sleep  15s
    Upload Document    ${test_data}
    Document verification
    Get Policy Status    ${test_data}
    Verify Policy Status 1    ${test_data}
    Servicing
    MT Endorsement  ${test_data}
#    MT Endorsement With Expiration Date    ${test_data}
    Get Policy Status for Endrosement    ${test_data}
    Verify Policy Status 2    ${test_data}
    Get Policy Stage for Endrosement    ${test_data}
    Verify Policy Stage 1    ${test_data}
    Create New Journal    ${test_data}
    Adding Endorsement    ${test_data}
    Endorsement Bind No Additional Premium    ${test_data}
