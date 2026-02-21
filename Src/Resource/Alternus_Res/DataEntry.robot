*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
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
${DE-Cancel}=    //div[div[@id='confirmReset']]//div//div//button[span[text()='Cancel']]
${ID-DE-Lossrunsyrs}=    id=Rows_0__Table_Corteges_7__3__Value
${ID-DE-Prioryr1}=    id=Rows_0__Table_Corteges_8__3__Value
${ID-DE-Prioryr2}=    id=Rows_0__Table_Corteges_8__8__Value
${ID-DE-Prioryr3}=    id=Rows_0__Table_Corteges_9__3__Value
${ID-DE-Prioryr4}=    id=Rows_0__Table_Corteges_9__8__Value
${ID-DE-Prioryr5}=    id=Rows_0__Table_Corteges_10__3__Value
${ID-DE-Earthquake}=    id=Rows_0__Table_Corteges_11__3__Value
${ID-DE-Hurricane}=    id=Rows_0__Table_Corteges_11__8__Value
${ID-DE-SevereConvectiveStorm}=    id=Rows_0__Table_Corteges_12__3__Value
${ID-DE-StatementValue}=    id=Rows_0__Table_Corteges_13__3__Value
${ID-DE-Referralreason}=    id=Rows_0__Table_Corteges_15__8__Value
${ID-DE-Referral}=    id=Rows_0__Table_Corteges_15__3__Value
${ID-CDE-SOV}=    id=SOV
${ID-DE-CarrierRisk}=    id=AZonRisk
${ID-DE-TieringRefAccount}=    id=NEPHILAtop25AC
${ID-DE-PrimContact_Email}=    id=PrimContact_Email
${CDE-Save}=    //input[@value='Save']
${ID-DE-StatementofValue}=    id=Rows_0__Table_Corteges_13__3__Value
${ID-DE-Referral}=    id=Rows_0__Table_Corteges_15__3__Value
${ID-DE-ReferralReason}=    id=Rows_0__Table_Corteges_15__8__Value
${DE-Next}=    //input[@value='Next']
${Dataentry}=    //a[contains(@href, '/Nexus/RatingAlternusEntries/ViewAlternusEntries/')]
${SICErrorMessage1}=    //div[@id='SICErrorMessage1']
${Dataentry}=   //a[contains(@href, '/Nexus/RatingAlternusEntries/ViewAlternusEntries/')]

*** Keywords ***
Data Entry
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${Data-Entry_client}=    run keyword and return status  element should be visible    ${DE-Client}
    run keyword if   ${Data-Entry_client}    log to console   Navigated to Data Entry Page
    click element    ${DE-Client}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[2]
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-DUNSNumber}    ${test_data['DUNS/EDM Number']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-YearEstablished}   ${test_data['Year Established']}
    press keys   ${ID-DE-YearEstablished}    TAB
    Check and enter input    ${ID-DE-PrimContact_Email}    ${test_data['Email']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${CDE-Save}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-DE-Additional Fields}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-PrimarySICcode}    ${test_data['PrimarySICCode']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-SecondarySICcode}    ${test_data['SecondarySICCode']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-TotalInsuredExposure}    ${test_data['Total Insured Exposure']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-InternationalExposure}  ${test_data['International Exposure']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-CDE-SOV}    ${test_data['Statement of Value']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-CarrierRisk}    ${test_data['Carrier on Risk']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-TieringRefAccount}    ${test_data['Tiering Referral Account']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${DE-Save}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    Check and enter input  ${ID-DE-ProgramLimit}   ${test_data['Total Limit']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${DE-Lossruns}    ${test_data['LossRuns']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-Lossrunsyrs}    ${test_data['LossRuns(yrs)']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr1}   ${test_data['Prior Yr 1']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr2}   ${test_data['Prior Yr 2']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr3}   ${test_data['Prior Yr 3']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr4}   ${test_data['Prior Yr 4']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr5}   ${test_data['Prior Yr 5']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Earthquake}   ${test_data['Earthquake']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Hurricane}   ${test_data['Hurricane']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-SevereConvectiveStorm}   ${test_data['Severe Convective Storm']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-Referral}    ${test_data['Referral']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-ReferralReason}   ${test_data['Referral Reason']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-DE-Apply}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible    ${ID-DE-ApplyChanges}
    run keyword if    ${Apply_changes}    click element     ${ID-DE-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${DE-GetSICEligibility}
    wait until element is not visible   globalAjaxLoading  100
    Display message
    click element    ${ID-DE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-DE-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

New Client DataEntry
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    ${Data-Entry_Programlimit}=    run keyword and return status  element should be visible    ${ID-DE-ProgramLimit}
    run keyword if   ${Data-Entry_Programlimit}    log to console   Navigated to Data Entry Page
    click element    ${DE-Client}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[2]
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-DE-Additional Fields}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-PrimarySICcode}    ${test_data['PrimarySICCode']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-SecondarySICcode}    ${test_data['SecondarySICCode']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-TotalInsuredExposure}    ${test_data['Total Insured Exposure']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-DE-InternationalExposure}  ${test_data['International Exposure']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-CDE-SOV}    ${test_data['Statement of Value']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-CarrierRisk}    ${test_data['Carrier on Risk']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-TieringRefAccount}    ${test_data['Tiering Referral Account']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${DE-Save}
    wait until element is not visible   globalAjaxLoading  200
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  200
    check and enter input  ${ID-DE-ProgramLimit}   ${test_data['Total Limit']}    
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${DE-Lossruns}    ${test_data['LossRuns']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-Lossrunsyrs}    ${test_data['LossRuns(yrs)']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr1}   ${test_data['Prior Yr 1']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr2}   ${test_data['Prior Yr 2']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr3}   ${test_data['Prior Yr 3']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr4}   ${test_data['Prior Yr 4']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Prioryr5}   ${test_data['Prior Yr 5']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Earthquake}   ${test_data['Earthquake']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-Hurricane}   ${test_data['Hurricane']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input  ${ID-DE-SevereConvectiveStorm}   ${test_data['Severe Convective Storm']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-Referral}    ${test_data['Referral']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-DE-ReferralReason}   ${test_data['Referral Reason']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-DE-Apply}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible    ${ID-DE-ApplyChanges}
    run keyword if    ${Apply_changes}    click element     ${ID-DE-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${DE-GetSICEligibility}
    wait until element is not visible   globalAjaxLoading  100
    Display message
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-DE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-DE-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Endorsement DataEntry
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${DataEntry_Next}=    run keyword and return status  element should be visible    ${DE-Next}
    run keyword if   ${DataEntry_Next}    log to console   Navigated to DataEntry page
    Display message
    click element    ${DE-Next}
    wait until element is not visible   globalAjaxLoading  100

Display message
    ${Display Message}=    run keyword and return status  page should contain element    ${SICErrorMessage1}
    ${Message}=    run keyword if   ${Display Message}    get text    ${SICErrorMessage1}
    run keyword if    '${Message}' != ''   log to console    "${Message}"    ELSE    log to console    "No system message displayed"

Click Data Entry
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    click element   ${Dataentry}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    Display message