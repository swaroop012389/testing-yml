*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot


*** Variables ***
# text fields
${BR_PI_gaugesteel}=  //input[@name='gaugesteel']
${BR_PI_ProtectionClass}=    //input[@name='Structure_ProtectionClass']
${BR_PI_NearestFireStation}=    //input[@name='ProjectMilesToFireStation']
${BR_PI_Height_of_elevation}=    //input[@name='elevationpilings']
${BR_PI_Construction_materials}=      //input[@name='constructionpilings']
${BR_PI_SquareFootageofBuilding}=   //input[@name='SquareFootageofBuilding']
${BR_PI_LossDescription}=    //textarea[@name='PreviousLossesAtThisLocationDetails']
${BR_PI_Project_PercentageofCompletion}=   //input[@name='Project_PercentageofCompletion']
${BR_PI_ProjectStartDate}=    //input[@name='StructureBuildingStart']
${BR_PI_ProjectCompletionDate}=    //input[@name='StructureBuildingCompletion']
${BR_PI_NeedMidTermInsurance}=    //textarea[@name='WhyNeedMidTermInsurance']
${BR_PI_InsuPlacedInPastDetails}=    //textarea[@name='HasInsuPlacedInPastDetails']
${BR_PI_LossesDetails}=    //textarea[@name='HaveAnyLossesDetails']
${BR_PI_CompletionWorkDescription}=  //textarea[@name='CompletionWorkDescription']
${BR_PI_ProjectStalledDetails}=    //textarea[@name='HasProjectStalledDetails']
${BR_PI_CompletionWorkDescription}=        //textarea[@name='CompletionWorkDescription']
${BR_PI_RemainingWorkDescription}=     //textarea[@name='RemainingWorkDescription']
${BR_PI_RemainingWorkValue}=   //input[@name='RemainingWorkValue']
${BR_PI_HasContractorChangedDetails}=    //textarea[@name='HasContractorChangedDetails']
${BR_PI_AnyOtherChangesInProjectDetails}=    //textarea[@name='AnyOtherChangesInProjectDetails']
${BR_PI_ProjectFireSourceOfWater}=  //input[@name='ProjectFireSourceOfWater']

*** Keywords ***

Project Information
    [Arguments]    ${test_data}
    Wait Until Page Contains    What is the construction type     50s
    Execute Javascript  window.scrollTo(0,50)
    click element  //input[@name='Location_ConstructionTypeCd' and @value='${test_data['What is the construction type']}']
    run keyword if    '${test_data['What is the construction type']}' == 'Non Combustible'    Input text    ${BR_PI_gaugesteel}  ${test_data['What gauge steel is the structure?']}
    wait until element is visible    ${BR_PI_ProtectionClass}  30s
    Input text   ${BR_PI_ProtectionClass}    ${test_data['What is the protection class?']}
    Press Keys   ${BR_PI_ProtectionClass}    ARROW_DOWN
    Press Keys   ${BR_PI_ProtectionClass}    RETURN
    sleep  1s
    IF    ${test_data['What is the protection class?']} > 7
      Input Text    ${BR_PI_NearestFireStation}    ${test_data['How many miles is the nearest fire station?']}
      click element  //input[@name='ProjectFireStationMannedYN' and @value='${test_data['Is the fire department manned 24 hours a day?']}']
      sleep  1s
      click element  //input[@name='ProjectFireHydrantsToBeInstalledYN' and @value='${test_data['Will fire hydrants be installed and working prior to the start of the construction?']}']
      sleep  1s
      Execute Javascript  window.scrollTo(0,500)
      IF    ${test_data['What is the protection class?']} >= 9
            run keyword if  '${test_data['Will fire hydrants be installed and working prior to the start of the construction?']}' == 'NO'   Input text  ${BR_PI_ProjectFireSourceOfWater}  ${test_data['If no fire hydrants, what is the source of water for pumper/tanker trucks?']}
      END
    END
    click element  //input[@name='WndBuildingOnPilingsYN' and @value='${test_data['Is the structure elevated on pilings?']}']
    IF    '${test_data['Is the structure elevated on pilings?']}' == 'YES'
        Select Value from Dropdown    ${BR_PI_Height_of_elevation}     ${test_data['The height of elevation for the pilings?']}
        #click element  //li[@data-value='${test_data['The height of elevation for the pilings?']}']
        Select Value from Dropdown   ${BR_PI_Construction_materials}    ${test_data['The construction materials of the pilings?']}
       # click element   //li[@data-value='${test_data['The construction materials of the pilings?']}']
    END
    Input text  ${BR_PI_SquareFootageofBuilding}  ${test_data['What is the square footage?']}
    click element  //input[@name='Coverage_BIEstimateBasis' and @value='${test_data['Does the project include “tilt up” construction?']}']
    click element  //input[@name='IsStructureModularYN' and @value='${test_data['Is the structure modular or mobile?']}']
    click element  //input[@name='Structure_OccupiedDuringConstructionYN' and @value='${test_data['Will the structure be occupied during construction?']}']
    click element  //input[@name='AnyLossesFromEarthquakeFloodWindFireVandalismYN' and @value='${test_data['Were there any previous losses at this location?']}']
    run keyword if  '${test_data['Were there any previous losses at this location?']}' == 'YES'   input text    ${BR_PI_LossDescription}  ${test_data['PI-Description of losses']}
    click element  //input[@name='HasProjectStartedYN' and @value='${test_data['Has the project started?']}']
    Wait Until Element Is Visible  ${BR_PI_ProjectStartDate}  20s
    Wait Until Element Is Enabled   ${BR_PI_ProjectStartDate}  20s
    ${Current_Eff_Date}=    get current date    result_format=%m/%d/%Y
    IF  '${test_data['Has the project started?']}' == 'NO'
        Press Keys   ${BR_PI_ProjectStartDate}     ${Current_Eff_Date}
        Press Keys  ${BR_PI_ProjectCompletionDate}    ${test_data['What is the completion date?']}
        Press Keys    ${BR_PI_ProjectCompletionDate}    TAB
    END
    IF  '${test_data['Has the project started?']}' == 'YES'
        Press Keys   ${BR_PI_ProjectStartDate}    ${Current_Eff_Date}
        Press Keys  ${BR_PI_ProjectCompletionDate}    ${test_data['What is the completion date?']}
        Press Keys    ${BR_PI_ProjectCompletionDate}    TAB
    END
    IF  '${test_data['Has the project started?']}' == 'YES'
        Input text  ${BR_PI_Project_PercentageofCompletion}    ${test_data['What is the percentage complete?']}
        run keyword if  '${test_data['What is the percentage complete?']}' >= '30'     Project complete details  ${test_data}
    END
    Click Continue Button
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    sleep  2s

Project complete details
    [Arguments]  ${test_data}
    Input text  ${BR_PI_NeedMidTermInsurance}   ${test_data['What is the reason for the mid-term need of insurance']}
    click element  //input[@name='HasInsuPlacedInPastYN' and @value='${test_data['Has insurance been placed in the past?']}']
    run keyword if  '${test_data['Has insurance been placed in the past?']}' == 'YES'  Input text  ${BR_PI_InsuPlacedInPastDetails}   ${test_data['Insurance-Provide details']}
    click element  //input[@name='HaveAnyLossesYN' and @value='${test_data['Have there been any losses?']}']
    run keyword if  '${test_data['Have there been any losses?']}' == 'YES'   Input text     ${BR_PI_LossesDetails}    ${test_data['Loss-Provide details']}
    click element  //input[@name='HasProjectStalledYN' and @value='${test_data['Has the project stalled?']}']
    run keyword if  '${test_data['Has the project stalled?']}' == 'YES'  Input text  ${BR_PI_ProjectStalledDetails}     ${test_data['Project Stalled-Provide details']}
    Input text  ${BR_PI_CompletionWorkDescription}    ${test_data['Describe the completed work']}
    Input text  ${BR_PI_RemainingWorkDescription}    ${test_data['Describe the remaining work']}
    Input text  ${BR_PI_RemainingWorkValue}     ${test_data['What is the value of the remaining work?']}
    click element  //input[@name='HasContractorChangedYN' and @value='${test_data['Has the contractor changed?']}']
    run keyword if  '${test_data['Has the contractor changed?']}' == 'YES'    Input text   ${BR_PI_HasContractorChangedDetails}   ${test_data['Cont Changed-Provide details']}
    click element  //input[@name='AnyOtherChangesInProjectYN' and @value='${test_data['Have there been any other changes in the project?']}']
    run keyword if  '${test_data['Have there been any other changes in the project?']}' == 'YES'   Input text     ${BR_PI_AnyOtherChangesInProjectDetails}    ${test_data['Other Change-Provide details']}


   # select from list by label    ${BR_PI_ProtectionClass}    ${test_data['What is the protection class?']}
   # log to console    NAVIGATED TO PROJECT INFORMATION PAGE
   # ${ProtectionClassValue}=    set variable    ${test_data['What is the protection class?']}
   # ${VerifyProtectionClassValue}=    evaluate       ${ProtectionClassValue}>7
   # Run Keyword If    '${VerifyProtectionClassValue}'=='True'    Protection Class More Than Seven   ${test_data}
   # wait until element is visible    ${Name_StructurePiling}
   # select radio button    ${Name_StructurePiling}    ${test_data['Is the structure elevated on pilings?']}
   # Run Keyword If    '${test_data['Is the structure elevated on pilings?']}'=='YES'
   # ...    Run Keywords    Wait Until Element Is Visible    ${ID_HeightofElevation}  5s   AND  select from list by label    ${ID_HeightofElevation}    ${test_data['the height of elevation for the pilings?']}   AND  select from list by label    ${ID_ConstructionPilings}    ${test_data['the construction materials of the pilings?']}
   # select radio button    ${Name_StructurePiling}    ${test_data['Is the structure elevated on pilings?']}
   # wait until element is visible    ${ID_SquareFootage}
   # Check and enter input    ${ID_SquareFootage}    ${test_data['What is the square footage?']}
   # wait until element is visible    ${Name_TiltUpConstruction}
   # select radio button    ${Name_TiltUpConstruction}    ${test_data['Does the project include “tilt up” construction?']}
   # wait until element is visible    ${Name_ModularOrMobileStructure}
   # select radio button    ${Name_ModularOrMobileStructure}    ${test_data['Is the structure modular or mobile?']}
   # wait until element is visible    ${Name_StructureOccupied}
   # select radio button    ${Name_StructureOccupied}    ${test_data['Will the structure be occupied during construction?']}
   # wait until element is visible    ${Name_PreviousLosses}
   # select radio button    ${Name_PreviousLosses}    ${test_data['Were there any previous losses at this location?']}
   # Run Keyword If    '${test_data['Were there any previous losses at this location?']}'=='YES'    Loss Description    ${test_data}
   # Run Keyword If   '${test_data['Has the project started?']}'=='YES'    Project Started    ${test_data}
   # ...    ELSE    Project Not Started    ${test_data}
   # Click Continue Button

Loss Description
    [Arguments]    ${test_data}
    wait until element is visible    ${ID_LossDescription}
    input text    ${ID_LossDescription}    ${test_data['PI-Description of losses']}

Future Start Date
    [Arguments]    ${test_data}
    ${CurrentDate}=    get current date
    ${AfterAdding}=    add time to date    ${CurrentDate}    ${test_data['What was the start date?']} days    result_format=%m-%d-%Y
    ${StartDate}=    remove string    ${AfterAdding}    -
    RETURN    ${StartDate}

Future Completion Date
    [Arguments]    ${test_data}
    ${CurrentDate}=    get current date
    ${AfterAdding}=    add time to date    ${CurrentDate}    ${test_data['What is the completion date?']} days    result_format=%m-%d-%Y
    ${CompDate}=    remove string    ${AfterAdding}    -
    RETURN    ${CompDate}

Past Start Date
    [Arguments]    ${test_data}
    ${CurrentDate}=    get current date
    ${AfterSub}=    Subtract Time From Date    ${CurrentDate}    ${test_data['What was the start date?']} days    result_format=%m-%d-%Y
    ${StartDate}=    remove string    ${AfterSub}    -
    RETURN    ${StartDate}

Project Not Started
    [Arguments]    ${test_data}
    wait until element is visible    ${Name_HasProjectStarted}
    select radio button    ${Name_HasProjectStarted}    ${test_data['Has the project started?']}
    wait until element is visible    ${ID_ApproxProjectStartDate}    timeout=10s
    ${StartDate1}=    Future Start Date    ${test_data}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input    ${ID_ApproxProjectStartDate}    ${StartDate1}
    wait until element is visible    ${ID_ApproxProjectCompletionDate}    timeout=10s
    ${CompDate1}=      Future Completion Date    ${test_data}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input    ${ID_ApproxProjectCompletionDate}     ${CompDate1}
    wait until element is not visible   globalAjaxLoading  40

Project Started
    [Arguments]    ${test_data}
    wait until element is visible    ${Name_HasProjectStarted}
    select radio button    ${Name_HasProjectStarted}    ${test_data['Has the project started?']}
    wait until element is visible    ${ID_ProjectStartDate}
    ${StartDate1}=    Past Start Date    ${test_data}
    sleep  1s
    Set Selenium Speed    0.2s
    Check and enter input    ${ID_ProjectStartDate}    ${StartDate1}
    wait until element is visible    ${ID_ProjectCompletionDate}
    ${CompDate1}=      Future Completion Date    ${test_data}
    sleep  1s
    Set Selenium Speed    0.2s
    Input Text       ${ID_ProjectCompletionDate}    ${CompDate1}
#    ${date}=  get text  ${ID_ProjectCompletionDate}
#    Run Keyword If  '${date}'!='${CompDate1}'   Input Text       ${ID_ProjectCompletionDate}    ${CompDate1}
    wait until element is visible    ${ID_ProjectCompletionPercentage}
    Check and enter input    ${ID_ProjectCompletionPercentage}    ${test_data['What is the percentage complete?']}
    press keys    None    ENTER
    Set Selenium Speed    0s
    ${Reason}=    run keyword and return status    wait until page contains    ${Text_Reason}
    Run Keyword If    '${Reason}'=='True'    run keywords
    ...    input text    ${ID_NeedMidTermInsurance}    ${test_data['What is the reason for the mid-term need of insurance']}    AND
    ...    Insurance Placed Past    ${test_data}        AND
    ...    Any Losses     ${test_data}     AND
    ...    Project Stalled    ${test_data}     AND
    ...    Completed and Remaining Work    ${test_data}

Insurance Placed Past
    [Arguments]    ${test_data}
    wait until element is visible    ${ID_HasInsurancePlacedInPast}
    Run Keyword If    '${test_data['Has insurance been placed in the past?']}'=='YES'    run keywords
    ...    select radio button    ${ID_HasInsurancePlacedInPast}    YES
    ...    AND    Wait Until Element Is Visible  ${ID_InsuPlacedInPastDetails}  5s  AND    input text    ${ID_InsuPlacedInPastDetails}     ${test_data['Insurance-Provide details']}
    ...    ELSE    select radio button    ${ID_HasInsurancePlacedInPast}    NO

Any Losses
    [Arguments]    ${test_data}
    wait until element is visible    ${Name_HaveAnyLosses}
    Run Keyword If    '${test_data['Have there been any losses?']}'=='YES'    run keywords
    ...    select radio button    ${Name_HaveAnyLosses}    YES
    ...    AND    Wait Until Element Is Visible    ${ID_LossesDetails}  5s  AND  input text    ${ID_LossesDetails}    ${test_data['Loss-Provide details']}
    ...    ELSE    select radio button    ${Name_HaveAnyLosses}    NO

Project Stalled
    [Arguments]    ${test_data}
    wait until element is visible    ${Name_ProjectStalled}
    Run Keyword If    '${test_data['Has the project stalled?']}'=='YES'    run keywords
    ...    select radio button    ${Name_ProjectStalled}    YES
    ...    AND    Wait Until Element Is Visible  ${ID_ProjectStalledDetails}  5s  AND    input text    ${ID_ProjectStalledDetails}    ${test_data['Project Stalled-Provide details']}
    ...    ELSE    select radio button    ${Name_HaveAnyLosses}    NO

Completed and Remaining Work
    [Arguments]    ${test_data}
    wait until element is visible    ${ID_CompletionWorkDescription}
    Check and enter input    ${ID_CompletionWorkDescription}    ${test_data['Describe the completed work']}
    wait until element is visible    ${ID_RemainingWorkDescription}
    Check and enter input    ${ID_RemainingWorkDescription}    ${test_data['Describe the remaining work']}
    wait until element is visible    ${ID_RemainingWorkValue}
    Check and enter input    ${ID_RemainingWorkValue}    ${test_data['What is the value of the remaining work?']}
    wait until element is visible    ${Name_HasContractorChanged}
    Run Keyword If    '${test_data['Has the contractor changed?']}'=='YES'    run keywords
    ...    select radio button    ${Name_HasContractorChanged}    YES
    ...    AND    Wait Until Element Is Visible  ${ID_ContractorChangedDetails}  5s  AND    input text    ${ID_ContractorChangedDetails}    ${test_data['Cont Chnaged-Provide details']}
    ...    ELSE    select radio button    ${Name_HasContractorChanged}    NO
    wait until element is visible    ${Name_AnyOtherChangesInProject}
    Run Keyword If   '${test_data['Have there been any other changes in the project?']}'=='YES'    run keywords
    ...    select radio button    ${Name_AnyOtherChangesInProject}    YES
    ...    AND    Wait Until Element Is Visible  ${ID_AnyOtherChangesDetails}  5s  AND  input text    ${ID_AnyOtherChangesDetails}    ${test_data['Other Change-Provide details']}
    ...    ELSE    select radio button    ${Name_AnyOtherChangesInProject}    NO
