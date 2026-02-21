*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-CD-ClientName}=    id=ClientName
${ID-CD-ClientStateId}=    id=ClientStateId
${ID-CD-ClientCity}=    id=ClientCity
${ID-CD-AddNewClient}=    //input[@value='Add New Client']
${ID-CD-YearEstablished}=    id=YearEstablishedpicker
${ID-CD-PrimContact_FirstName}=    id=PrimContact_FirstName
${ID-CD-PrimContact_LastName}=    id=PrimContact_LastName
${ID-CD-PrimContact_Email}=    id=PrimContact_Email
${ID-CD-PrimAddress_AddressTypeId}=    id=PrimAddress_AddressTypeId
${ID-CD-PrimAddress_Address1}=    id=PrimAddress_Address1
${ID-CD-PrimAddress_City}=    id=PrimAddress_City
${ID-CD-PrimAddress_StateId}=    id=PrimAddress_StateId
${ID-CD-PrimAddress_Zip}=    id=PrimAddress_Zip
${Name-CD-SelectedBranches}=    name=SelectedBranches
${ID-CD-Contacts}=    id=ui-accordion-clientDetails-header-0  
${CD-AddNew}=    //a[contains(@href, 'javascript:newContact()')]
${ID-CD-FirstName}=    id=FirstName
${ID-CD-LastName}=    id=LastName
${ID-CD-Email}=    id=Email
${ID-CD-Locations}=    //span[contains(@id, 'ui-accordion-clientDetails-header-1')]
${ID-CD-AddressTypeId}=    id=AddressTypeId
${ID-CD-Address1}=    id=PrimAddress_Address1
${ID-CD-City}=    id=PrimAddress_City
${ID-CD-StateId}=    id=PrimAddress_StateId
${ID-CD-Zip}=    id=PrimAddress_Zip
${Name-CD-Branches}=    name=SelectedBranches
${CD-Branch}=  //input[@id='SelectedBranches'][2]
${CD-Boulder_Branch}=   //input[@id='SelectedBranches'][3]
${ID-CD-Contacts}=    link=Contacts
${ID-CD-NamedInsured}=    id=ui-accordion-clientDetails-header-2
${ID-CD-Name}=    id=Name
${ID-CD-BusinessTypeId}=    id=BusinessTypeId
${ID-CD-RelatedAccounts}=    id=ui-accordion-clientDetails-header-3
${ID-CD-RelationshipTypeId}=    id=RelationshipTypeId
${CD-RelatedAccount}=    //button[contains(@onclick, 'editAccount()')]
${ID-CD-RelatedClientName}=    id=ClientName
${ID-CD-RelatedClientStateId}=    id=ClientStateId
${ID-CD-RelatedClientCity}=    id=ClientCity
${ID-CD-RelationshipId}=    id=RelationshipId
${ID-CD-AccountRelationshipId}=    id=AccountRelationshipId
${ID-CD-Marketing}=    id=ui-accordion-clientDetails-header-4
${CD-CreatingMarketing}=    //div[@class='entityList']//a[text()='Create Marketing']
${ID-CD-Description}=    //input[@id='description']
${CD-Save}=    //input[@value='Save']
${CD-OK}=    //button/span[text()='OK']
${ID-DE-DUNSNumber}=    id=DUNSNumber


*** Keywords ***
UMS ClientDetail
    [Arguments]    ${testdata}
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${DUNSNumber}=    run keyword and return status  element should be visible   ${ID-DE-DUNSNumber}
    run keyword if   ${DUNSNumber}    log to console   Navigated to Client Detail Page
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-DUNSNumber}    ${test_data['DUNS/EDM Number']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${ID-CD-YearEstablished}    ${test_data['Year Established']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-CD-PrimContact_FirstName}  ${test_data['First']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-CD-PrimContact_LastName}    ${test_data['Last']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-CD-PrimContact_Email}    ${test_data['Email']}
    wait until element is not visible   globalAjaxLoading  100
    check and select from list by label    ${ID-CD-PrimAddress_AddressTypeId}    ${test_data['Type']}
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible  ${ID-CD-Address1}
    check and enter input    ${ID-CD-Address1}    ${test_data['Address']}
    sleep  0.5s
    Press Keys  ${ID-CD-Address1}  ARROW_DOWN
    Press Keys    NONE  TAB
    sleep  1s
    wait until element is not visible   globalAjaxLoading  100
    IF    '${test_data['Program']}'=='K&R'
        select checkbox  ${CD-Branch}
    ELSE
        select checkbox  ${CD-Boulder_Branch}
    END
    wait until element is not visible   globalAjaxLoading  100
    click element    ${CD-Save}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-CD-Marketing}
    wait until element is visible    ${CD-CreatingMarketing}    timeout=35
    click element   ${CD-CreatingMarketing}
    wait until element is visible    ${ID-CD-Description}    timeout=35
    check and enter input    ${ID-CD-Description}    ${test_data['Description']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${CD-OK}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    close window
    ${title}=    get window titles
    Switch Window    title=${title}[0]
















































