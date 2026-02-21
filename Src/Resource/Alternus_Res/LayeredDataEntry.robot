*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../../Resource/Alternus_Res/MasterPremium.robot

*** Variables ***
${Name-LDE-IsManualEntry}=    name=IsManualEntry
${ID-LDE-PaymentTermsString}=    id=PaymentTermsString
${ID-LDE-AllianzParticipation}=    id=AllianzParticipation
${ID-LDE-MarketForm}=    id=MarketForm
${ID-LDE-AOPdeductible}=    id=AOPdeductible
${ID-LDE-TotalInsuredValueTiv}=    id=TotalInsuredValueTiv
${ID-LDE-TransactionTiv}=    id=TransactionTiv
${ID-LDE-AlternusMaxLimit}=    id=AlternusMaxLimit
${ID-LDE-Limit-0}=    id=PremiumLayer_0__Limit
${ID-LDE-LeadCarrier-0}=    id=PremiumLayer_0__LeadCarrier
${ID-LDE-RetailCommission-0}=    id=PremiumLayer_0__RetailCommission
${ID-LDE-Lead-0}=    id=PremiumLayer_0__Lead
${ID-LDE-PolicyFee-0}=    id=PremiumLayer_0__PolicyFee
${ID-LDE-PremiumCharge-0}=    id=PremiumLayer_0__AllRiskPremiumCharge
${ID-LDE-TriaPremiumCharge-0}=    id=PremiumLayer_0__TriaPremiumCharge
${ID-LDE-PremiumLayer_0__MuraPremiumAllocation-0}=    id=PremiumLayer_0__MuraPremiumAllocation
${ID-LDE-AddRow}=    //button[text()='Add']
${ID-LDE-Limit-1}=    id=PremiumLayer_1__Limit
${ID-LDE-LeadCarrier-1}=    id=PremiumLayer_1__LeadCarrier
${ID-LDE-RetailCommission-1}=    id=PremiumLayer_1__RetailCommission
${ID-LDE-Lead-1}=    id=PremiumLayer_1__Lead
${ID-LDE-PolicyFee-1}=    id=PremiumLayer_1__PolicyFee
${ID-LDE-PremiumCharge-1}=    id=PremiumLayer_1__AllRiskPremiumCharge
${ID-LDE-TriaPremiumCharge-1}=    id=PremiumLayer_1__TriaPremiumCharge
${ID-LDE-PremiumLayer_0__MuraPremiumAllocation-1}=    id=PremiumLayer_1__MuraPremiumAllocation
${ID-LDE-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-LDE-Apply&Continue}=  //input[@value='Apply & Continue']
${LDE-CoverageTerritory}=    id=CoverageTerritory
${LDE-Apply}=    id=navApply
${ID-LDE-CatMinimumPremium}=    id=CatMinimumPremium
${ID-LDE-Limit-2}=    id=PremiumLayer_2__Limit
${ID-LDE-LeadCarrier-2}=    id=PremiumLayer_2__LeadCarrier
${ID-LDE-RetailCommission-2}=    id=PremiumLayer_2__RetailCommission
${ID-LDE-Lead-2}=    id=PremiumLayer_2__Lead
${ID-LDE-PolicyFee-2}=    id=PremiumLayer_2__PolicyFee
${ID-LDE-PremiumCharge-2}=    id=PremiumLayer_2__AllRiskPremiumCharge
${ID-LDE-TriaPremiumCharge-2}=    id=PremiumLayer_2__TriaPremiumCharge
${ID-LDE-PremiumLayer_0__MuraPremiumAllocation-2}=    id=PremiumLayer_2__MuraPremiumAllocation
${ID-LDE-Limit-3}=    id=PremiumLayer_3__Limit
${ID-LDE-LeadCarrier-3}=    id=PremiumLayer_3__LeadCarrier
${ID-LDE-RetailCommission-3}=    id=PremiumLayer_3__RetailCommission
${ID-LDE-Lead-3}=    id=PremiumLayer_3__Lead
${ID-LDE-PolicyFee-3}=    id=PremiumLayer_3__PolicyFee
${ID-LDE-PremiumCharge-3}=    id=PremiumLayer_3__AllRiskPremiumCharge
${ID-LDE-PremiumCharge-4}=    id=PremiumLayer_4__AllRiskPremiumCharge
${ID-LDE-PremiumCharge-5}=    id=PremiumLayer_5__AllRiskPremiumCharge
${ID-LDE-PremiumCharge-6}=    id=PremiumLayer_6__AllRiskPremiumCharge
${ID-LDE-PremiumCharge-7}=    id=PremiumLayer_7__AllRiskPremiumCharge
${ID-LDE-PremiumCharge-8}=    id=PremiumLayer_8__AllRiskPremiumCharge
${ID-LDE-TriaPremiumCharge-3}=    id=PremiumLayer_3__TriaPremiumCharge
${ID-LDE-PremiumLayer_0__MuraPremiumAllocation-3}=    id=PremiumLayer_3__MuraPremiumAllocation
${Name-LDE-IsReinsuranceEntry}=    name=IsReinsuranceEntry
${ID-LDE-AttachmentPoint}=    id=AttachmentPoint
${ID-LDE-CedingCommission}=    id=CedingCommission
${LayeredDataEntry}=    //a[contains(@href, '/Nexus/RatingAlternusPremiumLayerEntry/ViewPremiumLayerEntry/')]
${ID-LDE-Search}=    id=Button1
${Name-LDE-FCradio}=    FCradio
${LDE-OK}=    //button//span[text()='Ok']
${LDE-Cancel}=    (//button[span[text()='Cancel']])[last()]
${Name-LDE-IsPayorFrontingCarrier}=    name=IsPayorFrontingCarrier
${ID-LDE-FrontingCarrierfound}=    //input[@class='valid']
${ID-LDE-FrontingCarrierName}=    id=FrontingCarrierName
${LDE-Next}=    //input[@value='Next']
${ID-LDE-OtherPremiumAllocation-0}=    id=PremiumLayer_0__OtherPremiumAllocation
${ID-LDE-OtherPremiumAllocation-1}=    id=PremiumLayer_1__OtherPremiumAllocation
${ID-LDE-OtherPremiumAllocation-2}=    id=PremiumLayer_2__OtherPremiumAllocation
${ID-LDE-OtherPremiumAllocation-3}=    id=PremiumLayer_3__OtherPremiumAllocation
${ID-LDE-OtherPremiumAllocation-4}=    id=PremiumLayer_4__OtherPremiumAllocation
${ID-LDE-OtherTriaAllocation-0}=     id=PremiumLayer_0__OtherTriaAllocation
${ID-LDE-OtherTriaAllocation-1}=    id=PremiumLayer_1__OtherTriaAllocation
${ID-LDE-OtherTriaAllocation-2}=    id=PremiumLayer_2__OtherTriaAllocation
${ID-LDE-OtherTriaAllocation-3}=    id=PremiumLayer_3__OtherTriaAllocation
${ID-LDE-OtherTriaAllocation-4}=    id=PremiumLayer_4__OtherTriaAllocation

*** Keywords ***
Layered Data Entry
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${LDEntryTerritory}=    run keyword and return status  element should be visible    ${LDE-CoverageTerritory}
    run keyword if   ${LDEntryTerritory}    log to console   Navigated to Layered Data Entry Page
    run keyword if  '${test_data['Manual Entry']}' == 'YES'    select checkbox  ${Name-LDE-IsManualEntry}    ELSE    unselect checkbox    ${Name-LDE-IsManualEntry}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Reinsurance required?']}' == 'YES'    select checkbox  ${Name-LDE-IsReinsuranceEntry}    ELSE    unselect checkbox    ${Name-LDE-IsReinsuranceEntry}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label  ${LDE-CoverageTerritory}   ${test_data['Coverage Territory']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-LDE-PaymentTermsString}    ${test_data['Payment Terms']}
    wait until element is not visible   globalAjaxLoading  150
    wait until element is visible    ${ID-LDE-AllianzParticipation}    60
    clear element text    ${ID-LDE-AllianzParticipation}
    press keys    ${ID-LDE-AllianzParticipation}    ${test_data['Alternus Participation1']}
    wait until element is not visible   globalAjaxLoading  150
    run keyword if    '${test_data['Alternus Participation2']}' != 'nan'    press keys    ${ID-LDE-AllianzParticipation}   ${test_data['Alternus Participation2']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['Alternus Participation3']}' != 'nan'    press keys    ${ID-LDE-AllianzParticipation}    ${test_data['Alternus Participation3']}
    wait until element is not visible   globalAjaxLoading  150
    run keyword if    '${test_data['Alternus Participation4']}' != 'nan'    press keys    ${ID-LDE-AllianzParticipation}   ${test_data['Alternus Participation4']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-CedingCommission}   ${test_data['Cede Commission']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-MarketForm}   ${test_data['Market Form']}
    wait until element is not visible   globalAjaxLoading  100
    ${LDE-AOPdeductible}=    run keyword and return status    element should be visible    ${ID-LDE-AOPdeductible}
    run keyword if    ${LDE-AOPdeductible}    Check and enter input    ${ID-LDE-AOPdeductible}   ${test_data['AOP deductible']}
    ${LDE-AttachmentPoint}=    run keyword and return status    element should be visible    ${ID-LDE-AttachmentPoint}
    run keyword if    ${LDE-AttachmentPoint}    Check and enter input    ${ID-LDE-AttachmentPoint}   ${test_data['Attachment Point']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-TransactionTiv}   ${test_data['Transaction TIV']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-AlternusMaxLimit}    ${test_data['Alternus Maximum Limit']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-CatMinimumPremium}    ${test_data['CatMinimumPremium']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data["Division"]}' == 'REINSURANCE'   Select Payor-Fronting Carrier    ${test_data}
    Enter LDE Values    ${test_data}    0
    wait until element is enabled    ${ID-LDE-AddRow}    60
    click element  ${ID-LDE-AddRow}
    Enter LDE Values    ${test_data}    1
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-LDE-AddRow}    60
    click element  ${ID-LDE-AddRow}
    Enter LDE Values    ${test_data}    2
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-LDE-AddRow}    60
    click element  ${ID-LDE-AddRow}
    Enter LDE Values    ${test_data}    3
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-LDE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible    ${ID-LDE-ApplyChanges}
    run keyword if    ${Apply_changes}    click element     ${ID-LDE-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    Master Premium Page Validation

Enter LDE Values
    [Arguments]    ${test_data}    ${Index}
    Check and enter input    ${ID-LDE-Limit-${Index}}    ${test_data['Limit-${Index}']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-LeadCarrier-${Index}}    ${test_data['Lead Carrier-${Index}']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-RetailCommission-${Index}}  ${test_data['Retail Commission-${Index} %']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-Lead-${Index}}  ${test_data['Lead-${Index} %']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-PolicyFee-${Index}}  ${test_data['Policy Fee-${Index}']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-PremiumCharge-${Index}}  ${test_data['Annual Premium Charge-${Index}']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-TriaPremiumCharge-${Index}}    ${test_data['Annual TRIA Premium Charge-${Index}']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-PremiumLayer_0__MuraPremiumAllocation-${Index}}  ${test_data['MURA Premium Allocation-${Index}']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-OtherPremiumAllocation-${Index}}  ${test_data['Other Premium Allocation-${Index}']}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-OtherTriaAllocation-${Index}}  ${test_data['Other TRIA Premium Allocation-${Index}']}
    wait until element is not visible   globalAjaxLoading  100

Payor-Fronting Carrier
    [Arguments]    ${testdata}
    Click Layered Data entry
    Select Payor-Fronting Carrier    ${testdata}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Name-LDE-IsPayorFrontingCarrier}    60
    select checkbox    ${Name-LDE-IsPayorFrontingCarrier}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-LDE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible    ${ID-LDE-ApplyChanges}
    run keyword if    ${Apply_changes}    click element     ${ID-LDE-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Select Payor-Fronting Carrier
    [Arguments]    ${testdata}
    ${LDE-Frontingcarrier}=    run keyword and return status    textfield value should be    ${ID-LDE-FrontingCarrierName}    ${EMPTY}
    run keyword if    ${LDE-Frontingcarrier}    Check and enter input    ${ID-LDE-FrontingCarrierName}    ${test_data['Fronting Carrier']}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-LDE-Search}    60
    click element   ${ID-LDE-Search}
    wait until element is not visible   globalAjaxLoading  100
    ${FCRadio-visible}=    run keyword and return status    element should be visible    ${Name-LDE-FCradio}
    run keyword if    ${FCRadio-visible}    selecting ok    ELSE    selecting cancel

Click Layered Data entry
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    click element   ${LayeredDataEntry}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]

selecting ok
    wait until element is visible    ${Name-LDE-FCradio}    60
    wait until element is enabled    ${Name-LDE-FCradio}    60
    click element     ${Name-LDE-FCradio}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible     ${LDE-OK}    60
    wait until element is enabled     ${LDE-OK}    60
    click element    ${LDE-OK}

selecting cancel
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${LDE-Cancel}    60
    wait until element is enabled    ${LDE-Cancel}    60
    click element    ${LDE-Cancel}

Endorsement LayeredDataEntry
    [Arguments]    ${testdata}
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${LDEntryTerritory}=    run keyword and return status  element should be visible    ${LDE-CoverageTerritory}
    run keyword if   ${LDEntryTerritory}    log to console   Navigated to Layered Data Entry Page
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID-LDE-TransactionTiv}   ${test_data['Transaction TIV']}
    wait until element is not visible   globalAjaxLoading  100
     ${LDE-AOPdeductible}=    run keyword and return status    element should be visible    ${ID-LDE-AOPdeductible}
    run keyword if    ${LDE-AOPdeductible}    Check and enter input    ${ID-LDE-AOPdeductible}   ${test_data['AOP deductible']}
    ${LDE-AttachmentPoint}=    run keyword and return status    element should be visible    ${ID-LDE-AttachmentPoint}
    run keyword if    ${LDE-AttachmentPoint}    Check and enter input    ${ID-LDE-AttachmentPoint}   ${test_data['Attachment Point']}
    Check and enter input    ${ID-LDE-CatMinimumPremium}    ${test_data['CatMinimumPremium']}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label    ${ID-LDE-PaymentTermsString}    ${test_data['Payment Terms']}
    wait until element is not visible   globalAjaxLoading  150
    wait until element is visible    ${ID-LDE-AllianzParticipation}    60
    check and enter input    ${ID-LDE-AllianzParticipation}    ${test_data['Alternus Participation']}
    wait until element is not visible   globalAjaxLoading  150
    Check and enter input    ${ID-LDE-AlternusMaxLimit}    ${test_data['Alternus Maximum Limit']}
    wait until element is not visible   globalAjaxLoading  100
    ${Endorsement_Effective_Date}=    get text    //td[b[text()='Endorsement Effective Date:']]//following-sibling::td
    log to console  ${Endorsement_Effective_Date}
    wait until element is not visible   globalAjaxLoading  350
    Premium Entry    ${test_data}
    click element    ${ID-LDE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible    ${ID-LDE-ApplyChanges}
    run keyword if    ${Apply_changes}    click element     ${ID-LDE-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Premium Entry
    [Arguments]    ${test_data}
    ${LeadCarrier}=    run keyword and return status    textfield value should be    (//input[contains(@id,'LeadCarrier')])[last()]    ${EMPTY}
    ${LayerCount_value}=    run keyword if    ${LeadCarrier}     get value    (//input[contains(@id,'LayerCode')])[last()]
    ${LayerCode}=  convert to integer    ${LayerCount_value}
    ${Premium_Layers}=  evaluate    ${LayerCount_value} - 1
    ${Class-value}=    run keyword and return status    page should contain    Attachment Point
    run keyword if    ${Class-value}    Excess-Premium Charge    ${test_data}    ${Premium_Layers}    ELSE    Primary-Premium Charge    ${test_data}    ${LayerCode}

Primary-Premium Charge
    [Arguments]    ${test_data}    ${LayerCode}
    FOR  ${index}    IN RANGE    0    ${LayerCode}
    Check and enter input    ${ID-LDE-PremiumCharge-${Index}}  ${test_data['Annual Premium Charge-0']}
    END

Excess-Premium Charge
    [Arguments]    ${test_data}    ${Premium_Layers}
    FOR  ${index}    IN RANGE    0    ${Premium_Layers}
    Check and enter input    ${ID-LDE-PremiumCharge-${Index}}  ${test_data['Annual Premium Charge-0']}
    END