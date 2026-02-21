*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  String
Library  Collections
Library  DateTime
Resource  ../../../Resource/Global-variable/v2.robot
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot
Resource  ../../../../Data Provider/DataProvider.robot
Resource  ../../../Resource/Alternus_RES/Servicing.robot
Resource  ../../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../../Resource/Alternus_Res/Journal.robot
Resource  ../../../Resource/Alternus_Res/Bind-Issue.robot
Resource  ../../../Resource/TMS_RES/Due_This_Month.robot


*** Keywords ***
Bound Not Issued Quoted_Guided
    [Arguments]    &{test_data}
    Login to UMS
    Policy Search with Renewal Flag    ${test_data}
    TMS_MGMT_LIAB_NFP Pick Start date
    Set Application Date to Current Date at Start
    Go to Bind/Issue page UMS
    Bind Quote Options to Bind  ${test_data}
    ${UMS-link} =  Set variable  ${CONFIG_DATA['UMS']['url']}
    run keyword if  '${UMS-link}'=='http://qa.ums.us.victorinsurance.com/Nexus/MultiSearch'    run keyword  execute javascript   window.open("http://qa.ums.us.victorinsurance.com/Nexus/Admin")
    run keyword if  '${UMS-link}'=='http://qa2.ums.us.victorinsurance.com/Nexus/MultiSearch'    run keyword  execute javascript   window.open("http://qa2.ums.us.victorinsurance.com/Nexus/Admin")
    run keyword if  '${UMS-link}'=='http://qa3.ums.us.victorinsurance.com/Nexus/MultiSearch'    run keyword  execute javascript   window.open("http://qa3.ums.us.victorinsurance.com/Nexus/Admin")
    run keyword if  '${UMS-link}'=='http://model.ums.us.victorinsurance.com/Nexus/MultiSearch'    run keyword  execute javascript   window.open("http://model.ums.us.victorinsurance.com/Nexus/Admin")
    ${title}  Get Window Titles
    Switch Window    ${title}[0]
#    switch window   NEW
    Administration
    Set Application Date As Tomorrows Date
    UMS Click Background process
    UMS Choose Job  ${testdata['Job Name']}
    UMS Choose Job with Texas time+1min  ${testdata['Texas Time+1min']}
    switch window   title=DOCUMENTS
    Underwriter Rating
    T-log Triggered    ${test_data}
    #TMS Dashboard   ${test_data}
    #Select policy   ${test_data}
    #Edit Task  ${test_data}
    #UMS_Journal
    #Journal Verification    ${test_data}
    Underwriter Rating
    Issue the policy in UMS
    #Policy status
    T-log Closed    ${test_data}

