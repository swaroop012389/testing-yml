*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot


*** Variables ***
# text fields
${BR_PUC_PropertyStAddress}=   //input[@name='PropertyLocationGoogleAddress_Explanation']
${BR_PUC_County}=    //input[@placeholder='Enter the first 3 letters of the County']
${BR_PUC_Property_IntendedOccupant}=    //textarea[@name='StructureIntendedOccupant']
${BR_PUC_Property_TotalCompletedValue}=    //input[@name='ValueofOtherProperties']
${BR_PUC_Property_TotalStructures}=    //input[@name='NumberOfStructuresLocation']



*** Keywords ***
Property Under Construction
    [Arguments]    ${test_data}
    log to console    NAVIGATED TO PROPERTY UNDER CONSTRUCTION PAGE
    Wait Until Element Is Enabled    ${BR_PUC_PropertyStAddress}  30s
    Wait Until Element Is Visible    ${BR_PUC_PropertyStAddress}  30s
    Input Text     ${BR_PUC_PropertyStAddress}  ${test_data['Applicant Address']}
    Sleep   2s
    Press Keys    ${BR_PUC_PropertyStAddress}  ARROW_DOWN
    Sleep   1.5s
    Press Keys    ${BR_PUC_PropertyStAddress}  RETURN
    Execute Javascript  window.scrollTo(0,500)
    #run keyword if  '${test_data['Property-County']}' != 'nan'   Select Value from Dropdown    ${BR_PUC_County}    ${test_data['Property-County']}
    Accept Clearance Popup
    run keyword if   '${test_data['Standard Quote – All other risks']}' == 'Standard Quote'   select project type   ${test_data}
    IF   '${test_data['Standard Quote – All other risks']}' == 'Builders Risk QuickCover'
            Run Keyword If   '${test_data['Has the builder had any builders risk loss in the last three years?']}' == 'YES'    select project type   ${test_data}
            Run Keyword If   '${test_data['QC-Do you want to increase the automatic additional coverages or add any optional coverages?']}' == 'YES'     select project type   ${test_data}
            IF  '${test_data['QC-Do you want to increase the automatic additional coverages or add any optional coverages?']}' == 'NO'
                IF  ${test_data['Total Completed value of all covered property']} > 1500000
                select project type   ${test_data}
                END
            END
    END
    Click Continue Button
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    sleep  2s

select project type
    [Arguments]  ${test_data}
    Scroll Element Into View    //input[@name='PropertyProjectType' and @value='${test_data['Please select project type:']}']
     click element  //input[@name='PropertyProjectType' and @value='${test_data['Please select project type:']}']
     click element  //input[@name='Structure1to4UnitDwellingSingleStructureYN' and @value='${test_data['Is the structure a 1-4 family detached structure?']}']
     IF    '${test_data['Is the structure a 1-4 family detached structure?']}' == 'NO'
         Input text  ${BR_PUC_Property_IntendedOccupant}   ${test_data['What is the intended occupancy?']}
     END
     Wait Until Element Is Visible    ${BR_PUC_Property_TotalStructures}    20s
     Select Value from Dropdown    ${BR_PUC_Property_TotalStructures}    ${test_data['What is the total number of structures for this location?']}
     #click element   ${BR_PUC_Property_TotalStructures}
    # Wait Until Element Is Visible     //li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1pq8hud' and @data-value='${test_data['What is the total number of structures for this location?']}']
    # click element  //li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1pq8hud' and @data-value='${test_data['What is the total number of structures for this location?']}']
     click element  //input[@name='OtherInsuredPropertiesYN' and @value='${test_data['Is the builder insuring any other properties with Victor within 100 feet of this structure?']}']
     Run Keyword If   '${test_data['Is the builder insuring any other properties with Victor within 100 feet of this structure?']}' == 'YES'  input text   ${BR_PUC_Property_TotalCompletedValue}  ${test_data['Provide total estimated completed value of all structures including this property:']}




