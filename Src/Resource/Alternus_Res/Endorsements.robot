*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot

*** Variables ***
${ID-endorsementName}=    id=Name
${Endorsement-Search}=    //input[@value='Search']
${Endorsement-Link}=    //a[contains(@href, "javascript:AddEndorsementToQuote")]
${QLP-Save}=    //input[@value='Save']
${QLP-AddEndorsements}=    //a[contains(@href, 'javascript:AddEndorsement();')]
${QLP-AutolinkEndorsements}=  //a[contains(@href, 'javascript:AutolinkEndorsement();')]
${ID-UW-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${ID-UW-Rating}=  //a[contains(text(),'Rating')]
${ID-EndorsementTitle}=    id=VariableValues_0__FormattedValue
${Name-Property}=    VariableValues[1].FormattedValue
${Name-GeneralProvision}=    VariableValues[1].FormattedValue
${Name-LayerSpecificEndorsement}=    name=VariableValues[2].FormattedValue
${Name-End-Limit}=    name=VariableValues[3].FormattedValue
${Name-End-Attachment}=    name=VariableValues[4].FormattedValue
${Endorsement-Close}=    (//button[@title='close'])[last()]
${Endorsement-text}=    (//html[@dir='ltr']//body[@class='cke_editable cke_editable_themed cke_contents_ltr'])
${ID-COV-Apply&Continue} =  //input[@value='Apply & Continue']
${ID-COV-ApplyChanges} =    //button/span[text()='Apply Changes']

*** Keywords ***
Add Endorsements
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UW-UNDERWRITING}  60
    mouse over  ${ID-UW-UNDERWRITING}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    link=Endorsements    60
    click element  link=Endorsements
    wait until element is not visible   globalAjaxLoading  100
    ${AddEndorsements}=    run keyword and return status  element should be visible    ${QLP-AddEndorsements}
    run keyword if   ${AddEndorsements}    log to console   Navigated to Endorsements Tab
    wait until element is not visible   globalAjaxLoading  100

Add Autolink Endorsements
    Add Endorsements
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${QLP-AutolinkEndorsements}    60
    click element    ${QLP-AutolinkEndorsements}

Add Autolink Endorsements for K&R
    Add Endorsements
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${QLP-AutolinkEndorsements}    60
    click element    ${QLP-AutolinkEndorsements}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is not visible   globalAjaxLoading  60
    wait until element is visible    ${Underwriting}    60
    wait until element is enabled    ${Underwriting}  60
    mouse over  ${ID-UW-UNDERWRITING}
    click element  ${ID-UW-Rating}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}


Add Endorse
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${QLP-AddEndorsements}    60
    click element    ${QLP-AddEndorsements}
    #wait until element is not visible   globalAjaxLoading  100

MFOE Primary Add Endorsements
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${ID-endorsementName}  ${test_data['Endorsement1']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${Endorsement-Search}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Endorsement-Link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save}
    wait until element is not visible   globalAjaxLoading  100
    Add Endorse
    check and enter input  ${ID-endorsementName}  ${test_data['Endorsement2']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${Endorsement-Search}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Endorsement-Link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save}
    wait until element is not visible   globalAjaxLoading  100
    Add Endorse
    check and enter input  ${ID-endorsementName}  ${test_data['Endorsement3']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${Endorsement-Search}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Endorsement-Link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save}
    wait until element is not visible   globalAjaxLoading  100
    Add Endorse
    check and enter input  ${ID-endorsementName}  ${test_data['Endorsement4']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${Endorsement-Search}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Endorsement-Link}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save}
    wait until element is not visible   globalAjaxLoading  100
    Add Endorse
    check and enter input  ${ID-endorsementName}  ${test_data['Endorsement5']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${Endorsement-Search}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Endorsement-Link}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-EndorsementTitle}    ${test_data['Endorsement Title']}
    wait until element is not visible   globalAjaxLoading  100
    select radio button  ${Name-Property}  2
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['General Provision']}' == 'YES'    select radio button  ${Name-GeneralProvision}  ${test_data}  ELSE    select radio button  ${Name-Property}    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['LayerSpecificEndorsement']}' == 'YES'    select checkbox   ${Name-LayerSpecificEndorsement}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${Name-End-Limit}    ${test_data['End_Limit']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${Name-End-Attachment}    ${test_data['Attachment']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save}
    wait until element is not visible   globalAjaxLoading  100

End-Endorsements
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${ID-endorsementName}  ${test_data['Endorsement1']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${Endorsement-Search}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${Endorsement-Link}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-EndorsementTitle}    ${test_data['Endorsement Title']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['General Provision']}' == 'YES'    select radio button    ${Name-GeneralProvision}    1
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['Property']}' == 'YES'    select radio button    ${Name-Property}    2
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['LayerSpecificEndorsement']}' == 'YES'    select checkbox   ${Name-LayerSpecificEndorsement}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${Name-End-Limit}    ${test_data['End_Limit']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${Name-End-Attachment}    ${test_data['Attachment']}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save}
    wait until element is not visible   globalAjaxLoading  100

Endorsements
    [Arguments]    ${test_data}
    run keyword if    '${test_data['Endorsement1']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement1']}
    run keyword if    '${test_data['Endorsement2']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement2']}
    run keyword if    '${test_data['Endorsement3']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement3']}
    run keyword if    '${test_data['Endorsement4']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement4']}
    run keyword if    '${test_data['Endorsement5']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement5']}
    run keyword if    '${test_data['Endorsement6']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement6']}
    run keyword if    '${test_data['Endorsement7']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement7']}
    run keyword if    '${test_data['Endorsement8']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement8']}
    run keyword if    '${test_data['Endorsement9']}' != 'nan'    run keywords    Add Endorse    AND    Endorsement Specific    ${test_data}    ${test_data['Endorsement9']}

Single Endorsements
    [Arguments]    ${test_data}    ${Endorsement_Name}
    Add Endorse
    Endorsement Specific    ${test_data}    ${Endorsement_Name}

Endorsement Specific
    [Arguments]    ${test_data}    ${Endorsement_Name}
    check and enter input  ${ID-endorsementName}    ${Endorsement_Name}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${Endorsement-Search}
    wait until element is not visible   globalAjaxLoading  100
    ${Record_count}=    Endorsement Records
    wait until element is not visible   globalAjaxLoading  100
    run keyword if   '${Record_count}' == '1'  Add Endorsements For Testcases   ${test_data}    ${Endorsement_Name}    ELSE    click element    ${Endorsement-Close}

Endorsement Records
    ${Number of records}=    get text    //span[contains(text(),'Number of records')]
    ${Record_count}=    get substring   ${Number of records}    19    20
    RETURN    ${Record_count}

Add Endorsements For Testcases
    [Arguments]  ${test_data}    ${Endorsement_Name}
    click element    ${Endorsement-Link}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if   '${Endorsement_Name}' == 'Alternus-PCE-NA'    Endorsement variables    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    click element   ${QLP-Save}
    wait until element is not visible   globalAjaxLoading  100

Endorsement variables
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${ID-EndorsementTitle}    ${test_data['Endorsement Title']}
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['General Provision']}' == 'YES'    select radio button    ${Name-GeneralProvision}    1
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['Property']}' == 'YES'    select radio button    ${Name-Property}    2
    wait until element is not visible   globalAjaxLoading  100
    run keyword if    '${test_data['LayerSpecificEndorsement']}' == 'YES'    select checkbox   ${Name-LayerSpecificEndorsement}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input  ${Name-End-Limit}    ${test_data['End_Limit']}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${Name-End-Attachment}    ${test_data['Attachment']}
    wait until element is not visible   globalAjaxLoading  150
    wait until element is enabled    //div[@id='cke_1_contents']//iframe    60
    wait until element is visible    //div[@id='cke_1_contents']//iframe
    select frame    //div[@id='cke_1_contents']//iframe
    wait until element is visible    ${Endorsement-text}    30
    check and enter input   ${Endorsement-text}    ${test_data['Endorsement Text']}
    wait until element is not visible   globalAjaxLoading  100
    unselect frame