*** Settings ***
Library  SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Library  String
Resource  ../../Resource/Generic.robot

*** Variables ***
${COV-datepicker1}=    id=datepicker1
${COV-datepicker2}=    id=datepicker2
${KR-COV-insuredDatepicker}=    id=insuredDatepicker
${Endorsment-missing_Error-message}=   //div[contains(text(),'Endorsements missing from record.')]


*** Keywords ***
Multi year term
    [Arguments]    ${test_data}
    ${Current_Eff_Date}=    get current date
    ${Formated_current_date}=   Get Current Date    result_format=%m/%d/%Y
    ${End_date}=    Add Time To Date    ${Current_Eff_Date}    549 days
    ${Formatdate}=      Convert Date    ${End_date}     result_format=%m/%d/%Y
    check and enter input   ${KR-COV-insuredDatepicker}    ${Formated_current_date}
    wait until element is not visible   globalAjaxLoading  100
    Wait Until Element Is Visible    ${COV-datepicker1}  100
    check and enter input   ${COV-datepicker1}    ${Formated_current_date}
    wait until element is not visible   globalAjaxLoading  100
    check and enter input   ${COV-datepicker2}    ${Formatdate}
    wait until element is not visible   globalAjaxLoading  100

Endorsement missing from record
    wait until element is not visible   globalAjaxLoading  100
    click element   ${ID-UMS-Apply&Continue}
    Log To Console    Checking Endorsements missing eroor message
    wait until element is not visible   globalAjaxLoad  100
    Wait Until Element Is Visible    ${Endorsment-missing_Error-message}   10
    ${Error message}=  Get Text    ${Endorsment-missing_Error-message}
    IF    '${Error message}' == 'Endorsements missing from record.'
        Log To Console    Error message : ${Error message}
    ELSE
    Close Browser
    END

    
