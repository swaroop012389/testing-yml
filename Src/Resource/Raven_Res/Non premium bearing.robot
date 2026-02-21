*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot
Resource    Raven Coverages Validation.robot
Resource    ../Alternus_Res/BindEndorsement.robot
Resource    Upload_SOV_file.robot

*** Variables ***
${Rate-Territory}=    //span[contains(text(),'OK')]
${Save-button}=    //input[@type='submit']
${ID-COV-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${ID-UMS-Apply&Continue}=  //input[@value='Apply & Continue']
${Coverage-BE-flood}=  //input[@coverageid='594']
${Coverage-BE-AOP}=  //input[@coverageid='593']
${Coverage_BE-Severeconvective}=  //input[@coverageid='598']
${Coverage-BE-EQ}=  //input[@coverageid='595']
${ID-BE-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-BE-Apply&Continue}=  //input[@value='Apply & Continue']
${Button_Next}=    //input[@value='Next']
${Refresh_Receivable}=  //input[@value='Refresh Receivables']

*** Keywords ***
Non Premium Bearing Endorsement
    Select Checkbox    ${Coverage-BE-AOP}
    Select Checkbox    ${Coverage-BE-EQ}
    Select Checkbox    ${Coverage-BE-flood}
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}
    Scroll Element Into View    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Endorsements To Attach
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Payments
    Wait Until Element Is Visible    ${Refresh_Receivable}  10
    Click Element    ${Refresh_Receivable}
    sleep  6s
    wait until element is visible    ${Button_Next}  20s
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    wait until element is not visible   globalAjaxLoading  100
    Adding Endorsement    ${test_data}
    Bind
    Select Endorsement Radio Button    ${test_data}
    log to console    Endorsement Created
    Verify Generated Document Name    ${test_data}



    
