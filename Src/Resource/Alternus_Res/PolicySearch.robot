*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../../Resource/UMS.robot
Resource    ../../Resource/Alternus_Res/PolicySearch.robot
Resource    ../../Resource/Alternus_Res/Coverages.robot
Resource    ../../Resource/Alternus_Res/DataEntry.robot
Resource    ../../Resource/Alternus_Res/ClientSearch.robot
Resource    ../../Resource/Alternus_Res/Client_Detail.robot
Resource    ../../Resource/Alternus_Res/Assignments.robot
Resource    ../../Resource/Alternus_Res/Underwriting.robot

*** Variables ***
${BROWSER}=  chrome
${ID-PS-Search-PolicyNumber}=  id=PolicyNumber
${PS-ClientSearch}=    //a[contains(@href, '/Nexus/ClientSearch')]
${PS-ViewCoverages}=    //a[contains(@href, '/Nexus/RatingCoverages/ViewCoverages/')]
${ID-PS-TotalBillingRangeId}=    id=TotalBillingRangeId
${ID-PS-StatusFilter}=  id=StatusId
${ID-PS-Program}=    id=ProgramId
${ID-PS-PolicyStageId}=    id=PolicyStageId
${ID-PS-Division}=    id=DivisionId
${ID-PS-RateTerritory}=    id=RateTerritoryId
${ID-PS-PolicyTerm}=   id=PolicyTermLengthsId
${ID-PS-View-Policy}=  link=View policy
${ID-PS-ApplyFilter}=  //input[@value='Apply Filter']
${ID-PS-FirmTypeId}=    id=FirmTypeId
${ID-NoofRecords}=    //div[@class='resultsCount']

*** Keywords ***
PolicySearch
        [Arguments]    ${test_data}
        wait until element is not visible   globalAjaxLoading  40
        ${Policynumber}=    run keyword and return status  element should be visible    ${ID-PS-Search-PolicyNumber}
        run keyword if   ${Policynumber}    log to console   Navigated to PolicySearch Page
        Check and enter input  ${ID-PS-Search-PolicyNumber}   ${test_data['PolicyNumber']}
        wait until element is not visible   globalAjaxLoading  40
        Check and select from list by label  ${ID-PS-PolicyStageId}    ${test_data['Policy Stage']}
        wait until element is not visible   globalAjaxLoading  40
        Check and select from list by label  ${ID-PS-Program}    ${test_data['Program']}
        wait until element is not visible   globalAjaxLoading  80
        Check and select from list by label    ${ID-PS-FirmTypeId}   ${test_data['Firm Type']}
        wait until element is not visible   globalAjaxLoading  40
        Check and select from list by label  ${ID-PS-Division}   ${test_data['Division']}
        wait until element is not visible   globalAjaxLoading  80
        Check and select from list by label  ${ID-PS-RateTerritory}   ${test_data['Rate Territory']}
        wait until element is not visible   globalAjaxLoading  80
        Check and select from list by label  ${ID-PS-PolicyTerm}    ${test_data['Policy Term']}
        wait until element is not visible   globalAjaxLoading  120
        Check and select from list by label  ${ID-PS-TotalBillingRangeId}    ${test_data['Total Billing Range']}
        wait until element is not visible   globalAjaxLoading  120
        run keyword if  '${test_data['Status']}' == 'In Force'    Endorsement Policy  ${test_data}    ELSE    Pending Policy    ${test_data}

Pending Policy
        [Arguments]    ${test_data}
        wait until element is not visible   globalAjaxLoading  100
        click element    //select[@id='StatusId']//option[text()='Pending']
        wait until element is not visible   globalAjaxLoading  120
        wait until element is visible  ${ID-PS-ApplyFilter}
        click element  ${ID-PS-ApplyFilter}
        wait until element is not visible   globalAjaxLoading  100
        ${no-of-rows}=  get element count  //div[div[contains(text(),'Number of found records')]]//table//tbody//tr
        ${Row1}=  convert to integer    ${no-of-rows}
        run keyword if   '${Row1}' > '1'    Existing Policy    ${test_data}   ELSE    Quoted Policy    ${test_data}
        wait until element is not visible   globalAjaxLoading  100

Quoted Policy
    [Arguments]    ${test_data}
    click element    //select[@id='StatusId']//option[text()='Quoted']
    wait until element is not visible   globalAjaxLoading  120
    wait until element is visible  ${ID-PS-ApplyFilter}
    click element  ${ID-PS-ApplyFilter}
    wait until element is not visible   globalAjaxLoading  250
    ${no-of-rows}=  get element count  //div[div[contains(text(),'Number of found records')]]//table//tbody//tr
    ${Row1}=  convert to integer    ${no-of-rows}
    run keyword if   '${Row1}' > '1'    Existing Policy   ${test_data}   ELSE    Bound Policy    ${test_data}
    wait until element is not visible   globalAjaxLoading  100

Bound Policy
    [Arguments]    ${test_data}
    click element    //select[@id='StatusId']//option[text()='Bound']
    wait until element is not visible   globalAjaxLoading  120
    wait until element is visible  ${ID-PS-ApplyFilter}
    click element  ${ID-PS-ApplyFilter}
    wait until element is not visible   globalAjaxLoading  250
    ${no-of-rows}=  get element count  //div[div[contains(text(),'Number of found records')]]//table//tbody//tr
    ${Row1}=  convert to integer    ${no-of-rows}
    run keyword if   '${Row1}' > '1'    Existing Policy   ${test_data}   ELSE    Create New Record    ${test_data}
    wait until element is not visible   globalAjaxLoading  100

Endorsement Policy
        [Arguments]    ${test_data}
        wait until element is not visible   globalAjaxLoading  40
        Check and select from list by label  ${ID-PS-StatusFilter}    ${test_data['Status']}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible  ${ID-PS-ApplyFilter}
        click element  ${ID-PS-ApplyFilter}
        wait until element is not visible   globalAjaxLoading  250
        ${no-of-rows}=  get element count  //div[div[contains(text(),'Number of found records')]]//table//tbody//tr
        ${Row1}=  convert to integer    ${no-of-rows}
        wait until element is not visible   globalAjaxLoading  100
        run keyword if   '${Row1}' > '1'    click element    ${PS-ViewCoverages}
        wait until element is not visible   globalAjaxLoading  100

Existing Policy
    [Arguments]    ${test_data}
    Click Policy
    Assignments
    UnderWriting Rating
    Coverages    ${test_data}
    Data Entry    ${test_data}

Create New Record
    [Arguments]    ${test_data}
    ClientSearch    ${test_data}
    ClientDetail    ${test_data}
    New Coverages    ${test_data}
    New Client DataEntry    ${test_data}