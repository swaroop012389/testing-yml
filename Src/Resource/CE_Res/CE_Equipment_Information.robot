*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot
Resource  ../../Resource/Storage_Tank/Facility_Storage_Tank_Schedule_Info.robot


*** Variables ***
${ID_EI_Equipment}=    id=EquipmentAddInformation
#${ID_EI_BuildingAndSecurity}=    //label/div[text()='Describe construction of building where Equipment is stored']/parent::label/parent::div/following-sibling::div
${ID_EI_BuildingAndSecurity}=   //input[@name='ConstOfBuildingAndSecurityDesc']
#${ID_EI_BuildingAndSecurity}=    //label/div[text()='Describe construction of building where Equipment is stored']/parent::div/following-sibling::div
#${ID_EI_SecurityAtJobsite}=    //label/div[text()='Describe security at Jobsite(s)']/parent::div/following-sibling::div
#${ID_EI_SecurityAtJobsite}=    //label/div[text()='Describe security at Jobsite(s)']/parent::label/parent::div/following-sibling::div
${ID_EI_SecurityAtJobsite}=    //input[@name='constructionbuildingEquipmentDesc']
${ID_EI_YearMade}=           //input[@name='tableInputs[0].YearMade']
${ID_EI_Description}=          //input[@name='tableInputs[0].Description']
${ID_EI_SerialNo}=             //input[@name='tableInputs[0].SerialNumber']
${ID_EI_Manufacturer}=         //input[@name='tableInputs[0].Manufacturer']
${ID_EI_ModelNo}=              //input[@name='tableInputs[0].Model']
${ID_EI_Value$}=               //input[@name='tableInputs[0].Valuation']
${Class_EI_UploadDocument}=    //span[@class="has-files"]
${Text_UploadButton}=    //*[text()="Upload"]
${Value_EI_RefreshEquipment}=    //button[text()='Refresh Equipment Schedule']
${ContinueButton_Name}=    //input[@name='Continue'][2]
${ID_ContinueButton}=    //input[@id='continueButton']
${ID_FileType} =  id=fileTypeCode
${ID_Address_where_Equipment} =  id=equipmentAddStored
${ID_constOfBuildingAndSecurityDesc} =  id=constOfBuildingAndSecurityDesc
#${ID_SecurityEquipment} =  //label/div[text()='Describe security where equipment is typically stored']/parent::label/parent::div/following-sibling::div
${ID_SecurityEquipment} =  //input[@name='SecurityAtJobsiteDesc']
${ID_EI_EquipmentType}=  //input[@name='tableInputs[0].EquipmentCode']
${ID_FireSuppressed}=  //input[@name='tableInputs[0].IsFireSuppression']
${ID_EI_UtilizeGPSsystem}=  //input[@name='tableInputs[0].IsUtilizeGPS']
${ID_EQ_AddressLine}=  //input[@name='contractorAddress']
${ID_EQ_City}=  //input[@name='contractorCity']
${ID_EQ_State}=  //input[@name='contractorState']
${ID_EQ_ZipCode}=  //input[@name='contractorZipCode']

# validations
${Text_AskingForUploadDoc}=    Upload your schedule of equipment using the Upload a Document feature on the right.


*** Keywords ***
CE Equipment Information
    [Arguments]    ${test_data}
#        Execute Javascript    document.body.style.zoom="67%"
    log to console    Reached EQUIPMENT INFORMATION PAGE
    Run Keyword If    '${test_data['How many pieces of equipment need to be insured?']}' in ['6To20','Over20']    CE Equipment Information for 6to20 and Over20  ${test_data}
    ...    ELSE    CE Equipment Information 1to5   ${test_data}
    Run Keyword If    '${test_data['How many pieces of equipment need to be insured?']}' in ['6To20','Over20']    ST CE Upload Document  Schedule_of_Equipment.xlsx  Schedule of Equipment
    ...    ELSE    Equipment Details Manual Entry    ${test_data}
    Sleep    3s
#    ${EQ_ContinueButton}=    run keyword and return status    page should contain element    ${ContinueButton_Name}
#    Run Keyword If    '${EQ_ContinueButton}'=='True'    run keywords    wait until element is visible    ${ContinueButton_Name}    AND
#    ...    scroll element into view    ${ContinueButton_Name}    AND
#    ...    click element    ${ContinueButton_Name}
#    ...    ELSE    click element    ${ID_ContinueButton}
#    Continue Click RE

Equipment Details Manual Entry
    [Arguments]    ${test_data}
    wait until element is visible   ${ID_EI_YearMade}   5s
    Input Text    ${ID_EI_YearMade}    ${test_data['Year Made']}
    Input Text    ${ID_EI_Description}    ${test_data['Description']}
    Input Text    ${ID_EI_SerialNo}    ${test_data['Serial No.']}
    Input Text    ${ID_EI_Manufacturer}    ${test_data['Manufacturer']}
    Input Text    ${ID_EI_ModelNo}    ${test_data['Model No.']}
    Input Text    ${ID_EI_Value$}    ${test_data['Value $']}
    Scroll Element Into View    //button[text()='Add']
#     Execute Javascript    window.scrollTo(100, 0)
#     Execute Javascript    window.scrollTo(0, 500)
    wait until element is visible    ${ID_EI_EquipmentType}
    Select Value From Dropdown   ${ID_EI_EquipmentType}    ${test_data['Equipment Type']}
     Execute Javascript    window.scrollTo(100, 0)
     Scroll Element Into View     //button[text()='Add']
    Select Value From Dropdown    ${ID_FireSuppressed}  ${test_data['Fire Suppressed']}
#    Click Element    ${ID_FireSuppressed}
#    Sleep    1s
#    Click Element    //li/span[text()='${test_data['Fire Suppressed']}']
    Execute Javascript    window.scrollTo(100, 0)
    sleep  0.5s
#    Scroll Element Into View    //button[text()='Add']
#    Click Element  ${ID_EI_UtilizeGPSsystem}
#    Sleep    0.5s
#    Click Element   //li/span[text()='${test_data['Utilize GPS System']}']
    Select Value From Dropdown   ${ID_EI_UtilizeGPSsystem}   ${test_data['Utilize GPS System']}
    Continue Click RE

Equipments Document Upload
    [Arguments]    ${test_data}
    ${file}=    set variable    ${CURDIR}\\Schedule_of_Equipment.xlsx
    click element  //button[text()='Documents']
    wait until element is enabled  //button[text()='Upload here']  5s
#    choose file  (//input)[19]  ${file}
    choose file  (//input[@type='file'])[2]  ${file}
    Sleep    2s
    Click Element    (//div[@role='combobox'])[7]
    Wait Until Page Contains Element     //li[normalize-space()='Schedule of Equipment']
    Click Element    //li[normalize-space()='Schedule of Equipment']
    Wait Until Element Is Visible   //button[text()='Upload Document']
    sleep  0.3s
    Click Element    //button[text()='Upload Document']
    Wait Until Element Is Visible   //button[text()='Upload here']  30s
    Click Element     //button[text()='Documents']
    wait until element is visible    ${Value_EI_RefreshEquipment}    10
    scroll element into view    ${Value_EI_RefreshEquipment}
    click element    ${Value_EI_RefreshEquipment}

CE Equipment Information 1to5
    [Arguments]    ${test_data}
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Page Contains Element    //input[@name='EquipmentAddInformation' and @value='${test_data['EquipmentaddressStored']}']
    Click Element    //input[@name='EquipmentAddInformation' and @value='${test_data['EquipmentaddressStored']}']
    Run Keyword If    '${test_data['EquipmentaddressStored']}'=='NO'    Enter Equipment Address     ${test_data}
    Scroll Element Into View    ${ID_EI_YearMade}
    Select Value from Dropdown  ${ID_EI_BuildingAndSecurity}    ${test_data['BuildingAndSecurity']}
    Select Value from Dropdown   ${ID_SecurityEquipment}    ${test_data['Describe security where Equipment is stored']}
    Scroll Element Into View    ${ID_EI_YearMade}
#    Click Element  ${ID_EI_SecurityAtJobsite}
#    Sleep    1s
#    Click Element    //li/span[text()='${test_data['Describe security where Equipment is stored']}']
    Select Value from Dropdown  ${ID_EI_SecurityAtJobsite}   ${test_data['Describe security where Equipment is stored']}

Enter Equipment Address
    [Arguments]    ${test_data}
     Wait Until Element Is Visible    ${ID_EQ_AddressLine}  10s
     Input Text    ${ID_EQ_AddressLine}    ${test_data['Equipment Address']}
     Input Text    ${ID_EQ_City}    ${test_data['Equipment City']}
#     Scroll Element Into View     ${ID_EI_SecurityAtJobsite}
     Select Value From Dropdown  ${ID_EQ_State}  ${test_data['Equipment State']}
#     Click Element   ${ID_EQ_State}
#     Wait Until Page Contains Element      //li/span[text()='${test_data['Equipment State']}']
#     Click Element    //li/span[text()='${test_data['Equipment State']}']
     Enter Zip Code  ${ID_EQ_ZipCode}   ${test_data['Equipment ZipCode']}


CE Equipment Information for 6to20 and Over20
    [Arguments]    ${test_data}
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Page Contains Element    //input[@name='EquipmentAddInformation' and @value='${test_data['EquipmentaddressStored']}']
    Click Element    //input[@name='EquipmentAddInformation' and @value='${test_data['EquipmentaddressStored']}']
    Run Keyword If    '${test_data['EquipmentaddressStored']}'=='NO'  Enter Equipment Address  ${test_data}
    Select Value From Dropdown  ${ID_EI_BuildingAndSecurity}    ${test_data['Address where Equipment is typically stored']}
    Execute Javascript    window.scrollTo(0, 300)
    Scroll Element Into View    //button[normalize-space()='Save & Continue']
    Select Value From Dropdown  ${ID_SecurityEquipment}    ${test_data['Describe construction of building and security']}
#    Click Element   ${ID_SecurityEquipment}
#    Sleep    1s
#    Click Element    //li/span[text()='${test_data['Describe construction of building and security']}']
#    Click Element    ${ID_EI_SecurityAtJobsite}
#    Sleep    1s
#    Click Element    (//li[text()='${test_data['Describe security at Jobsite(s)']}']
    Select Value From Dropdown  ${ID_EI_SecurityAtJobsite}    ${test_data['Describe security at Jobsite(s)']}
