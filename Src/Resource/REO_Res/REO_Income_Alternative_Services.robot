*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${RE_IAS_EISYesNo}=    (//input[@type='checkbox'])[1]
${ID_IAS_EISRevenue}=    //input[@name='EIS_Revenue']
${RE_IAS_PPYesNo}=    (//input[@type='checkbox'])[2]
${ID_IAS_PPRevenue}=    //input[@name='PP_Revenue']
${RE_IAS_excYesNo}=    (//input[@type='checkbox'])[3]
${ID_IAS_excRevenue}=    //input[@name='1031E_Revenue']
${RE_IAS_REDYesNo}=    (//input[@type='checkbox'])[4]
${ID_IAS_REDRevenue}=    //input[@name='RED_Revenue']
${RE_IAS_CMYesNo}=    (//input[@type='checkbox'])[5]
${ID_IAS_CMRevenue}=    //input[@name='CM_Revenue']
${RE_IAS_STYesNo}=    (//input[@type='checkbox'])[6]
${ID_IAS_STRevenue}=    //input[@name='ST_Revenue']
${RE_IAS_AMYesNo}=    (//input[@type='checkbox'])[7]
${ID_IAS_AMRevenue}=    //input[@name='AM_Revenue']
${RE_IAS_TAEYesNo}=    (//input[@type='checkbox'])[8]
${ID_IAS_TAERevenue}=    //input[@name='TAE_Revenue']
${RE_IAS_HMRVYesNo}=    (//input[@type='checkbox'])[9]
${ID_IAS_HMRVRevenue}=    //input[@name='HMRV_Revenue']
${RE_IAS_MBYesNo}=    (//input[@type='checkbox'])[10]
${ID_IAS_MBRevenue}=    //input[@name='MB_Revenue']
${RE_IAS_FMGYesNo}=    (//input[@type='checkbox'])[11]
${ID_IAS_FMGRevenue}=    //input[@name='FMG_Revenue']
${RE_IAS_BVYesNo}=    (//input[@type='checkbox'])[12]
${ID_IAS_BVRevenue}=    //input[@name='BV_Revenue']

*** Keywords ***
RE Income from Alternative Services
    [Arguments]    &{test_data}
    Execute Javascript  window.scrollTo(0,100)
    Sleep    5s
    click element   //input[@name='IncomefromAlternativeSources' and @value='${test_data['Is the applicant service listed with following']}']
    run keyword if     '${test_data['Is the applicant service listed with following']}' == 'YES'    Services listed   &{test_data}
    Execute Javascript  window.scrollTo(0,1000)
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30

Services listed
    [Arguments]    &{test_data}
    Set Selenium Implicit Wait    1s
    run keyword if    '${test_data['Environmentally impacted site']}' == 'YES'    run keywords    click element    ${RE_IAS_EISYesNo}  AND  Input text    ${ID_IAS_EISRevenue}  ${test_data['EISRevenue']}
    run keyword if    '${test_data['Property preservation']}' == 'YES'    run keywords    click element    ${RE_IAS_PPYesNo}  AND  Input text    ${ID_IAS_PPRevenue}  ${test_data['PPRevenue']}
    run keyword if    '${test_data['1031 exchanges']}' == 'YES'    run keywords    click element    ${RE_IAS_excYesNo}  AND  Input text    ${ID_IAS_excRevenue}  ${test_data['excRevenue']}
    scroll element into view    ${RE_IAS_REDYesNo}
    wait until page contains element    ${RE_IAS_REDYesNo}    timeout=40s
    run keyword if    '${test_data['Real estate development']}' == 'YES'    run keywords    click element    ${RE_IAS_REDYesNo}  AND  Input text    ${ID_IAS_REDRevenue}  ${test_data['REDRevenue']}
    run keyword if    '${test_data['Construction management']}' == 'YES'    run keywords    click element    ${RE_IAS_CMYesNo}  AND  Input text    ${ID_IAS_CMRevenue}  ${test_data['CMRevenue']}
    run keyword if    '${test_data['Sale of timeshares']}' == 'YES'    run keywords    click element    ${RE_IAS_STYesNo}  AND  Input text    ${ID_IAS_STRevenue}  ${test_data['STRevenue']}
    run keyword if    '${test_data['Appraisal management']}' == 'YES'    run keywords    click element    ${RE_IAS_AMYesNo}  AND  Input text    ${ID_IAS_AMRevenue}  ${test_data['AMRevenue']}
    run keyword if    '${test_data['Title']}' == 'YES'    run keywords    click element    ${RE_IAS_TAEYesNo}  AND  Input text    ${ID_IAS_TAERevenue}  ${test_data['TAERevenue']}
    run keyword if    '${test_data['Hotels']}' == 'YES'    run keywords    click element    ${RE_IAS_HMRVYesNo}  AND  Input text    ${ID_IAS_HMRVRevenue}  ${test_data['HMRVRevenue']}
    run keyword if    '${test_data['Mortgage banking']}' == 'YES'    run keywords    click element    ${RE_IAS_MBYesNo}  AND  Input text    ${ID_IAS_MBRevenue}  ${test_data['MBRevenue']}
    run keyword if    '${test_data['Partnerships']}' == 'YES'    run keywords    click element    ${RE_IAS_FMGYesNo}  AND  Input text    ${ID_IAS_FMGRevenue}  ${test_data['FMGRevenue']}
    run keyword if    '${test_data['Business valuations']}' == 'YES'    run keywords    click element    ${RE_IAS_BVYesNo}  AND  Input text    ${ID_IAS_BVRevenue}  ${test_data['BVRevenue']}