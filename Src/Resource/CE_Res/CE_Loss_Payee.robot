*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot
Resource  CE_Claims_History.robot


*** Variables ***
${ID_LP_LossPayeeAddInfo}=  id=LossPayeeAddInfo
${ID-LP-LossPayeeName}=  id=LossPayeeName
${ID-LP-LossMailingAddressStreet}=  id=LossMailingAddressStreet
${ID-LP-LossPayeeCity}=  id=LossPayeeCity
${ID-LP-LossPayeeState}=  id=LossPayeeState
${ID-LP-LossPayeeZipCode}=  id=LossPayeeZipCode
${ID-LP-LossPayeeType}=  id=LossPayeeType
${ID-AI-AdditionalInterest_Type}=  //input[@name='AdditionalInterest_Type']
${ID-AI-AddNew_Button}=  //button[text()='Add New']
${ID-AI-Add_Button}=  id=addButton
${ID_AI_Name}=              //input[@name='AdditionalInterest_Name']
${ID_AI_Street_Address}=  //input[@name='AdditionalInterest_Addr1']
${ID_AI_City}=  //input[@name='AdditionalInterest_City']
${ID_AI_State}=  //input[@name='AdditionalInterest_State']
${ID_AI_ZipCode}=  //input[@name='AdditionalInterest_MailingZipCode']
${CE_AI_LoanNumber}=  //input[@name='AdditionalInterest_LoanNum']


*** Keywords ***
CE Additional Interests
    [Arguments]    ${test_data}
#    Execute Javascript    document.body.style.zoom="70%"
    Wait Until Page Contains Element       ${ID-AI-AddNew_Button}  10s
    Click Element    ${ID-AI-AddNew_Button}
    Wait Until Element Is Visible    ${ID-AI-AdditionalInterest_Type}  5s
    Select Value From Dropdown    ${ID-AI-AdditionalInterest_Type}  ${test_data['Additional Interest']}
    Input Text  ${ID_AI_Name}  ${test_data['Applicant Name']}
    Input Text  ${ID_AI_Street_Address}  ${test_data['Applicant Address']}
    Input Text  ${ID_AI_City}  ${test_data['City']}
    Scroll Element Into View     ${ID_AI_ZipCode}
    Scroll Element Into View    ${CE_CH_AddButton}
    Select Value From Dropdown  ${ID_AI_State}  ${test_data['State']}
    Enter Zip Code     ${ID_AI_ZipCode}  ${test_data['ZipCode']}
    Input Text  ${CE_AI_LoanNumber}  97124267267
    Scroll Element Into View    ${CE_CH_AddButton}
    Click Element    ${CE_CH_AddButton}
    Continue Click RE
