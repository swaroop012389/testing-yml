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

