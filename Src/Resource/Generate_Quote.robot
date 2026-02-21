*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../Resource/UMS.robot
Resource  ../Resource/Generic.robot
Resource  ../../Data Provider/DataProvider.robot

*** Variables ***
${ID-Alert-display} =  id=initialDisplayMessages
${ID-IP-Premium} =  id=quoteOptionTotalPremium
${Submit_Continue}=    //input[@onclick="ap.submitQuoteForm('Continue');"]
${ML_QO_Continue}=  //button[text()='Continue']

*** Keywords ***
RE Generate Quote
        [Arguments]    &{test_data}
        Wait Until Page Contains    ${test_data['Quote Option']}   50s
#        Execute JavaScript    document.body.style.zoom = "80%"
        click element  //p[text()='${test_data['Quote Option']}']
        #Execute Javascript    window.scrollTo(100, 800)
        run keyword if   '${test_data['EPL + Discrimination']}' == 'YES' or '${test_data['Construction Development']}' == 'YES'     RE_Select Optional Coverages     &{test_data}
        IF   '${test_data['Residential Ownership']}' == 'YES' and '${test_data['Environmental Hazard']}' == 'YES'
            IF   '${test_data['Quote Option']}' == 'Quote Option 2'
                Run keyword if  '${test_data['GQ_Residential Ownership']}' == 'YES'   click element       (//input[@type='checkbox'])[1]
                Run keyword if  '${test_data['GQ_Environmental Hazard']}' == 'YES'   click element       (//input[@type='checkbox'])[2]
                Run keyword if  '${test_data['GQ_Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[3]
            ELSE IF  '${test_data['Quote Option']}' == 'Quote Option 4'
                Run keyword if  '${test_data['GQ_Residential Ownership']}' == 'YES'   click element       (//input[@type='checkbox'])[4]
                Run keyword if  '${test_data['GQ_Environmental Hazard']}' == 'YES'   click element       (//input[@type='checkbox'])[5]
                Run keyword if  '${test_data['GQ_Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[6]
            END
        END
        IF   '${test_data['Residential Ownership']}' != 'YES' and '${test_data['Environmental Hazard']}' == 'YES'
            IF   '${test_data['Quote Option']}' == 'Quote Option 2'
                Run keyword if  '${test_data['GQ_Environmental Hazard']}' == 'YES'   click element       (//input[@type='checkbox'])[1]
                Run keyword if  '${test_data['GQ_Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[2]
            ELSE IF  '${test_data['Quote Option']}' == 'Quote Option 4'
                Run keyword if  '${test_data['GQ_Environmental Hazard']}' == 'YES'   click element       (//input[@type='checkbox'])[3]
                Run keyword if  '${test_data['GQ_Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[4]
            END
        END
        IF   '${test_data['Residential Ownership']}' == 'YES' and '${test_data['Environmental Hazard']}' != 'YES'
            IF   '${test_data['Quote Option']}' == 'Quote Option 2'
                   Run keyword if  '${test_data['GQ_Residential Ownership']}' == 'YES'   click element       (//input[@type='checkbox'])[1]
                   Run keyword if  '${test_data['GQ_Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[2]
            ELSE IF   '${test_data['Quote Option']}' == 'Quote Option 4'
                   Run keyword if  '${test_data['GQ_Residential Ownership']}' == 'YES'   click element       (//input[@type='checkbox'])[3]
                   Run keyword if  '${test_data['GQ_Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[4]
            END
        END
        Continue Click Generate Quote
#        Wait Until Element Is Enabled   ${Submit_Continue}
#        set focus to element  ${Submit_Continue}
#        sleep  0.5
#        mouse up  ${Submit_Continue}
#        click element  ${Submit_Continue}  CTRL+ALT
#        wait until element is not visible  ${ID_wait-One-moment-please}  30
#        wait until element is not visible  ${ID_Pleasewait}   30
        sleep  2s

RE_Select Optional Coverages
    [Arguments]     &{test_data}
    IF   '${test_data['Quote Option']}' == 'Quote Option 1'
        run keyword if   '${test_data['EPL + Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[1]
        run keyword if   '${test_data['Construction Development']}' == 'YES'  click element     (//input[@type='checkbox'])[2]
    END
    IF   '${test_data['Quote Option']}' == 'Quote Option 2'
        run keyword if   '${test_data['EPL + Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[3]
        run keyword if   '${test_data['Construction Development']}' == 'YES'  click element     (//input[@type='checkbox'])[4]
    END
    IF   '${test_data['Quote Option']}' == 'Quote Option 3'
        run keyword if   '${test_data['EPL + Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[5]
        run keyword if   '${test_data['Construction Development']}' == 'YES'  click element     (//input[@type='checkbox'])[6]
    END
    IF   '${test_data['Quote Option']}' == 'Quote Option 4'
        run keyword if   '${test_data['EPL + Discrimination']}' == 'YES'   click element       (//input[@type='checkbox'])[7]
        run keyword if   '${test_data['Construction Development']}' == 'YES'  click element     (//input[@type='checkbox'])[8]
    END

Check quote options
        [Arguments]  ${action}  ${msg}
        ${alert-msg} =  Get text  ${ID-Alert-display}
        Run Keyword if  '${msg}' == '${alert-msg}'  Write Log  Select premium warning message check successful  ELSE  Write Log  Select premium warning message check failed

RE View Quote
        ${UW-check}=    Run Keyword and Return status    Page should contain    The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.
        run keyword if    '${UW-check}' == 'True'  UMS Release hold
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

DNO Select Quote
        [Arguments]  &{test_data}
        run keyword if    '${test_data["Quote Options"]}' == 'Select All'    select checkbox    name=selectAllCheckbox    ELSE    DNO Selecting Quote   &{test_data}
        click element    ${Submit_Continue}
        wait until element is not visible  ${ID_wait-One-moment-please}  80
        wait until element is not visible  ${ID_Pleasewait}   80
        DNO Generate Quote    &{test_data}

DNO Generate Quote
        [Arguments]  &{test_data}
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        Wait Until Page Contains Element    //input[@type='radio']  60s
        click element  //input[@type='radio']
        click element   ${ML_QO_Continue}
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

DNO Selecting Quote
        [Arguments]  &{test_data}
        ${SelectingQuote} =  Set Variable  ${test_data['Quote Options']}
        click element  id=option${SelectingQuote}

DNO Quote options
    [Arguments]  &{test_data}
    Wait Until Page Contains Element    //input[@type='checkbox']  60s
    click element  //input[@type='checkbox']
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    click element  ${ML_QO_Continue}
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    Sleep    10s
    