*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/Generic.robot


*** Variables ***
${AE_QO_Additional_Limits}=  //input[@name='question_98334']
${AE_QO_AlternativeOptionsComment}=  //textarea[@name='AlternativeOptionsComment']
${AE_QO_Continue}=  //button[text()='Continue']
${AE_QO_Select_checkbox_01}=    id=PLOption01
${AE_QO_Select_checkbox_02}=    id=PLOption02
${AE_QO_Select_OptionalCoverage_checkbox_01}=    name=DOL25
${AE_QO_Select_OptionalCoverage_checkbox_02}=    name=DOL25
${AE_wait_One_moment_please}=  //*[@id="lb_please_wait"]/div/div/div/p
${AE_Pleasewait}=  //*[@id="pleaseWait"]/div/div
${AE_UMS_Documents-TAB}=  link=DOCUMENTS
${AE_UMS_Create-Document}=  link=Create document
${AE_UMS_Select-Documents-type-genearation}  id=DocumentGenericId
${AE_UMS_Select-Generic-Letter}=  id=GenericLetterID
${AE_UMS_Select-Inccreased-limit}=   //table[@id='genletterVariables']/tbody/tr[3]/td/table/tbody/tr/td/input
${AE_UMS_Select-Inccreased-limit-app}=   //table[@id='genletterVariables']/tbody/tr[12]/td/table/tbody/tr/td/input
${AE_UMS_Generate-for-sending&filling}=   //button/span[text()='Generate for sending/filing']
${Send_documents_checkbox}=   //input[@cbtype='selectedFileCheckbox']
${Send_Documents}=   //input[@value='Send Documents']
${Send}=   //html/body/div[8]/div[3]/div/button[1]/span
${AE_GQ_Continue}=  //button[text()='Continue']


*** Keywords ***

AE Quote Options
    [Arguments]    &{test_data}
    Sleep    15s
    Execute Javascript    window.scrollTo(0, 0)
    ${qop_page}=  Run Keyword And Return Status  Page Should Contain Element    //p[text()='Based on the information gathered, below are the quote option available to your client:']
    Run Keyword If    ${qop_page}  Sleep    10s
    Run Keyword If   ${qop_page}  Run QOP

Run QOP
#    Wait Until Page Contains Element    (//input[@type='checkbox'])[1]  25s
    Execute Javascript    window.scrollTo(0, 0)
    ${checkbox}=  Run Keyword And Return Status  Page Should Contain Element   (//input[@type='checkbox'])[1]
    Click Element    (//input[@type='checkbox'])[1]
##    Set Selenium Speed    0.1s
#    run keyword if    '${test_data['SALE1']}' == 'YES' or '${test_data['SALE2']}' == 'YES' or '${test_data['SALE3']}' == 'YES'
#    ...    Click Element    (//input[@type='checkbox'])[2]
#    Run Keyword If    '${test_data['Per claim policy limit']}' in ['25', '50']  Click Element    //p[text()='Defense Outside the Limits']/parent::div/child::div/table/tbody/tr[2]/td/label/span/input
    click element  ${AE_GQ_Continue}

Create and Send Document
        [Arguments]    ${test_data}
        Click Element    ${AE_UMS_Documents-TAB}
        click element  ${AE_UMS_Create-Document}
        wait until element is visible  ${AE_UMS_Select-Documents-type-genearation}
        click element  ${AE_UMS_Select-Documents-type-genearation}
        select from list by label  ${AE_UMS_Select-Documents-type-genearation}  ${test_data['Document Type']}
        Wait Until Element Is Enabled    ${AE_UMS_Generate-for-sending&filling}  10s
        click element  ${AE_UMS_Generate-for-sending&filling}
        Wait Until Page Contains Element    ${Send_documents_checkbox}    500s
        Reload Page
        Click Element    ${Send_documents_checkbox}
        Click Element    ${Send_Documents}
        Wait Until Element Is Visible    ${Send}    500s
        Click Element    ${Send}
        wait until element is not visible   globalAjaxLoading  800

Select Mid Term Quote Document Type
        [Arguments]    ${test_data}
        Click Element    ${AE_UMS_Documents-TAB}
        click element  ${AE_UMS_Create-Document}
        wait until element is visible  ${AE_UMS_Select-Documents-type-genearation}
        click element  ${AE_UMS_Select-Documents-type-genearation}
        select from list by label  ${AE_UMS_Select-Documents-type-genearation}  ${test_data['Document Type For Generation']}
        select from list by label  ${AE_UMS_Select-Generic-Letter}  ${test_data['Select Generic Letter']}
        wait until element is visible  ${AE_UMS_Select-Inccreased-limit}
        click element  ${AE_UMS_Select-Inccreased-limit}
        wait until element is visible  ${AE_UMS_Select-Inccreased-limit-app}
        click element  ${AE_UMS_Select-Inccreased-limit-app}
        click element  ${AE_UMS_Generate-for-sending&filling}
        Wait Until Element Is Visible    ${Send_documents_checkbox}    500s
        Click Element    ${Send_documents_checkbox}
        Click Element    ${Send_Documents}
        Wait Until Element Is Visible    ${Send}    300s
        Click Element    ${Send}

