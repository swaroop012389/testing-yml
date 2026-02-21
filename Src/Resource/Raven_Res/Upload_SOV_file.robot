*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ID-UMS-BIND/ISSUE-TAB}=  //a[contains(text(),'BIND/ISSUE')]
${ID-UMS-SOV}=    //a[contains(text(),'SOV Import')]
${ID-UMS-Issue/Reissue}=  //a[contains(text(),'Issue/Reissue')]
${UMS_Import_SOV}=  //button[@id='importSOV']
${Choose_file}=    //input[@name='Sov_File']
${SOV_Save}=    //span[contains(text(),'Save')]

*** Keywords ***
Upload_SOV_file
    [Arguments]    ${test_data}
    Log To Console    Navigated to SOV Upload page
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-UMS-BIND/ISSUE-TAB}    60
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  60
    mouse over  ${ID-UMS-BIND/ISSUE-TAB}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-UMS-BIND/ISSUE-TAB}  100
    Click Element  ${ID-UMS-SOV}
    wait until element is not visible   globalAjaxLoading  100
    Click Button    ${UMS_Import_SOV}
    wait until element is not visible   globalAjaxLoading  100
    set focus to element  ${Choose_file}
    mouse over    ${Choose_file}
    wait until element is enabled  ${Choose_file}   20
    choose file  ${Choose_file}  ${CURDIR}\\SOV1.xlsx
    wait until element is not visible   globalAjaxLoading  100
    Click Element    ${SOV_Save}
    