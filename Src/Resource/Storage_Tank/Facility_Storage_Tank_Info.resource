*** Settings ***
Resource  ../../Resource/Global-variable/v2.robot

*** Keywords ***
ST Facility Storage Tank Info
    [Arguments]    &{test_data}
    Wait Until Page Contains Element  //input[@name='historyOfLeaksOrReleases' and @value='${test_data['History of leaks or releases']}']  10s
    Click Element    //input[@name='historyOfLeaksOrReleases' and @value='${test_data['History of leaks or releases']}']
    Run Keyword If  "${test_data['History of leaks or releases']}"=="YES"  Input Text    //textarea[@name='HistoryOfLeaksOrReleasesDetails']    ${test_data['Please Provide Leak Details']}
    Click Element    //input[@name='noticesOfViolations' and @value='${test_data['Notices of violations pollution related claims']}']
    Click Element    //input[@name='outOfServiceStorageTanks' and @value='${test_data['storage tanks that have been removed, closed-in-place, out-of-service']}']
    Click Element    //input[@name='anyPlansToRemoveStorageTanks' and @value='${test_data['any plans to remove any of the storage tanks within the next 12 months']}']
    Click Element    //input[@name='federalStateLocalRulesCompliance' and @value='${test_data['Are all storage tanks in compliance with all applicable federal/state/local rules']}']
    Click Element    //input[@name='spillPreventionControlAndCounterMeasurePlan' and @value='${test_data['Does this facility maintain a spill prevention control and countermeasure ']}']
    Click Element    //input[@name='nonStandardTanks' and @value='${test_data['Does the facility have non-standard tanks located at chemical processing plants']}']
    Click Element    //input[@name='singleWalledStorageTanksYN' and @value='${test_data['Are there any single-walled storage tanks']}']
    Run Keyword If    "${test_data['Are there any single-walled storage tanks']}"=="YES"  Select Single Walled Storage Tanks    &{test_data}
    Click Element    //input[@name='closedAbandonedTemporarilyOutOfService' and @value='${test_data['Are there any storage tanks that are closed, abandoned or temporarily out of service']}']
    Click Element    //input[@name='locatedOutsideUSOrTerritories' and @value='${test_data['Are there any storage tanks located outside the U.S. or its territories']}']
    Click Element    //input[@name='over50000GallonsStorageTanks' and @value='${test_data['Are there any storage tanks over 50,000 gallons in any single location']}']
    Sleep    50s
    Continue Click RE

Select Single Walled Storage Tanks
    [Arguments]    &{test_data}
    Wait Until Page Contains Element    //span[text()='Installed prior to 1990']  5s
    Run Keyword If    "${test_data['Installed prior to 1990']}"=="YES"  Click Element    //span[text()='Installed prior to 1990']
    Run Keyword If    "${test_data['Bare steel']}"=="YES"  Click Element    //span[text()='Bare steel']
    Run Keyword If    "${test_data['Relined']}"=="YES"  Click Element    //span[text()='Relined']