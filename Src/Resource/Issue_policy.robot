*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../Resource/UMS.robot
Resource  ../Resource/Generic.robot
Resource  ../../Data Provider/DataProvider.robot
Resource  ../Resource/DNO_Res/DNO_General_Questions.robot

*** Variables ***
${DNO_Issue_Policy}=    //input[@value='Issue Policy']
${DNO_Issue_Binder}=    //input[@value='Issue Binder']
${DatePicker_Eff_Date}=    //input[@name='PolicyEffectiveDate']
${ML_IB_dnoPnpDate}=  //input[@name='DNOPandPLitigationDate']
${ML_IB_eplPnpDate}=  //input[@name='EPLPandPLitigationDate']
${ML_IB_fduPnpDate}=  //input[@name='FDUPandPLitigationDate']
${ML_QO_Continue}=  //button[text()='Continue']
#Private
${Class-PS-label-declined}=  //p[text()='Declined']
${ID-PS-DeclineOrgTypeMessage}=  //div[@class='MuiAlert-message css-127h8j3']
${Class-PS-label-in-progress}=  //span[@class='label label-in-progress']

*** Keywords ***
RE Issue Policy
     Execute Javascript  window.scrollTo(0,1000)
     Wait Until Element Is Enabled   ${ML_QO_Continue}
     set focus to element  ${ML_QO_Continue}
     sleep  0.5
     mouse up  ${ML_QO_Continue}
     click element  ${ML_QO_Continue}  CTRL+ALT
     Wait Until Page Contains Element    //span[text()='Policy Issued']  120s

DNO Issue Binder
     [Arguments]   &{test_data}
     Effective Date   &{test_data}
     Sleep    1s
     Run Keyword If    '${test_data['Program']}' in ['ML-PRIVATE', 'MGMT-LIAB'] and '${test_data['Does your client have existing coverage?']}' == 'YES'   Prior & Pending Litigation Date  &{test_data}
     Sleep    10s
     Press Keys    NONE  TAB
     click element   ${ML_QO_Continue}
     Wait Until Page Contains Element    (//p[text()='Policy Summary'])[2]  500s
     Sleep    10s
     Policy Exit   ${Work ID}  ${test_data}

Effective Date
     [Arguments]   &{test_data}
     Sleep    1s
     wait until page contains element    ${DatePicker_Eff_Date}    timeout=30s
     Sleep    1s
     Wait Until Element Is Visible   ${DatePicker_Eff_Date}    timeout=30s
     Sleep    1s
     ${Current_date}=  Get Current Date    result_format=%m/%d/%Y
     Press Keys   ${DatePicker_Eff_Date}    ${Current_date}
     Press Keys    ${DatePicker_Eff_Date}   TAB
     wait until element is not visible  ${ID_wait-One-moment-please}  30
     wait until element is not visible  ${ID_Pleasewait}   30

Prior & Pending Litigation Date
    [Arguments]   &{test_data}
    #wait until page contains element    ${DatePicker_Eff_Date}    timeout=30s
    #Wait Until Element Is Visible   ${DatePicker_Eff_Date}    timeout=30s
   # Input text    ${DatePicker_Eff_Date}    ${test_data["Effective Date"]}
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    ${P-Date}=  Get Current Date
    ${Past-Date}=  Subtract Time From Date   ${P-Date}    48:06:16.967   result_format=%m-%d-%Y
    IF    '${test_data['Does your client have existing coverage?']}' == 'YES' and '${test_data['DNO']}' == 'YES' and '${test_data['DNO_Current P&P lit date']}' == 'UNKNOWN'
        Press keys  ${ML_IB_dnoPnpDate}  ${Past-Date}
    END
    wait until element is not visible   globalAjaxLoading  10
    IF    '${test_data['Does your client have existing coverage?']}' == 'YES' and '${test_data['EPL']}' == 'YES' and '${test_data['EPL_Current P&P lit date']}' == 'UNKNOWN'
        Press keys  ${ML_IB_eplPnpDate}  ${Past-Date}
    END
    wait until element is not visible   globalAjaxLoading  10
    IF    '${test_data['Does your client have existing coverage?']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES' and '${test_data['FDU_Current P&P lit date']}' == 'UNKNOWN'
        Press keys  ${ML_IB_fduPnpDate}  ${Past-Date}
        Press Keys    ${ML_IB_fduPnpDate}    TAB
    END
#    Press keys  ${ML_IB_dnoPnpDate}  ${Past-Date}
#    wait until element is not visible   globalAjaxLoading  10
#    Press keys  ${ML_IB_eplPnpDate}  ${Past-Date}
#    wait until element is not visible   globalAjaxLoading  10
#    Press keys  ${ML_IB_fduPnpDate}  ${Past-Date}
#    Press Keys    ${ML_IB_fduPnpDate}    TAB
    wait until element is not visible   globalAjaxLoading  10
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    sleep  2s

DNO Issue Policy
    sleep    5s
    click element    ${DNO_Issue_Policy}
#    wait until element is not visible  ${ID_wait-One-moment-please}  30
#    wait until element is not visible  ${ID_Pleasewait}   30

Decline Policy Summary
    [Arguments]  &{test_data}
    #Get Work_ID
    Wait Until Page Contains Element    ${Class-PS-label-declined}  10s
    ${Decline_Label}=  get text  ${Class-PS-label-declined}
    Run Keyword If  "${Decline_Label}"=="Declined"  log to console  Policy Declined Status verified  ELSE  Run Keyword    Fail
    #run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'   Log To Console  ${test_data['Nature of Operations']} -"${Decline_Label}"  ELSE  Log To Console  ${test_data['Type of Non Profit']} -"${Decline_Label}"
    ${Decline_Message}=  get text  ${ID-PS-DeclineOrgTypeMessage}
    Log To Console    Decline_Message - "${Decline_Message}"
    Sleep    2s
   #${title} =  Get text  id=lob-title
   #${id} =  Get Regexp matches  ${title}  \\d
   #${work-id} =  Evaluate  "".join($id)
   #Wait Until Element Is Visible  link:My Work
   #Click element  link:My Work
   # Policy Exit  ${Work ID}  ${test_data}

Broker Policy Summary
    [Arguments]  &{test_data}
    run keyword if  '${test_data['Broker-id']}' != 'Broker'  Get Work_ID
    #run keyword if  '${test_data['Broker-id']}' == 'Broker'  continue Click RE
    ${In-progress_Label}=  get text  ${Class-PS-label-in-progress}
    Log To Console    "${In-progress_Label}"
    ${Decline_Message}=  get text  ${ID-PS-DeclineOrgTypeMessage}
    Log To Console    "${Decline_Message}"
    ${title} =  Get text  id=lob-title
    ${id} =  Get Regexp matches  ${title}  \\d
    ${work-id} =  Evaluate  "".join($id)
    Wait Until Element Is Visible  link:My Work
    Click element  link:My Work
    Policy Exit  ${work-id}  ${test_data}