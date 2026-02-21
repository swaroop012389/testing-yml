*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ClientSearch}=    //a[contains(@href, '/Nexus/ClientSearch')]
${ID-CS-ClientName}=    id=ClientName
${ID-CS-ClientStateId}=    id=ClientStateId
${ID-CS-ClientCity}=    id=ClientCity
${ID-CS-AddNewClient}=    //span[contains(text(),'Add New Client')]
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-UMS-ApplyFilter}=  //span[contains(text(),'Apply Filter')]
${ID_ApplyFilter_Button}=    id=applyButton
${ID_AddNewClient_Button}=    id=btnAddNewClient

*** Keywords ***
Click Client Search Tab
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ClientSearch}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[0]
    ${Client_Name}=    run keyword and return status  element should be visible   ${ID-CS-ClientName}
    run keyword if   ${Client_Name}    log to console   Navigated to Client Search Page

Enter Client Name
    [Arguments]    ${testdata}
    check and enter input    ${ID-CS-ClientName}    ${test_data['Client Name']}
    wait until element is not visible   globalAjaxLoading  100

Click Apply Filter Button
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID_ApplyFilter_Button}

Click Add New Client Button
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID_AddNewClient_Button}    20
    click element    ${ID_AddNewClient_Button}
    wait until element is not visible   globalAjaxLoading  100

ClientSearch
    [Arguments]    ${testdata}
    Click Client Search Tab
    Enter Client Name    ${testdata}
    check and select from list by label    ${ID-CS-ClientStateId}    ${test_data['State']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${ID-CS-ClientCity}    ${test_data['City']}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-UMS-ApplyFilter}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-CS-AddNewClient}
    wait until element is not visible   globalAjaxLoading  100

DNO_Private_ClientSearch
    [Arguments]    &{testdata}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ClientSearch}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[0]
    ${Client_Name}=    run keyword and return status  element should be visible   ${ID-CS-ClientName}
    run keyword if   ${Client_Name}    log to console   Navigated to Client Search Page
    check and enter input    ${ID-CS-ClientName}    ${test_data['Client Name']}
    wait until element is not visible   globalAjaxLoading  100
    check and select from list by label    ${ID-CS-ClientStateId}    ${test_data['State']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${ID-CS-ClientCity}    ${test_data['City']}
    wait until element is not visible   globalAjaxLoading  100
    #click element  ${ID-UMS-ApplyFilter}
    click element  //span[contains(text(),'Apply Filter')]
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible  ${ID-CS-AddNewClient}  5s
    click element    ${ID-CS-AddNewClient}
    wait until element is not visible   globalAjaxLoading  100