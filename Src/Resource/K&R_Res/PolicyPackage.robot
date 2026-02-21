*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot
Resource  ../../Resource/Alternus_Res/Bind-Issue.robot

*** Variables ***
${ID-PP-Submit}=    //input[@value='Submit']
${Name-ReviewAction}=   Action
${Apply&Continue}=  //input[@value='Apply & Continue']

*** Keywords ***
PolicyPackage
    [Arguments]     ${test_data}
    wait until element is not visible   globalAjaxLoading  150
    click element   ${Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    select radio button  Action  Review
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled    ${ID-PP-Submit}    60
    click element    ${ID-PP-Submit}
    wait until element is not visible   globalAjaxLoading  350
    ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
    log to console    Policy Details are: ${Policy_Header_Info}
    ${Policy_Status}=    Run Keyword If    '${test_data['Program']}'=='REALESTATE'    get substring  ${Policy_Header_Info}  64
    ...    ELSE IF    '${test_data['Program']}'=='K&R'    get substring    ${Policy_Header_Info}  62
    ...    ELSE IF    '${test_data['Program']}'=='VIMMPROPERTY'    get substring    ${Policy_Header_Info}  68
    ...    ELSE    get substring    ${Policy_Header_Info}    60
    set suite variable  ${Policy_Status}
    log to console    Policy Status is: ${Policy_Status}
    IF    '${test_data['Program']}'=='VIMMPROPERTY'
         ${policy-number} =  Get substring  ${Policy_Header_Info}    0  19
    ELSE
        ${policy-number} =  Get substring  ${Policy_Header_Info}    0  19
    END
    set test variable  ${policy-no}  ${policy-number}
    set to dictionary    ${test_data}    PolicyNumber=${policy-no}
#    run keyword and continue on failure    run keyword if     "${Policy_Status}" == "${test_data['Policy Status3']}"     log to console    Policy Status Matches and Verified
#    ...    ELSE    run keywords    log to console    Policy Status is not matching    AND    Close Browser
    IF     '${test_data['Program']}' == 'K&R'
            ${policy-number} =  Get text  //*[@id="PolicyNumberInHeader"]
            run keyword if     "${Policy_Status}" == "${test_data['Policy Status2']}"     log to console    Policy Status Matches and Verified
            ...  ELSE    run keywords    log to console    Policy Status is not matching    AND    Close Browser
            Log To Console    ${policy-number}
            set test variable  ${policy-no}   ${policy-number}
            set to dictionary    ${test_data}    PolicyNumber=${policy-number}
    END
