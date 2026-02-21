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
${ID_CD_County}=    id=PrimAddress_County
${Name-CD-Branches}=    name=SelectedBranches
${Value_BethesdaKR_CB}=    //input[@value='5']
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
${ID-DE-YearEstablished}=    id=YearEstablishedpicker
${ID-DE-MARSHTransactionType}=    id=MARSHTransactionType
${ID-DE-DUNSNumber}=    id=DUNSNumber
${ID-DE-Additional Fields}=  //a[text()='Additional Fields']
${ID-DE-PrimarySICcode}=    id=PrimarySICcode
${ID-DE-SecondarySICcode}=    id=SecondarySICcode
${ID-DE-TotalInsuredExposure}=    id=TotalInsuredExposure
${ID-DE-InternationalExposure}=    id=InternationalExposure
${ID-DE-ProgramLimit}=    id=Rows_0__Table_Corteges_0__8__Value
${DE-Lossruns}=    id=Rows_0__Table_Corteges_6__3__Value
${DE-GetSICEligibility}=  link=Get SIC Eligibility...
${ID-DE-SIC Description}=    id=Rows_0__Table_Corteges_4__8__Value
${DE-Client}=    //td[b[text()='CLIENT:']]//following-sibling::td//a
${DE-Save}=    //button[span[text()='Save']]//span[@class='ui-button-text']
${ID-DE-Apply}=    //input[@value='Apply']
${ID-DE-ApplyFilter}=  //input[@value='Apply Filter']
${ID-DE-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-DE-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-DE-StatementValue}=    id=Rows_0__Table_Corteges_13__3__Value
${ID-DE-SOV}=    id=SOV
${ID-DE-CarrierRisk}=    id=AZonRisk
${ID-DE-TieringRefAccount}=    id=NEPHILAtop25AC
${Link_ClientUMS}=    //a[contains(@href,'Client/ViewClient')]
${Link_MailingAddress}=    //a[contains(@href,'mailingAdd')]
${ID_MailingAddressField}=    id=PrimAddress_MailingAddress1


*** Keywords ***
ClientDetail
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
    wait until element is not visible   globalAjaxLoading  200
    check and select from list by label    ${ID-CD-PrimAddress_AddressTypeId}    ${test_data['Type']}
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible  ${ID-CD-Address1}
    check and enter input    ${ID-CD-Address1}    ${test_data['Address']}
    sleep  0.7s
    Press Keys  ${ID-CD-Address1}  ARROW_DOWN
    Press Keys    NONE  TAB
#    wait until element is not visible   globalAjaxLoading  100
#    check and enter input    ${ID-CD-City}    ${test_data['City_CD']}
#    wait until element is not visible   globalAjaxLoading  100
#    check and select from list by label    ${ID-CD-StateId}    ${test_data['State_CD']}
#    check and enter input    ${ID-CD-Address1}    ${test_data['Address']}
#    wait until element is not visible   globalAjaxLoading  100
#    check and enter input    ${ID-CD-Zip}    ${test_data['Zip_CD']}
#    wait until element is not visible   globalAjaxLoading  100
    wait until element is not visible   globalAjaxLoading  100
    Sleep    5s
    run keyword if  '${test_data['Bethesda']}' == 'YES'  select checkbox  ${Name-CD-Branches}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Bethesda KR']}' == 'YES'  select checkbox  ${Value_BethesdaKR_CB}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Houston']}' == 'YES'  select checkbox  ${Name-CD-Branches}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Morristown']}' == 'YES'  select checkbox  ${Name-CD-Branches}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Program']}' == 'VIMMPROPERTY'   select checkbox  ${CD-Boulder_Branch}
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
#    close window
    ${title}=    get window titles
    Switch Window    title=${title}[0]

DNO_Private_ClientDetail
    [Arguments]    &{testdata}
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
    check and enter input    ${ID-CD-Address1}    ${test_data['Address']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input    ${ID-CD-City}    ${test_data['City_CD']}
    wait until element is not visible   globalAjaxLoading  100
    check and select from list by label    ${ID-CD-StateId}    ${test_data['State_CD']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input    ${ID-CD-Zip}    ${test_data['Zip_CD']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Bethesda']}' == 'YES'  select checkbox  ${Name-CD-Branches}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Bethesda KR']}' == 'YES'  select checkbox  ${Name-CD-Branches}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Houston']}' == 'YES'  select checkbox  ${Name-CD-Branches}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Morristown']}' == 'YES'  select checkbox  ${Name-CD-Branches}
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
    close window
    ${title}=    get window titles
    Switch Window    title=${title}[0]

Click UMS Client Link
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Link_ClientUMS}  10s
    click element    ${Link_ClientUMS}

Edit Client Name
    [Arguments]    ${test_data}
    ${title}=  Get Window Titles
    Switch Window  title=${title}[2]
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-CD-Name}  10s
    check and enter input    ${ID-CD-Name}    ${test_data['Client Name']}
    Click Client Page Save Button

Edit Client Physical Address
    [Arguments]    ${test_data}
    ${title}=  Get Window Titles
    Switch Window  title=${title}[2]
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-CD-Address1}
    check and enter input    ${ID-CD-Address1}    ${test_data['Physical Address']}

Click Client Mailing Address Link
    wait until element is visible    ${Link_MailingAddress}
    mouse over    ${Link_MailingAddress}
    click element    ${Link_MailingAddress}

Click Client Page Save Button
    wait until element is visible    ${CD-Save}
    scroll element into view    ${CD-Save}
    click element    ${CD-Save}

Edit Client Mailing Address
    [Arguments]    ${test_data}
    Click Client Mailing Address Link
    Check and enter input  ${ID_MailingAddressField}    ${test_data['Mailing Address']}
    Click Client Page Save Button
    close window
    ${title}=    get window titles
    Switch Window    title=${title}[0]

