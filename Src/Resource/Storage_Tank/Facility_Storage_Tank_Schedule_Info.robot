*** Settings ***
Resource  ../../Resource/Global-variable/v2.robot
Resource  ST_General_Information.resource

*** Variables ***

${ST_FSTSI_FS_Facility_No}=        //input[@name='tableInputs[0].FacilityID']
${ST_FSTSI_FS_Add_Button}=         (//button[text()='Add'])[1]
${ST_FSTSI_ST_Add_Button}=         (//button[text()='Add'])[2]
${ST_FSTSI_FS_State}=              (//div[@role='combobox'])[1]
${ST_FSTSI_FS_Type}=               (//div[@role='combobox'])[2]
${ST_FSTSI_FS_SPCC}=               (//div[@role='combobox'])[3]
${ST_FSTSI_ST_UST}=                (//div[@role='combobox'])[4]
${ST_FSTSI_ST_Capacity}=           (//div[@role='combobox'])[5]
${ST_FSTSI_ST_Tank_Type}=          (//div[@role='combobox'])[6]
${ST_FSTSI_ST_Tank_Cons}=          (//div[@role='combobox'])[7]
${ST_FSTSI_ST_TLD}=                (//div[@role='combobox'])[8]
${ST_FSTSI_ST_Pipe_Type}=          (//div[@role='combobox'])[9]
${ST_FSTSI_ST_Pipe_Cons}=          (//div[@role='combobox'])[10]
${ST_FSTSI_ST_PLD}=                (//div[@role='combobox'])[11]
${ST_FSTSI_ST_PDS}=                (//div[@role='combobox'])[12]
${ST_FSTSI_ST_AST}=                (//div[@role='combobox'])[13]
${ST_FSTSI_ST_Content}=            (//div[@role='combobox'])[14]
${ST_FSTSI_ST_Tank_Deductible}=    (//div[@role='combobox'])[15]


*** Keywords ***
ST Facility Schedule
    [Arguments]    &{test_data}
    Wait Until Page Contains Element    ${ST_FSTSI_FS_Facility_No}  10s
    Execute Javascript   document.body.style.zoom="50%"
    ${No_of_FS_Rows}=    Set Variable  ${test_data['Facility Schedule Rows']}
    FOR    ${index}    IN RANGE   0  ${No_of_FS_Rows}
        ${value}=  evaluate  ${index}+1
        ${add_states}=  evaluate  ${No_of_FS_Rows}-1
        Input text  //input[@name='tableInputs[${index}].FacilityID']      ${test_data['Facility number${value}']}
        Input text  //input[@name='tableInputs[${index}].FacilityName']      ${test_data['Facility Name${value}']}
        Input text  //input[@name='tableInputs[${index}].FacilityADD1']      ${test_data['Facility Address${value}']}
        Input text  //input[@name='tableInputs[${index}].FacilityCity']      ${test_data['Facility city${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].FacilityState']   ${test_data['Facility State${value}']}
        Enter Zip Code  //input[@name='tableInputs[${index}].FacilityZip']      ${test_data['Facility Zip Code${value}']}
        Execute Javascript    window.scrollTo(50, 0)
        Select Value From Dropdown  //input[@name='tableInputs[${index}].FacilityType']   ${test_data['Facility Type${value}']}
#        Scroll Until Element Is Visible for NP  ${ST_FSTSI_FS_Type}   //li/span{text()='${test_data['Facility Type${value}']}']
        Select Value From Dropdown  //input[@name='tableInputs[${index}].FacilitySPCC']   ${test_data['SPCC Plan${value}']}
        Execute Javascript    window.scrollTo(100, 0)
        Select Current Date ST  //input[@name='tableInputs[0].FacilityRetroactiveDate']/parent::div/child::div/button
#        Input Text  //input[@name='tableInputs[${index}].FacilityRetroactiveDate']      ${test_data['Facility Retro Date${value}']}
        run keyword if  '${index}' < '${add_states}'   click element  ${ST_FSTSI_FS_Add_Button}
    END

Select Current Date ST
    [Arguments]    ${Locator}
    Scroll Element Into View    ${Locator}
    Click Element   ${Locator}
#    ${currentDate}=     Get Current Date    result_format=%m/%d/%Y
#    Input Text  ${Locator}  ${currentDate}
    ${currentDate}=     Get Current Date    result_format=%d
    ${date}=  Convert To Integer  ${currentDate}
    Wait Until Page Contains Element    //button[text()='${date}']
    sleep  0.5s
    Scroll Element Into View     //button[text()='${date}']
    Click Element    //button[text()='${date}']

ST Storage Tank Schedule
    [Arguments]    &{test_data}
    ${No_of_ST_Rows}=    Set Variable  ${test_data['Storage Tank Schedule Rows']}
    FOR    ${index}    IN RANGE   0  ${No_of_ST_Rows}
        Scroll Element Into View    ${ST_FSTSI_ST_Add_Button}
        ${value}=  evaluate  ${index}+1
        ${add_states}=  evaluate  ${No_of_ST_Rows}-1
        Input text  tableInputs[${index}].TankFacilityID        ${test_data['Facility number${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].TankCategory']         ${test_data['UST/AST${value}']}
        Input text  tableInputs[${index}].YearInstalled         ${test_data['Year Installed${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].Capacity']    ${test_data['Capacity (Gallons)${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].TankType']    ${test_data['Tank Type${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].TankConstruction']    ${test_data['Tank Construction${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].TankLeakDetection']    ${test_data['Tank Leak Detection${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].PipeType']    ${test_data['Pipe Type${value}']}
#        Click Element    ${ST_FSTSI_ST_Pipe_Cons}
#        Wait Until Page Contains Element   //li/span[text()='${test_data['Pipe Construction${value}']}']
#        Click Element   //li/span[text()='${test_data['Pipe Construction${value}']}']
        Select Value From Dropdown  //input[@name='tableInputs[${index}].PipeConstruction']   ${test_data['Pipe Construction${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].PipeLeakDetection']      ${test_data['Pipe Leak Detection${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].PipeDeliverySystem']      ${test_data['Pipe Delivery System${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].ASTBase']      ${test_data['AST Base/Diking Construction${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].Contents']      ${test_data['Contents${value}']}
        Select Current Date ST     //input[@name='tableInputs[${index}].TankRetroActiveDate']/parent::div/child::div/button
#        Input Text  tableInputs[${index}].TankRetroActiveDate   ${test_data['Tank Retroactive Date${value}']}
        Select Value From Dropdown  //input[@name='tableInputs[${index}].TankDeductible']   ${test_data['Tank Deductible${value}']}
        run keyword if  '${index}' < '${add_states}'   click element  ${ST_FSTSI_ST_Add_Button}
    END
    Continue Click RE

Verify UW Hold and Release
    ${element-check}  Run Keyword and Return status  Wait Until Page Contains Element  //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  20s
    Run Keyword if  ${element-check}  UMS Release hold

ST Quote Option
    [Arguments]  &{test_data}
    Wait Until Page Contains Element    (//input[@type='checkbox'])[1]  20s
    Click Element    (//input[@type='checkbox'])[${test_data['Quote Option']}]
    Continue Click Generate Quote

ST Billing Inormation
    [Arguments]  &{test_data}
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Page Contains Element    //input[@name='BillingPreferences']
    Select Value From Dropdown    //input[@name='BillingPreferences']   ${test_data['Billing Preferences']}
    Select Value From Dropdown     //input[@name='PaymentPlan']    ${test_data['Payment Plan']}
    Click Element    //input[@name='primarycontactYESNO' and @value='${test_data["Is your client's accounting contact the same as the contact previously entered?"]}']
#    Run Keyword If    '${test_data['Is your client's accounting contact the same as the contact previously entered?']}=='NO'
    Continue Click RE

ST CE Upload Document
        [Arguments]  ${File_name}  ${Document_Type}
        ${LOB_Name}=  get text  //p[contains(text(),'Status')]/preceding-sibling::div/p
        ${file}=    set variable    ${CURDIR}\\${File_name}
        Execute Javascript    window.scrollTo(0, 0)
        click element  //button[text()='Documents']
        Wait Until Page Contains Element  //button[text()='Upload here']  10s
        choose file   //input[@type='file']   ${file}
        sleep  2s
#        Execute Javascript    window.scrollTo(0, 200)
#        Click Element     //div/label[text()='Document type']/parent::div/child::div
        sleep  3s
        Execute Javascript    window.scrollTo(0, 200)
        Click Element     //div/label[text()='Document type']/parent::div/child::div
        Scroll Element Into View  //li[normalize-space()='${Document_Type}']
        Click Element    //li[normalize-space()='${Document_Type}']
        Wait Until Element Is Visible   //button[text()='Upload Document']
        sleep  2s
        Click Element    //button[text()='Upload Document']
        Sleep    20s
        Wait Until Element Is Visible   //button[text()='Upload here']  30s
        Click Element     //button[text()='Documents']
        Run Keyword If    '${LOB_Name}'=='Contractors Equipment'  Wait Until Refresh Schedule Appears  Refresh Equipment Schedule
        Run Keyword If    '${LOB_Name}'=='Storage Tank Liability'  Wait Until Refresh Schedule Appears  Refresh Facility & Tank Schedule

Wait Until Refresh Schedule Appears
    [Arguments]    ${Schedule_Name}
    Wait Until Page Contains Element    //button[text()='${Schedule_Name}']  10s
    Scroll Element Into View     //button[text()='${Schedule_Name}']
    Click Element    //button[text()='${Schedule_Name}']
    Wait Until Element Is Enabled  ${IDcontinue}
#    Execute Javascript    window.scrollTo(500, 500)
    Sleep    15s
    Continue Click RE


