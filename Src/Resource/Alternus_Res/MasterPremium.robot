*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../../Resource/Alternus_Res/LayeredDataEntry.robot

*** Variables ***
${ID-MP-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-MP-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-LDE-Limit1}=    id=PremiumLayer_1__Limit
${ID-LDE-Limit}=    id=PremiumLayer_0__Limit
${MasterPremiumButton}=    //a[contains(@href, '/Nexus/AlternusMasterPremium/ViewAlternusPremiumRatingSheet/')]
${LayeredDataEntryButton}=    //a[contains(@href, '/Nexus/RatingAlternusPremiumLayerEntry/ViewPremiumLayerEntry/')]
${ID-LDE-Limit}=    id=PremiumLayer_0__Limit
${ID-LDE-LeadCarrier}=    id=PremiumLayer_0__LeadCarrier
${ID-LDE-RetailCommission}=    id=PremiumLayer_0__RetailCommission
${ID-LDE-Lead}=    id=PremiumLayer_0__Lead
${ID-LDE-PolicyFee}=    id=PremiumLayer_0__PolicyFee
${ID-LDE-PremiumCharge}=    id=PremiumLayer_0__AllRiskPremiumCharge
${ID-LDE-TriaPremiumCharge}=    id=PremiumLayer_0__TriaPremiumCharge
${ID-LDE-PremiumLayer_0__MuraPremiumAllocation}=    id=PremiumLayer_0__MuraPremiumAllocation
${ID-LDE-AddRow}=    //button[text()='Add']
${ID-LDE-Limit1}=    id=PremiumLayer_1__Limit
${ID-LDE-LeadCarrier1}=    id=PremiumLayer_1__LeadCarrier
${ID-LDE-RetailCommission1}=    id=PremiumLayer_1__RetailCommission
${ID-LDE-Lead1}=    id=PremiumLayer_1__Lead
${ID-LDE-PolicyFee1}=    id=PremiumLayer_1__PolicyFee
${ID-LDE-PremiumCharge1}=    id=PremiumLayer_1__AllRiskPremiumCharge
${ID-LDE-TriaPremiumCharge1}=    id=PremiumLayer_1__TriaPremiumCharge
${ID-LDE-PremiumLayer_0__MuraPremiumAllocation1}=    id=PremiumLayer_1__MuraPremiumAllocation
${ID-LDE-CatMinimumPremium}=    id=CatMinimumPremium
${ID-LDE-Limit2}=    id=PremiumLayer_2__Limit
${ID-LDE-LeadCarrier2}=    id=PremiumLayer_2__LeadCarrier
${ID-LDE-RetailCommission2}=    id=PremiumLayer_2__RetailCommission
${ID-LDE-Lead2}=    id=PremiumLayer_2__Lead
${ID-LDE-PolicyFee2}=    id=PremiumLayer_2__PolicyFee
${ID-LDE-PremiumCharge2}=    id=PremiumLayer_2__AllRiskPremiumCharge
${ID-LDE-TriaPremiumCharge2}=    id=PremiumLayer_2__TriaPremiumCharge
${ID-LDE-PremiumLayer_0__MuraPremiumAllocation2}=    id=PremiumLayer_2__MuraPremiumAllocation
${ID-LDE-Limit3}=    id=PremiumLayer_3__Limit
${ID-LDE-LeadCarrier3}=    id=PremiumLayer_3__LeadCarrier
${ID-LDE-RetailCommission3}=    id=PremiumLayer_3__RetailCommission
${ID-LDE-Lead3}=    id=PremiumLayer_3__Lead
${ID-LDE-PolicyFee3}=    id=PremiumLayer_3__PolicyFee
${ID-LDE-PremiumCharge3}=    id=PremiumLayer_3__AllRiskPremiumCharge
${ID-LDE-TriaPremiumCharge3}=    id=PremiumLayer_3__TriaPremiumCharge
${ID-LDE-PremiumLayer_0__MuraPremiumAllocation3}=    id=PremiumLayer_3__MuraPremiumAllocation
${Name-LDE-IsReinsuranceEntry}=    name=IsReinsuranceEntry
${ID-LDE-AttachmentPoint}=    id=AttachmentPoint
${ID-LDE-CedingCommission}=    id=CedingCommission

*** Keywords ***
Master Premium Page Validation
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${PI-applycontinue}=    run keyword and return status  element should be visible    ${ID-MP-Apply&Continue}
    run keyword if   ${PI-applycontinue}    log to console   Navigated to MasterPremium Tab

Master_Premium
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Manual Entry']}' == 'YES'    MP_All Risk_Premium    ${test_data}    ELSE    MP_All Risk_Layered    ${test_data}
    ${TRIA-Header}=  run keyword and return status    element should be visible    //i[contains(text(),'TRIA Coverage')]
    run keyword if  ${TRIA-Header}  Check_TRIA  ${test_data}
    click element  ${ID-MP-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible    ${ID-MP-ApplyChanges}
    run keyword if    ${Apply_changes}    click element     ${ID-MP-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Layer Validation_PD
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}
    wait until element is not visible   globalAjaxLoading  100
    ${Layer-countvalue}=    run keyword if    '${test_data['Class']}' == 'EXCESS'    Excess-Layer_count  ${Layer-count}    ELSE    Primary-Layer_count    ${Layer-count}
    ${MP_Limit}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[1]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[1]
    log to console   MP_Limit:${MP_Limit}
    log to console    $${test_data["Limit-${Layer-count}"]}
    ${MP_Limit}=    remove string    ${MP_Limit}    ,
    run keyword if   '$${test_data["Limit-${Layer-count}"]}' == '${MP_Limit}'    log to console    ${LayerName} LayerLimit in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} LayerLimit in Masterpremium does not have the same value as given in LDE
    wait until element is not visible   globalAjaxLoading  150
    ${MP_RetailCommission}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[5]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[5]
    log to console   MP_RetailCommission:${MP_RetailCommission}
    log to console   ${test_data["Retail Commission-${Layer-count} %"]}%
    run keyword if    '${test_data["Retail Commission-${Layer-count} %"]}%' == '${MP_RetailCommission}'    log to console    ${LayerName} Retail Commission % in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} Retail Commission % in Masterpremium does not have the same value as given in LDE
    wait until element is not visible   globalAjaxLoading  100
    ${MP_AllocatedPremium}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[8]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[8]
    log to console   MP_AllocatedPremium:${MP_AllocatedPremium}
    ${MP_AllocatedPremium}=    remove string    ${MP_AllocatedPremium}    ,
    log to console    $${test_data["Annual Premium Charge-${Layer-count}"]}
    run keyword if    '$${test_data["Annual Premium Charge-${Layer-count}"]}' == '${MP_AllocatedPremium}'    log to console    ${LayerName} Allocated Premium in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} Allocated Premium in Masterpremium does not have the same value as given in LDE
    run keyword if  '${test_data['Manual Entry']}' == 'YES'    PolicyFee_PD    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${Alternus Limit}=    Alternus Limit Calculation    ${test_data['Limit-${Layer-count}']}    ${test_data['Alternus Participation']}
    log to console   AlternusLimit:${Alternus Limit}
    ${Alternus Limit}=    convert to string    ${Alternus Limit}
    ${Alternus Limit}=    evaluate    round(${Alternus Limit})
    ${Alternus Limit Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text    //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[3]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[3]
    ${Alternus Limit Value}=    remove string    ${Alternus Limit Value}    ,
    ${Alternus Limit Value}=    remove string    ${Alternus Limit Value}    $
    log to console   ${Alternus Limit Value}
    ${Alternus Limit Value}=    remove string    ${Alternus Limit Value}    ,
    run keyword if    '${Alternus Limit}' == '${Alternus Limit Value}'    log to console    ${LayerName} Calculated Alternus Limit has the same value as given in Masterpremium    ELSE    log to console    ${LayerName} Calculated Alternus Limit does not have the same value as given in Masterpremium
    ${Summation-Allocated Premium}=    Summation For All Layers    ${test_data}    8
    log to console    Summation_Allocated Premium:${Summation-Allocated Premium}
    ${Summation-Allocated Premium_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[6])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[6])
    ${Summation-Allocated Premium_Value}=    remove string    ${Summation-Allocated Premium_Value}    ,
    ${Summation-Allocated Premium_Value}=    remove string    ${Summation-Allocated Premium_Value}    $
    log to console    ${Summation-Allocated Premium_Value}
    run keyword if    '${Summation-Allocated Premium}' == '${Summation-Allocated Premium_Value}'    log to console    Calculated Summation-Allocated Premium has the same value as given in Masterpremium    ELSE    log to console    Calculated Summation-Allocated Premium does not have the same value as given in Masterpremium
    ${Summation-Retail Commission $}=    Summation For All Layers    ${test_data}    9
    ${Summation-Retail Commission $}=    evaluate    round(${Summation-Retail Commission $},1)
    log to console    Summation_Retail Commission $:${Summation-Retail Commission $}
    ${Summation-Retail Commission $_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[7])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[7])
    ${Summation-Retail Commission $_Value}=   remove string    ${Summation-Retail Commission $_Value}    ,
    ${Summation-Retail Commission $_Value}=   remove string    ${Summation-Retail Commission $_Value}    $
    ${Summation-Retail Commission $_Value}=   evaluate    round(${Summation-Retail Commission $_Value},1)
    log to console    ${Summation-Retail Commission $_Value}
    run keyword if    '${Summation-Retail Commission $}' == '${Summation-Retail Commission $_Value}'    log to console    Calculated Summation-Retail Commission $ has the same value as given in Masterpremium    ELSE    log to console    Calculated Summation-Retail Commission $ does not have the same value as given in Masterpremium
    run keyword if   '${test_data['Cede Commission']}' == 'nan'    PD_Ceding  ${test_data}    ELSE    PD_Ceding with Value    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${Summation-Policy Fee $}=    Summation For All Layers    ${test_data}    11
    log to console    Summation_Policy Fee $:${Summation-Policy Fee $}
    ${Summation-Policy Fee $_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[9])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[9])
    ${Summation-Policy Fee $_Value}=    remove string    ${Summation-Policy Fee $_Value}    ,
    ${Summation-Policy Fee $_Value}=    remove string    ${Summation-Policy Fee $_Value}    $
    ${Summation-Policy Fee $_Value}=   evaluate    round(${Summation-Policy Fee $_Value},1)
    log to console    ${Summation-Policy Fee $_Value}
    run keyword if    '${Summation-Policy Fee $}' == '${Summation-Policy Fee $_Value}'    log to console    Calculated Summation-Policy Fee $ has the same value as given in Masterpremium    ELSE    log to console    Calculated Summation-Policy Fee $ does not have the same value as given in Masterpremium
    ${Allocated Premium}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text  //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[8]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[8]
    ${Allocated Premium}=    remove string    ${Allocated Premium}    ,
    ${Allocated Premium}=    remove string    ${Allocated Premium}    $
    ${Premium Distribution Calculation}=   Premium Distribution Layer Calculation    ${Allocated Premium}    ${Summation-Allocated Premium_Value}
    ${Premium Distribution Calculation}=    evaluate    round(${Premium Distribution Calculation},2)
    log to console    Premium Distribution:${Premium Distribution Calculation}
    ${Premium Distribution Calculation_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text  //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[12]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[12]
    ${Premium Distribution Calculation_Value}=    remove string    ${Premium Distribution Calculation_Value}    %
    ${Premium Distribution Calculation_Value}=    remove string    ${Premium Distribution Calculation_Value}    ,
    ${Premium Distribution Calculation_Value}=    remove string    ${Premium Distribution Calculation_Value}    $
    ${Premium Distribution Calculation_Value}=    evaluate    round(${Premium Distribution Calculation_Value},2)
    log to console    ${Premium Distribution Calculation_Value}
    run keyword if    '${Premium Distribution Calculation}%' == '${Premium Distribution Calculation_Value}%'    log to console    ${LayerName} Calculated Premium Distribution has the same value as given in Masterpremium    ELSE    log to console    ${LayerName} Calculated Premium Distribution does not have the same value as given in Masterpremium

PD_Ceding
    [Arguments]    ${test_data}
    ${Summation-Ceding Commission $}=    Summation For All Layers    ${test_data}    10
    log to console    Summation_Ceding Commission $:${Summation-Ceding Commission $}
    ${Summation-Ceding Commission $_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[8])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[8])
    ${Summation-Ceding Commission $_Value}=    remove string    ${Summation-Ceding Commission $_Value}    $
    ${Summation-Ceding Commission $_Value}=    evaluate    round(${Summation-Ceding Commission $_Value},1)
    log to console    ${Summation-Ceding Commission $_Value}
    run keyword if    '${Summation-Ceding Commission $}' == '${Summation-Ceding Commission $_Value}'    log to console    Calculated Summation-Ceding Commission $ has the same value as given in Masterpremium    ELSE    log to console    Calculated Summation-Ceding Commission $ does not have the same value as given in Masterpremium

PD_Ceding with Value
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${Ceding Commission $}=    Cede Commission Calculation    ${test_data['Annual Premium Charge-${Layer-count}']}    ${test_data['Cede Commission']}
    ${Ceding Commission $}=    convert to string    ${Ceding Commission $}
    ${Ceding Commission $}=    remove string    ${Ceding Commission $}    ,
    ${Ceding Commission $}=    fetch from left    ${Ceding Commission $}    .
    log to console   Ceding Commission $:${Ceding Commission $}
    ${Ceding Commission $ Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text    //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[10]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[10]
    ${Ceding Commission $ Value}=    remove string    ${Ceding Commission $ Value}    ,
    ${Ceding Commission $ Value}=    remove string    ${Ceding Commission $ Value}    $
    ${Ceding Commission $ Value}=    fetch from left    ${Ceding Commission $ Value}    .
    log to console   ${Ceding Commission $ Value}
    run keyword if    '${Ceding Commission $}' == '${Ceding Commission $ Value}'    log to console    ${LayerName} Calculated Ceding Commission $ has the same value as given in Masterpremium    ELSE    log to console    ${LayerName} Calculated Ceding Commission $ does not have the same value as given in Masterpremium
    ${Summation-Ceding Commission $}=    Summation For All Layers    ${test_data}    10
    ${Summation-Ceding Commission $}=    evaluate    round(${Summation-Ceding Commission $},1)
    log to console    Summation_Ceding Commission $:${Summation-Ceding Commission $}
    ${Summation-Ceding Commission $_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[8])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td[8])
    ${Summation-Ceding Commission $_Value}=    remove string    ${Summation-Ceding Commission $_Value}    $
    ${Summation-Ceding Commission $_Value}=    remove string    ${Summation-Ceding Commission $_Value}    ,
    ${Summation-Ceding Commission $_Value}=    evaluate    round(${Summation-Ceding Commission $_Value},1)
    log to console   ${Summation-Ceding Commission $_Value}
    run keyword if    '${Summation-Ceding Commission $}' == '${Summation-Ceding Commission $_Value}'    log to console    Calculated Summation-Ceding Commission $ has the same value as given in Masterpremium    ELSE    log to console    Calculated Summation-Ceding Commission $ does not have the same value as given in Masterpremium

Cede Commission Calculation
    [Arguments]    ${Premium Charge}    ${Cede Commission}
    ${Cede Commission Calculation}=    evaluate    (${Premium Charge} * ${Cede Commission}) / 100
    RETURN    ${Cede Commission Calculation}

Premium Distribution Layer Calculation
    [Arguments]    ${Allocated Premium}    ${Summation-Allocated Premium_Value}
    ${Premium Distribution Layer Calculation}=    evaluate    (${Allocated Premium} / ${Summation-Allocated Premium_Value}) * 100
    RETURN    ${Premium Distribution Layer Calculation}

Excess-Layer_count
    [Arguments]    ${Layer-count}
    ${Layer-count1}=  convert to integer    ${Layer-count}
    ${Layer-count2}=    evaluate    ${Layer-count1}+1
    ${Layer-count}=    convert to string    ${Layer-count2}
    RETURN    ${Layer-count}

Primary-Layer_count
    [Arguments]    ${Layer-count}
    RETURN    ${Layer-count}

Layer Validation_LD
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}
    wait until element is not visible   globalAjaxLoading  100
    ${Layer-countvalue}=    run keyword if    '${test_data['Class']}' == 'EXCESS'    Excess-Layer_count  ${Layer-count}    ELSE    Primary-Layer_count    ${Layer-count}
    ${MP_Limit}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[1]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[1]
    log to console   MP_Limit:${MP_Limit}
    ${MP_Limit}=    remove string    ${MP_Limit}    ,
    log to console    $${test_data["Limit-${Layer-count}"]}
    run keyword if   '$${test_data["Limit-${Layer-count}"]}' == '${MP_Limit}'    log to console    ${LayerName} LayerLimit in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} LayerLimit in Masterpremium does not have the same value as given in LDE
    wait until element is not visible   globalAjaxLoading  150
    ${Alternus Limit}=    Alternus Limit Calculation    ${test_data['Limit-${Layer-count}']}    ${test_data['Alternus Participation']}
    ${Alternus Limit}=    convert to string    ${Alternus Limit}
    ${Alternus Limit}=    remove string    ${Alternus Limit}    .0
    log to console   AlternusLimit:${Alternus Limit}
    ${Alternus Limit Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[3]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[3]
    log to console   ${Alternus Limit Value}
    ${Alternus Limit Value}=    remove string    ${Alternus Limit Value}    ,
    run keyword if    '$${Alternus Limit}' == '${Alternus Limit Value}'    log to console    ${LayerName} Calculated Alternus Limit has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Alternus Limit does not have the same value as given in MasterPremium
    ${MP_RetailCommission}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[4]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[4]
    log to console   MP_RetailCommission:${MP_RetailCommission}
    log to console    ${test_data["Retail Commission-${Layer-count} %"]}%
    run keyword if    '${test_data["Retail Commission-${Layer-count} %"]}%' == '${MP_RetailCommission}'    log to console    ${LayerName} Calculated Retail Commission % has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Retail Commission % does not have the same value as given in MasterPremium
    wait until element is not visible   globalAjaxLoading  100
    ${Annual Premium}=    Full Layer Annual Premium    ${test_data['Annual Premium Charge-${Layer-count}']}    ${test_data['Lead-${Layer-count} %']}
    ${Annual Premium}=    convert to string    ${Annual Premium}
    ${Annual Premium}=    Evaluate    round(${Annual Premium})
    log to console   Full Layer Annual Premium:${Annual Premium}
    ${Full Layer Annual Premium Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[5]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[5]
    log to console   ${Full Layer Annual Premium Value}
    ${Full Layer Annual Premium Value}=    remove string    ${Full Layer Annual Premium Value}    ,
    run keyword if    '$${Annual Premium}' == '${Full Layer Annual Premium Value}'    log to console    ${LayerName} Calculated Full Layer Annual Premium has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Full Layer Annual Premium does not have the same value as given in MasterPremium
    run keyword if  '${test_data['Manual Entry']}' == 'YES'    PolicyFee_LD    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}    ELSE    Lead_LD    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${MP_AllocatedPremium}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[7]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[7]
    log to console   MP_AllocatedPremium:${MP_AllocatedPremium}
    log to console    $${test_data["Annual Premium Charge-${Layer-count}"]}
    ${MP_AllocatedPremium}=    remove string    ${MP_AllocatedPremium}    ,
    run keyword if    '$${test_data["Annual Premium Charge-${Layer-count}"]}' == '${MP_AllocatedPremium}'    log to console    ${LayerName} Calculated Allocated Premium has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Allocated Premium does not have the same value as given in MasterPremium
    ${Layer Discounted Annual Premium}=    convert to integer    ${Annual Premium}
    ${Layer Discounted Annual Premium}=    evaluate   ${Layer Discounted Annual Premium} * 0.925
    ${Layer Discounted Annual Premium}=    evaluate    round(${Layer Discounted Annual Premium})
    log to console    Layer Discounted Annual Premium:${Layer Discounted Annual Premium}
    ${Layer Discounted Annual Premium Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[8]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[8]
    log to console   ${Layer Discounted Annual Premium Value}
    ${Layer Discounted Annual Premium Value}=    remove string    ${Layer Discounted Annual Premium Value}    ,
    run keyword if    '$${Layer Discounted Annual Premium}' == '${Layer Discounted Annual Premium Value}'    log to console    ${LayerName} Calculated Layer Discounted Annual Premium has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Layer Discounted Annual Premium does not have the same value as given in MasterPremium
    ${Modified Discounted Premium}=  convert to integer    ${Layer Discounted Annual Premium}
    ${Modified Discounted Premium}=    evaluate   ${Modified Discounted Premium} / (1 + (0 /100))
    ${Modified Discounted Premium}=    evaluate    round(${Modified Discounted Premium})
    log to console    Modified Discounted Premium:${Modified Discounted Premium}
    ${Modified Discounted Premium Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[9]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[9]
    log to console   ${Modified Discounted Premium Value}
    ${Modified Discounted Premium Value}=    remove string    ${Modified Discounted Premium Value}    ,
    run keyword if    '$${Modified Discounted Premium}' == '${Modified Discounted Premium Value}'    log to console    ${LayerName} Calculated Modified Discounted Premium has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Modified Discounted Premium does not have the same value as given in MasterPremium
    ${Final Layer Modified Premium}=  convert to integer    ${Modified Discounted Premium}
    ${Final Layer Modified Premium}=    evaluate   ${Final Layer Modified Premium} * (1 + (0 /100))
    ${Final Layer Modified Premium}=    evaluate    round(${Final Layer Modified Premium})
    log to console    Final Layer Modified Premium:${Final Layer Modified Premium}
    ${Final Layer Modified Premium Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[10]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[10]
    log to console   ${Final Layer Modified Premium Value}
    ${Final Layer Modified Premium Value}=    remove string    ${Final Layer Modified Premium Value}    ,
    run keyword if    '$${Final Layer Modified Premium}' == '${Final Layer Modified Premium Value}'    log to console    ${LayerName} Calculated Final Layer Modified Premium has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Final Layer Modified Premium does not have the same value as given in MasterPremium
    ${Alternus-AZ Quota Share}=  set variable    ${test_data['Alternus Participation']}
    log to console    Alternus-AZ Quota Share:${Alternus-AZ Quota Share}
    ${Alternus-AZ Quota Share Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[11]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[11]
    log to console   ${Alternus-AZ Quota Share Value}
    ${Alternus-AZ Quota Share Value}=    remove string    ${Alternus-AZ Quota Share Value}    %
    run keyword if    '${Alternus-AZ Quota Share}' == '${Alternus-AZ Quota Share Value}'    log to console    ${LayerName} Calculated Alternus-AZ Quota Share has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Alternus-AZ Quota Share does not have the same value as given in MasterPremium
    ${Alternus Term Premium}=    Alternus Term Premium    ${Layer Discounted Annual Premium}    ${test_data['Alternus Participation']}
    ${Alternus Term Premium}=    evaluate    round(${Alternus Term Premium})
    ${Alternus Term Premium Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[12]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[12]
    log to console   ${Alternus Term Premium Value}
    ${Alternus Term Premium Value}=    remove string    ${Alternus Term Premium Value}    ,
    run keyword if    '$${Alternus Term Premium}' == '${Alternus Term Premium Value}'    run keywords    log to console    Alternus Term Premium:${Alternus Term Premium}    AND    log to console    ${LayerName} Calculated Alternus Term Premium has the same value as given in MasterPremium
    ${SummationATP}=    run keyword if    '$${Alternus Term Premium}' != '${Alternus Term Premium Value}'    evaluate  ${Alternus Term Premium} + 1
    run keyword if    '$${SummationATP}' == '${Alternus Term Premium Value}'    run keywords    log to console    Alternus Term Premium:${SummationATP}    AND    log to console    ${LayerName} Calculated Alternus Term Premium has the same value as given in MasterPremium
    ${Alternus-Master Layer Premium}=    run keyword if    '${test_data['Reinsurance required?']}' == 'YES'    Alternus-Master Layer Premium-With Reinsurance required    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}  ${Layer-countvalue}    ${AlternusTermPremium}    ELSE    Alternus-Master Layer Premium-Without Reinsurance required    ${Alternus Term Premium}
    log to console    Alternus-Master Layer Premium:${Alternus-Master Layer Premium}
    ${Alternus-Master Layer Premium Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[15]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[15]
    log to console   ${Alternus-Master Layer Premium Value}
    ${Alternus-Master Layer Premium Value}=    remove string    ${Alternus-Master Layer Premium Value}    ,
    ${Alternus-Master Layer Premium Value}=    remove string    ${Alternus-Master Layer Premium Value}    $
    run keyword if    '${Alternus-Master Layer Premium}' == '${Alternus-Master Layer Premium Value}'    log to console    ${LayerName} Calculated Alternus-Master Layer Premium has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Alternus-Master Layer Premium does not have the same value as given in MasterPremium
    ${Commission $}=   Commission $    ${Alternus-Master Layer Premium}    ${test_data["Retail Commission-${Layer-count} %"]}
    ${Commission $}=    convert to string    ${Commission $}
    ${Commission $}=    fetch from left    ${Commission $}    .
    log to console   Commission $:${Commission $}
    ${Commission $ Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[16]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[16]
    ${Commission $ Value}=    remove string    ${Commission $ Value}    $
    ${Commission $ Value}=    fetch from left    ${Commission $ Value}    .
    log to console   ${Commission $ Value}
    run keyword if    '${Commission $}' == '${Commission $ Value}'    log to console    ${LayerName} Calculated Commission $ has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Commission $ does not have the same value as given in MasterPremium
    run keyword if   '${test_data['Cede Commission']}' == 'nan'    MP_Ceding  ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}    17    ${Alternus-Master Layer Premium Value}    ELSE    MP_Ceding with Value    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}  17    ${Alternus-Master Layer Premium Value}
    run keyword if  '${test_data['TRIA']}' == 'YES'    TRIA_LD    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    run keyword if  '${test_data['Reinsurance required?']}' == 'YES'    ReinsuranceRequired_LD    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${Summation-Alternus-Master Layer Premium_Value}=    run keyword if  '${test_data['Reinsurance required?']}' == 'YES'    Layer % Distribution calculation_REIN    ${test_data}    ELSE    Layer % Distribution calculation_NO_REIN    ${test_data}
    ${Layer % Distribution}=   Layer % Distribution Calculation    ${Alternus-Master Layer Premium Value}    ${Summation-Alternus-Master Layer Premium_Value}
    ${Layer % Distribution}=    evaluate    round(${Layer % Distribution},1)
    log to console    Layer % Distribution:${Layer % Distribution}
    ${Layer % Distribution_Value}=  run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[18]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[18]
    ${Layer % Distribution_Value}=    remove string    ${Layer % Distribution_Value}    %
    ${Layer % Distribution_Value}=    evaluate    round(${Layer % Distribution_Value},1)
    log to console    ${Layer % Distribution_Value}
    run keyword if    '${Layer % Distribution}' == '${Layer % Distribution_Value}'    log to console    ${LayerName} Calculated Layer % Distribution has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Layer % Distribution does not have the same value as given in MasterPremium

Layer % Distribution calculation_NO_REIN
    [Arguments]    ${test_data}
    ${Summation-Mura Layer Premium}=    Summation For All Layers    ${test_data}    13
    log to console    SummationMURALayerPremium:${Summation-Mura Layer Premium}
    ${Summation-Mura Layer Premium_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[6])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[6])
    log to console   ${Summation-Mura Layer Premium_Value}
    run keyword if    '$${Summation-Mura Layer Premium}' == '${Summation-Mura Layer Premium_Value}'    log to console    Layer Premium has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-Mura Layer Premium does not have the same value as given in MasterPremium
    ${Summation-Other Layer Premium}=    Summation For All Layers    ${test_data}    14
    log to console    SummationotherLayerPremium:${Summation-Other Layer Premium}
    ${Summation-Other Layer Premium_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[7])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[7])
    log to console    ${Summation-Other Layer Premium_Value}
    run keyword if    '$${Summation-Other Layer Premium}' == '${Summation-Other Layer Premium_Value}'    log to console    Calculated Summation-Other Layer Premium has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-Other Layer Premium does not have the same value as given in MasterPremium
    ${Summation-Alternus-Master Layer Premium}=    Summation For All Layers    ${test_data}    15
    log to console    SummationAMLP:${Summation-Alternus-Master Layer Premium}
    ${Summation-Alternus-Master Layer Premium_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[8])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[8])
    log to console    ${Summation-Alternus-Master Layer Premium_Value}
    ${Summation-Alternus-Master Layer Premium_Value}=    remove string    ${Summation-Alternus-Master Layer Premium_Value}    ,
    run keyword if    '$${Summation-Alternus-Master Layer Premium}' == '${Summation-Alternus-Master Layer Premium_Value}'    log to console    Calculated Summation-Alternus-Master Layer Premium has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-Alternus-Master Layer Premium does not have the same value as given in MasterPremium
    ${Summation-Commission}=    Summation For All Layers    ${test_data}    16
    ${Summation-Commission}=   evaluate    round(${Summation-Commission},1)
    log to console    SummationCommission:${Summation-Commission}
    ${Summation-Commission_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[9])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[9])
    ${Summation-Commission_Value}=   remove string    ${Summation-Commission_Value}    $
    ${Summation-Commission_Value}=   evaluate    round(${Summation-Commission_Value},1)
    log to console    ${Summation-Commission_Value}
    run keyword if    '${Summation-Commission}' == '${Summation-Commission_Value}'    log to console    Calculated Summation-Commission has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-Commission does not have the same value as given in MasterPremium
    ${Summation-CedingCommission}=  Summation For All Layers    ${test_data}    17
    ${Summation-CedingCommission}=    convert to string    ${Summation-CedingCommission}
    ${Summation-CedingCommission}=  fetch from left    ${Summation-CedingCommission}    .
    log to console    SummationCedingCommission:${Summation-CedingCommission}
    ${Summation-CedingCommission_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[10])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[10])
    ${Summation-CedingCommission_Value}=    remove string    ${Summation-CedingCommission_Value}    $
    ${Summation-CedingCommission_Value}=    remove string    ${Summation-CedingCommission_Value}    ,
    ${Summation-CedingCommission_Value}=  fetch from left    ${Summation-CedingCommission_Value}    .
    log to console    ${Summation-CedingCommission_Value}
    run keyword if    '${Summation-CedingCommission}' == '${Summation-CedingCommission_Value}'    log to console    Calculated Summation-CedingCommission has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-CedingCommission does not have the same value as given in MasterPremium
    RETURN    ${Summation-Alternus-Master Layer Premium_Value}

Layer % Distribution calculation_REIN
    [Arguments]    ${test_data}
    ${Summation-Mura Layer Premium}=    Summation For All Layers    ${test_data}    13
    log to console    SummationMURALayerPremium:${Summation-Mura Layer Premium}
    ${Summation-Mura Layer Premium_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[6])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[6])
    ${Summation-Mura Layer Premium_Value}=    remove string    ${Summation-Mura Layer Premium_Value}    ,
    log to console    ${Summation-Mura Layer Premium_Value}
    run keyword if    '$${Summation-Mura Layer Premium}' == '${Summation-Mura Layer Premium_Value}'    log to console    Calculated Summation-Mura Layer Premium has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-Mura Layer Premium does not have the same value as given in MasterPremium
    ${Summation-Other Layer Premium}=    Summation For All Layers    ${test_data}    14
    log to console    SummationotherLayerPremium:${Summation-Other Layer Premium}
    ${Summation-Other Layer Premium_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[7])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[7])
    ${Summation-Other Layer Premium_Value}=    remove string    ${Summation-Other Layer Premium_Value}    ,
    log to console    ${Summation-Other Layer Premium_Value}
    run keyword if    '$${Summation-Other Layer Premium}' == '${Summation-Other Layer Premium_Value}'    log to console    Calculated Summation-Other Layer Premium has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-Other Layer Premium does not have the same value as given in MasterPremium
    ${Summation-Alternus-Master Layer Premium}=    Summation For All Layers    ${test_data}    15
    ${Summation-Alternus-Master Layer Premium_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[8])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[8])
    ${Summation-Alternus-Master Layer Premium_Value}=    remove string    ${Summation-Alternus-Master Layer Premium_Value}    ,
    log to console  ${Summation-Alternus-Master Layer Premium_Value}
    run keyword if    '$${Summation-Alternus-Master Layer Premium}' == '${Summation-Alternus-Master Layer Premium_Value}'    run keywords    log to console    SummationAMLP:${Summation-Alternus-Master Layer Premium}    AND    log to console    Calculated Summation-Alternus-Master Layer Premium has the same value as given in MasterPremium
    ${SummationAMLP}=    run keyword if    '$${Summation-Alternus-Master Layer Premium}' != '${Summation-Alternus-Master Layer Premium_Value}'    evaluate  ${Summation-Alternus-Master Layer Premium} - 1
    run keyword if    '$${SummationAMLP}' == '${Summation-Alternus-Master Layer Premium_Value}'    run keywords    log to console    SummationAMLP:${SummationAMLP}    AND    log to console    Calculated Summation-Alternus-Master Layer Premium has the same value as given in MasterPremium
    ${Summation-Commission}=    Summation For All Layers    ${test_data}    16
    ${Summation-Commission}=    evaluate   round(${Summation-Commission},1)
    log to console    SummationCommission:${Summation-Commission}
    ${Summation-Commission_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[9])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[9])
    ${Summation-Commission_Value}=   remove string    ${Summation-Commission_Value}    $
    ${Summation-Commission_Value}=   evaluate    round(${Summation-Commission_Value},1)
    log to console    ${Summation-Commission_Value}
    run keyword if    '${Summation-Commission}' == '${Summation-Commission_Value}'    log to console    Calculated Summation-Commission has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-Commission does not have the same value as given in MasterPremium
    ${Summation-CedingCommission}=  Summation For All Layers    ${test_data}    17
    ${Summation-CedingCommission}=    convert to string    ${Summation-CedingCommission}
    ${Summation-CedingCommission}=  fetch from left    ${Summation-CedingCommission}    .
    log to console    SummationCedingCommission:${Summation-CedingCommission}
    ${Summation-CedingCommission_Value}=   run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[10])    ELSE    get text    (//b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td[10])
    ${Summation-CedingCommission_Value}=    remove string    ${Summation-CedingCommission_Value}    $
    ${Summation-CedingCommission_Value}=    remove string    ${Summation-CedingCommission_Value}    ,
    ${Summation-CedingCommission_Value}=  fetch from left    ${Summation-CedingCommission_Value}    .
    log to console    ${Summation-CedingCommission_Value}
    run keyword if    '${Summation-CedingCommission}' == '${Summation-CedingCommission_Value}'    log to console    Calculated Summation-CedingCommission has the same value as given in MasterPremium    ELSE    log to console    Calculated Summation-CedingCommission does not have the same value as given in MasterPremium
    RETURN    ${Summation-Alternus-Master Layer Premium_Value}

Layer % Distribution Calculation
    [Arguments]    ${Alternus-Master Layer Premium Value}    ${Summation-Alternus-Master Layer Premium_Value}
    ${Alternus-Master Layer Premium Value}=    remove string    ${Alternus-Master Layer Premium Value}    $
    ${Summation-Alternus-Master Layer Premium_Value}=    remove string    ${Summation-Alternus-Master Layer Premium_Value}    $
    ${Layer % Distribution Calculation}=   evaluate    (${Alternus-Master Layer Premium Value} / ${Summation-Alternus-Master Layer Premium_Value}) * 100
    RETURN    ${Layer % Distribution Calculation}

Master Premium Layers Value for ALL RISK
    [Arguments]    ${test_data}    ${Layer-Index}    ${Layer-countvalue}    ${Layer-position}
    ${Layer-Value}=    run keyword if    '${test_data['ALL_RISK']}' == 'YES'    get text    //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[${Layer-position}]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[${Layer-position}]
    ${Layer-Value}=    remove string   ${Layer-Value}    $
    ${Layer-Value}=    remove string   ${Layer-Value}    ,
    RETURN    ${Layer-Value}

Master Premium Layers Value for TRIA
    [Arguments]    ${test_data}    ${Layer-Index}    ${Layer-countvalue}    ${Layer-position}
    ${Layer-Value}=    run keyword if    '${test_data['TRIA']}' == 'YES'    get text   //b[i[contains(text(), 'TRIA Coverage')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[${Layer-position}]
    ${Layer-Value}=    remove string   ${Layer-Value}    $
    RETURN    ${Layer-Value}

Summation for 2 layers
    [Arguments]    ${test_data}    ${Layer-position}
    ${Layer1}=    run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    2    1    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    2    0    ${Layer-position}
    ${Layer2}=  run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    3   2    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    3    1    ${Layer-position}
    ${Summation of Layers}=   evaluate    ${Layer1} + ${Layer2}
    RETURN    ${Summation of Layers}

Summation for 3 layers
    [Arguments]    ${test_data}    ${Layer-position}
    ${Layer1}=    run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    2    1    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    2    0    ${Layer-position}
    ${Layer2}=  run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    3    2    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    3    1    ${Layer-position}
    ${Layer3}=  run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    4    3    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    4    2    ${Layer-position}
    ${Summation of Layers}=   evaluate    (${Layer1}) + (${Layer2}) + (${Layer3})
    RETURN    ${Summation of Layers}

Summation for 4 layers
    [Arguments]    ${test_data}    ${Layer-position}
    ${Layer1}=    run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    2    1    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    2    0    ${Layer-position}
    ${Layer2}=  run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    3    2    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    3    1    ${Layer-position}
    ${Layer3}=  run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    4    3    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    4    2    ${Layer-position}
    ${Layer4}=  run keyword if    '${test_data['Class']}' == 'EXCESS'    Master Premium Layers Value for ALL RISK   ${test_data}    5    4    ${Layer-position}    ELSE    Master Premium Layers Value for ALL RISK   ${test_data}    5    3    ${Layer-position}
    ${Summation of Layers}=   evaluate    ${Layer1} + ${Layer2} + ${Layer3} + ${Layer4}
    RETURN    ${Summation of Layers}

Summation For All Layers
    [Arguments]   ${test_data}    ${Layer-position}
    ${Layer_Count}=    get element count    //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr
    ${Layer_Count}=    convert to integer    ${Layer_Count}
    ${Summation Value}=    run keyword if    '${Layer_Count}' == '6'    Summation for 4 layers    ${test_data}    ${Layer-position}    ELSE IF    '${Layer_Count}' == '5'    Summation for 3 layers    ${test_data}    ${Layer-position}    ELSE IF    '${Layer_Count}' == '4'    Summation for 2 layers    ${test_data}    ${Layer-position}
    RETURN    ${Summation Value}

Ceding Commission
    [Arguments]   ${Alternus-Master Layer Premium}
    ${Alternus-Master Layer Premium}=    convert to integer   ${Alternus-Master Layer Premium}
    ${Ceding commission}=    evaluate    (${Alternus-Master Layer Premium} * 0) / 100
    RETURN    ${Ceding commission}

MP_Ceding
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}    ${Layer-Position}    ${Alternus-Master Layer Premium Value}
    ${Ceding Commission}=    Ceding Commission  ${Alternus-Master Layer Premium Value}
    ${Ceding Commission}=    convert to string    ${Ceding Commission}
    ${Ceding Commission}=    fetch from left    ${Ceding Commission}    .
    log to console  Ceding Commission:${Ceding Commission}
    ${Ceding Commission Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[${Layer-Position}]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[${Layer-Position}]
    ${Ceding Commission Value}=    remove string    ${Ceding Commission Value}    $
    ${Ceding Commission Value}=    convert to string    ${Ceding Commission Value}
    ${Ceding Commission Value}=    fetch from left    ${Ceding Commission Value}    .
    log to console   ${Ceding Commission Value}
    run keyword if    '${Ceding Commission}' == '${Ceding Commission Value}'    log to console    ${LayerName} Calculated Ceding Commission has the same calculated value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Ceding Commission does not have the same value as given in Masterpremium

Ceding Commission with Value
    [Arguments]   ${Alternus-Master Layer Premium}    ${ceding commission}
    ${Ceding commission}=    evaluate    (${Alternus-Master Layer Premium} * ${ceding commission}) / 100
    RETURN    ${Ceding commission}

MP_Ceding with Value
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}  ${Layer-Position}    ${Alternus-Master Layer Premium Value}
    ${Ceding Commission}=    Ceding Commission with Value  ${Alternus-Master Layer Premium Value}    ${test_data['Cede Commission']}
    ${Ceding Commission}=    evaluate    round(${Ceding Commission},1)
    log to console    Ceding Commission:${Ceding Commission}
    ${Ceding Commission Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[${Layer-Position}]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[${Layer-Position}]
    ${Ceding Commission Value}=    remove string    ${Ceding Commission Value}    $
    ${Ceding Commission Value}=    evaluate    round(${Ceding Commission Value},1)
    log to console   ${Ceding Commission Value}
    run keyword if    '${Ceding Commission}' == '${Ceding Commission Value}'    log to console    ${LayerName} Calculated Ceding Commission has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Ceding Commission does not have the same value as given in Masterpremium

Calculation without reinsurance
    ${Alternus-Master Layer Premium}=  Alternus-Master Layer Premium-Without Reinsurance required    ${Alternus Term Premium}
    log to console    Alternus-Master Layer Premium:${Alternus-Master Layer Premium}
    ${Alternus-Master Layer Premium Value}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[15]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[15]
    log to console   ${Alternus-Master Layer Premium Value}
    ${Alternus-Master Layer Premium Value}=    remove string    ${Alternus-Master Layer Premium Value}    ,
    run keyword if    '$${Alternus-Master Layer Premium}' == '${Alternus-Master Layer Premium Value}'    log to console    ${LayerName} Calculated Alternus-Master Layer Premium has the same value as given in MasterPremium    ELSE    log to console    ${LayerName} Calculated Alternus-Master Layer Premium does not have the same value as given in Masterpremium

Alternus-Master Layer Premium-Without Reinsurance required
    [Arguments]    ${AlternusTermPremium}
    ${AlternusTermPremium}=    convert to integer    ${AlternusTermPremium}
    ${Alternus-Master_Layer_Premium}=    evaluate   ${AlternusTermPremium} - 0 - 0
    RETURN    ${Alternus-Master_Layer_Premium}

Commission $
    [Arguments]    ${Alternus-Master Layer Premium}    ${Retail Commission %}
    ${Alternus-Master Layer Premium}=    convert to integer   ${Alternus-Master Layer Premium}
    ${Commission $}=    evaluate    (${Alternus-Master Layer Premium} * ${Retail Commission %}) / 100
    RETURN   ${Commission $}

Lead_LD
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${MP_Lead%}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[6]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[6]
    log to console   MP_Lead%:${MP_Lead%}
    log to console    ${test_data["Lead-${Layer-count} %"]}
    ${MP_Lead%}=    remove string    ${MP_Lead%}    ,
    run keyword if    '${test_data["Lead-${Layer-count} %"]}%' == '${MP_Lead%}'    log to console    ${LayerName} Lead % in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} Lead % in Masterpremium does not have the same value as given in LDE

Alternus Limit Calculation
    [Arguments]    ${Limit}    ${AlternusParticipation}
    ${Limit}=    convert to integer    ${Limit}
    ${AlternusParticipation}=    evaluate    round(${AlternusParticipation},3)
    ${Alternus_Limit}=    evaluate    ${Limit} * ${AlternusParticipation} / 100
    RETURN    ${Alternus_Limit}

Full Layer Annual Premium
    [Arguments]    ${Annual Premium Charge}    ${Lead}
    ${PremiumCharge}=    convert to integer    ${Annual Premium Charge}
    ${Lead}=    convert to string   ${Lead}
    ${Lead}=    remove string    ${Lead}    .00
    ${Lead}=    convert to integer    ${Lead}
    ${Full_Layer_Annual_Premium}=    evaluate   (${Annual Premium Charge} / ${Lead}) * 100
    RETURN    ${Full_Layer_Annual_Premium}

Alternus Term Premium
    [Arguments]    ${Discounted Annual Premium}  ${AlternusParticipation}
    ${Alternus_Term_Premium}=   evaluate    (${Discounted Annual Premium} * ${AlternusParticipation} * 1) / 100
    RETURN   ${Alternus_Term_Premium}

TRIA_PD
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${MP_AllocatedTRIAPremium}=    get text   //b[i[contains(text(), 'TRIA Coverage')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[8]
    log to console   MP_AllocatedTRIAPremium:${MP_AllocatedTRIAPremium}
    ${MP_AllocatedTRIAPremium}=    remove string    ${MP_AllocatedTRIAPremium}    ,
    log to console    $${test_data["Annual TRIA Premium Charge-${Layer-count}"]}
    run keyword if    '$${test_data["Annual TRIA Premium Charge-${Layer-count}"]}' == '${MP_AllocatedTRIAPremium}'    log to console    ${LayerName} TRIA Premium Charge in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} TRIA Premium Charge in Masterpremium does not have the same value as given in LDE

TRIA_LD
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${MP_AllocatedTRIAPremium}=    get text   //b[i[contains(text(), 'TRIA Coverage')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[7]
    log to console   MP_AllocatedTRIAPremium:${MP_AllocatedTRIAPremium}
    ${MP_AllocatedTRIAPremium}=    remove string    ${MP_AllocatedTRIAPremium}    ,
    log to console    $${test_data["Annual TRIA Premium Charge-${Layer-count}"]}
    run keyword if    '$${test_data["Annual TRIA Premium Charge-${Layer-count}"]}' == '${MP_AllocatedTRIAPremium}'    log to console    ${LayerName} TRIA Premium Charge in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} TRIA Premium Charge in Masterpremium does not have the same value as given in LDE

PolicyFee_LD
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${MP_PolicyFee}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[11]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[11]
    log to console   MP_PolicyFee:${MP_PolicyFee}
    log to console    $${test_data["Policy Fee-${Layer-count}"]}
    ${MP_PolicyFee}=    remove string    ${MP_PolicyFee}    ,
    run keyword if    '$${test_data["Policy Fee-${Layer-count}"]}' == '${MP_PolicyFee}'    log to console    ${LayerName} Policy Fee in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} Policy Fee in Masterpremium does not have the same value as given in LDE

PolicyFee_PD
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${MP_PolicyFee}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[11]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[11]
    log to console   MP_PolicyFee:${MP_PolicyFee}
    log to console    $${test_data["Policy Fee-${Layer-count}"]}
    ${MP_PolicyFee}=    remove string    ${MP_PolicyFee}    ,
    run keyword if    '$${test_data["Policy Fee-${Layer-count}"]}' == '${MP_PolicyFee}'    log to console    ${LayerName} Policy Fee in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} Policy Fee in Masterpremium does not have the same value as given in LDE

ReinsuranceRequired_LD
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}
    ${MP_MURAPremiumAllocation}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[13]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[13]
    log to console   ${MP_MURAPremiumAllocation}
    log to console   $${test_data["MURA Premium Allocation-${Layer-count}"]}
    ${MP_MURAPremiumAllocation}=    remove string    ${MP_MURAPremiumAllocation}    ,
    run keyword if    '$${test_data["MURA Premium Allocation-${Layer-count}"]}' == '${MP_MURAPremiumAllocation}'    log to console    ${LayerName} MURA Premium Allocation in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} MURA Premium Allocation in Masterpremium does not have the same value as given in LDE
    ${MP_OtherPremiumAllocation}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[14]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[14]
    log to console   ${MP_OtherPremiumAllocation}
    log to console    $${test_data["Other Premium Allocation-${Layer-count}"]}
    ${MP_OtherPremiumAllocation}=    remove string    ${MP_OtherPremiumAllocation}    ,
    run keyword if    '$${test_data["Other Premium Allocation-${Layer-count}"]}' == '${MP_OtherPremiumAllocation}'    log to console    ${LayerName} Other Premium Allocation in Masterpremium has the same value as given in LDE    ELSE    log to console    ${LayerName} Other Premium Allocation in Masterpremium does not have the same value as given in LDE

Alternus-Master Layer Premium-With Reinsurance required
    [Arguments]    ${test_data}    ${LayerName}    ${Layer-Index}    ${Layer-count}    ${Layer-countvalue}    ${AlternusTermPremium}
    ${Alternus-Term-Premium}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text   //b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[12]    ELSE    get text    //b[i[contains(text(), 'Named PERIL ')]]//following-sibling::table[1]//tbody//tr[${Layer-Index}]//td[contains(text(),'${Layer-countvalue}')][1]//following-sibling::td[12]
    ${Alternus-Term-Premium}=    convert to string    ${Alternus-Term-Premium}
    ${Alternus-Term-Premium}=    remove string    ${Alternus-Term-Premium}    ,
    ${Alternus-Term-Premium}=    remove string    ${Alternus-Term-Premium}    $
    ${Alternus-Master Layer Premium}=  Alternus-Master Layer Premium-With Reinsurance    ${Alternus-Term-Premium}   ${test_data["MURA Premium Allocation-${Layer-count}"]}  ${test_data["Other Premium Allocation-${Layer-count}"]}
    RETURN    ${Alternus-Master Layer Premium}

Alternus-Master Layer Premium-With Reinsurance
    [Arguments]    ${AlternusTermPremium}    ${MURAPremium}    ${OtherPremium}
    ${AlternusTermPremium}=    convert to integer    ${AlternusTermPremium}
    ${MURAPremium}=    convert to integer    ${MURAPremium}
    ${OtherPremium}=    convert to integer    ${OtherPremium}
    ${Alternus-Master_Layer_Premium}=    evaluate   ${AlternusTermPremium} - ${MURAPremium} - ${OtherPremium}
    RETURN    ${Alternus-Master_Layer_Premium}

Check_TRIA
    [Arguments]  ${test_data}
    run keyword if    '${test_data['Manual Entry']}' == 'YES'    MP_TRIA_Premium    ELSE    MP_TRIA_Layered

MP_All Risk_Premium
    [Arguments]  ${test_data}
    ${All-Risk-PD}=    run keyword if    '${test_data['ALL_RISK']}' == 'YES'    get text    (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td)[last()]    ELSE    get text    (//b[i[contains(text(), 'Named PERIL')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td)[last()]
    run keyword if   '${All-Risk-PD}' == '100.00%'    log to console    All Risk/Single Peril Premium Distribution is equal to 100%    ELSE    log to console    All Risk Premium Distribution is not equal to 100%

MP_TRIA_Premium
    ${TRIA-PD}=    get text    (//b[i[contains(text(), 'TRIA')]]//following-sibling::table[2]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td)[last()]        #(//b[i[contains(text(), 'All Risk')]]//following-sibling::table[2]//tbody[tr[th[b[text()='Premium Distribuion']]]]//tr[td[@colspan='4']]//td)[last()]
    run keyword if   '${TRIA-PD}' == '100.00%'    log to console    TRIA Premium Distribution is equal to 100%    ELSE    log to console    TRIA Premium Distribution is not equal to 100%

MP_All Risk_Layered
    [Arguments]  ${test_data}
    ${MFOE-All-Risk-PD}=    run keyword if     '${test_data['ALL_RISK']}' == 'YES'    get text    (//b[i[contains(text(), 'All Risk')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td)[last()]    ELSE    get text    (//b[i[contains(text(), 'Named PERIL')]]//following-sibling::table[1]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td)[last()]
    run keyword if   '${MFOE-All-Risk-PD}' == '100.00%'    log to console    All Risk Layer % Distribution is equal to 100%    ELSE    log to console    All Risk Premium Distribution is not equal to 100%

MP_TRIA_Layered
    ${MFOE-TRIA-PD}=    get text    (//b[i[contains(text(), 'TRIA')]]//following-sibling::table[2]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td)[last()]       #(//b[i[contains(text(), 'All Risk')]]//following-sibling::table[2]//tbody[tr[th[b[text()='Layer % Distribution']]]]//tr[td[@colspan='4']]//td)[last()]
    run keyword if   '${MFOE-TRIA-PD}' == '100.00%'    log to console    TRIA Layer % Distribution is equal to 100%    ELSE    log to console    TRIA Premium Distribution is not equal to 100%

Endorsement Master Premium
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    ${PI-applycontinue}=    run keyword and return status  element should be visible    ${ID-MP-Apply&Continue}
    run keyword if   ${PI-applycontinue}    log to console   Navigated to MasterPremium Tab
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-MP-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible    ${ID-MP-ApplyChanges}
    run keyword if    ${Apply_changes}    click element     ${ID-MP-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Reinsurance MP
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    click element  ${ID-MP-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible    ${ID-MP-ApplyChanges}
    run keyword if    ${Apply_changes}    click element     ${ID-MP-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]