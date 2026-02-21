*** Settings ***
Resource  ../../Resource/Global-variable/v2.robot
Resource    Facility_Storage_Tank_Schedule_Info.robot

*** Variables ***
${ST_SLLI_SL_Broker_Name}=           //input[@name='SurplusLinesBrokerName']
${ST_SLLI_SL_BrokerorAgency_Name}=   //input[@name='SurplusLinesBrokerAgencyName']
${ST_SLLI_SL_License_Number}=        //input[@name='SurplusLinesLicenseNumber']
${ST_SLLI_SL_Exp_Date}=              //input[@name='SurplusLinesExpirationDate']
${ST_SLLI_SL_Filing_State}=          //input[@name='SurplusLinesStateofFiling']
${ST_SLLI_SL_State}=                 //input[@name='SurplusLinesState']
${ST_SLLI_SL_Add_Line1}=             //input[@name='SurplusLinesAddLine1']
${ST_SLLI_SL_City}=                  //input[@name='SurplusLinesCity']
${ST_SLLI_SL_ZipCode}=               //input[@name='SurplusLinesZipCode']
${ST_IP_EffectiveDate}=             //input[@name='PolicyEffectiveDate']


*** Keywords ***
ST Surplus Lines License Information
    [Arguments]    &{test_data}
    Wait Until Page Contains Element  ${ST_SLLI_SL_Broker_Name}  10s
    Input Text  ${ST_SLLI_SL_Broker_Name}    ${test_data['Surplus Line Broker Name']}
    Input Text  ${ST_SLLI_SL_BrokerorAgency_Name}    ${test_data['Broker/Agency Name']}
    Input Text  ${ST_SLLI_SL_License_Number}   ${test_data['License Number']}
#    Input Text  ${ST_SLLI_SL_Exp_Date}  ${test_data['Expiration Date']}
    Select Current Date ST    //input[@name='SurplusLinesExpirationDate']/parent::div/child::div/button
    Select Value From Dropdown  ${ST_SLLI_SL_Filing_State}  ${test_data['State']}
    Input Text  ${ST_SLLI_SL_Add_Line1}    ${test_data['Applicant Address']}
    Input Text  ${ST_SLLI_SL_City}    ${test_data['City']}
    Select Value From Dropdown  ${ST_SLLI_SL_State}   ${test_data['State']}
    Enter Zip Code  ${ST_SLLI_SL_ZipCode}    ${test_data['ZipCode']}
    Click Element   //input[@name='AdditionalNamedInsureds' and @value='${test_data['Additional Named insured and/or Additional Insured?']}']
    Continue Click RE

ST Issue Policy
    Wait Until Page Contains Element  ${ST_IP_EffectiveDate}
#    ${Current_Eff_Date}=    get current date    result_format=%m/%d/%Y
#   Input Text  ${ST_IP_EffectiveDate}  ${Current_Eff_Date}
#    Press Keys  ${ST_IP_EffectiveDate}   RETURN
    Select Current Date ST    //input[@name='PolicyEffectiveDate']/parent::div/child::div
    Press Keys    NONE  TAB
    Continue Click Generate Quote
    Wait Until Page Contains Element    //p[text()='Client Information']  120s
