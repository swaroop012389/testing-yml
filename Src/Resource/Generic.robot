*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../Resource/UMS.robot
Resource  ../Resource/Global-variable/v2.robot
Resource  ../../Data Provider/DataProvider.robot
Resource  ../Resource/Cyber_Res/Cyber_General_Information.robot
Resource  Upload_document.robot

*** Variables ***
${Real_Estate_E&O}=    //p[contains(text(), 'Real Estate E&O')]
${Cyber} =  //p[text()='Cyber']
${StorageTank}=     //p[text()='Storage Tank Liability']
${IDcontinue}=  //button[normalize-space()='Save & Continue']
${Continue-GQ}=     //button[normalize-space()='Continue']
${ID_ExpirationDate} =  id=ExpirationDate
${ID-Alert-display} =  id=initialDisplayMessages
${ID_wait-One-moment-please}=  //*[@id="lb_please_wait"]/div/div/div/p
${ID_Pleasewait}=  //*[@id="pleaseWait"]/div/div
&{page_list} =  agencyInformationPage_menuLink=Insurance Agency Information  genInformationPage_menuLink=General Information  generalQuestionsPage_menuLink=General Questions  claimsHistoryPage_menuLink=Claims History  staffInformationPage_menuLink=Staff Information  incomeFromAlternativeServicesPage_menuLink=Income From Alternative Services  ownedProperty_menuLink=Owned Properties  applicantIncomePage_menuLink=Applicant Income  firmIncomeAdditionalInformationPage_menuLink=Additional Income Information  riskManagementPage_menuLink=Risk Management  priorCoveragePage_menuLink=Prior Coverage  coverageOptionsPage_menuLink=Quote Options  coverageSelection_menuLink=Quote Options  quoteDisplayPage_menuLink=Generate Quote  rapidQuoteLinksPage_menuLink=View Quote Letter  optionalComplimentaryProductsPage_menuLink=Complimentary Coverages  billingContact_menuLink=Billing and Contact Information  issuePolicyPage_menuLink=Issue Policy  policySummary_menuLink=Policy Summary
${Architects_Engineers}=  //p[contains(text(), 'Architects, Engineers & Consultants')]
${CE_Link}=   //p[text()='Contractors Equipment']
${V2_My_Work_Tab}=    //a[@id='my-work']
${V2_Search_Options}=    //button[@id='dropdown-advanced']
${V2_Work_ID_InputField}=    //input[@id='workItemId']
${V2_Search_Button}=    //button[@id='searchBtn']
${V2_Policy_open_Link}=    (//span[contains(text(),'Open')])[4]
${Workid}=    //div[@id='lob-title']
${ID-continue}=   (//input[@value='Continue'])[3]
${Private_Management_Liability}=   //p[contains(text(), 'Private Company Management Liability')]
${All_LOB_GI_Address_Suggestion_Popup}=    //h2[text()='Confirm your address']
${All_LOB_GI_Client_Suggestion_Popup}=    //h2[text()='Client Suggestions']

*** Keywords ***
Accept Clearance Popup
    ${Pop-up}=  run keyword and return status    Wait Until Page Contains Element   ${All_LOB_GI_Client_Suggestion_Popup}  20s
    Run Keyword If  ${Pop-up}   Execute Javascript    window.scrollTo(0, 100)
    sleep  2s
    run keyword if    ${Pop-up}  Click Element   (//span/input[@type='checkbox'])[1]
    run keyword if    ${Pop-up}  Click Element   //button[text()='Submit']
    sleep  2s
    Set Test Variable  ${Pop-up}  ${Pop-up}
    Sleep    5s

Check and enter input
       [Arguments]  ${locator}  ${data}
       Run Keyword if  "${data}" != "nan"  Run Keywords  Clear element text  ${locator}  AND  press keys  ${locator}  ${data}

Login Real Estate E&O
        Navigate to Real Estate E&O

Navigate to Storage Tank LOB
        Wait Until Element Is Visible  ${StorageTank}  10s
        Scroll Element Into View   ${StorageTank}
        click element  ${StorageTank}

Navigate to Cyber
        Wait Until Element Is Visible  ${Cyber}  10s
        Scroll Element Into View    ${Cyber}
        click element  ${Cyber}

Navigate to Real Estate E&O
        set selenium implicit wait  3
        wait until element is enabled  ${Real_Estate_E&O}  10
        click element  ${Real_Estate_E&O}

Contractor Equipment Navigation
        Wait Until Element Is Visible  ${CE_Link}  10s
        Scroll Element Into View    ${CE_Link}
        click element  ${CE_Link}

Navigate to Private_Company_Management_Liability
	    Execute Javascript    window.scrollTo(0,50)
        wait until element is enabled  ${Private_Management_Liability}   10
        click element    ${Private_Management_Liability}

continue Click RE
        Wait Until Element Is Enabled   ${IDcontinue}
        set focus to element  ${IDcontinue}
        sleep  0.5
        mouse up  ${IDcontinue}
        click element  ${IDcontinue}  CTRL+ALT

Continue Click Generate Quote
        Wait Until Element Is Visible   ${Continue-GQ}  10s
        set focus to element  ${Continue-GQ}
        sleep  0.5
        mouse up  ${Continue-GQ}
        click element  ${Continue-GQ}  CTRL+ALT

Continue Click AE
        set focus to element  ${ID-continue}
        sleep  0.5
        mouse up  ${ID-continue}
        click element  ${ID-continue}
        wait until element is not visible  ${ID_wait-One-moment-please}  10
        wait until element is not visible  ${ID_Pleasewait}   30

Click Continue Button
        wait until element is visible    ${IDcontinue}    timeout=10s
        set focus to element  ${IDcontinue}
        sleep  0.5
        mouse up  ${IDcontinue}
        click element  ${IDcontinue}
        One Moment Please Not Visible

One Moment Please Not Visible
        wait until element is not visible    ${ID_wait-One-moment-please}    timeout=240s
        wait until element is not visible    ${ID_Pleasewait}    timeout=240s

Check and enter date
        [Arguments]  ${locator}  ${date}
        @{jscriptid} =  Split string  ${locator}  =
        Run Keyword if  "${date}" != "nan"  Run Keywords  press keys  ${locator}  '${date}'  AND  execute javascript  document.getElementById("${jscriptid[1]}").value = "${date}";

Check and select from list by label
        [Arguments]  ${locator}  ${data}
        Run Keyword if  "${data}" != "nan"  select from list by label  ${locator}  ${data}

Check expiry greater than 1 year
        [Arguments]  ${action}  ${msg}
        Check and click  General Information
        ${exp-date} =  Get value  ${ID_ExpirationDate}
        ${new-exp-date} =  Add time to date  ${exp-date}  365 days  date_format=%m-%d-%Y
        ${format-new-exp-date} =  Convert date  ${new-exp-date}  result_format=%m-%d-%Y
        Check and enter date  ${ID_ExpirationDate}  ${format-new-exp-date}
        Press Keys  ${ID_ExpirationDate}  RETURN
        continue Click RE
        ${alert-msg} =  Get text  ${ID-Alert-display}
        Run Keyword if  '${msg}' == '${alert-msg}'  Write Log  Expiry date error message check successful  ELSE  Write Log  Expiry date error message check failed
        Check and perform action  ${action}  ${ID_ExpirationDate}  ${exp-date}

Write Log
        [Arguments]  ${msg}
        Set Test Message  ${msg}\n  append=yes
        Log to console  ${msg}

Check and perform action
        [Arguments]  ${action}  ${locator}=default  ${value}=default
        Run Keyword if  '${action}' == 'Rollback'  Run Keywords  Check and enter date  ${locator}  ${value}  AND  continue Click RE
        Run Keyword if  '${action}' == 'Continue'  continue Click RE

Open V2 Generated Work Id From My Work
        click element    ${V2_My_Work_Tab}
        wait until page contains element    ${V2_Search_Options}    3s
        Wait Until Element Is Visible  link:Clear All
        Click element  link:Clear All
        sleep  1s
        click element    ${V2_Search_Options}
        wait until page contains element    ${V2_Work_ID_InputField}    2s
        Press Keys    NONE  TAB
        input text    ${V2_Work_ID_InputField}    ${Work ID}
        scroll element into view    ${V2_Search_Button}
        click element    ${V2_Search_Button}

Clik on Search Screen Policy Open Link, Undewriter
        wait until page contains element    //li[contains(text(),'${Work ID}')]    2s
        click element    //li[contains(text(),'${Work ID}')]
        wait until element is visible  ${V2_Policy_open_Link}  3s
        sleep    1s
        set focus to element     ${V2_Policy_open_Link}
        click element    ${V2_Policy_open_Link}

Clik on Search Screen Policy Open Link, Broker
        Wait Until Element Is Visible    //a[@id='CARD-view']
        Scroll Element Into View    //a[@id='CARD-view']
        Click Element    //a[@id='CARD-view']
#        wait until page contains element    //li[contains(text(),'${Work ID}')]    2s
#        Double click element    //li[contains(text(),'${Work ID}')]
         Wait Until Page Contains Element    //div[@id='${Work ID}']
         Double Click Element   //div[@id='${Work ID}']
         sleep  3s
#         Wait Until Element Is Visible    //span[@id='eventWorkItemAction_Open']
#         Click Element    //span[@id='eventWorkItemAction_Open']

#For A&E
Navigate to Architects Engineers & Consultants
        set selenium implicit wait  10s
        ${title}=  Get Window Titles
        Switch Window    ${title}[1]
        sleep  10s
        wait until element is enabled  ${Architects_Engineers}  50s
        Execute Javascript    window.scrollTo(0,50)
        click element  ${Architects_Engineers}
        Close Cyber Cookies

Assign Work ID Into Testdata
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  40
    wait until element is visible    ${Workid}    15
    ${Work_Id}=    get text    ${Workid}
    ${Name_work_id1}=    fetch from right    ${Work_Id}    (
    ${Name_work_id}=    remove string    ${Name_work_id1}    )
    ${FetchRight}=    fetch from right    ${Name_work_id}    :
    ${FetchWorkID}=    get substring    ${FetchRight}    1    7
    log to console    WORK ${Name_work_id}
    Set to dictionary  ${test_data}  WorkID=${FetchWorkID}

Stop Execution Before Binding and Issue Policy
    [Arguments]  &{test_data}
    Run Keyword If      '${test_data['Target']}'=='US - PROD'
    ...  Run Keywords    Go to UMS    AND    Fetch Client Details In UMS
#    Run Keyword If      '${test_data['Target']}'=='US - UAT'
#    ...  Run Keywords    Go to UMS    AND    Fetch Client Details In UMS
    Pass Execution If  '${test_data['Target']}'=='US - PROD'
    ...  Smoke Test  Execution is stopped in production before binding and Issue policy
#    Pass Execution If  '${test_data['Target']}'=='US - UAT'
#    ...  Smoke Test Execution is stopped in UAT for dry run before binding and Issue policy

Add X Days To Current Date
    [Arguments]    ${test_data}
    ${CurrentDate}=    get current date
    ${AfterAdding}=    add time to date    ${CurrentDate}    ${test_data['Effective Date:']} days    result_format=%m-%d-%Y
    RETURN    ${AfterAdding}

Suggestion Name Address match click for IA
        execute javascript  document.getElementById("IsUserRetainingEnteredData").click()
        execute javascript  document.getElementById("contButton").click();

Check and enter date for Date of Circumstance Description IA
        [Arguments]  ${locator}  ${date}
        @{jscriptid} =  Split string  ${locator}  =
        Run Keyword if  "${date}" != "nan"  Run Keywords  press keys  ${locator}  '${date}'  AND  execute javascript  document.getElementById("${jscriptid[0]}").value = "${date}";

Check and click for IA
       [Arguments]  ${page}
       wait until element is not visible  ${ID_wait-One-moment-please}  30
       wait until element is not visible  ${ID_Pleasewait}   30
       ${title} =  Get element attribute  class:active.list-group-item  id
       ${cur_page} =  Get from dictionary  ${page_list_IA}  ${title}
       run keyword if  '${page}' != '${cur_page}'  run keywords  Wait Until Element Is Enabled  link:${page}  AND  Click element  link:${page}

Opening New Tab UMS
    &{config_data}=  Read config data  config.txt
    ${UMS-URL}=  Set variable  ${config_data['UMS']['url']}
    go to  ${UMS-URL}

Select Value from Dropdown
    [Arguments]    ${Loctor}  ${testdata}
    Scroll Element Into View     ${Loctor}
    Click Element   ${Loctor}
    sleep  0.5s
    Check And Enter Input   ${Loctor}  ${testdata}
    Wait Until Element Is Visible   //ul/li[text()='${testdata}']
    Click Element      //ul/li[text()='${testdata}']

Select Value From Dropdown ST Cov
    [Arguments]    ${Loctor}  ${testdata}  ${Index}
    Click Element   ${Loctor}
    Wait Until Element Is Visible    (//li[text()='${testdata}'])[${Index}]
    sleep  0.5s
    Click Element    (//li[text()='${testdata}'])[${Index}]

Enter zip Code
    [Arguments]    ${locator}  ${testdata_zip}
    ${ZIP_LENGTH}=    Get Length    ${testdata_zip}
    ${one}=  Set Variable    1
    FOR    ${index}    IN RANGE   0  ${Zip_Length}
         ${Index2}=  Evaluate  ${index} + ${one}
         ${digit}=    Get Substring    ${testdata_zip}    ${index}   ${Index2}
         Input Text     ${locator}     ${digit}
    END
