*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot
Resource  CE_Claims_History.robot


*** Variables ***
${ID_CI_DescriptionOfOperations}=  //input[@name='DescriptionOfOperations']
${CE_CI_Prcnt1}=  //input[@name='tableInputs[0].CS_Percentage']
${CE_CI_Prcnt2}=  //input[@name='tableInputs[1].CS_Percentage']
${CE_CI_Prcnt3}=  //input[@name='tableInputs[2].CS_Percentage']
${CE_CI_Prcnt4}=  //input[@name='tableInputs[3].CS_Percentage']
${ID_CI_NumberOfPiecesInsuring}=   numberOfPiecesInsuring
${Name-CI-blastingPerformedYN}=    blastingPerformedYN
${Name-CI-fireSuppressionSystemYN}=    fireSuppressionSystemYN
${Name-CI-transportOwnEquipmentYN}=    transportOwnEquipmentYN
${Name-CI-utilizeLoJackYN}=   utilizeLoJackYN
${Name-CI-drugAlcoholTestingConductedYN}=      drugAlcoholTestingConductedYN
${Name-CI-trainingRequiredProvidedYN}=   trainingRequiredProvidedYN


*** Keywords ***
CE Contractor Information
    [Arguments]    ${test_data}
    Wait Until Page Contains Element    ${ID_CI_DescriptionOfOperations}   20s
    Select Value From Dropdown  ${ID_CI_DescriptionOfOperations}  ${test_data['Description of Operations']}
    Enter State1 Business   ${test_data}
    Enter State2 Business   ${test_data}
    Enter State3 Business   ${test_data}
    run keyword if  '${test_data['State4']}' != 'nan'  Enter State4 Business   ${test_data}
    Click Element    (//input[@value='NO'])[1]          # This 4 lines are addeed temporarly as radio button should be by default selected
    Click Element    (//input[@value='NO'])[2]
    Click Element    (//input[@value='NO'])[3]
    Click Element    (//input[@value='NO'])[4]
    Click Element    //input[@name='numberOfPiecesInsuring' and @value='${test_data['How many pieces of equipment need to be insured?']}']
    Continue Click RE

Enter State1 Business
    [Arguments]    ${test_data}
    Select Value From Dropdown    //input[@name='tableInputs[0].CS_State']   ${test_data['State1']}
#    Click Element    //input[@name='tableInputs[0].CS_State']
#    Wait Until Element Is Visible    //ul/li[text()='${test_data['State1']}']
#    sleep  0.5s
#    Click Element     //ul/li[text()='${test_data['State1']}']
    Input Text  ${CE_CI_Prcnt1}  ${test_data['Percentage State1']}

Enter State2 Business
    [Arguments]    ${test_data}
    Click Element    ${CE_CH_AddButton}
    Scroll Element Into View    ${CE_CH_AddButton}
    Wait Until Page Contains Element  //input[@name='tableInputs[1].CS_State']
#    Wait Until Element Is Visible   (//div[@role='combobox'])[3]
#    Click Element    (//div[@role='combobox'])[3]
#    Wait Until Element Is Visible    (//li/span[text()='${test_data['State2']}'])[2]
#    sleep  0.5s
#    Click Element     (//li/span[text()='${test_data['State2']}'])[2]
    Select Value From Dropdown    //input[@name='tableInputs[1].CS_State']    ${test_data['State2']}
    Input Text  ${CE_CI_Prcnt2}  ${test_data['Percentage State2']}

Enter State3 Business
    [Arguments]    ${test_data}
    Click Element    ${CE_CH_AddButton}
    Wait Until Page Contains Element    //input[@name='tableInputs[2].CS_State']
#    Wait Until Element Is Visible   (//div[@role='combobox'])[4]
#    Click Element    (//div[@role='combobox'])[4]
#    Wait Until Element Is Visible    (//li/span[text()='${test_data['State3']}'])[3]
#    sleep  0.5s
#    Click Element     (//li/span[text()='${test_data['State3']}'])[3]
    Select Value From Dropdown    //input[@name='tableInputs[2].CS_State']   ${test_data['State3']}
    Input Text  ${CE_CI_Prcnt3}   ${test_data['Percentage State3']}

Enter State4 Business
    [Arguments]    ${test_data}
    Click Element    ${CE_CH_AddButton}
    Wait Until Page Contains Element  //input[@name='tableInputs[3].CS_State']
#    Wait Until Element Is Visible   (//div[@role='combobox'])[5]
#    Click Element    (//div/span[@role='combobox'])[5]
#    Wait Until Element Is Visible    (//li[text()='${test_data['State4']}'])[4]
#    sleep  0.5s
#    Click Element     (//li/span[text()='${test_data['State4']}'])[4]
    Select Value From Dropdown    //input[@name='tableInputs[3].CS_State']   ${test_data['State4']}
    Input Text  ${CE_CI_Prcnt4}   ${test_data['Percentage State4']}