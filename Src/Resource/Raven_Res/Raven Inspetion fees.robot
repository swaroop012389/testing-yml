*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot
Resource    Raven Coverages Validation.robot

*** Variables ***
${QO_Zero-link}=    //a[contains(text(),'Show zero columns')]
${QO_Edit-ES-Fees}=     (//a[@class='editEsFee read-only-link'])[1]
${ES-Fees}=   //input[@class='formated']
${QO_Penchange}=  //a[contains(text(),'Pen Change')]
${Penchange_Save}=  //input[@type='submit']
${Penchange_premium}=  (//input[@type='text'])[1]
${Penchange_Save-link}=  //a[contains(text(),'Save')]

*** Keywords ***
Inspection fees
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoad  100
    Log To Console    Navigated to Inspection fees page
    Click Link    ${QO_Zero-link}
    IF    '${test_data['AOP']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Aop Inspection Index']}]  100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Aop Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Aop Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['Earthquake']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Earthquake Inspection Index']}]   100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Earthquake Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Earthquake Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['Flood']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Flood Inspection Index']}]    100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Flood Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Flood Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['NAMEDWINDSTORM']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Namedwindstorm Inspection Index']}]   100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Namedwindstorm Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Namedwindstorm Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['SEVERECONVECTIVE']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Severeconvective Inspection Index']}]  100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Severeconvective Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Severeconvective Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['Wildfire']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Wildfire Inspection Index']}]    100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Wildfire Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Wildfire Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['CA Earthquake']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['CA Earthquake Inspection Index']}]    100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['CA Earthquake Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['CA Earthquake Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['New Madrid Earthquake']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['New Madrid Earthquake Inspection Index']}]    100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['New Madrid Earthquake Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['New Madrid Earthquake Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['Other Earthquake']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Other Earthquake Inspection Index']}]  100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Other Earthquake Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Other Earthquake Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['Pacific NW Earthquake']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Pacific NW Earthquake Inspection Index']}]    100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Pacific NW Earthquake Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Pacific NW Earthquake Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['Special Hazard Flood']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Special Hazard Flood Inspection Index']}]    100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Special Hazard Flood Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['ASpecial Hazard Flood Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['TRIA']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Tria Inspection Index']}]   100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Tria Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Tria Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END
    IF    '${test_data['TRIA REJECTED']}' == 'YES'
    Wait Until Element Is Visible    (//a[@class='editEsFee read-only-link'])[${testdata['Tria rejected Inspection Index']}]    100
    Sleep    2s
    Click Link    (//a[@class='editEsFee read-only-link'])[${testdata['Tria rejected Inspection Index']}]
    Wait Until Element Is Visible    ${ES-Fees}     100
    Check and enter input    ${ES-Fees}   ${testdata['Tria rejected Inspection fees']}
    Click Link    ${Penchange_Save-link}
    END



    
