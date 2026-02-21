*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/Generic.robot
Resource    ../../Resource/TMS_Res/TMS_Dashboard.robot
Resource    ../Alternus_Res/Alt_Generic.robot


*** Variables ***
${Open}=  (//a[@href="javascript:void(0);"])[1]
${Close}=    //a[text()='Close']
${Task_Type}=  //a[@href='/TMS/Home/TaskGrid?grid-sort=StepDesc-asc']
${Task_Type_Filter}=  (//span[@title="Filter"])[1]
${Insured_Applicant_Filter}=  (//span[@title="Filter"])[2]
${Policy_Status}=  (//span[@title="Filter"])[3]
${Work_ID}=  //a[@class='k-header-column-menu k-state-active']
${Work-Id-Border-up}=  //a[@class='k-header-column-menu k-state-border-up']
${Work-Id-datafield}=    (//span[@class="k-icon k-i-more-vertical"])[5]
${Task-Id-class}=    (//span[@class="k-icon k-i-more-vertical"])[2]
${Action-ID-Class}=  (//span[@class="k-icon k-i-more-vertical"])[1]
${Action-Column}=  //li[@class='k-item k-columns-item k-state-default k-first k-last']
${Reassign-Close_Button}=  //span[@class='ui-accordion-header ui-corner-top ui-accordion-header-collapsed ui-corner-all ui-state-default ui-accordion-icons']
${Checkbox_select}=  //li[@class="k-item k-state-default k-first"]
${Work-ID-Search}=  //span[@class="k-icon k-i-filter"]
${Work_Id_Policy_Number}=  (//input[@class="k-textbox"])[1]
${TaskType-Id-filter}=    (//li[@class='k-item k-filter-item k-state-default k-last'])[2]
${Filter_Button}=  //button[@class="k-button k-primary"]
${Select_Value}=  //span[text()="--Select Value--"]
${Select_Value_Filter}=  (//span[@class="k-dropdown-wrap k-state-default"])[3]
${Reassign1-Close_Button}=  //select[@id='ReassignIdBulk']
${Reassign-comment}=  //textarea[@id='txtCommentsBulk']
${Main_Checkbox_Filter_Values}=  (//label[@class="k-checkbox-label k-no-text"]) [1]
${Sub_Check_Boxs1}=  (//label[@class="k-checkbox-label k-no-text"]) [2]
${Sub_Check_Boxs2}=  (//label[@class="k-checkbox-label k-no-text"]) [3]
${Sub_Check_Boxs3}=  (//label[@class="k-checkbox-label k-no-text"]) [4]
${Sub_Check_Boxs4}=  (//label[@class="k-checkbox-label k-no-text"]) [5]
${Sub_Check_Boxs5}=  (//label[@class="k-checkbox-label k-no-text"]) [6]
${Sub_Check_Boxs6}=  (//label[@class="k-checkbox-label k-no-text"]) [7]
${Sub_Check_Boxs7}=  (//label[@class="k-checkbox-label k-no-text"]) [8]
${Sub_Check_Boxs8}=  (//label[@class="k-checkbox-label k-no-text"]) [9]
${Sub_Check_Boxs9}=  (//label[@class="k-checkbox-label k-no-text"]) [10]
${Sub_Check_Boxs10}=  (//label[@class="k-checkbox-label k-no-text"]) [11]
${Sub_Check_Boxs11}=  (//label[@class="k-checkbox-label k-no-text"]) [12]
${Sub_Check_Boxs12}=  (//label[@class="k-checkbox-label k-no-text"]) [13]
${TMS_Program}=  //select[@id='ProgramId']
${TMS_Division}=   //select[@id='DivisionId']
${TMS_Worklist}=  //select[@id='Worklist']
${TMS_DueDateRange}=  //select[@id='DueDateRange']
${TMS_Status}=  //select[@name='Status']
${DateChange}=  //input[@id='dateRange']
${Datechange_Submit_Button}=  (//button[@type='button'])[4]
${Datechange_Cancel_Button}=  (//button[@type='button'])[3]
${Rfresh_Button_ID}=  //button[@value='Refresh']
${ID_UMS_Button}=  //button[@id="btnUMS"]
${ID_V2_Button}=  //button[@id="btnV2"]
${ID_V2_Submit}=  ///button[@id="btnSubmit"]
${ID_V2_Close}=  //button[@id="btnClose"]
${Comments}=  //textarea[@name='txtComments']
${Com_1}=  //textarea[@id='txtComments']
${Type-Due-Data-Value11}=  //input[@id="newDueDate"]
${Due_Date_Edit_Task}=  //span[@class='k-picker-wrap k-state-default']
${Select_Check_Box}=  //input[@id='IsJournalNote']
${Type_Policy_Select_Value}=  //span[@class='k-dropdown-wrap k-state-default']
${Type-Due-Data-Value}=  //span[@class='k-widget k-datepicker k-header form-control pull-left fontstyle']
${Type-Due-Data-Value1}=  //input[@id="newDueDate"]
${Checkbox_Action_Select_All}=  //li[@class="k-item k-state-default k-first"]
${ID-COV-Apply&Continue} =  //input[@value='Apply & Continue']
${ID-COV-ApplyChanges} =    //button/span[text()='Apply Changes']
${Underwriting}=   //a[contains(text(),'UNDERWRITING')]
${Rating}=  //a[contains(text(),'Rating')]
${Reassigned_1}=    (//div//table//tbody/tr[1]//td)[12]
${Reassigned_2}=    (//div//table//tbody/tr[2]//td)[12]
${Reassigned_3}=    (//div//table//tbody/tr[3]//td)[12]
${Reassigned_4}=    (//div//table//tbody/tr[4]//td)[12]
${Reassigned_5}=    (//div//table//tbody/tr[5]//td)[12]
${Reassigned_6}=    (//div//table//tbody/tr[6]//td)[12]
${TMS_JoornalNote_Checkbox}=    //input[@id='IsJournalNote']
${Accept_alert}=    action=ACCEPT
${Dismiss_alert}=    action=DISMISS
${Close_All_Button}=    //button[@id='btnCloseAll']
${Expand_Arrow}=    //span[@class="k-icon k-i-arrow-60-right k-menu-expand-arrow"]
${First_Item}=    //li[@class="k-item k-state-default k-first"]
${Index_1}=    (//input[@data-index='1'])
${Index_2}=    (//input[@data-index='2'])
${Index_3}=    (//input[@data-index='3'])
${Index_4}=    (//input[@data-index='4'])
${Link_1}=    (//span[@class='k-link'][1])
${No_Text_Label}=    //label[@class='k-checkbox-label k-no-text']
${Bulk_Reassign}=    //button[@id='btnBulkReassign']
${UMS_Button}=    //button[@id="btnUMS"]
${Close_Button}=    //button[@id="btnClose"]
${TMS_Button_Submit}=    //button[@id="btnSubmit"]
${Primary_Butotn_1}=    //button[@class="k-button k-primary"]
${Primary_Butotn_2}=    (//button[@class='k-button k-primary'])[2]
${Dropdown_header}=    (//span[@class='k-widget k-dropdown k-header'])[5]
##Endorsements##
${Checkbox_E&O}=    //input[@id='item456']
${Checkbox_MOLDFUNGIMICROBE}=  //input[@id='CoverageIDs_461']
${Checkbox_DISCRIMINATION}=     //input[@id='CoverageIDs_467']
#ERP##
${ERP2_REO}=     //input[@id='CoverageIDs_469']
${ERP3_REO}=    //input[@id='CoverageIDs_470']
${ERP_Unlimited_REO}=   //input[@id='CoverageIDs_538']


*** Keywords ***
Select policy
        [Arguments]   ${test_data}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${TMS_Program}   ${test_data['TMS_Program']}
        wait until element is visible    ${TMS_Division}    10s
        Check and select from list by label  ${TMS_Division}   ${test_data['TMS_Division']}
        wait until element is visible    ${TMS_Worklist}    10s
        Check and select from list by label  ${TMS_Worklist}   ${test_data['TMS_Worklist']}
        wait until element is visible    ${TMS_DueDateRange}    10s
        Check and select from list by label  ${TMS_DueDateRange}   ${test_data['TMS_Due Date Range']}
        wait until element is visible    ${TMS_Status}    10s
        Check and select from list by label  ${TMS_Status}   ${test_data['TMS_Status']}
        wait until element is not visible   globalAjaxLoading  50
        click refresh button
        Search Policy from List  ${test_data}

Select policy with close status
        [Arguments]   ${test_data}
        wait until element is not visible   globalAjaxLoading  100
        Check and select from list by label  ${TMS_Program}   ${test_data['TMS_Program']}
        wait until element is visible    ${TMS_Division}    100
        Check and select from list by label  ${TMS_Division}   ${test_data['TMS_Division']}
        wait until element is visible    ${TMS_Worklist}    100
        Check and select from list by label  ${TMS_Worklist}   ${test_data['TMS_Worklist']}
        wait until element is visible    ${TMS_DueDateRange}    100
        Check and select from list by label  ${TMS_DueDateRange}   ${test_data['TMS_Due Date Range']}
        wait until element is visible    ${TMS_Status}    100
        Check and select from list by label  ${TMS_Status}   ${test_data['TMS_Status']}
        click refresh button
        Search Policy from List  ${test_data}
        wait until element is not visible   globalAjaxLoading  100
        ${Policy_Status}=    get text    (//table//tbody//tr//td)[20]
        log to console   Policy status:${Policy_Status}

Click Refresh Button
        mouse over  ${Rfresh_Button_ID}
        click element  ${Rfresh_Button_ID}

Open Policy from List
        sleep  3s
        wait until element is visible    ${Open}   50s
        wait until element is enabled    ${Open}   50
        mouse over  ${Open}
        click element  ${Open}

Search Policy from List
        [Arguments]   ${test_data}
        set focus to element  ${Work-Id-datafield}
        sleep  2s
        mouse over  ${Work-Id-datafield}
        click element    ${Work-Id-datafield}
        set selenium implicit wait  5
        set focus to element  ${Work-ID-Search}
        sleep  2s
        mouse over  ${Work-ID-Search}
        click element  ${Work-ID-Search}
        wait until element is not visible   globalAjaxLoading  10
        set focus to element  ${Work_Id_Policy_Number}
        check and enter input  ${Work_Id_Policy_Number}   ${TMS_Policy_Number}
        set selenium implicit wait  8
        set focus to element  ${Primary_Butotn_1}
        sleep  1
        mouse up  ${Primary_Butotn_1}
        click element  ${Primary_Butotn_1}  CTRL+ALT
        set focus to element  ${Task-Id-class}
        sleep  2s
        mouse over  ${Task-Id-class}
        click element    ${Task-Id-class}
        set focus to element    ${TaskType-Id-filter}
        sleep  2s
        mouse over  ${TaskType-Id-filter}
        set focus to element    ${Dropdown_header}
        sleep  5s
        mouse over    ${Dropdown_header}
        click element    ${Dropdown_header}    CTRL+ALT
        mouse over    //li[text()='${test_data["TC_Name"]}']
        click element    //li[text()='${test_data["TC_Name"]}']
        mouse over    ${Primary_Butotn_2}
        click element    ${Primary_Butotn_2}
        Open Policy from List

Edit Task
       [Arguments]   ${test_data}
       wait until element is not visible   globalAjaxLoading  100
       check and enter input  ${Comments}   ${test_data['Comment']}
       wait until element is not visible   globalAjaxLoading  100
       check and enter input  ${Type-Due-Data-Value1}   20-June-2025
       Select Checkbox  ${TMS_JoornalNote_Checkbox}
       Checkbox Should Be Selected  ${TMS_JoornalNote_Checkbox}
       Click Submit Button
       Handle Alert  timeout=10 s

Open Policy from TMS to UMS
       Open Policy from List
       Click UMS Button in Edit Task

Click Submit Button
        set selenium implicit wait  5
        set focus to element  ${TMS_Button_Submit}
        sleep  0.5
        mouse up  ${TMS_Button_Submit}
        click element  ${TMS_Button_Submit}  CTRL+ALT

Edit Task2
       [Arguments]   ${test_data}
       wait until element is not visible   globalAjaxLoading  100
       check and enter input  ${Com_1}  ${test_data['Comment_1']}
       wait until element is not visible   globalAjaxLoading  100
       check and enter input  ${Type-Due-Data-Value11}   20-June-2027
       Select Checkbox  //input[@id='IsJournalNote']
       Checkbox Should Be Selected  //input[@id='IsJournalNote']
       Click Submit Close
       Handle Alert  timeout=10 s
       Back to UMS

Click Submit Close
        set selenium implicit wait  5
        set focus to element  ${Close_Button}
        sleep  0.5
        mouse up  ${Close_Button}
        click element  ${Close_Button}   CTRL+ALT

Click UMS Button in Edit Task
        set selenium implicit wait  5
        sleep  0.5
        set focus to element  ${UMS_Button}
        wait until element is visible  ${UMS_Button}  5s
        sleep  0.5
        mouse up  ${UMS_Button}
        click element  ${UMS_Button}  CTRL+ALT

Pending to Quote
         wait until element is not visible   globalAjaxLoading  100
         wait until element is visible    ${Underwriting}    60
         wait until element is enabled    ${Underwriting}  60
         mouse over  ${Underwriting}
         click element  ${Rating}
         #${Discrimination status}=  Run Keyword And Return Status    Checkbox Should Be Selected    id=CoverageIDs_467
         #Run Keyword If  '${Discrimination status}'=='False'  Click Element  id=CoverageIDs_467
         click element    ${ID-COV-Apply&Continue}
         wait until element is not visible   globalAjaxLoading  200
         ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
         run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
         wait until element is not visible   globalAjaxLoading  100
         click element    ${ID-COV-Apply&Continue}
         wait until element is not visible   globalAjaxLoading  100
         click element    ${ID-COV-Apply&Continue}
         wait until element is not visible   globalAjaxLoading  100
         click element    ${ID-COV-Apply&Continue}
         wait until element is not visible   globalAjaxLoading  100
         click element    ${ID-COV-Apply&Continue}

Select policy1
        [Arguments]   ${test_data}
        wait until element is not visible   globalAjaxLoading  10
        Check and select from list by label  ${Program}   ${test_data['TMS_Program']}
        Check and select from list by label  ${TMS_Division}   ${test_data['TMS_Division']}
        Check and select from list by label  ${TMS_Worklist}   ${test_data['TMS_Worklist']}
        Check and select from list by label  ${TMS_DueDateRange}   ${test_data['TMS_Due Date Range']}
        Check and select from list by label  ${TMS_Status}   ${test_data['TMS_Status']}
        wait until element is not visible   globalAjaxLoading  50
        input text  ${DateChange}   ${test_data['TMS_Date']}
        wait until element is not visible   globalAjaxLoading  50
        click refresh button
        Search Task Type from List  ${test_data}

Search Task Type from List
        [Arguments]   ${test_data}
        set selenium implicit wait  8
        set focus to element  ${Action-ID-Class}
        sleep  2s
        mouse over  ${Action-ID-Class}
        click element    ${Action-ID-Class}
        set selenium implicit wait  8
        set focus to element    ${Expand_Arrow}
        sleep  2s
        mouse over   ${Expand_Arrow}
        click element   ${Expand_Arrow}
        set selenium implicit wait  10
        mouse over   ${First_Item}
        click element   ${Link_1}
        set selenium implicit wait  3
        click element   ${No_Text_Label}  CTRL+ALT
        click element   ${Reassign-Close_Button}
        wait until element is not visible   globalAjaxLoading  10
        Input Text    ${Reassign-comment}    ${test_data['Comment']}
        Check and select from list by label   ${Reassign1-Close_Button}   ${test_data['Re-Assign']}
        click element  ${Bulk_Reassign}
        #Handle Alert  action=ACCEPT
        Handle Alert  ${Dismiss_alert}

Select policy2
        [Arguments]   ${test_data}
        wait until element is not visible   globalAjaxLoading  10
        Check and select from list by label  ${Program}   ${test_data['TMS_Program']}
        Check and select from list by label  ${Division}   ${test_data['TMS_Division']}
        Check and select from list by label  ${Worklist}   ${test_data['TMS_Worklist']}
        Check and select from list by label  ${DueDateRange}   ${test_data['TMS_Due Date Range']}
        Check and select from list by label  ${Status}   ${test_data['TMS_Status1']}
        wait until element is not visible   globalAjaxLoading  50
        click refresh button
        Search Task Type from List  ${test_data}

Select policy3
        [Arguments]   ${test_data}
        wait until element is not visible   globalAjaxLoading  10
        Check and select from list by label  ${Program}   ${test_data['TMS_Program']}
        Check and select from list by label  ${Division}   ${test_data['TMS_Division']}
        Check and select from list by label  ${Worklist}   ${test_data['TMS_Worklist']}
        Check and select from list by label  ${DueDateRange}   ${test_data['TMS_Due Date Range']}
        Check and select from list by label  ${Status}   ${test_data['TMS_Status1']}
        wait until element is not visible   globalAjaxLoading  50
        click refresh button
        Search Task Type from List2  ${test_data}

Search Task Type from List2
        [Arguments]   ${test_data}
        set selenium implicit wait  8
        set focus to element  ${Action-ID-Class}
        sleep  2s
        mouse over  ${Action-ID-Class}
        click element    ${Action-ID-Class}
        set selenium implicit wait  8
        set focus to element    ${Expand_Arrow}
        sleep  2s
        mouse over   ${Expand_Arrow}
        click element   ${Expand_Arrow}
        set selenium implicit wait  10
        mouse over   ${First_Item}
        Click Element    ${Index_1}
        Click Element    ${Index_2}
        Click Element    ${Index_3}
        Click Element    ${Index_4}
        click element   ${Link_1}
        set selenium implicit wait  3
        click element   ${No_Text_Label}  CTRL+ALT
        click element   ${Reassign-Close_Button}
        wait until element is not visible   globalAjaxLoading  10
        Input Text    ${Reassign-comment}    ${test_data['Comment']}
        mouse over   ${Close_All_Button}
        click element   ${Close_All_Button}
        Handle Alert  ${Accept_alert}
        Handle Alert  ${Dismiss_alert}

Re-Assigned Verification
        set selenium implicit wait  5
        ${Check-Re-Assigned1}=  get text   ${Reassigned_1}
        log to console   ${Check-Re-Assigned1}
        ${Check-Re-Assigned2}=  get text   ${Reassigned_2}
        log to console   ${Check-Re-Assigned2}
        ${Check-Re-Assigned3}=  get text   ${Reassigned_3}
        log to console   ${Check-Re-Assigned3}
        ${Check-Re-Assigned4}=  get text   ${Reassigned_4}
        log to console   ${Check-Re-Assigned4}
        ${Check-Re-Assigned5}=  get text   ${Reassigned_5}
        log to console   ${Check-Re-Assigned5}
        ${Check-Re-Assigned6}=  get text   ${Reassigned_6}
        log to console   ${Check-Re-Assigned6}

Edit Task3
       [Arguments]   ${test_data}
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[0]
       wait until element is not visible   globalAjaxLoading  100
       check and enter input  ${Com_1}   ${test_data['Comment_1']}
       wait until element is not visible   globalAjaxLoading  100
       check and enter input  ${Type-Due-Data-Value11}   ${test_data['Due_Date_Edit_Task_1']}
       Select Checkbox  ${TMS_JoornalNote_Checkbox}
       Checkbox Should Be Selected  ${TMS_JoornalNote_Checkbox}
       Click Submit Close
       Handle Alert  ${Accept_alert}
       Back to UMS

Pending to Quote for Rating
    Sleep    2
    Run Keyword If  '${test_data['MOLD FUNGI MICROBE']}'=='Microbe Endorsement'   click element    ${Checkbox_MOLDFUNGIMICROBE}
    Run Keyword If  '${test_data['Two Year ERP']}'=='ERPTWO'   click element    ${ERP2_REO}
    Run Keyword If  '${test_data['Three Year ERP']}'=='ERPTHREE'   click element    ${ERP3_REO}
    Run Keyword If  '${test_data['Unlimited ERP Term']}'=='ERPUNLMTD'   click element    ${ERP3_REO}
    Sleep    2
    Run Keyword If  '${test_data['Division']}'!='INDAPPR'   click element    ${Checkbox_DISCRIMINATION}
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  200
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-COV-Apply&Continue}