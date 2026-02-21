*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${RE_QO_limitOfLiability1QuoteOptionPage}=    id=limitOfLiability1QuoteOptionPage
${RE_QO_limitOfLiability2QuoteOptionPage}=    id=limitOfLiability2QuoteOptionPage
${RE_QO_limitOfLiability3QuoteOptionPage}=    id=limitOfLiability3QuoteOptionPage
${RE_QO_limitOfLiability4QuoteOptionPage}=    id=limitOfLiability4QuoteOptionPage
${RE_QO_defenceCosts1QuoteOptionPage}=    id=defenceCosts1QuoteOptionPage
${RE_QO_defenceCosts2QuoteOptionPage}=    id=defenceCosts2QuoteOptionPage
${RE_QO_defenceCosts3QuoteOptionPage}=    id=defenceCosts3QuoteOptionPage
${RE_QO_defenceCosts4QuoteOptionPage}=    id=defenceCosts4QuoteOptionPage
${RE_QO_deductible1QuoteOptionPage}=    id=deductible1QuoteOptionPage
${RE_QO_deductible2QuoteOptionPage}=    id=deductible2QuoteOptionPage
${RE_QO_deductible3QuoteOptionPage}=    id=deductible3QuoteOptionPage
${RE_QO_deductible4QuoteOptionPage}=    id=deductible4QuoteOptionPage
${RE_QO_deductibleType1QuoteOptionPage}=    id=deductibleType1QuoteOptionPage
${RE_QO_deductibleType2QuoteOptionPage}=    id=deductibleType2QuoteOptionPage
${RE_QO_deductibleType3QuoteOptionPage}=    id=deductibleType3QuoteOptionPage
${RE_QO_deductibleType4QuoteOptionPage}=    id=deductibleType4QuoteOptionPage
${RE_QO_residentialOwnership}=   (//input[@type='checkbox'])[5]
${RE_QO_Environmental Hazard}=   (//input[@type='checkbox'])[6]
${RE_QO_Environmental Hazard_CA}=   (//input[@type='checkbox'])[5]
${RE_QO_ContingentBodilyInjury}=   (//input[@type='checkbox'])[6]
${RE_QO_NotforProfitDirectors&Officers}=   (//input[@type='checkbox'])[7]
${RE_QO_Nameofprincipal}=   //input[@name='CoverageNfpDnoYes_01']
${RE_QO_Nameofoutsideboard}=   //input[@name='CoverageNfpDnoYes_02']

${RE_QO_DiscriminationCoverage}=    (//input[@role='combobox'])[17]
${RE_QO_CombinedDiscriminationCoverage}=     (//input[@placeholder='Select One'])[2]
${RE_QO_ConstructionLimits}=   (//em[text()='Select One'])[1]
${RE_QO_DiscriminationCoverageEPL}=    (//input[@role='combobox'])[18]
${RE_QO_EPLDeductible}=    //input[@name='EPLDEDUCTIBLE']
${RE_QO_nameOfPrincipalOutside}=    id=nameOfPrincipalOutside
${RE_QO_nameOfBoard}=    id=nameOfBoard
${RE_QO_OptionalDiscriminationEndorsement}=    (//input[@name='DISCRIMINATION_SUBLIMIT_PREMIUM'])
${RE_QO_Hazard EndorsementPremium}=    (//input[@name='HAZARD_PREMIUM'])
${RE_QO_portalineligibleid}=    name=portalineligibleid
${Quoteoption}=    //a[@title='Quote Options']
${RE_QO_Save}=   //button[text()='Save and Continue']

*** Keywords ***
RE Quote Options
    [Arguments]    &{test_data}
    Wait Until Page Contains    Quote Options    10s
#   Execute JavaScript    document.body.style.zoom = "67%"
    Execute Javascript  window.scrollTo(0,300)
    IF  '${test_data['State']}' != 'Colorado'
        run keyword if    '${test_data['Residential Ownership']}' == 'YES'    click element    ${RE_QO_residentialOwnership}
        IF  '${test_data['Environmental Hazard']}' == 'YES'
            run keyword if  '${test_data['State']}' == 'California'  click element  ${RE_QO_Environmental Hazard_CA}  ELSE  click element    ${RE_QO_Environmental Hazard}
        END
        run keyword if    '${test_data['Contingent Bodily Injury']}' == 'YES'    click element    ${RE_QO_ContingentBodilyInjury}
        IF    '${test_data['Not for Profit Directors & Officers']}' == 'YES'
            Click element   ${RE_QO_NotforProfitDirectors&Officers}
            Input text   ${RE_QO_Nameofprincipal}    ${test_data['Name of Principal on outside board']}
            Input text   ${RE_QO_Nameofoutsideboard}    ${test_data['Name of outside board']}
        END
    END
   Execute Javascript  window.scrollTo(0,500)
   # run keyword if    '${test_data['State']}' == 'California'    check and select from list by label    ${RE_QO_DiscriminationCoverageForCA}    ${test_data['Discrimination Coverage']}   ELSE    check and select from list by label   ${RE_QO_DiscriminationCoverage}    ${test_data['Discrimination Coverage']
    run keyword if    '${test_data['Discrimination Coverage']}' != 'nan'   Input Text   ${RE_QO_DiscriminationCoverage}  ${test_data['Discrimination Coverage']}
    sleep  0.7s
    Press Keys    ${RE_QO_DiscriminationCoverage}   ARROW_DOWN
    Press Keys    ${RE_QO_DiscriminationCoverage}   RETURN
    Press Keys    ${RE_QO_DiscriminationCoverage}    TAB
    sleep  2s
    ${DiscriminationCoverageEPL}=    run keyword and return status    Page Should Contain    Combined Discrimination and Employment Practices Liability (EPL) Coverage
    run keyword if    ${DiscriminationCoverageEPL}   DiscriminationCoverageEPL    &{test_data}
    run keyword if    '${test_data['Does the applicant require additional coverages or endorsements?']}' != 'nan'    click element   //input[@name='CoverageAdditionalsYn' and @value='${test_data['Does the applicant require additional coverages or endorsements?']}']
    sleep  0.5s
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30

DiscriminationCoverageEPL
    [Arguments]    &{test_data}
    run keyword if    '${test_data['Combined Discrimination and Employment']}' != 'nan'     Input Text   ${RE_QO_DiscriminationCoverageEPL}  ${test_data['Combined Discrimination and Employment']}
    sleep  0.7s
    Press Keys    ${RE_QO_DiscriminationCoverageEPL}   ARROW_DOWN
    Press Keys    ${RE_QO_DiscriminationCoverageEPL}   RETURN
    Press Keys    ${RE_QO_DiscriminationCoverageEPL}    TAB
    sleep  3s
    #run keyword if    '${test_data['EPL Deductibles']}' != 'nan'     Execute Javascript  window.scrollTo(0,900)
   # ${EPLDeductible}=    run keyword and return status    Page Should Contain    EPL Deductibles
    #run keyword if    ${EPLDeductible}   Select Value from Dropdown    ${RE_QO_EPLDeductible}    ${test_data['EPL Deductibles']}
    IF    '${test_data['Combined Discrimination and Employment']}' != 'nan'
        Input text    ${RE_QO_EPLDeductible}    ${test_data['EPL Deductibles']}
        Press Keys    ${RE_QO_EPLDeductible}   ARROW_DOWN
        Press Keys    ${RE_QO_EPLDeductible}   RETURN
        Press Keys    ${RE_QO_EPLDeductible}    TAB
        #click element  (//span[text()='${test_data['EPL Deductibles']}'])[last()]
    END
    IF    '${test_data['Construction Development Limits']}' != 'nan'
           IF   '${test_data['EPL Deductibles']}' != 'nan'
                 sleep  0.6s
                 Input text   //input[@name='CONSTDEV']     ${test_data['Construction Development Limits']}
                 Press Keys    //input[@name='CONSTDEV']   ARROW_DOWN
                 Press Keys    //input[@name='CONSTDEV']   RETURN
                 Press Keys    //input[@name='CONSTDEV']    TAB
                 #sleep  0.6s
                 #click element  (//span[text()='${test_data['Construction Development Limits']}'])[last()]    #[2]
           ELSE
                 Input text   //input[@name='CONSTDEV']     ${test_data['Construction Development Limits']}
                 Press Keys    //input[@name='CONSTDEV']   ARROW_DOWN
                 Press Keys    //input[@name='CONSTDEV']   RETURN
                 Press Keys    //input[@name='CONSTDEV']    TAB
                # click element    (//div[@role='combobox'])[last()]
                # sleep  0.6s
                # click element  (//span[text()='${test_data['Construction Development Limits']}'])[last()]    #[2]
           END
    END


RE Quote Options-Shortform
    [Arguments]    &{test_data}
    click element  (//input[@type='radio'])[${test_data['Quote Option']}]
    Execute Javascript  window.scrollTo(0,800)
    IF   '${test_data['Optional Discrimination Endorsement (sublimit of $100,000) Premium $100']}' != 'nan'
        Input text    ${RE_QO_OptionalDiscriminationEndorsement}   ${test_data['Optional Discrimination Endorsement (sublimit of $100,000) Premium $100']}
        Press Keys    ${RE_QO_OptionalDiscriminationEndorsement}   ARROW_DOWN
        Press Keys    ${RE_QO_OptionalDiscriminationEndorsement}   RETURN
        Press Keys    ${RE_QO_OptionalDiscriminationEndorsement}    TAB
    END
    IF   '${test_data['Optional Environmental Hazard Endorsement Premium $100']}' != 'nan'
        Input text    ${RE_QO_Hazard EndorsementPremium}    ${test_data['Optional Environmental Hazard Endorsement Premium $100']}
        Press Keys    ${RE_QO_Hazard EndorsementPremium}   ARROW_DOWN
        Press Keys    ${RE_QO_Hazard EndorsementPremium}   RETURN
        Press Keys    ${RE_QO_Hazard EndorsementPremium}    TAB
    END
    Wait Until Element Is Enabled   ${RE_QO_Save}
    set focus to element  ${RE_QO_Save}
    sleep  0.5
    mouse up  ${RE_QO_Save}
    click element  ${RE_QO_Save}  CTRL+ALT
    sleep  20s

RE-Portal Ineligible
   click element    ${Quoteoption}
   wait until element is not visible  ${ID_wait-One-moment-please}  30
   wait until element is not visible  ${ID_Pleasewait}   30
   select checkbox    ${RE_QO_portalineligibleid}
   continue Click RE
   wait until element is not visible  ${ID_wait-One-moment-please}  30
   wait until element is not visible  ${ID_Pleasewait}   30