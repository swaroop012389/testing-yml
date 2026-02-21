*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  String
Library  DateTime
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../../Resource/Alternus_Res/Servicing.robot
Resource    ../../Resource/Alternus_Res/Bind-Issue.robot
Resource  ../../Resource/UMS.robot


*** Variables ***
${Image-Link}=   //a[contains(text(),'IMAGE')]
${Add_External_Document}=  //a[contains(text(),'Add External Document')]
${Add_File}=  //input[@id="Uploaded_File"]
${Add_File_Class}=  //input[@class="required"]
${Document_Type}=   //select[@id="DocumentType"]
${Additional_Document_Type}=   //textarea[@id="AdditionalDocumentType"]
${OK_Button}=   //button/span[text()='OK']
${Cancel_Button}=   //button/span[text()='Cancel']
${Underwriting}=   //a[contains(text(),'UNDERWRITING')]
${T_Log}=  //a[contains(text(),'T-LOG')]
${Task_Management}=  //a[contains(text(),'TASK MANAGEMENT')]
${Create_New}=  //a[contains(text(),'Create New')]
${Task_Type}=  //select[@id="TaskType"]
${Description}=  //input[@id="TaskName"]
${Due_Date}=  //input[@id="TaskDueDate"]
${Task_Priority}=  //select[@id="TaskPriority"]
${Assign_To}=  //select[@id="UserListId"]
${Detail}=  //textarea[@id="jornalDetails"]
${Journel_Entry}=  //a[contains(text(),'JOURNAL')]
${View}=  //a[contains(text(),'View')][2]
${ID-UW-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${Bind/Issue}=  //a[contains(text(),'BIND/ISSUE')]
${Bind}=  (//a[contains(text(),'Bind')])[2]
${Select_Checkbox1}=  //input[@id='Checkbox1']
${MGMT-NFP-Select_Checkbox1}=   //input[@id='Checked_1']
${MGMT-Private-Select_Checkbox1}=   //input[@id='Checkbox1']
${Apply&Continue}=  //input[@value='Apply & Continue']
${Apply_and_Continue}=  //input[@value='Apply & Continue']
${Next}=  //input[@value='Next']
${Submit}=  //input[@id='Submit']
${Servicing}=  //a[contains(text(),'SERVICING')]
${Cancellation}=  //a[contains(text(),'Cancellation')]
${Administration}=  //a[contains(text(),'ADMINISTRATION')]
${Application_Date}=  //a[contains(text(),'Set Application Date')]
${Click_Change_Date}=  IsTodayDate
${Enter_Date}=  //input[@id='txtSelectedDate']
${Submit_Date}=  //input[@id='btnSubmit']
${UMS-JOURNAL}=    //a[contains(text(),'JOURNAL')]
${Journal-create-entry}=    //a[contains(@href, 'javascript:CreateJournalEntry();')]
${ID-JournalTypeId}=    id=JournalTypeId
${ID-Description}=    id=Description
${ID-Details}=    id=Details
${Journal-create}=    //input[@value=' Create ']
${Tlog-Details}=    (//img[@src="/Nexus/images/ic_more.gif"])[2]
${ID-UW-Decline-Application}=  //a[contains(text(),'Application')]
${DECLINE-REASON}=  //a[contains(text(),'Decline Application')]
${Apply_Button}=  //input[@value='Apply']
${Business_Brokerage}=  //option[@value='73']
${ID-UMS-ChangeDate}=  id=rdSelectDate
${ID-UMS-DatePicker}=  id=txtSelectedDate
${Lose_Quote}=  //a[contains(text(),'Lose')]
${Coverage_Option_Not_Available}=  //option[@value='214']
${Coverage_Option_Not_Available_RET}=  //option[@value='280']
${Lose_Quote}=  //a[contains(text(),'Lose')]
${Coverage_Option_Not_Available}=  //option[@value='214']
${Program_Upload_Document}=  //select[@id="OrganizationInfoModel_ProgramId"]
${Division_Upload_Document}=  //select[@id="OrganizationInfoModel_DivisionId"]
${Class_Upload_Document}=  //select[@id="OrganizationInfoModel_FirmTypeId"]
${Total_Billing_Upload_Document}=  //select[@id="OrganizationInfoModel_TotalBillingRangeId"]
${Rate_Territory_Upload_Document}=  //select[@id="OrganizationInfoModel_RateTerritoryId"]
${Billings_Upload_Document}=  //input[@id="BillingsAmount"]
${NAR_Number_Upload_Document}=  //input[@id="NarNumber"]
${Addition_Info}=  //a[contains(text(),'Additional Info')]
${SAE-Coverages}=    //input[@id='item1']
${Cyber-Coverage}=    //input[@id='item556']
${MGMT-Coverage}=    //input[@id='item549']
${Buildersrisk-Coverages-checkbox}=    //input[@id='item408']
${Loose-Quote-Apply-Button}=    //input[@value='Apply']
${TMS_Choose_File}=    //input[@id="Uploaded_File"]
${OK_Button}=    //button/span[text()='OK']
${Apply&Continue_Button}=    //input[@value='Apply & Continue']
${T-Log_Program_Text}=    (//table//tbody//tr//td)[20]
${T-Log_Program_Text}=    (//table//tbody//tr//td)[21]
${T-Log_Task_Text}=    (//table//tbody//tr//td)[22]
${T-Log_Operation_Text}=    (//table//tbody//tr//td)[23]
${T-Log_Operation2_Text}=    (//table//tbody//tr//td)[30]
${T-Log_DateTime_Text}=    (//table//tbody//tr//td)[25]


*** Keywords ***
ADD DOCUMENT
        [Arguments]  ${test_data}
        Navigate to Image File
        Add External Document
        Add Other Documents Upload
        Document Type  ${test_data}
        click ok button

Navigate to Image File
        wait until element is not visible   globalAjaxLoading  100
        ${title}=    get window titles
        Switch Window    title=${title}[1]
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible    ${Image-Link}    60
        wait until element is enabled    ${Image-Link}  60
        mouse over  ${Image-Link}
        click element  ${Image-Link}

Add Other Documents Upload
        [Arguments]  ${file}=c:\\Users\\Default\\NTUSER.DAT
        sleep  2s
        Wait Until Element Is Visible  ${TMS_Choose_File}  20s
        set focus to element  ${TMS_Choose_File}
        sleep  0.5
        mouse over    ${TMS_Choose_File}
        wait until element is enabled  ${TMS_Choose_File}  20
        choose file  ${TMS_Choose_File}  ${file}
        set selenium implicit wait  5
        set focus to element  ${OK_Button}
        sleep  0.5
        mouse up  ${OK_Button}
        click element  ${OK_Button}  CTRL+ALT

Document Type
        [Arguments]  ${test_data}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${Document_Type}   ${test_data['Document Type']}
        wait until element is not visible   globalAjaxLoading  100
        check and enter input  ${Additional_Document_Type}   ${test_data['Additional Document Type']}
        wait until element is not visible   globalAjaxLoading  100

T Log Page
       [Arguments]  ${test_data}
       wait until element is not visible   globalAjaxLoading 100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${T_Log}
       wait until element is not visible   globalAjaxLoading  100
       ${Tlog_Username}=    get text    ${T-Log_Program_Text}
       log to console   Tlog_Username:${Tlog_Username}
       ${Name}=    UMS Username
       run keyword if    'System Generated' == '${Tlog_Username}'    log to console    "Username matches and is verified"
       run keyword if    '${Name}' == '${Tlog_Username}'    log to console    "Username matches and is verified"
       ${Tlog_Program}=    get text    ${T-Log_Program_Text}
       log to console    Tlog_Program:${Tlog_Program}
       ${Tlog_Task}=    get text    ${T-Log_Task_Text}
       log to console    Tlog_Task:${Tlog_Task}
       run keyword if    'TMS' == '${Tlog_Task}'    log to console    "Task matches and is verified"
       ${Tlog_Operation}=    get text    ${T-Log_Operation_Text}
       log to console   Tlog_Operation:${Tlog_Operation}
       run keyword if    '${test_data["TC_Name"]} task triggered' == '${Tlog_Operation}'    log to console    "Operation matches and is verified"
       run keyword if    '${test_data["TC_Name"]} task closed' == '${Tlog_Operation}'    log to console    "Operation matches and is verified"
       ${Tlog_DateTime}=    get text    ${T-Log_DateTime_Text}
       ${Conv_Date}=    TMS Current Date Conversion
       ${Date}=    fetch from left    ${Tlog_DateTime}    ${space}
       log to console    Tlog_Date:${Date}
       run keyword if  '${Conv_Date}' == '${Date}'  log to console    "Date matches and is verified"

T-log Triggered
       [Arguments]    ${test_data}
       wait until element is not visible   globalAjaxLoading 200
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       Underwriter Rating
       Fetch Policy Number From UMS Header
       wait until element is not visible   globalAjaxLoading  200
       wait until element is enabled    ${ID-UW-UNDERWRITING}  200
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  200
       click element  ${T_Log}
       wait until element is not visible   globalAjaxLoading  100
       ${Tlog_Username}=    get text    ${T-Log_Program_Text}
       log to console   Tlog_Username:${Tlog_Username}
       ${Name}=    UMS Username
       run keyword if    'System Generated' == '${Tlog_Username}'    log to console    "Username matches and is verified"
       run keyword if    '${Name}' == '${Tlog_Username}'    log to console    "Username matches and is verified"
       ${Tlog_Program}=    get text    ${T-Log_Program_Text}
       log to console    Tlog_Program:${Tlog_Program}
       ${Tlog_Task}=    get text    ${T-Log_Task_Text}
       log to console    Tlog_Task:${Tlog_Task}
       run keyword if    'TMS' == '${Tlog_Task}'    log to console    "Task matches and is verified"
#       Reload Page
       Wait Until Element Is Not Visible  globalAjaxLoading  100
       ${Tlog_Operation}=    get text    ${T-Log_Operation_Text}
       ${Tlog_Operation1}=    get text    ${T-Log_Operation2_Text}
       log to console   Tlog_Operation:${Tlog_Operation}
       log to console   Tlog_Operation:${Tlog_Operation1}
       run keyword if    '${test_data["TC_Name"]} task triggered' == '${Tlog_Operation}'  log to console    "Operation matches and is verified"
       ...    ELSE IF    '${test_data["TC_Name"]} task triggered' == '${Tlog_Operation1}'    Log to console    "Operation matches and is verified"
       ...    ELSE     run keywords    Log to console    "Operation does not match"    AND    close browser
       ${Tlog_DateTime}=    get text    ${T-Log_DateTime_Text}
       ${Conv_Date}=    TMS Current Date Conversion
       ${Date}=    fetch from left    ${Tlog_DateTime}  ${space}
       log to console    Tlog_Date:${Date}
       run keyword if  '${Conv_Date}' == '${Date}'  log to console    "Date matches and is verified"

T-log Closed
       [Arguments]    ${test_data}
       wait until element is not visible   globalAjaxLoading 100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${T_Log}
       wait until element is not visible   globalAjaxLoading  100
       ${TLog_URL}=  Get Location
       Log To Console  T Log URl is: ${TLog_URL}
       ${Tlog_Username}=    get text    ${T-Log_Program_Text}
       log to console   Tlog_Username:${Tlog_Username}
       ${Name}=    UMS Username
       run keyword if    'System Generated' == '${Tlog_Username}'    log to console    "Username matches and is verified"
       run keyword if    '${Name}' == '${Tlog_Username}'    log to console    "Username matches and is verified"
       ${Tlog_Program}=    get text    ${T-Log_Program_Text}
       log to console    Tlog_Program:${Tlog_Program}
       ${Tlog_Task}=    get text    ${T-Log_Task_Text}
       log to console    Tlog_Task:${Tlog_Task}
       run keyword if    'TMS' == '${Tlog_Task}'    log to console    "Task matches and is verified"
       ${Tlog_Operation}=    get text    ${T-Log_Operation_Text}
       ${Tlog_Operation1}=  get text   ${T-Log_Operation2_Text}
       log to console   Tlog_Operation:${Tlog_Operation}
       log to console   Tlog_Operation:${Tlog_Operation1}
       run keyword if    '${test_data["TC_Name"]} task closed' == '${Tlog_Operation}'  log to console    "Operation matches and is verified"
       ...    ELSE IF    '${test_data["TC_Name"]} task closed' == '${Tlog_Operation1}'    Log to console    "Operation matches and is verified"
       ...    ELSE     run keywords    Log to console    "Operation does not match"    AND    close browser
       ${Tlog_DateTime}=    get text    ${T-Log_DateTime_Text}
       ${Conv_Date}=    TMS Current Date Conversion
       ${Date}=    fetch from left    ${Tlog_DateTime}  ${space}
       log to console    Tlog_Date:${Date}
       run keyword if  '${Conv_Date}' == '${Date}'  log to console    "Date matches and is verified"
       Underwriter Rating
       Wait Until Element Is Visible  //span[@id='PolicyNumberInHeader']  10s
       ${TMS_Policy_Number_Header}=  get text  //span[@id='PolicyNumberInHeader']
       Set Global Variable    ${TMS_Policy_Number}  ${TMS_Policy_Number_Header}

Fetch Policy Number From UMS Header
       Wait Until Element Is Visible   //span[@id='PolicyNumberInHeader']  5s
       ${TMS_Policy_Number_Header}=  get text  //span[@id='PolicyNumberInHeader']
       Log To Console  UMS Header Policy Number:${TMS_Policy_Number_Header}
       set test variable  ${policy-no}  ${TMS_Policy_Number_Header}
       Set Global Variable    ${TMS_Policy_Number}  ${TMS_Policy_Number_Header}

Add External Document
       click element  ${Add_External_Document}

Click Ok Button
        set selenium implicit wait  5
        set focus to element  ${OK_Button}
        sleep  0.5
        mouse up  ${OK_Button}
        click element  ${OK_Button}  CTRL+ALT

Decline Application
       [Arguments]    ${test_data}
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${ID-UW-Decline-Application}
       mouse over  //option[@value='${test_data['Reason Value']}']
       click element  //option[@value='${test_data['Reason Value']}']
       wait until element is visible    ${Loose-Quote-Apply-Button}
       set focus to element  ${Loose-Quote-Apply-Button}
       mouse up  ${Loose-Quote-Apply-Button}
       click element  ${Loose-Quote-Apply-Button}  CTRL+ALT
       IF     '${test_data['Program']}' == 'K&R'
            ${policy-number} =  Get text  //*[@id="PolicyNumberInHeader"]
            Log To Console    ${policy-number}
            set test variable  ${policy-no}   ${policy-number}
            set to dictionary    ${test_data}    PolicyNumber=${policy-number}
       END

Decline Reasons
        [Arguments]  &{test_data}
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Decline Application
        ${Decline reasons}=  Get Text    //option[contains(text(),' V2 Ineligible class of business ')]
        Run Keyword If    '${Decline reasons}' == '${test_data['Decline Reasons']}'  log to console  "Policy is Declined with correct decline reason"  ELSE  log to console  "Policy is not Declined with correct decline reason"


For Tsetcase 3 Bound Document Type
        [Arguments]  ${test_data}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${Document_Type}   ${test_data['Document Type']}
        wait until element is not visible   globalAjaxLoading  100
        check and enter input  ${Additional_Document_Type}   ${test_data['Additional Document Type']}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${Program_Upload_Document}   ${test_data['Upload_Program']}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${Division_Upload_Document}   ${test_data['Upload_division']}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${Class_Upload_Document}   ${test_data['Upload_class']}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${Total_Billing_Upload_Document}  ${test_data['Upload_Total_Billing_Range']}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${Rate_Territory_Upload_Document}   ${test_data['Upload_Rate_Territory']}
        wait until element is not visible   globalAjaxLoading  100
        check and enter input  ${Billings_Upload_Document}   ${test_data['Upload_Billings']}
        wait until element is not visible   globalAjaxLoading  100
        check and enter input  ${NAR_Number_Upload_Document}   ${test_data['Upload_Nar']}

Lose a quote
       [Arguments]  ${test_data}
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${Lose_Quote}
       mouse over  //option[@value='${test_data['Reason Value']}']
       click element  //option[@value='${test_data['Reason Value']}']
       wait until element is visible    ${Loose-Quote-Apply-Button}
       set focus to element  ${Loose-Quote-Apply-Button}
       sleep  0.5
       mouse up  ${Loose-Quote-Apply-Button}
       click element  ${Loose-Quote-Apply-Button}  CTRL+ALT
       IF       '${test_data['Program']}' == 'K&R'
                ${policy-number} =  Get text  //*[@id="PolicyNumberInHeader"]
                Log To Console    ${policy-number}
                set test variable  ${policy-no}   ${policy-number}
                set to dictionary    ${test_data}    PolicyNumber=${policy-number}
       END


Change the Policy Status from Quoted to Bound
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${Bind/Issue}  60
       mouse over  ${Bind/Issue}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${Bind}
       wait until element is not visible   globalAjaxLoading  100
       ${Quote_Enabled}=    run keyword and return status    element should be visible    ${Select_Checkbox1}
       Run Keyword If   '${Quote_Enabled}'=='True'    run keywords    select checkbox  ${Select_Checkbox1}    AND    click element    ${Apply_and_Continue}
       ${Endo_Enabled}=    run keyword and return status    element should be visible    ${MGMT-NFP-Select_Checkbox1}
       Run Keyword If   '${Endo_Enabled}'=='True'    select checkbox    ${MGMT-NFP-Select_Checkbox1}
       click element  ${Apply_and_Continue}
       wait until element is enabled    ${Apply_and_Continue}  60
       click element  ${Apply_and_Continue}
       wait until element is enabled    ${Apply_and_Continue}  60
       click element  ${Apply_and_Continue}
       ${Apply_&_continue}=  run keyword and return status    element should be visible    ${Apply_and_Continue}
       run keyword if    ${Apply_&_continue}    click element     ${Apply_and_Continue}
       ${CFC_Not_Bound}=    run keyword and return status    page should contain    CFC Policy Not Bound
       Run Keyword If    '${CFC_Not_Bound}'=='True'    click element    ${Payments-Next}
       ${Next_Button}=  run keyword and return status    element should be visible    ${Payments-Next}
       run keyword if    ${Next_Button}    Click element  ${Payments-Next}
       wait until element is not visible   globalAjaxLoading  100
       select radio button    Action    Review
       click element  ${Submit}
       wait until element is not visible   globalAjaxLoading  100
       ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       log to console  ${Policy_Status}
       set selenium implicit wait  5

ADD DOCUMENT for Bound status
    [Arguments]  ${test_data}
    Navigate to Image File
    Add External Document
    Add Other Documents Upload
    For Tsetcase 3 Bound Document Type  ${test_data}
    click ok button

Policy status
       ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       log to console  ${Policy_Status}

#TMS_SAE


Changing policy status from UWreview to quoted
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       mouse over  ${ID-UMS-UNDERWRITING}
       click element  link=Rating
       select radio button  Action  Review
       click element  ${ID-UMS-Cancellation-Submit}

Changing policy status from UWreview to pending info
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       mouse over  ${ID-UMS-UNDERWRITING}
       click element  ${Addition_Info}
       mouse over  //option[@value='1033']
       click element  //option[@value='1033']
       set selenium implicit wait  5
       set focus to element  //input[@value='Apply & Continue']
       sleep  0.5
       mouse up  //input[@value='Apply & Continue']
       click element  //input[@value='Apply & Continue']
       select radio button  Action  Review
       click element  ${ID-UMS-Cancellation-Submit}

## TMS_MGMT LIAB Non Profit
Set UMS date X Number of Days Prior Exp Date MGMT LIAB NFP
        [Arguments]  ${xdays}
        wait until element is not visible   globalAjaxLoading  200
        ${Final_date}=    Subtract x Days from the Exp Date  ${Substring_element}  ${xdays}
        set testvariable  ${Final_date}
        ${calcc-date}=  Subtract time from date  ${Final_date}  0  date_format=%m/%d/%Y
        ${format-calc-date}=  Convert date  ${calcc-date}  result_format=%m/%d/%Y
        Set testvariable  ${application-date}  ${format-calc-date}
        log to console  ${application-date}
        @{datess}=  Split string  ${application-date}  /
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{datess}
        click element  ${ID-UMS-Submitoffset}


Return date 100 Days prior to renewal date for MGMT LIAB
       wait until element is not visible   globalAjaxLoading  10
       ${Renewal_Substring_element}=    Get Substring Value    ${element}  16  26
       log to console  ${Substring_element}
       ${Renewal_Final_date}=    Subtract 100 Days from the Renewal Date for MGMT LIAB  ${Renewal_Substring_element}
       set testvariable  ${Renewal_Final_date}
       log to console  ${Renewal_Final_date}
       RETURN    ${Renewal_Final_date}

Changing policy status from UWreview to quoted for MGMT
      wait until element is not visible   globalAjaxLoading  200
      mouse up    ${Underwritting_Tab}
      wait until element is visible   ${Rating_link}
      click element   ${Rating_link}
      wait until element is not visible   globalAjaxLoading  200
      Click Element    ${Builders_risk-Coverage}
      wait until element is visible  ${Program}
      ${programName}=  get text  ${Program}
      log to console  get text:${programName}
      run keyword if  '${programName}'=='MGMT-LIAB'  select checkbox  ${MGMT_Coverage1}
      click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is not visible   globalAjaxLoading  100
      wait until element is visible   ${ApplyChanges-Button}
      click element   ${ApplyChanges-Button}
      wait until element is not visible   globalAjaxLoading  100
      log to console  Rating base page reached
      wait until element is not visible   globalAjaxLoading  100
      click element   ${ID-UMS-CancellationApply&Continue}
      log to console  Modifiers page reached
      wait until element is not visible   globalAjaxLoading  100
      click element   ${ID-UMS-CancellationApply&Continue}
      log to console  Limit/Deductibles options page reached
      wait until element is not visible   globalAjaxLoading  100
      run keyword if  '${programName}'=='MGMT-LIAB'  click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is not visible   globalAjaxLoading  100
      select checkbox  ${CoverageSelectAllCheckboxes}
      click element   ${ID-UMS-CancellationApply&Continue}
      log to console  Quote options page reached
      wait until element is not visible   globalAjaxLoading  100
      click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is not visible   globalAjaxLoading  100
      wait until element is visible   ${ApplyChanges-Button}
      click element   ${ApplyChanges-Button}
      wait until element is not visible   globalAjaxLoading  100
      select radio button  Action  Review
      click element  ${ID-UMS-Cancellation-Submit}

Change the Policy Status from Quoted to Bound For MGMT LIAB Non Profit
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${Bind/Issue}  60
       mouse over  ${Bind/Issue}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${Bind}
       wait until element is not visible   globalAjaxLoading  100
       select checkbox  ${MGMT-NFP-Select_Checkbox1}
       click element  ${Apply_and_Continue}
       wait until element is enabled    ${Apply_and_Continue}  60
       click element  ${Apply_and_Continue}
       wait until element is enabled    ${Apply_and_Continue}  60
       click element  ${Apply_and_Continue}
       ${Apply_&_continue}=  run keyword and return status    element should be visible    ${Apply_and_Continue}
       run keyword if    ${Apply_&_continue}    click element     ${Apply_and_Continue}
       ${Next_Button}=  run keyword and return status    element should be visible    ${Payments-Next}
       run keyword if    ${Next_Button}    Click element  ${Payments-Next}
       wait until element is not visible   globalAjaxLoading  100
       select radio button    Action    Review
       click element  ${Submit}
       wait until element is not visible   globalAjaxLoading  100
       ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       log to console  ${Policy_Status}
       set selenium implicit wait  5

Changing policy status from UWreview to pending info for MGMT
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       mouse over  ${ID-UMS-UNDERWRITING}
       click element  ${Addition_Info}
       mouse over  //option[@value='124974']
       click element  //option[@value='124974']
       set selenium implicit wait  5
       set focus to element  //input[@value='Apply & Continue']
       sleep  0.5
       mouse up  //input[@value='Apply & Continue']
       click element  //input[@value='Apply & Continue']
       select radio button  Action  Review
       click element  ${ID-UMS-Cancellation-Submit}

Changing policy status from UWreview to Info
       [Arguments]     ${test_data}
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       mouse over  ${ID-UMS-UNDERWRITING}
       click element  ${Addition_Info}
       mouse over  //option[@value='124974']
       click element  //option[@value='124974']
       set selenium implicit wait  5
       set focus to element  //input[@value='Apply & Continue']
       sleep  0.5
       mouse up  //input[@value='Apply & Continue']
       click element  //input[@value='Apply & Continue']
       select radio button  Action  Review
       click element  ${ID-UMS-Cancellation-Submit}

Changing policy status from UW Review to pending
      [Arguments]    ${test_data}
      wait until element is not visible   globalAjaxLoading  200
      mouse up    ${Underwritting_Tab}
      wait until element is visible   ${Rating_link}
      click element   ${Rating_link}
      wait until element is not visible   globalAjaxLoading  200
      Click Element    ${Builders_risk-Coverage}
      #wait until element is visible  ${Program}
      #${programName}=  get text  ${Program}
      #log to console  get text:${programName}
      run keyword if  '${test_data['Program']}'=='SAE'  select checkbox  ${SAE-Coverages}
      run keyword if  '${test_data['Program']}'=='BUILDERSRISK'  select checkbox  ${Buildersrisk-Coverages-checkbox}
      run keyword if  '${test_data['Program']}'=='CYBER PVT ENT'  select checkbox  ${Cyber_Coverage1}
      run keyword if  '${test_data['Program']}'=='MGMT-LIAB'  select checkbox  ${MGMT-Coverage}
      click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is not visible   globalAjaxLoading  100
      wait until element is visible   ${ApplyChanges-Button}
      click element   ${ApplyChanges-Button}
      wait until element is not visible   globalAjaxLoading  100
      log to console  Rating base page reached
      wait until element is not visible   globalAjaxLoading  100
      wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
      mouse over  ${ID-UMS-UNDERWRITING}
      click element  link=Policy Holds
      wait until element is not visible   globalAjaxLoading  10
      click element  id=idReleaseAll
      Click Element  //html/body/table/tbody/tr[2]/td/div/div/div[2]/form/div/input[2]

Changing policy status from UWreview to pending for TMS Cyber
      wait until element is not visible   globalAjaxLoading  200
      mouse up    (//li//a[contains(text(),'UNDERWRITING')])
      wait until element is visible   (//li//a[contains(text(),'UNDERWRITING')])[1]
      click element   (//li//a[contains(text(),'UNDERWRITING')])[1]
      wait until element is not visible   globalAjaxLoading  200
      wait until element is visible  (//tr//th[contains(text(),'Program')]//following-sibling::td//select/option)[2]
      ${programName}=  get text  (//tr//th[contains(text(),'Program:')]//following-sibling::td//select/option)[2]
      log to console  get text:${programName}
      run keyword if  '${programName}'=='CYBER PVT ENT'  select checkbox  ${Cyber_Coverage1}
      click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is not visible   globalAjaxLoading  100
      wait until element is visible   ${ApplyChanges-Button}
      click element   ${ApplyChanges-Button}
      wait until element is not visible   globalAjaxLoading  100

Changing policy status from UWreview to quoted for TMS Cyber
      wait until element is not visible   globalAjaxLoading  200
      mouse up    (//li//a[contains(text(),'UNDERWRITING')])
      wait until element is visible   (//li//a[contains(text(),'UNDERWRITING')])[1]
      click element   (//li//a[contains(text(),'UNDERWRITING')])[1]
      wait until element is not visible   globalAjaxLoading  200
      wait until element is visible  (//tr//th[contains(text(),'Program')]//following-sibling::td//select/option)[2]
      ${programName}=  get text  (//tr//th[contains(text(),'Program:')]//following-sibling::td//select/option)[2]
      log to console  get text:${programName}
      run keyword if  '${programName}'=='CYBER PVT ENT'  select checkbox  ${Cyber_Coverage1}
      click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is not visible   globalAjaxLoading  100
      wait until element is visible   ${ApplyChanges-Button}
      click element   ${ApplyChanges-Button}
      wait until element is not visible   globalAjaxLoading  100
      #log to console  Rating base page reached
      #wait until element is not visible   globalAjaxLoading  100
      #click element   ${ID-UMS-CancellationApply&Continue}
      #log to console  Modifiers page reached
      #wait until element is not visible   globalAjaxLoading  100
      #click element   ${ID-UMS-CancellationApply&Continue}
      #log to console  Limit/Deductibles options page reached
      #wait until element is not visible   globalAjaxLoading  100
      #run keyword if  '${programName}'=='CYBER PVT ENT'  click element   ${ID-UMS-CancellationApply&Continue}
      #wait until element is not visible   globalAjaxLoading  100
      #select checkbox  ${CoverageSelectAllCheckboxes}
      #click element   ${ID-UMS-CancellationApply&Continue}
      #log to console  Quote options page reached
      #wait until element is not visible   globalAjaxLoading  100
      #select radio button  Action  Review
      #click element  ${ID-UMS-Cancellation-Submit}

Changing policy status from UWreview to pending info for TMS Cyber
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       mouse over  ${ID-UMS-UNDERWRITING}
       click element  ${Addition_Info}
       mouse over  //option[@value='124967']
       click element  //option[@value='124967']
       set selenium implicit wait  5
       set focus to element  ${Apply&Continue_Button}
       sleep  0.5
       mouse up  ${Apply&Continue_Button}
       click element  ${Apply&Continue_Button}
       select radio button  Action  Review
       click element  ${ID-UMS-Cancellation-Submit}

Change the Policy Status from Quoted to Bound For MGMT Private
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${Bind/Issue}  60
       mouse over  ${Bind/Issue}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${Bind}
       wait until element is not visible   globalAjaxLoading  100
       select checkbox  ${MGMT-Private-Select_Checkbox1}
       click element  ${Apply_and_Continue}
       wait until element is enabled    ${Apply_and_Continue}  60
       click element  ${Apply_and_Continue}
       wait until element is visible    ${Apply_and_Continue}  20s
       click element  ${Apply_and_Continue}
       ${Apply_&_continue}=  run keyword and return status    element should be visible    ${Apply_and_Continue}
       run keyword if    ${Apply_&_continue}    click element     ${Apply_and_Continue}
       ${Next_Button}=  run keyword and return status    element should be visible    ${Payments-Next}
       run keyword if    ${Next_Button}    Click element  ${Payments-Next}
       Wait Until Element Is Not Visible  globalAjaxLoading  100
       ${Next_Button}=  run keyword and return status    element should be visible    ${Payments-Next}
       run keyword if    ${Next_Button}    Click element  ${Payments-Next}
       wait until element is not visible   globalAjaxLoading  100
       select radio button    Action    Review
       click element  ${Submit}
       wait until element is not visible   globalAjaxLoading  100
       ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       log to console  ${Policy_Status}
       set selenium implicit wait  5

Get Policy Status
        [Arguments]    ${test_data}
        wait until element is not visible    globalAjaxLoading 100
        ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
        ${Policy_Status}=  Fetch From Right  ${Policy_Header_Info}  STATUS:
        set suite variable  ${Policy_Status}
        log to console    Policy Status is: ${Policy_Status}

Get Policy Status for Endrosement
        [Arguments]    ${test_data}
        wait until element is not visible    globalAjaxLoading 100
        ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
        ${Policy_Status}=  Fetch From Right  ${Policy_Header_Info}  STATUS:
        set suite variable  ${Policy_Status}
        log to console    Policy Status is: ${Policy_Status}

Get Policy Stage for Endrosement
        [Arguments]    ${test_data}
        wait until element is not visible    globalAjaxLoading 100
        ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
        ${Policy_Stage1}=    Fetch From Right  ${Policy_Header_Info}  STAGE:
        ${Policy_Stage}=    Get Substring  ${Policy_Stage1}  1  12
        set suite variable  ${Policy_Stage}
        log to console    Policy Stage is: ${Policy_Stage}

Verify Policy Stage 1
        [Arguments]     ${test_data}
        run keyword if     '${Policy_Stage}'=='${test_data['Policy Stage 1']}'     log to console    Policy Stage Matches and Verified
        ...     ELSE     run keywords     log to console     Policy Stage is not matching     AND     Close Browser

Generate Follow Up Task
       [Arguments]    ${test_data}
       ${title}=    get window titles
       Switch Window    title=${title}[1]
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       click element    //a[contains(text(),'Additional Info')]
       wait until element is not visible   globalAjaxLoading  100
       Wait Until Element Is Visible    //option[contains(text(),'${test_data['Add Info Needed']}')]  5s
       sleep  5s
       click element    //option[contains(text(),'${test_data['Add Info Needed']}')]
       check and enter input    //td/textarea[@id='Comment']    ${test_data['Add Info comment']}
       click element    ${Apply_and_Continue}
       wait until element is not visible    globalAjaxLoading    10
       select radio button    Action    Review
       select checkbox    FollowUpTaskChecked
       click element  ${Submit}

Verify After Triggering If the Task is Listed Under UMS Task Management
        [Arguments]    ${test_data}
        sleep  2s
        click element    ${UMS_Task_Management}
        wait until element is visible    //td[contains(text(),'Follow-Up Task')]    10
        ${UMS_TM_Task_Name}=    get text    //td[contains(text(),'Follow-Up Task')]
        run keyword if    '${test_data['Task Name']}'=='${UMS_TM_Task_Name}'    log to console
        ...    ${UMS_TM_Task_Name} is triggered and present undet task management tab, Verified
        ...  ELSE  run keywords  log to console  Task is not present under task management tab  AND  close browser

Navigate To Rating Page
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       click element    (//li/a[contains(text(),'Rating')])[1]
       wait until element is not visible   globalAjaxLoading  100

Navigate to Quote Letter Page, Review & Submit Quote Letter
       wait until element is not visible   globalAjaxLoading  100
       click element    ${ID-UMS-Quote-letter}
       wait until element is not visible   globalAjaxLoading  100
       select radio button    Action    Review
       click element  ${Submit}
       wait until element is not visible   globalAjaxLoading  100


Changing policy status from Pending to quoted for TMS Cyber
      wait until element is not visible   globalAjaxLoading  200
      mouse up    (//li//a[contains(text(),'UNDERWRITING')])
      wait until element is visible   (//li//a[contains(text(),'UNDERWRITING')])[1]
      click element   (//li//a[contains(text(),'UNDERWRITING')])[1]
      wait until element is not visible   globalAjaxLoading  200
      wait until element is visible  (//tr//th[contains(text(),'Program')]//following-sibling::td//select/option)[2]
      ${programName}=  get text  (//tr//th[contains(text(),'Program:')]//following-sibling::td//select/option)[2]
      log to console  get text:${programName}
      #run keyword if  '${programName}'=='CYBER PVT ENT'  select checkbox  ${Cyber_Coverage1}
      #click element   ${ID-UMS-CancellationApply&Continue}
      #wait until element is not visible   globalAjaxLoading  100

      #wait until element is not visible   globalAjaxLoading  100
      #wait until element is visible  ${DeductibleValue}
      #clear element text    ${DeductibleValue}
      #input text  ${DeductibleValue}   2
      #click element   ${ID-UMS-CancellationApply&Continue}
      log to console  Rating base page reached
      wait until element is not visible   globalAjaxLoading  100
      click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is visible   ${ApplyChanges-Button}
      click element   ${ApplyChanges-Button}
      log to console  Modifiers page reached
      wait until element is not visible   globalAjaxLoading  100
      click element   ${ID-UMS-CancellationApply&Continue}
      log to console  Limit/Deductibles options page reached
      wait until element is not visible   globalAjaxLoading  100
      click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is not visible   globalAjaxLoading  100
      click element   ${ID-UMS-CancellationApply&Continue}
      wait until element is not visible   globalAjaxLoading  100
      select checkbox  ${CoverageSelectAllCheckboxes}
      click element   ${ID-UMS-CancellationApply&Continue}
      log to console  Quote options page reached
      wait until element is not visible   globalAjaxLoading  100
      select radio button  Action  Review
      click element  ${ID-UMS-Cancellation-Submit}

Get Policy Status for Endrosement ERP
    [Arguments]    ${test_data}
        wait until element is not visible    globalAjaxLoading 100
        ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
        ${Policy_Status}=  Fetch From Right  ${Policy_Header_Info}  STATUS:
        set suite variable  ${Policy_Status}
        log to console    Policy Status is: ${Policy_Status}