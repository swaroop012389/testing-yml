*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../../Resource/Alternus_Res/Endorsements.robot

*** Variables ***
${ID-QLP-QuoteExpand}=    //img[contains(@id, 'imgtdQuote_Letter')]
${ID-QLP-Quoteclear}=    //a[contains(@id, 'clearCurrentLink')]
${Name-QLP-Territory}=    name=OptionalParagraphs[16].IsSelected
${ID-QLP-Territory}=    id=OptionalParagraphs_16__Text
${Name-QLP-PolicyForm}=    name=OptionalParagraphs[17].IsSelected
${ID-QLP-PolicyForm}=    id=OptionalParagraphs_17__Text
${Name-QLP-Descriptionproperty}=    name=OptionalParagraphs[18].IsSelected
${ID-QLP-Descriptionproperty}=    id=OptionalParagraphs_18__Text
${Name-QLP-Perils}=    name=OptionalParagraphs[19].IsSelected
${ID-QLP-Perils}=    id=OptionalParagraphs_19__Text
${Name-QLP-Locations}=    name=OptionalParagraphs[21].IsSelected
${ID-QLP-Locations}=    //textarea[@id='OptionalParagraphs_21__Text']
${ID-QLP-BinderExpand}=    //img[contains(@id, 'imgtdBinder_Letter')]
${Name-QLP-Reinsurance}=    name=OptionalParagraphs[1].IsSelected
${ID-QLP-ReinsurancePno}=    id=OptionalParagraphs_1__Text
${ID-UW-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${ID-UW-Rating}=  //a[contains(text(),'Rating')]
${ID-UW-Endorsements}=  //a[contains(text(),'Endorsements')]
${ID-UW-Quote Letter Paragraphs}=  //a[contains(text(),'Quote Letter Paragraphs')]
${QLP-Save}=    //input[@value='Save']
${QLP-AddEndorsements}=    //a[contains(@href, 'javascript:AddEndorsement();')]
${AddEndorsements_Alternus-MFOE-NA}=    //a[contains(@href, "javascript:AddEndorsementToQuote(3315, 'Alternus-MFOE-NA(4-17)')")]
${Name-QLP-Cancellationdays}=    name=OptionalParagraphs[24].IsSelected
${ID-QLP-Cancellationdays}=    id=OptionalParagraphs_24__Text
${Name-QLP-Sublimits}=    name=OptionalParagraphs[20].IsSelected
${ID-QLP-Sublimits}=    id=OptionalParagraphs_20__Text
${Name-QLP-Additionalterms}=    name=OptionalParagraphs[25].IsSelected
${ID-QLP-Additionalterms}=    id=OptionalParagraphs_25__Text
${QLP-Save&CopytoBinder}=    //input[@value='Save & copy to binder letter']
${ID-endorsementName}=    id=Name
${Endorsement-Search}=    //input[@value='Search']
${Endorsement-Link}=    //a[contains(@href, "javascript:AddEndorsementToQuote")]
${Name-QLP-FrontingCedingCommission}=    name=OptionalParagraphs[22].IsSelected
${ID-QLP-FrontingCedingCommission}=    id=OptionalParagraphs_22__Text
${Name-QLP-ReinsurancePaymentterm}=    name=OptionalParagraphs[23].IsSelected
${ID-QLP-ReinsurancePaymentterm}=    id=OptionalParagraphs_23__Text
###K&R###
${ID-Checklist-Items}=  //img[contains(@id, 'imgtdCHCK_Check_List_Items')]
${ID-Completed_App}=    //input[@id='OptionalParagraphs_0__IsSelected']
${ID-Save-Button}=     (//input[@type='button'])[1]

*** Keywords ***
Quote Letter Paragraphs
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-UW-UNDERWRITING}    60
    wait until element is enabled    ${ID-UW-UNDERWRITING}  60
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    link=Quote Letter Paragraphs    100
    wait until element is enabled    link=Quote Letter Paragraphs  100
    click element  link=Quote Letter Paragraphs
    wait until element is not visible   globalAjaxLoading  100

QLP BinderLetter
    [Arguments]    ${test_data}
    Quote Letter Paragraphs
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-QLP-BinderExpand}
    wait until element is not visible   globalAjaxLoading  100
    select checkbox   ${Name-QLP-Reinsurance}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-ReinsurancePno}  ${test_data['Reinsurance Policy Number']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save}
    wait until element is not visible   globalAjaxLoading  100

QLP QuoteLetter
    [Arguments]    ${test_data}
    wait until element is visible    ${ID-QLP-QuoteExpand}    60
    click element  ${ID-QLP-QuoteExpand}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Territory_Check']}' == 'YES'    select checkbox  ${Name-QLP-Territory}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-Territory}    ${test_data['Territory']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Policyform_Check']}' == 'YES'    select checkbox  ${Name-QLP-PolicyForm}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-PolicyForm}    ${test_data['Policy Form']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Description of Property_Check']}' == 'YES'    select checkbox  ${Name-QLP-Descriptionproperty}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-Descriptionproperty}    ${test_data['Description of Property']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Perils/Coverage_Check']}' == 'YES'    select checkbox  ${Name-QLP-Perils}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-Perils}    ${test_data['Perils/Coverage']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Sublimits & Deductibles_Check']}' == 'YES'    select checkbox  ${Name-QLP-Sublimits}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-Sublimits}    ${test_data['Sublimits & Deductibles']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Locations_Check']}' == 'YES'    select checkbox  ${Name-QLP-Locations}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-Locations}    ${test_data['Locations']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['FrontingCedingCommission_Check']}' == 'YES'    select checkbox    ${Name-QLP-FrontingCedingCommission}
    check and enter input   ${ID-QLP-FrontingCedingCommission}    ${test_data['FrontingCedingCommission']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Reinsurance Payment Term_Check']}' == 'YES'    select checkbox    ${Name-QLP-ReinsurancePaymentterm}
    check and enter input   ${ID-QLP-ReinsurancePaymentterm}    ${test_data['Reinsurance Payment Term']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Cancellation days_Check']}' == 'YES'    select checkbox  ${Name-QLP-Cancellationdays}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-Cancellationdays}    ${test_data['Cancellation days']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['Additional Terms & Conditions_Check']}' == 'YES'    select checkbox  ${Name-QLP-Additionalterms}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-QLP-Additionalterms}    ${test_data['Additional Terms & Conditions']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save&CopytoBinder}
    wait until element is not visible   globalAjaxLoading  100

Quote Letter Paragraphs with selecting options
    [Arguments]    ${test_data}
    Quote Letter Paragraphs
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-Checklist-Items}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-Completed_App}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${ID-Save-Button}