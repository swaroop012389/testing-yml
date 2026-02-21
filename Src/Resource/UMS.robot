*** Settings ***
Library  SeleniumLibrary
Library  ../Resource/Global-variable/login.py
Resource  ../../Data Provider/DataProvider.robot
Library  Collections
Library  String
Library  DateTime
Resource   ../Resource/Alternus_Res/Alt_Generic.robot
Resource   ../Resource/TMS_RES/UMS_PAGE.robot
Resource   ../Resource/Generic.robot
Resource  ../Resource/Alternus_Res/QuoteLetter.robot

*** Variables ***
${BROWSER}=  chrome
${V2_UMS_Button}=  //button[normalize-space()='UMS']
${ID-UMS-Search-PolicyNumber}=  id=PolicyNumber
${ID-UMS-ApplyFilter}=  //input[@value='Apply Filter']
${ID-UMS-StatusFilter}=  id=StatusId
${ID-UMS-View-Policy}=  link=View policy
${ID-UMS-Cancellation-Tab}=  //a[contains(text(),'CANCELLATION')]
${ID-UMS-Reinstatement-Tab}=  //a[contains(text(),'Reinstatement')]
${ID-UMS-Cancellation-Date}=  id=Application_CancelDate
${ID-UMS-Cancellation.Reason}=  id=ReasonForCancellation
${ID-UMS-Enter_UW_Reason}=  //textarea[@id='CancellationTransactionDto_UWComment']
${ID-UMS-Cancellation.Method}=  id=CancellationMethod
${ID-UMS-Cancellation Apply filter}=  //input[@value='Apply']
${ID-UMS-CancellationApply&Continue}=  //input[@value='Apply & Continue']
${ID-UMS-PolicyInfo-TAb}=  link=Policy Info
${ID-UMS-Apply&Continue}=  id=navApplyContinue
${ID-UMS-SelectCheckbox}=  //input[@type='checkbox']
${ID-UMS-Abandon-Cancellation}=  //input[@value='Abandon Cancellation']
${ID-UMS-Cancellation-Next}=  //input[@value='Next']
${ID-UMS-Payments-link}=  link=Payments
${ID-UMS-not-generate-Cancellation-Letter}=  //div/table/tbody/tr[5]/td/input
${ID-UMS-Cancellation-Submit}=  id=Submit
${ID-UMS-Documents-TAB}=  link=DOCUMENTS
${ID-UMS-Documents-review}=  link=Create document
${ID-UMS-Documents-table}=  //table[@class="editableTable"]/tbody/tr
${ID-UMS-Documents-startIndex}=  3
${ID-UMS-Images-TAB}=  link=IMAGE FILES
${ID-UMS-Images-table}=  //table[@id="filelist"]/tbody/tr
${ID-UMS-Images-startIndex}=  1
${ID-UMS-Select-Documents-type-genearation}  id=DocumentGenericId
${ID-UMS-Select-Generic-Letter}=  id=GenericLetterID
${ID-UMS-Select-Insured-Request}=   //table[@id='genletterVariables']/tbody/tr[4]/td/table/tbody/tr/td/input
${ID-UMS-DAY-Notice}=  name=GLV_Days Notice
${ID-UMS-Generate}=  //div[3]/div/button/span
${ID-UMS-Reinstate2button}=   //div[3]/div[3]/div/button/span
${ID-UMS-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${ID-UMS-Endorsements}=  //a[contains(text(),'Endorsements')]
${ID-UMS-Add-Endorsement}=  //a[contains(text(),'Add Endorsement')]
${ID-UMS-Rating}=  //a[@class='button button-pill button-primary']
${ID-UMS-edit-predfirmre}=  //a[contains(text(),'PREDFIRMRE19_05/12')]
${ID-UMS-Add-Endorsement-Name}=  id=Name
${ID-UMS-ADD-ENDORSEMENT-Search}=  //input[@value='Search']
${ID-UMS-edit-deccorre}=  //table[@id='endorsementsToAdd']/tbody/tr/td/a
${ID-UMS-edit-endorsement-date}=  id=datepicker
${ID-UMS-Endorsements-premium}=  id=Premium
${ID-UMS-Carry-Forward}=  //form/table/tbody/tr[2]/td[2]
${ID-UMS-Predecessor-Firm}=  id=VariableValues_0__FormattedValue
${ID-UMS-Exclude-Prior-To}=  name=VariableValues[1].FormattedValue
${ID-UMS-Exclude-On-After}=  name=VariableValues[2].FormattedValue
${ID-UMS_edit-endorsement-SAVE}=  //input[@value='Save']
${ID-UMS-Review-Endorsement-Letter}=  //tr[@id='reviewQuoteLetter']/td/input
${ID-UMS-BIND/ISSUE-TAB}=  //a[contains(text(),'BIND/ISSUE')]
${ID-UMS-select-No-Additional-Premium}=  id=NoAdditionalPremium
${ID-UMS-select-all-coverage}=  xpath=(//input[@type='checkbox'])[2]
${ID-UMS-select-endorsement}=  name=Selected
${ID-DE-ApplyChanges}=  //button/span[text()='Apply Changes']
${ID-UMS_link}=  //a[contains(text(),'UMS')]
${ID-UMS-Offset-button}=  //input[@value='Offset']
${ID-UMS-Offset-transaction}=  name=SelectedTransactionRecordIds
${ID-UMS-Offset}=  //a[contains(text(),'Offset')]
${ID-UMS-Submit}=  id=Submit
${ID-UMS-Do-not-generate-Quote-Letter}=  xpath=(//input[@name='Action'])[3]
${ID-UMS-Quote-letter}=  link=Quote Letter
${ID-UMS-checkbox-1}=  xpath=(//input[@id='Checkbox1'])[5]
${ID-UMS-Paymentplan}=  id=PaymentPlan
${ID-UMS-PaymentSource}=  id=PaymentSource
${ID-UMS-Generate Receivables}=  //input[@value='Generate Receivables']
${ID-UMS-Add-Receivable}=  //input[@value='Add Receivable']
${ID-UMS-AR-Ammount}=  id=Ammount
${ID-UMS-click-Add-receivable}=  xpath=(//input[@value='Add Receivable'])[2]
${ID-UMS-Issue/Reissue}=  //a[contains(text(),'Issue/Reissue')]
${ID-UMS-Coverage-bubble}=  //a[contains(text(),'Coverages')]
${ID-UMS-Task-Administration}=  link=Task Administration
${ID-UMS-Tools}=  link=TOOLS
${ID-UMS-Job-Status}=  link=Job Status
${ID-UMS-MAIN-ADMINISTRATION}=  //a[contains(text(),'ADMINISTRATION')]
${ID-UMS-Search-TAB}=  //a[contains(text(),'SEARCH')]
${ID-UMS-Configure-Background-Process}=  link=Configure Background Process
${ID-UMS-JobFrequency}=  id=JobFrequency
${ID-UMS-JobName}=  id=JobName
${ID-UMS-Hour}=  id=Hour
${ID-UMS-Submitoffset}=  //input[@value='Submit']
${ID-UMS-Send-documents}=  //input[@value='Send Documents']
${ID-UMS-Expiration Date}=  id=OrganizationInfoModel_ExpirationDateString
${ID-UMS-SAVE}=  //span[contains(text(),'Save')]
${ID-UMS-End-SAVE}=  //input[@value='Save']
${ID-UMS-Admin}=  Link=ADMINISTRATION
${ID-UMS-SetDate}=  Link=Set Application Date
${ID-UMS-CurrentDate}=  id=rdToday
${ID-UMS-ChangeDate}=  id=rdSelectDate
${ID-UMS-DatePicker}=  id=txtSelectedDate
${minutes-to-add}=  2
${download directory}=  \\..\\..\\..\\Reports\\
&{file-list}=  &{EMPTY}
${UMS_Policy_Number}=  PolicyNumberInHeader
${ID-V2portal-refresh}=    id=saveAndExitButton
${UMS-ExpandAll}=    //a[text()='Expand All']
${EPL-Coverage}=    //input[@id='CoverageIDs_467']
${SAE-Coverages}=    //input[@id='item1']
${Cyber-Coverage}=    //input[@id='item556']
${MGMT-Coverage}=    //input[@id='item549']
${Buildersrisk-Coverages-checkbox}=    //input[@id='item408']
${ApplyChanges-Button}=  //button//span[contains(text(),'Apply Changes')]
${AddEndorsementFirstLink}=  (//table[@id='endorsementsToAdd']//tbody/tr/td/a)[1]
${CoverageSelectAllCheckboxes}=  //td[@class='td1']//input[@type='checkbox']
${FullTimeValue}=  //input[@id='Coverages_1__DesiredLimits_0__Value']
${DeductibleValue}=  //input[@id='Rows_0__Table_Corteges_1__3__Value']
${PostEndorsementLink}=  //a[contains(text(),'Post Endorsement')]
${UMS_Task_Management}=  //a[contains(text(),'TASK MANAGEMENT')]
${UMS_Task_Management_Edit}=  (//a[contains(text(),'Edit')])[1]
${UMS_Task_Management_Details}=  //textarea[@id='jornalDetails']
${UMS_Task_Management_Update}=  //input[@type='submit']
${UMS_Task_Management_Close}=  (//a[contains(text(),'Close')])[1]
${ID_QuoteLetter}=    //a[contains(@href,'/Nexus/RatingQuoteLetter/ViewSendQuoteLetter')]
${UMS_Task_Close_journaldetailstext}=  //textarea[@id='JournalDetails']
${UMS_Task_Management_Close_Button}=  //input[@type='submit']
${BR_EndorsementRecord}=    //a[contains(text(),'Policy Changes - PR')]
${Cancellation_Eff_Date_Value}=    //input[@id='NewEffectiveDateString']
#SAE
${SAE_Limit/deductibles_tab}=  //a[contains(text(),'Limit/Deductibles')]
${SAE_limit0}=  id=Coverages_0__DesiredLimits_0__Value
${SAE_Agg_limit0}=  id=Coverages_0__DesiredLimits_0__AggregateValue
${SAE_Deductibles_limit0}=  id=Coverages_0__DesiredDeductibles_0__Value
${SAE_limit1}=  id=Coverages_0__DesiredLimits_1__Value
${SAE_Agg_limit1}=  id=Coverages_0__DesiredLimits_1__AggregateValue
${SAE_Deductibles_limit1}=  id=Coverages_0__DesiredDeductibles_1__Value
${SAE_limit2}=  id=Coverages_0__DesiredLimits_2__Value
${SAE_Agg_limit2}=  id=Coverages_0__DesiredLimits_2__AggregateValue
${SAE_Deductibles_limit2}=  id=Coverages_0__DesiredDeductibles_2__Value
${SAE_limit3}=  id=Coverages_0__DesiredLimits_3__Value
${SAE_Agg_limit3}=  id=Coverages_0__DesiredLimits_3__AggregateValue
${SAE_Deductibles_limit3}=  id=Coverages_0__DesiredDeductibles_2__Value
${Agg_Deductibles_limit3}=   id=Coverages_0__DesiredDeductibles_2__AggregateValue
${Link_Bind}=    //a[text()='Bind']
${ID-UMS-Select-Inccreased-limit}=   //table[@id='genletterVariables']/tbody/tr[3]/td/table/tbody/tr/td/input
${ID-UMS-Select-Inccreased-limit-app}=   //table[@id='genletterVariables']/tbody/tr[12]/td/table/tbody/tr/td/input
${ID-UMS-Generate-for-sending&filling}=   //button/span[text()='Generate for sending/filing']
${Sen_documents_checkbox}=   //input[@cbtype='selectedFileCheckbox']
${Send_Dpcuments}=   //input[@value='Send Documents']
${Send}=   //html/body/div[8]/div[3]/div/button[1]/span
${Link_Bind_Issue}=    //a[text()='BIND/ISSUE']
${ID_Name_Field}=    //input[@id='Name']
${AE_EndorsementRecord}=    //a[contains(text(),'LIMIT-NON-APH_9/14')]
${Name_CarryForwardCB}=    //input[@name='CarryForward' and @type='checkbox']
${Id_PremiumField}=    //input[@id='Premium']
${Id_FreeformText}=    VariableValues_0__FormattedValue
${Mid_term_Quote_text}=  //*[@id="tr2165762"]/td[6]/span
${NAME-BE-IsIssueReissueCorrection}=    name=IsIssueReissueCorrection
${NAME-BE-AllRisk}=    //input[@coverageid='473']
${NAME-BE-Optional}=    //input[@coverageid='455']
${ID-BE-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-BE-Apply&Continue}=  //input[@value='Apply & Continue']
${Checkbox_NoAdditionalPremium}=    //input[@id='NoAdditionalPremium']
${Checkbox_AllCoverages}=    //td[@class='td1']//input[@type='checkbox']
${Button_Next}=    //input[@value='Next']
${Button_AddReceivable}=    //input[@value='Add Receivable']
${Button_Add_Receivable2}=    (//input[@value='Add Receivable'])[2]
${Field_Amount}=    //input[@name='Ammount']
${Button_Save}=    //input[@value='Save']
${Button_Submit}=    //input[@id='Submit']
${ID_Title_Field}=    //input[@id='Title']
${BR_EndorsementRecord}=    //a[contains(text(),'Policy Changes - PR')]
${REO_EndorsementRecord}=    //a[contains(text(),'CORRECTIONRE11_07/01')]
${IA_EndorsementRecord}=    //a[contains(text(),'MANUSCRIPTRE19_05/12')]
${K&R_Coverage_tab}=  //a[contains(text(),'Coverages')]
${K&R_EndorsementRecord}=    //a[contains(text(),'Named Insured Endorsement')]
${Underwritting_Rating}=    (//a[contains(text(),'Rating')])[1]
${Checkbox-Endrosmentoption}=   (//input[@type='checkbox'])[1]
${UMS_Coverages_Button}=    //a[contains(@href,'Coverages')]
${CE_TRIA_Checkbox}=    //td[@id='TRIA']//input
${CE_CareConditionEquipment}=    id=Rows_0__Table_Corteges_2__3__Value
${CE_CooperationOfOwners}=    Rows_0__Table_Corteges_3__3__Value
${QuoteOptionsCheckAll_Checkbox}=    //input[contains(@onclick,'checkAllAs')]
${CE_EQCoverage}=    //input[@id='CoverageIDs_562']
${Edit_Endorsement_Link}=    //a[contains(text(),'Edit')]
${Delete_Endorsement_Link}=    //a[contains(text(),'Delete')]
${Cyber_Coverage1}=    //input[@id='item556']
${SAE-Coverages}=    //input[@id='item1']
${MGMT_Coverage1}=    //input[@id='item549']
${SAE-Coverage}=   //a[contains(text(),'Coverages')]
${Builders_risk-Coverage}=   //a[contains(text(),'Coverages')]
${ID-Click-Quote-Letter}=   //*[@id="formCoverages"]/div[2]/ul/li[8]/a
${Underwritting_Tab}=   (//li//a[contains(text(),'UNDERWRITING')])
${Rating_link}=     (//li//a[contains(text(),'UNDERWRITING')])[1]
${Program}=     //select[@id='ProgramId']
${Relese_all}=  id=idReleaseAll
${Holds_Save}=  //html/body/table/tbody/tr[2]/td/div/div/div[2]/form/div/input[2]
${Letter_mailCopy}=    //*[@id="LetterModel_MailCopy"]
${Id_PremiumField}=    //input[@id='Premium']
${Name_CarryForwardCB}=    //input[@name='CarryForward' and @type='checkbox']
${Id_FreeformText}=    VariableValues_0__FormattedValue
${Cancellation_Eff_Date_Value}=    //input[@id='NewEffectiveDateString']
${Text_JournalTab}=    //a[contains(text(),'JOURNAL')]
${Link_CreateNewJournal}=    //a[contains(text(),'Create New')]
${Dropdown_JournalType}=    JournalTypeId
${ID_JournalDescription}=    id=Description
${ID_JournalDetails}=    id=Details
${Button_JournalCreate}=    //input[@value=' Create ']
###ERP###
${Checkbox_E&O}=    (//input[@class='OptionCheckBox'])[1]
${Checkbox_Don't_Pro_Rate}=     (//input[@class='OptionCheckBox'])[2]
${Checkbox_ERP2}=   (//input[@class='OptionCheckBox'])[23]
${Checkbox_ERP_Don't_Pro_Rate}=     (//input[@class='OptionCheckBox'])[24]
${Checkbox_Unlimited}=      (//input[@class='OptionCheckBox'])[09]
${Checkbox_ERP_Unlimited_Don't_Pro_Rate}=     (//input[@class='OptionCheckBox'])[10]
${Checkbox_Unlimited_1}=      (//input[@class='OptionCheckBox'])[15]
${Checkbox_ERP_Unlimited_Don't_Pro_Rate_1}=     (//input[@class='OptionCheckBox'])[16]
###ERP IA###
${Checkbox_ERP2_IA}=    (//input[@name='SelectedQuoteOptionIds'])[17]
${Checkbox_ERP2_Don't_Pro_Rate_IA}=     (//input[@name='DontProRatePremiumIds'])[17]
${Checkbox_ERP3_IA}=    (//input[@name='SelectedQuoteOptionIds'])[17]
${Checkbox_ERP3_Don't_Pro_Rate_IA}=     (//input[@name='DontProRatePremiumIds'])[17]

*** Keywords ***
Login to UMS
        &{config_data}=  Read config data  config.txt
        ${UMS-URL}=  Set variable  ${config_data['UMS']['url']}
        open browser  ${UMS-URL}  edge
        maximize browser window

Login to UMS Edge
        &{config_data}=  Read config data  config.txt
        ${UMS-URL}=  Set variable  ${config_data['UMS']['url']}
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
        run keyword if  '${CONFIG_DATA['V2']['headless']}'=='Yes'  Call Method    ${options}    add_argument    --headless
        Call Method    ${options}    add_argument    --disable-gpu
        Create WebDriver    Edge    options=${options}
        Go To   ${UMS-URL}
        maximize browser window

UMS Set application date
        Login to UMS
        Set application date
        close browser

Set application date
        [Arguments]  ${days}=current
        Click element  ${ID-UMS-MAIN-ADMINISTRATION}
        Click element  ${ID-UMS-SetDate}
        Set UMS current date
        run keyword if  '${days}' != 'current'  Set UMS date  ${days}

Set UMS current date
        click element  ${ID-UMS-CurrentDate}
        click element  ${ID-UMS-Submitoffset}
        click element  ${ID-UMS-SetDate}

Set UMS date
        [Arguments]  ${days}
        ${calc-date}=  Subtract time from date  ${policy-exp-date}  ${days}  date_format=%m-%d-%Y
        ${format-calc-date}=  Convert date  ${calc-date}  result_format=%m-%d-%Y
        Set testvariable  ${application-date}  ${format-calc-date}
        @{dates}=  Split string  ${format-calc-date}  -
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{dates}
        click element  ${ID-UMS-Submitoffset}
        click element  ${ID-UMS-SetDate}

Get UMS time
        click element  ${ID-UMS-Admin}
        click element  ${ID-UMS-SetDate}
        click element  ${ID-UMS-Submitoffset}
        click element  ${ID-UMS-SetDate}
        ${cur-time}=  Get value  ${ID-UMS-DatePicker}
        RETURN  ${cur-time}

Calculate schedule time
        ${cur-time}=  Get UMS time
        ${calc-time}=  Add minutes  ${cur-time}  ${minutes-to-add}
        Calculate job time  ${cur-time}
        RETURN  ${calc-time}

Calculate job time
        [Arguments]  ${cur-time}
        ${new-time}=  Add time to date  ${cur-time}  ${minutes-to-add} minutes  date_format=%m/%d/%Y %H:%M:%S %p  result_format=%m/%d/%Y %I:%M
        ${format-time}=  Replace string using regexp  ${new-time}  ^0  ${EMPTY}
        ${format-time}=  Replace string using regexp  ${format-time}  /0  /
        ${format-time}=  Replace string using regexp  ${format-time}  ${SPACE}0  ${SPACE}
        Set test variable  ${calculated-job-time}  ${format-time}

Schedule job
        [Arguments]  ${job-name}  ${days}
        Set application date  ${days}
        ${schedule-time}=  Calculate schedule time
        UMS Click Background process
        UMS Choose Job   ${job-name}
        UMS Schedule Background Process  ${schedule-time}
        click element  ${ID-UMS-SAVE}
        Set job info  ${job-name}  ${days}
        close browser

Set job info
        [Arguments]  ${job-name}  ${days}
        &{job-info}=  Create Dictionary
        Set to dictionary  ${job-info}  Stage  ${days}
        Run Keyword if  '${job-name}' == 'AutoRenewalProcessJob'  Set to dictionary  ${job-info}  AutoRenewalProcessJobStartTime  ${calculated-job-time}
        Run Keyword if  '${job-name}' == 'AutoRenewalDocumentsProcessJob'  Set to dictionary  ${job-info}  AutoRenewalDocumentsProcessJobStartTime  ${calculated-job-time}
        Set to dictionary  ${job-info}  ApplicationDate  ${application-date}
        Set testvariable  &{job-info}  &{job-info}

Check job completion
        [Arguments]
        click element  ${ID-UMS-Tools}
        click element  ${ID-UMS-Job-Status}
        ${joblog}=  Get webelement  class:docList
        @{ar-job-log}=  Split to lines  ${joblog.text}
        FOR  ${log}  IN  @{ar-job-log}
        ${job-found}=  Run Keyword And Return status  Should contain  ${log}  ${job-name} ${job-start-time}
        exit FOR loop IF  ${job-found}
        END
        run keyword if  ${job-found}  Get job run info  ${log}  ELSE  Fail  Job execution not done. Please run the script again

Get job run info
        [Arguments]  ${log}
        @{loginfo}=  Split string  ${log}  ${SPACE}
        Set test variable  ${job-name}  ${loginfo[0]}
        Set test variable  ${job-start}  ${loginfo[1]}${SPACE}${loginfo[2]}${SPACE}${loginfo[3]}
        Set test variable  ${job-end}  ${loginfo[4]}${SPACE}${loginfo[5]}${SPACE}${loginfo[6]}
        ${count}=  Set variable  ${0}
        FOR  ${row}  IN  @{res_info}
        run keyword if  '${row['${job-name}EndTime']}' == ''  Set to dictionary  ${row}  ${job-name}StartTime=${job-start}  ${job-name}EndTime=${job-end}
        Set to dictionary  ${new_res_info}  ${count}  ${row}
        ${count}=  Evaluate  ${count} + 1
        END

Select Date
        [Arguments]  ${m}  ${d}  ${y}
        ${currentDate}=     Get Current Date    result_format=datetime
        ${year}=  Convert To Integer  ${y}
        ${month}=  Convert To Integer  ${m}
        ${date}=  Convert To Integer  ${d}
        ${month-diff}=  Evaluate  ${month}-${currentDate.month}
        ${year-diff}=  Evaluate  ${year}-${currentDate.year}
        ${move}=  Evaluate  ${year-diff}*12+${month-diff}
        IF  ${move}== 0
            Click Element  xpath=//a[text()="${date}"]
        ELSE
        ${shiftForward}=  Set Variable If
        ...   ${move}>0  1
        ...   ${move}<0  0
        ${move}=  Set Variable If
        ...   ${move}>0  ${move}
        ...   ${move}<0  ${move}*-1
            FOR     ${var}  IN RANGE    ${move}
                Run Keyword If  ${shiftForward}==0  Click Element  xpath=//a[@title="Prev"]
                Run Keyword If  ${shiftForward}==1  Click Element  xpath=//a[@title="Next"]
             END
        END
        Click Element  xpath=//a[text()="${date}"]

Verify documents and images
        [Arguments]  ${expected-doc-list}  ${expected-image-list}
        ${docs}=  Get file list  ${ID-UMS-Documents-TAB}  ${ID-UMS-Documents-table}  ${ID-UMS-Documents-startIndex}
        ${images}=  Get file list  ${ID-UMS-Images-TAB}  ${ID-UMS-Images-table}  ${ID-UMS-Images-startIndex}  img
        Run Keyword If  '${docs}' == '${expected-doc-list}'  Check successful  Document files  doc-list-check  ELSE  Check failed  Document files  doc-list-check
        Run keyword if  '${images}' == '${expected-image-list}'  Check successful  Image files  img-list-check  ELSE  Check failed  Image files  img-list-check
        Set Test Variable  ${docs}  ${docs}
        Set Test Variable  ${images}  ${actual-image-list}

Get file list
        [Arguments]  ${ID-UMS-Documents-TAB}  ${ID-UMS-Documents-table}  ${start-index}  ${type}=doc
	    @{list}=  Create List
	    @{url-list}=  Create List
	    @{actual-image-list}=  Create List
	    Click element  ${ID-UMS-Documents-TAB}
        ${rows}=  Get Element Count   ${ID-UMS-Documents-table}
        ${rows}=  Evaluate  ${rows} + 1
        FOR  ${index}  IN RANGE  ${start-index}  ${rows}
        ${el}=  Set variable  ${ID-UMS-Documents-table} [${index}]/td[3]
        ${Value}=    Get Text    ${el}
        Append to list  ${actual-image-list}  ${value}
        ${txt}=   Run keyword if  '${type}' == 'img'  Append to url list  ${Value}
        Append to list  ${url-list}  ${txt}
        ${Value}=	Replace String Using Regexp	${Value}	${SPACE}\\d{4}-\\d+-\\d+  ${EMPTY}
        Append to list  ${list}  ${value}
        END
        sort list  ${list}
        ${str-list}=  Evaluate  "|".join(${list})
        ${actual-image-list}=  Evaluate  "|".join(${actual-image-list})
        Set to dictionary  ${file-list}  ${policy-no}=${url-list}
        Set test variable  ${actual-image-list}  ${actual-image-list}
	    RETURN  ${str-list}

Append to url list
        [Arguments]  ${file-name}
        ${file-url}=  Get element attribute  //a[contains(text(),"${file-name}")]  href
        ${txt}=  Set variable  ${file-name} - ${file-url}
        RETURN  ${txt}

Search on UMS with Policy No
        [Arguments]  ${PolicyNo#}
        input text  ${ID-UMS-Search-PolicyNumber}  ${PolicyNo#}

Search Page Apply Filter
        click element  ${ID-UMS-ApplyFilter}

Search Page with Status Apply Filter
        click element  ${ID-UMS-StatusFilter}
        select from list by label  ${ID-UMS-StatusFilter}  Pending
        click element  ${ID-UMS-ApplyFilter}

UMS Click View Policy
        wait until element is not visible   globalAjaxLoading  40
        ${policy-exists}=  Run keyword and return status  page should contain  View policy
        Run keyword if  ${policy-exists}  click element  ${ID-UMS-View-Policy}  ELSE  Fail  Policy not found

UMS Click on Cancellation Tab
        wait until element is visible  ${ID-UMS-Cancellation-Tab}  30
        click element  ${ID-UMS-Cancellation-Tab}

UMS Click on Reinstatement Tab
        wait until element is visible  ${ID-UMS-Cancellation-Tab}  30
        mouse over  ${ID-UMS-Cancellation-Tab}
        click element  ${ID-UMS-Reinstatement-Tab}

UMS Enter Cancellation date
        [Arguments]  ${Date}
        input text  ${ID-UMS-Cancellation-Date}  '${Date}'

UMS Select Cancellation Method
        [Arguments]  ${Method}
        click element  ${ID-UMS-Cancellation.Method}
        select from list by label  ${ID-UMS-Cancellation.Method}  ${Method}

UMS Select Reason for Cancellation
        click element  ${ID-UMS-Cancellation.Reason}
        select from list by label  ${ID-UMS-Cancellation.Reason}  2 (Non Payment of Premium)

UMS Click on Apply filter
        click element  ${ID-UMS-Cancellation Apply filter}

UMS Click on Reinstate
        click element  ${ID-UMS-Cancellation-Submit}
        wait until element is not visible   globalAjaxLoading  40
        CLICK ELEMENT  ${ID-UMS-Reinstate2button}
        wait until element is not visible   globalAjaxLoading  40

UMS Click on Apply & Continue
        wait until element is not visible   globalAjaxLoading  40
        click element  ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  40

UMS Click on Cancellation Next
        click element  ${ID-UMS-Cancellation-Next}

UMS Click Cancellation Do not generate Cancellation Letter
        click element  ${ID-UMS-not-generate-Cancellation-Letter}

UMS Click on Submit
        click element  ${ID-UMS-Cancellation-Submit}

UMS Click on Documents Tab
        click element  ${ID-UMS-Documents-TAB}

UMS create document for review
        click element  ${ID-UMS-Documents-review}
        wait until element is visible  ${ID-UMS-Select-Documents-type-genearation}
        click element  ${ID-UMS-Select-Documents-type-genearation}
        select from list by label  ${ID-UMS-Select-Documents-type-genearation}  Generic Letter
        click element  ${ID-UMS-Select-Generic-Letter}
        select from list by label  ${ID-UMS-Select-Generic-Letter}  Cancellation
        wait until element is visible  ${ID-UMS-Select-Insured-Request}
        click element  ${ID-UMS-Select-Insured-Request}
        input text  ${ID-UMS-DAY-Notice}  60
        click element  ${ID-UMS-Generate}

Extra limit add
        click element  link=Limit/Deductibles Options
        input text  id=Coverages_0__DesiredLimits_3__Value  1000
        input text  id=Coverages_0__DesiredLimits_3__AggregateValue  2000
        input text  id=Coverages_0__DesiredDeductibles_3__Value  1
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  //div[11]/div/button/span
        wait until element is not visible   globalAjaxLoading  40
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  //div[4]/div[3]/div/button/span
        wait until element is not visible   globalAjaxLoading  40

UMS Click on Endorsements
        wait until element is visible  ${ID-UMS-UNDERWRITING}
        mouse over  ${ID-UMS-UNDERWRITING}
        execute javascript  $('.SelectedMenu').mouseover()
        click element  ${ID-UMS-Endorsements}

UMS Endorsements Search
        [Arguments]  ${Endorsement-Value}
        click element  ${ID-UMS-BIND/ISSUE-TAB}
        click element  ${ID-UMS-Add-Endorsement}
        wait until element is visible  ${ID-UMS-Add-Endorsement-Name}
        input text  ${ID-UMS-Add-Endorsement-Name}   ${Endorsement-Value}
        click element  ${ID-UMS-ADD-ENDORSEMENT-Search}
        wait until element is visible  link=${Endorsement-Value}  10
        wait until element is enabled  link=${Endorsement-Value}  10
        click element  link=${Endorsement-Value}
        wait until element is not visible   globalAjaxLoading  40

Add time to current date
        [Arguments]  ${Daysto-Add}
        ${Date}=  Get Current Date  time_zone=local
        ${Adddays}=  Add Time To Date  ${Date}  ${Daysto-Add}
        ${dateformat}=  Convert Date  ${Adddays}  %m/%d/%Y
        RETURN  ${dateformat}

UMS Endorsements Premium Bearing Midterm
        ${Date}=  Add time to current date  60 days
        input text  ${ID-UMS-edit-endorsement-date}  ${Date}
        input text  ${ID-UMS-Endorsements-premium}  100
        click element  ${ID-UMS_edit-endorsement-SAVE}
        wait until element is enabled  ${ID-UMS-select-endorsement}  5
        click element  ${ID-UMS-select-No-Additional-Premium}
        scroll element into view  ${ID-UMS-select-endorsement}
        click element  ${ID-UMS-select-endorsement}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}

UMS Endorsements expiry date change
        wait until element is enabled  ${ID-UMS-select-endorsement}  5
        scroll element into view  ${ID-UMS-select-No-Additional-Premium}
        execute javascript  document.getElementById('NoAdditionalPremium').click()
        scroll element into view  ${ID-UMS-select-endorsement}
        click element  ${ID-UMS-select-endorsement}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-PolicyInfo-TAb}
        ${Adddays}=  Add time to current date  455 days
        input text  ${ID-UMS-Expiration Date}  ${Adddays}
        click element  ${ID-UMS-CancellationApply&Continue}

UMS Add Endorsement predfirmre
        ${Date}=  Get Current Date  time_zone=local
        ${dateformat}=  Convert Date  ${Date}  %m/%d/%Y
        input text  ${ID-UMS-edit-endorsement-date}  ${dateformat}
        input text  ${ID-UMS-Endorsements-premium}  100
        click element  ${ID-UMS-Carry-Forward}
        input text  ${ID-UMS-Predecessor-Firm}  Automation sample test
        input text  ${ID-UMS-Exclude-Prior-To}  11/09/2019
        input text  ${ID-UMS-Exclude-On-After}  12/09/2019
        click element  ${ID-UMS_edit-endorsement-SAVE}
        wait until element is not visible  ${ID-UMS_edit-endorsement-SAVE}  5

UMS Add Endorsement
        [Arguments]  ${Date}  ${Premium}
        input text  ${ID-UMS-edit-endorsement-date}  ${Date}
        input text  ${ID-UMS-Endorsements-premium}  ${Premium}
        click element  ${ID-UMS_edit-endorsement-SAVE}

UMS Click on BIND/ISSUE TAB
        click element  ${ID-UMS-BIND/ISSUE-TAB}
        click element  ${ID-UMS-select-No-Additional-Premium}
        click element  ${ID-UMS-select-all-coverage}
        click element  ${ID-UMS-select-endorsement}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}

Payments Add receivable
         [Arguments]  ${Premium}
        click element  ${ID-UMS-Add-Receivable}
        wait until element is not visible   globalAjaxLoading  40
        input text  ${ID-UMS-AR-Ammount}  ${Premium}
        click element  ${ID-UMS-click-Add-receivable}
        click element  ${ID-UMS-SAVE}
        click element  ${ID-UMS-Cancellation-Next}
        wait until element is not visible   globalAjaxLoading  40

Go to UMS continue to Offset process
        Go to UMS
        wait until element is enabled  ${ID-UMS-BIND/ISSUE-Tab}  30
        mouse over  ${ID-UMS-BIND/ISSUE-Tab}
        click element  ${ID-UMS-Offset}
        CLICK ELEMENT  ${ID-UMS-Offset-transaction}
        click element  ${ID-UMS-Offset-button}

Change Status Pending to Quote
        wait until element is visible  ${ID-UMS-Quote-letter}  18
        click element  ${ID-UMS-Quote-letter}
        CLICK ELEMENT  ${ID-UMS-Do-not-generate-Quote-Letter}
        click element  ${ID-UMS-Submit}

Change Status Quote to Bound
        [Arguments]  ${PaymentsourceV}  ${PaymentPlanV}
        click element  ${ID-UMS-BIND/ISSUE-Tab}
        click element  ${ID-UMS-checkbox-1}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-Paymentplan}
        select from list by label  ${ID-UMS-PaymentSource}  ${PaymentsourceV}
        select from list by label  ${ID-UMS-Paymentplan}  ${PaymentPlanV}
        click element  ${ID-UMS-Generate Receivables}
        wait until element is not visible   globalAjaxLoading  40
        click element  ${ID-UMS-Cancellation-Next}
        CLICK ELEMENT  ${ID-UMS-Do-not-generate-Quote-Letter}
        click element  ${ID-UMS-Submit}

Issue the policy in UMS
        wait until element is enabled  ${ID-UMS-BIND/ISSUE-Tab}  30
        mouse over  ${ID-UMS-BIND/ISSUE-Tab}
        click element  ${ID-UMS-Issue/Reissue}
        click element  ${ID-UMS-CancellationApply&Continue}
        UMS Review button and submit

UMS Review button and submit
        click element  ${ID-UMS-Review-Endorsement-Letter}
        click element  ${ID-UMS-Submitoffset}
        wait until element is visible  ${ID-UMS-Send-documents}    timeout=70s

Verify Retrotype
        [Arguments]  ${retro-type}=None
        Go to UMS
        click element  ${ID-UMS-Coverage-bubble}
        ${Retro}=  get text  //div[@id='organizationPanel']/table/tbody/tr/td[3]/table/tbody/tr[6]/td
        should be equal  ${retro-type}  ${Retro}
        should be equal as strings  ${retro-type}  ${Retro}

Verify Plan
        [Arguments]  ${plan-type}=None
        Go to UMS
        wait until element is enabled  ${ID-UMS-BIND/ISSUE-Tab}  30
        mouse over  ${ID-UMS-BIND/ISSUE-Tab}
        click element  ${ID-UMS-BIND/ISSUE-Tab}
        click element  ${ID-UMS-Payments-link}
        ${Valueofplan}=  Get Selected List Value  ${ID-UMS-Paymentplan}
        should be equal  ${plan-type}  ${Valueofplan}
        should match  ${plan-type}  ${Valueofplan}

Go to Bind/Issue page UMS
        mouse over  ${ID-UMS-BIND/ISSUE-Tab}
        click element  ${ID-UMS-BIND/ISSUE-Tab}

Go to UMS
        Wait Until Element Is Visible  ${V2_UMS_Button}  10s
        Scroll Element Into View    ${V2_UMS_Button}
        Click Element  ${V2_UMS_Button}
        ${Length}  Get window titles
        switch window   ${Length}[2]   30

Search Policy
        [Arguments]  ${PolicyNo}
        click element  ${ID-UMS-Search-TAB}
        Search on UMS with Policy No  ${PolicyNo}
        Search Page Apply Filter
        wait until element is not visible   globalAjaxLoading  40

Close policy window
        ${windows}=  Get window titles
        switch window   ${windows}[1]   30
        close window
        switch window   ${windows}[0]   30

Check successful
        [Arguments]  ${check-type}  ${status-field}
        log to console   ${check-type} check successful for ${policy-no}
        Set test variable  ${${status-field}}  Success

Check failed
        [Arguments]  ${check-type}  ${status-field}
        log to console   ${check-type} check failed for ${policy-no}
        Set test variable  ${${status-field}}  Fail

Get attribute value
        [Arguments]  ${elements}  ${field}
        FOR  ${el}  IN  @{elements}
        @{el_array}=  Split to lines  ${el.text}
        END
        FOR  ${el}  IN  @{el_array}
        ${check}=  Run Keyword and return status  Should contain  ${el}  ${field}
        @{value}=  Run keyword if  ${check}  Split string  ${el}  :
        END
        ${renflag}=  Set variable  ${value}[1]
        RETURN  ${renflag.strip()}

Search Policy again
        [Arguments]  ${PolicyNo#}
        sleep  30
        click element  ${ID-UMS-Search-TAB}
        Search on UMS with Policy No  ${PolicyNo#}
        Search Page Apply Filter
        UMS Click View Policy

UMS Click in ADMINISTRATION
        click element  ${ID-UMS-MAIN-ADMINISTRATION}

UMS Click Background process
        mouse over  ${ID-UMS-Task-Administration}
        click element  ${ID-UMS-Configure-Background-Process}

UMS Choose Job
        [Arguments]  ${JobName}
        click element  ${ID-UMS-JobName}
        select from list by label  ${ID-UMS-JobName}  ${JobName}

UMS Schedule Background Process
        [Arguments]  ${schedule-time}
        click element  ${ID-UMS-JobFrequency}
        select from list by label  ${ID-UMS-JobFrequency}  Daily
        input text  ${ID-UMS-Hour}  ${schedule-time}
        click element  ${ID-UMS_edit-endorsement-SAVE}

Change Plan
        [Arguments]  ${plan}
        Go to UMS
        wait until element is enabled  ${ID-UMS-BIND/ISSUE-Tab}  30
        Go to Bind/Issue page UMS
        click element  id=Checkbox1
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}
        click element  ${ID-UMS-CancellationApply&Continue}
        select from list by value  ${ID-UMS-Paymentplan}  ${plan}
        click element  ${ID-UMS-Generate Receivables}
        wait until element is not visible   globalAjaxLoading  40
        CLICK ELEMENT  ${ID-UMS-Cancellation-Next}
        UMS Review button and submit
        Issue the policy in UMS
        Go to Bind/Issue page UMS
        click element  ${ID-UMS-Payments-link}
        ${Valueofplan}=  Get Selected List Value  ${ID-UMS-Paymentplan}

Change UW review to quote
        wait until element is visible  ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element  id=idReleaseAll
        click element  //input[@value='Save']
        wait until element is visible  ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Rating
        click element  id=navApplyContinue
        click element  //div[4]/div[3]/div/button/span

UMS remove hold
        Go to UMS
        Fetch Policy Number From UMS Header
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element    ${UMS-ExpandAll}

UMS Release hold
        Go to UMS
        sleep  2s
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element  id=idReleaseAll
        click element  //input[@value='Save']
        Navigate To Rating Page
        Wait Until Element Is visible    //a[normalize-space()='Quote Letter']     10s
        Wait Until Element Is Enabled    //a[normalize-space()='Quote Letter']     10s
        Click Element    //a[normalize-space()='Quote Letter']
        select radio button  Action  Review
        click element  ${ID-UMS-Cancellation-Submit}
#        Close UMS window

Navigate To Rating Page
    wait until element is visible  ${ID-UMS-UNDERWRITING}  10
    mouse over  ${ID-UMS-UNDERWRITING}
    click element  link=Rating

Verify SAE Optional Coverages
    [Arguments]    &{test_data}
    Navigate To Rating Page
    Wait Until Page Contains Element    //a[normalize-space()='Coverages']
    Click Element     //a[normalize-space()='Coverages']
    Checkbox Should Be Selected    //label[normalize-space()='PL']/parent::td/preceding-sibling::td/input
    Run Keyword If    "${test_data['Per claim policy limit']}" != "NONE"  Validate DOL Coverage  &{test_data}
    Validate Sale Coverage  &{test_data}
    Close UMS Window

Validate DOL Coverage
    [Arguments]    &{test_data}
    Run Keyword If    "${test_data['Per claim policy limit']}" == "25"  Checkbox Should Be Selected    //label[normalize-space()='DOL25']/parent::td/preceding-sibling::td/input
    Run Keyword If    "${test_data['Per claim policy limit']}" == "50"  Checkbox Should Be Selected    //label[normalize-space()='DOL50']/parent::td/preceding-sibling::td/input

Validate Sale Coverage
    [Arguments]    &{test_data}
    Run Keyword If    "${test_data['SALE1']}" == "YES"  Checkbox Should Be Selected    //label[normalize-space()='SALE']/parent::td/preceding-sibling::td/input
    Run Keyword If    "${test_data['SALE2']}" == "YES"  Checkbox Should Be Selected    //label[normalize-space()='2SALE']/parent::td/preceding-sibling::td/input
    Run Keyword If    "${test_data['SALE3']}" == "YES"  Checkbox Should Be Selected    //label[normalize-space()='3SALE']/parent::td/preceding-sibling::td/input



Fetch Policy Number In UMS
    [Arguments]    ${test_data}
    ${Policy_Number}=    get text    ${UMS_Policy_Number}
    log to console   ${Policy_Number}
    set test variable  ${policy-no}   ${Policy_Number}
    set to dictionary    ${test_data}    PolicyNumber=${Policy_Number}

Close UMS window
        ${windows}=  Get window titles
        switch window   ${windows}[2]   30
        close window
        switch window   ${windows}[1]   30
        Reload Page

Release Policy Holds
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element  id=idReleaseAll
        click element  //input[@value='Save']
        wait until element is visible  ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Rating

### TMS ###
Navigate to TMS
        Set selenium implicit wait  30
        ${TMS-URL}=  Set variable  ${CONFIG_DATA['TMS']['url']}
        open browser  ${TMS-URL}  edge
        maximize browser window

Policy Cancellation
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       wait until element is not visible   globalAjaxLoading  100
       wait until element is enabled    ${Servicing}  60
       mouse over  ${Servicing}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${Cancellation}
       set selenium implicit wait  5
       click ok button
       sleep  2
       wait until element is not visible   globalAjaxLoading  100
       set selenium implicit wait  2
       ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       log to console    Policy_Status:${Policy_Status}
       set selenium implicit wait  2
       sleep  1
       run keyword if    'Pending Cancellation' == '${Policy_Status}'    log to console    "Policy Status matches and is verified"


Return date 100 Days prior to renewal date
       wait until element is not visible   globalAjaxLoading  100
       ${Renewal_Substring_element}=  Get Substring Value  ${element}  17  26
       log to console  ${Renewal_Substring_element}
       ${Renewal_Final_date}=    Subtract 100 Days from the Renewal Date  ${Renewal_Substring_element}
       set testvariable  ${Renewal_Final_date}
       log to console  ${Renewal_Final_date}
       RETURN    ${Renewal_Final_date}

Subtract x Days from the Exp Date
       [Arguments]  ${element}  ${xdays}
       ${month}=    get substring    ${element}    0    2
       ${date}=    get substring    ${element}    3    5
       ${year}=    get substring    ${element}    6
       ${Eff_Enddate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
       ${End-date}=   Subtract Time From Date    ${Eff_Enddate}    ${xdays}
       ${T_year}=    get substring    ${End-date}  0  4
       ${T_month}=    get substring    ${End-date}    5    7
       ${T_date}=    get substring    ${End-date}    8    10
       ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
       RETURN    ${Terminate_date}

Subtract 119 Days from the Renewal Date
       [Arguments]  ${element}
       ${month}=    get substring    ${element}    0    2
       ${date}=    get substring    ${element}    3    5
       ${year}=    get substring    ${element}    6
       ${Eff_Enddate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
       ${End-date}=   Subtract Time From Date    ${Eff_Enddate}    119 days
       ${T_year}=    get substring    ${End-date}  0  4
       ${T_month}=    get substring    ${End-date}    5    7
       ${T_date}=    get substring    ${End-date}    8    10
       ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
       RETURN    ${Terminate_date}

Subtract 100 Days from the Renewal Date
       [Arguments]  ${element}
       ${month}=    get substring    ${element}    0    2
       ${date}=    get substring    ${element}    3    5
       ${year}=    get substring    ${element}    6
       ${Eff_Enddate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
       ${End-date}=   Subtract Time From Date    ${Eff_Enddate}    100 days
       ${T_year}=    get substring    ${End-date}  0  4
       ${T_month}=    get substring    ${End-date}    5    7
       ${T_date}=    get substring    ${End-date}    8    10
       ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
       RETURN    ${Terminate_date}

change Application Date
       wait until element is not visible   globalAjaxLoading  100
       ${title}=    get window titles
       Switch Window    title=${title}[0]
       wait until element is not visible   globalAjaxLoading  100
       click element    ${Administration}
       click element    ${Application_Date}
       set selenium implicit wait  5
       select radio button    ${Click_Change_Date}    False

Pick Expiry Date
        wait until element is not visible   globalAjaxLoading  100
       ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       #${element}=    get text    //a/span[@id='PolicyNumberInHeader']
#       ${Renewal_Substring_element}=    Get Substring Value    ${element}  30  40
       ${Substring_element}=    Get Substring Value    ${element}  30  40
       #${Substring_element}=    Fetch From Right  ${element}   ,
       set test variable  ${Substring_element}
       log to console  ${Substring_element}

Pick Renewal Date
       wait until element is not visible   globalAjaxLoading  100
       ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       ${Renewal_Substring_element}=    Get Substring Value    ${element}  17  27
       set test variable  ${Renewal_Substring_element}
       RETURN    ${Renewal_Substring_element}


Set UMS date X Number of Days Prior Exp Date
       [Arguments]  ${xdays}
       wait until element is not visible   globalAjaxLoading  200
       ${Final_date}=    Subtract x Days from the Exp Date  ${Substring_element}  ${xdays}
       set test variable  ${Final_date}
       ${calcc-date}=  Subtract time from date  ${Final_date}  0  date_format=%m/%d/%Y
       ${format-calc-date}=  Convert date  ${calcc-date}  result_format=%m/%d/%Y
       Set test variable  ${application-date}  ${format-calc-date}
       log to console  ${application-date}
       @{datess}=  Split string  ${application-date}  /
       click element  ${ID-UMS-ChangeDate}
       click element  ${ID-UMS-DatePicker}
       Select date  @{datess}
       click element  ${ID-UMS-Submitoffset}

Subtract X Days From Start Date
       [Arguments]  ${test_data}
       ${month}=    get substring    ${Renewal_Substring_element}    0    2
       ${date}=    get substring    ${Renewal_Substring_element}    3    5
       ${year}=    get substring    ${Renewal_Substring_element}    6
       log to console    m:${month}
       log to console    d:${date}
       log to console    y:${year}
       ${Eff_Enddate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
       ${End-date}=   Subtract Time From Date    ${Eff_Enddate}    ${test_data['xdays']} days
       log to console    Ed:${End-date}
       ${T_year}=    get substring    ${End-date}  0  4
       ${T_month}=    get substring    ${End-date}    5    7
       ${T_date}=    get substring    ${End-date}    8    10
       ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
       RETURN    ${Terminate_date}

Set X Days Prior To Start Date
        [Arguments]    ${test_data}
        wait until element is not visible   globalAjaxLoading  200
        ${Final_date}=    Subtract X Days From Start Date  ${test_data}
        set test variable  ${Final_date}
        log to console    FinalDate:${Final_date}
        Set test variable  ${Final_date}
        log to console  FD:${Final_date}
        @{datess}=  Split string  ${Final_date}  /
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{datess}
        click element  ${ID-UMS-Submitoffset}

Set UMS Date 100 Days Prior to Effective Renewal Date
        ${Ren_Final_date}=    Subtract 100 Days from the Renewal Date  ${Renewal_Substring_element}
        set test variable  ${Ren_Final_date}
        log to console  ${Ren_Final_date}
        ${calc-Ren-date}=  Subtract time from date  ${Ren_Final_date}  0  date_format=%m/%d/%Y
        log to console  ${calc-Ren-date}
        ${format-calc-Ren-date}=  Convert date  ${calc-Ren-date}  result_format=%m/%d/%Y
        Set test variable  ${Ren-application-date}  ${format-calc-Ren-date}
        log to console  ${Ren-application-date}
        @{Ren-dates}=  Split string  ${Ren-application-date}  /
        log to console  Split Date= @{Ren-dates}
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{Ren-dates}
        click element  ${ID-UMS-Submitoffset}

Set UMS Date 119 Days Prior to Effective Renewal Date
        ${Ren_Final_date}=    Subtract 119 Days from the Renewal Date  ${Renewal_Substring_element}
        set test variable  ${Ren_Final_date}
        log to console  ${Ren_Final_date}
        ${calc-Ren-date}=  Subtract time from date  ${Ren_Final_date}  0  date_format=%m/%d/%Y
        log to console  ${calc-Ren-date}
        ${format-calc-Ren-date}=  Convert date  ${calc-Ren-date}  result_format=%m/%d/%Y
        Set test variable  ${Ren-application-date}  ${format-calc-Ren-date}
        log to console  ${Ren-application-date}
        @{Ren-dates}=  Split string  ${Ren-application-date}  /
        log to console  Split Date= @{Ren-dates}
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{Ren-dates}
        click element  ${ID-UMS-Submitoffset}

Enter Texas Timing
        ${Texas-time}=  Calculate Texas time
        Set Test Variable  ${Texas-time}
        log to console  ${Texas-time}

UMS Configure Background Process
        [Arguments]  ${test_data}
        UMS Click Background process
        wait until element is not visible   globalAjaxLoading  40
        Check and select from list by label  ${ID-UMS-JobName}    ${test_data['Job_Name']}
        Check and select from list by label  ${ID-UMS-JobFrequency}    ${test_data['Job_Frequency']}
        click element  ${ID-UMS-Hour}
        ${UTC_Date_Time}=  Get Current Date  UTC  - 6 hours  exclude_millis=yes
        ${Removed_Spaces}=  remove string  ${UTC_Date_Time}  ${space}AM
        ${Time1}=  fetch from right  ${Removed_Spaces}  ${space}
        ${Time2}=	Convert Time  ${Time1}  verbose
        ${Texas_Time_Plus_1min}=  Add Time To Time   ${Time2}  00:01:00  timer  exclude_millis=yes
        log to console  Texas Time:${Texas_Time_Plus_1min}
        ${Texas_Time_Plus_1min}=  get substring  ${Texas_Time_Plus_1min}  0  5
        log to console  ${Texas_Time_Plus_1min}
        input text  ${ID-UMS-Hour}  ${Texas_Time_Plus_1min}
        #click element   //button[contains(text(),'Done')]
        click element  ${ID-UMS-SAVE}
        wait until element is not visible   globalAjaxLoading  100
        sleep  70

Calculate Texas time
        ${cur-time}=  Get UMS time
        ${calcc-time}=  Add time to date  ${cur-time}  ${minutes-to-add} minutes  date_format=%m/%d/%Y %H:%M:%S %p  result_format=%I:%M
        log to console  ${calcc-time}
        Calculate job time  ${cur-time}
        RETURN  ${calcc-time}

UMS Schedule Background Process1
        [Arguments]  ${Texas-time}
        click element  ${ID-UMS-Hour}
        input text    ${ID-UMS-Hour}    ${Texas-time}
        click element  ${ID-UMS-SAVE}

Set Application Date to Current Date at Start
        ${title}=    get window titles
        Switch Window    title=${title}[0]
        wait until element is not visible   globalAjaxLoading  100
        click element  //a[contains(text(),'ADMINISTRATION')]
        wait until element is not visible   globalAjaxLoading  100
        click element    ${Application_Date}
        wait until element is not visible   globalAjaxLoading  100
        click element  ${ID-UMS-CurrentDate}
        click element  ${ID-UMS-Submitoffset}
        wait until element is not visible  globalAjaxLoading  5
        click element    ${Application_Date}
        ${title}=    get window titles
        Switch Window    title=${title}[1]

Set Application Date to Current Date
        ${title}=    get window titles
        Switch Window    title=${title}[0]
        wait until element is not visible   globalAjaxLoading  100
        click element    ${Application_Date}
        wait until element is not visible   globalAjaxLoading  100
        click element  ${ID-UMS-CurrentDate}
        click element  ${ID-UMS-Submitoffset}
        wait until element is not visible  globalAjaxLoading  5
        click element    ${Application_Date}
        wait until element is not visible   globalAjaxLoading  10
        ${title}=    get window titles
        Switch Window    title=${title}[1]
        set selenium implicit wait  1
        go back
        wait until element is not visible   globalAjaxLoading  10

Select Current Date
        [Arguments]  ${m}  ${d}  ${y}
        ${currentDate}=     Get Current Date    result_format=datetime
        ${year}=  Convert To Integer  ${y}
        ${month}=  Convert To Integer  ${m}
        ${date}=  Convert To Integer  ${d}
        ${second_currentDate}=     Get Current Date    result_format=%d
        log to console  ${second_currentDate}
        ${int_format_date}=  Convert To Integer  ${second_currentDate}
        ${month-diff}=  Evaluate  ${currentDate.month}-${month}
        ${year-diff}=  Evaluate  ${currentDate.year}-${year}
        ${move}=  Evaluate  ${year-diff}*12+${month-diff}
        log to console  ${move}
        ${shiftForward}=  Set Variable If
        ...   ${move}>0  1
        ...   ${move}<0  0
        ${move}=  Set Variable If
        ...   ${move}>0  ${move}
        ...   ${move}<0  ${move}*-1
        FOR     ${var}  IN RANGE    ${move}
            Run Keyword If  ${shiftForward}==0  Click Element  xpath=//a[@title="Prev"]
            Run Keyword If  ${shiftForward}==1  Click Element  xpath=//a[@title="Next"]
         END
        Click Element  xpath=//a[text()="${int_format_date}"]

UMS Choose Job with Texas time+1min
        [Arguments]  ${Req_mins}
        wait until element is not visible   globalAjaxLoading  200
        click element  ${ID-UMS-JobFrequency}
        select from list by label  ${ID-UMS-JobFrequency}  Daily
        wait until element is not visible   globalAjaxLoading  200
        clear element text  ${ID-UMS-Hour}
        wait until element is not visible   globalAjaxLoading  200
        sleep   2s
        ${UTC_Date_Time}=  Get Current Date  UTC  - 6 hours  exclude_millis=yes
        ${Removed_Spaces}=  remove string  ${UTC_Date_Time}  ${space}AM
        ${Time1}=  fetch from right  ${Removed_Spaces}  ${space}
        ${Time2}=	Convert Time  ${Time1}  verbose
        ${Texas_Time_Plus_1min}=  Add Time To Time   ${Time2}  ${Req_mins}  timer  exclude_millis=yes
        ${Texas_Time_Plus_1min}=  get substring  ${Texas_Time_Plus_1min}  0  5
        input text  ${ID-UMS-Hour}  ${Texas_Time_Plus_1min}
        click element  ${ID-UMS-SAVE}
        wait until element is not visible   globalAjaxLoading  200
        sleep   65s

Select a Random Date
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Substring_element}=    Get Substring Value    ${element}  17  27
        log to console  ${Substring_element}
        ${Final_date}=    Add Number of Days to the Date  ${Substring_element}  50
        #set test variable  ${Final_date}
        RETURN    ${Final_date}

Complete Cancellation
        [Arguments]  ${test_data}
        ${Eff_Cancellation_Date}=     get value     ${Cancellation_Eff_Date_Value}
        ${cancellation_Date}=  Add Number of Days to the Date  ${Eff_Cancellation_Date}  50
        input text  ${ID-UMS-Cancellation-Date}  ${cancellation_Date}
        run keyword if  '${test_data['Cancellation_Method']}'=='Flat'  input text  ${ID-UMS-Cancellation-Date}  ${Eff_Cancellation_Date}
        run keyword if  '${test_data['Cancellation_Method']}'=='Short-Rate (90%)'  input text  ${ID-UMS-Cancellation-Date}  ${cancellation_Date}
        run keyword if  '${test_data['Cancellation_Method']}'=='Pro-Rata'  input text  ${ID-UMS-Cancellation-Date}  ${cancellation_Date}
         run keyword if  '${test_data['Cancellation_Method']}'=='Pro-Rata-MinFactor'  input text  ${ID-UMS-Cancellation-Date}  ${cancellation_Date}
        check and select from list by label  ${ID-UMS-Cancellation.Method}    ${test_data['Cancellation_Method']}
        check and enter input  ${ID-UMS-Enter_UW_Reason}   ${test_data['Enter_Reasonfor_UW_AllOther']}
        click element  ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  50
        select radio button    Action    ${test_data['Value']}
        click element  ${ID-UMS-Cancellation-Submit}
        wait until element is not visible   globalAjaxLoading  100

Complete Cancellation Page
        [Arguments]  ${test_data}
        ${cancellation_Date}=  Select a Random Date
        input text  ${ID-UMS-Cancellation-Date}  ${cancellation_Date}
        check and select from list by label  ${ID-UMS-Cancellation.Method}    ${test_data['Cancellation_Method']}
        check and enter input  ${ID-UMS-Enter_UW_Reason}   ${test_data['Enter_Reasonfor_UW_AllOther']}
        click element  ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  50
        wait until element is enabled    ${ID-UW-UNDERWRITING}  60
        mouse over  ${ID-UW-UNDERWRITING}
        wait until element is not visible   globalAjaxLoading  100
        click element  ${ID-UMS-Rating}
        wait until element is not visible   globalAjaxLoading  100

Abandon cancellation
        wait until element is not visible   globalAjaxLoading  50
        click element  ${ID-UMS-Abandon-Cancellation}
        set selenium implicit wait  5
        handle alert  action=Accept
        set selenium implicit wait  5
        ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        log to console  Policy Status:${Policy_Status}

Set Application Date As Tomorrows Date
        ${Current_date}=  Get Current Date  result_format=datetime
        ${Tomorrows_date}=  Add Time To Date  ${Current_date}  1 day  date_format=%m/%d/%Y
        log to console  ${Tomorrows_date}
        ${format-tomorrows-date}=  Convert date  ${Tomorrows_date}  result_format=%m/%d/%Y
        Set test variable  ${format-tomorrows-date}  ${format-tomorrows-date}
        log to console  ${format-tomorrows-date}
        @{tomorrows_dates}=  Split string  ${format-tomorrows-date}  /
        log to console  @{tomorrows_dates}
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select Tomorrows Date  @{tomorrows_dates}
        click element  ${ID-UMS-Submitoffset}

Select Tomorrows Date
        [Arguments]  ${m}  ${d}  ${y}
        ${year}=  Convert To Integer  ${y}
        ${month}=  Convert To Integer  ${m}
        ${date}=  Convert To Integer  ${d}
        Click Element  xpath=//a[text()="${${date}}"]

Change the Policy Status From Pending to Quoted
        wait until element is not visible   globalAjaxLoading  100
        wait until element is not visible   globalAjaxLoading  100
        scroll element into view  ${ID-UMS-Apply&Continue}
        click element  ${ID-UMS-Apply&Continue}
        Click Apply Changes Button
        wait until element is not visible   globalAjaxLoading  100
        scroll element into view  ${ID-UMS-Apply&Continue}
        execute javascript  window.scrollTo(0,300)
        click element  ${ID-UMS-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        scroll element into view  ${ID-UMS-Apply&Continue}
        execute javascript  window.scrollTo(0,300)
        click element  ${ID-UMS-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        select checkbox  ${ID-UMS-SelectCheckbox}
        scroll element into view  ${ID-UMS-Apply&Continue}
        click element  ${ID-UMS-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        ${Apply_&_continue}=  run keyword and return status    element should be visible    ${ID-UMS-Apply&Continue}
        run keyword if    ${Apply_&_continue}    click element     ${ID-UMS-Apply&Continue}
        ${Apply_&_continue}=  run keyword and return status    element should be visible    ${ID-UMS-Apply&Continue}
        run keyword if    ${Apply_&_continue}    click element     ${ID-UMS-Apply&Continue}
        ${Apply_changes}=  run keyword and return status    element should be visible    //button/span[text()='Apply Changes']
        run keyword if    ${Apply_changes}    Click Apply Changes Button
        select radio button    Action    Review
        click element  ${Submit}
        wait until element is not visible   globalAjaxLoading  100
        ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        log to console  ${Policy_Status}
        set selenium implicit wait  5

Set Application Date As Current Date
        ${title}=    get window titles
        Switch Window    title=${title}[0]
        wait until element is not visible   globalAjaxLoading  100
        click element    ${Application_Date}
        wait until element is not visible   globalAjaxLoading  100
        click element  ${ID-UMS-CurrentDate}
        click element  ${ID-UMS-Submitoffset}
        ${Current_date}=  Get Current Date  result_format=datetime
        ${Final_current_date}=  Subtract Time From Date  ${Current_date}  0  date_format=%m/%d/%Y
        log to console  ${Final_current_date}
        ${format-Final-cur-date}=  Convert date  ${Final_current_date}  result_format=%m/%d/%Y
        #Set testvariable  ${format-tomorrows-date}  ${format-tomorrows-date}
        log to console  ${format-Final-cur-date}
        @{Final_curent_dates}=  Split string  ${format-Final-cur-date}  /
        log to console  krishna;@{Final_curent_dates}
        click element  ${ID-UMS-CurrentDate}
        click element  ${ID-UMS-DatePicker}
        Select Final Current Date  @{Final_curent_dates}
        click element  ${ID-UMS-Submitoffset}
        wait until element is not visible   globalAjaxLoading  10
        ${title}=    get window titles
        Switch Window    title=${title}[1]
        set selenium implicit wait  1
        go back
        wait until element is not visible   globalAjaxLoading  10

Select Final Current Date
        [Arguments]  ${m}  ${d}  ${y}
        ${year}=  Convert To Integer  ${y}
        ${month}=  Convert To Integer  ${m}
        ${date}=  Convert To Integer  ${d}
        Click Element  xpath=//a[text()="${date}"]

Click Apply Changes Button
        Wait Until Element Is Visible    //button/span[text()='Apply Changes']   10s
        set focus to element  //button/span[text()='Apply Changes']
        sleep  0.5
        mouse up  //button/span[text()='Apply Changes']
        click element  //button/span[text()='Apply Changes']  CTRL+ALT

Select from Coverages
        wait until element is not visible   globalAjaxLoading  200
        wait until element is visible  (//tr//th[contains(text(),'Program')]//following-sibling::td//select/option)[2]
        ${programName}=  get text  (//tr//th[contains(text(),'Program')]//following-sibling::td//select/option)[2]
        log to console  get text:${programName}
        run keyword if  '${programName}'=='REALESTATE'  select checkbox  ${EPL-Coverage}
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible   ${ApplyChanges-Button}
        click element   ${ApplyChanges-Button}
        wait until element is not visible   globalAjaxLoading  100
        #wait until element is visible  ${DeductibleValue}
        #clear element text    ${DeductibleValue}
        #input text  ${DeductibleValue}   2
        click element   ${ID-UMS-CancellationApply&Continue}
        log to console  Rating base page reached
        wait until element is not visible   globalAjaxLoading  100
        click element   ${ID-UMS-CancellationApply&Continue}
        log to console  Limit/Deductibles options page reached
        wait until element is not visible   globalAjaxLoading  100
        #run keyword if  '${programName}'=='REALESTATE'  run keywords  wait until element is visible   ${FullTimeValue}  AND  input text  ${FullTimeValue}  1000
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        ${Checkbox_present}=    run keyword and return status    page should contain element    ${CoverageSelectAllCheckboxes}
        Run Keyword If    '${Checkbox_present}'=='True'    run keywords    select checkbox  ${CoverageSelectAllCheckboxes}    AND
        ...    click element   ${ID-UMS-CancellationApply&Continue}
        log to console  Quote options page reached
        wait until element is not visible   globalAjaxLoading  100
        ${Checkbox_present1}=    run keyword and return status    page should contain element    ${CoverageSelectAllCheckboxes}
        Run Keyword If    '${Checkbox_present1}'=='True'    run keywords    select checkbox  ${CoverageSelectAllCheckboxes}    AND
        ...    click element   ${ID-UMS-CancellationApply&Continue}
        ${Apply_Changes}=    run keyword and return status    page should contain element   ${ApplyChanges-Button}
        Run Keyword If  ${Apply_Changes}    click element   ${ApplyChanges-Button}
        log to console  reached end opt page

Bind Quote
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible   ${ID-UMS-Add-Endorsement}
        click link  ${ID-UMS-Add-Endorsement}
        log to console  Bind Endorsement page reached
        Wait Until Element Is Visible  ${AddEndorsementFirstLink}  10s
        click element   ${AddEndorsementFirstLink}
        wait until element is visible   ${ID-UMS_edit-endorsement-SAVE}
        click element   ${ID-UMS_edit-endorsement-SAVE}
        wait until element is not visible   globalAjaxLoading  100
        select radio button  Selected  False
        wait until element is not visible   globalAjaxLoading  100
        select checkbox  ${CoverageSelectAllCheckboxes}
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        click element   ${ID-UMS-CancellationApply&Continue}
        ${Apply_&_continue}=  run keyword and return status    element should be visible    ${ID-UMS-CancellationApply&Continue}
        run keyword if    ${Apply_&_continue}    click element     ${ID-UMS-CancellationApply&Continue}
        ${Apply_&_continue}=  run keyword and return status    element should be visible    ${ID-UMS-CancellationApply&Continue}
        run keyword if    ${Apply_&_continue}    click element     ${ID-UMS-CancellationApply&Continue}
        wait until element is visible   ${PostEndorsementLink}
        click element  ${PostEndorsementLink}
        UMS Review button and submit

Underwriter Rating
        wait until element is not visible   globalAjaxLoading  200
        mouse up    (//li//a[contains(text(),'UNDERWRITING')])
        wait until element is visible   (//li//a[contains(text(),'UNDERWRITING')])[1]
        click element   (//li//a[contains(text(),'UNDERWRITING')])[1]

Update Task in UMS Task Management
        [Arguments]    ${test_data}
        click element  ${UMS_Task_Management}
        wait until element is not visible   globalAjaxLoading  100
        click element  ${UMS_Task_Management_Edit}
        wait until element is not visible   globalAjaxLoading  100
        input text  ${UMS_Task_Management_Details}  ${test_data['Comment']}
        click element  ${UMS_Task_Management_Update}
        Handle Alert  action=ACCEPT
        click element  ${UMS-JOURNAL}

Navigate To UMS Journal
        wait until element is not visible   globalAjaxLoading  100
        click element  ${UMS-JOURNAL}

Review Non renewal Status Manual Close
        [Arguments]    ${test_data}
        ${title}=    get window titles
        Switch Window    title=${title}[1]
        click element  ${UMS_Task_Management}
        Wait Until Element Is Visible   ${UMS_Task_Management_Close}  10s
        click element  ${UMS_Task_Management_Close}
        wait until element is not visible   globalAjaxLoading  100
        input text  ${UMS_Task_Close_journaldetailstext}  ${test_data['Task Closure comment']}
        click element  ${UMS_Task_Management_Close_Button}
        Handle Alert  action=ACCEPT
        Handle Alert  action=ACCEPT

UMS T-log Closed
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
         ${Tlog_Username}=    get text    (//table//tbody//tr//td)[20]
         log to console   Tlog_Username:${Tlog_Username}
         ${Name}=    UMS Username
         run keyword if    'System Generated' == '${Tlog_Username}'    log to console    "Username matches and is verified"
         run keyword if    '${Name}' == '${Tlog_Username}'    log to console    "Username matches and is verified"
         ${Tlog_Program}=    get text    (//table//tbody//tr//td)[21]
         log to console    Tlog_Program:${Tlog_Program}
         ${Tlog_Task}=    get text    (//table//tbody//tr//td)[22]
         log to console    Tlog_Task:${Tlog_Task}
         run keyword if    'TMS' == '${Tlog_Task}'    log to console    "Task matches and is verified"
         ${Tlog_Operation}=    get text    (//table//tbody//tr//td)[23]
         log to console   Tlog_Operation:${Tlog_Operation}
         run keyword if    'Task Closed -Review Non-Renewal Status' == '${Tlog_Operation}'    log to console    "Operation matches and is verified"    ELSE    run keywords    Log to console    "Operation does not match"    AND    close browser
         ${Tlog_DateTime}=    get text    (//table//tbody//tr//td)[25]
         ${Conv_Date}=    TMS Current Date Conversion
         ${Date}=    fetch from left    ${Tlog_DateTime}    ${space}
         log to console    Tlog_Date:${Date}
         run keyword if  '${Conv_Date}' == '${Date}'  log to console    "Date matches and is verified"

Verify Task Closure in UMS Task Management
        click element  ${UMS_Task_Management}
        log to console  "Task is Closed in Task Management"

Release Holds and Click Quote Letter
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element  id=idReleaseAll
        click element  //input[@value='Save']
        wait until element is visible  ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Rating
        wait until element is visible   ${ID_QuoteLetter}
        click element   ${ID_QuoteLetter}
        select radio button  Action  Review
        click element  ${ID-UMS-Cancellation-Submit}

Pick Start date
        wait until element is not visible   globalAjaxLoading  100
        ${PolicyText}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${StartDate}=    Get Substring Value    ${PolicyText}  17  27
        set test variable  ${StartDate}
        log to console  start date is:${StartDate}
        wait until element is not visible   globalAjaxLoading  100
        Subtract x Days from the Renewal Start Date

Subtract x Days from the Renewal Start Date
        ${month}=    get substring    ${StartDate}    0    2
        ${date}=    get substring    ${StartDate}    3    5
        ${year}=    get substring    ${StartDate}    6
        ${Eff_Enddate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
        ${End-date}=   Subtract Time From Date    ${Eff_Enddate}  100 days
        ${T_year}=    get substring    ${End-date}  0  4
        ${T_month}=    get substring    ${End-date}    5    7
        ${T_date}=    get substring    ${End-date}    8    10
        ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
        set test variable    ${Terminate_date}
        log to console   m/d/y is:${Terminate_date}
        RETURN    ${Terminate_date}

Set UMS Date X Days Prior to Effective Renewal Date
        @{Ren-dates}=  Split string  ${Terminate_date}  /
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{Ren-dates}
        click element  ${ID-UMS-Submitoffset}

## TMS_SAE
TMS_SAE Pick Expiry Date
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Substring_element}=    Get Substring Value    ${element}  28  38
        set test variable  ${Substring_element}
        log to console  ${Substring_element}

TMS_SAE Pick Renewal Date
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Renewal_Substring_element}=    Get Substring Value    ${element}  13  23
#        ${Renewal_Substring_element}=    Get Substring Value    ${element}  15  25
        set test variable  ${Renewal_Substring_element}

TMS_SAE Select a Random Date
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Substring_element}=    Get Substring Value    ${element}  15  25
        log to console  ${Substring_element}
        ${Final_date}=    Add Number of Days to the Date  ${Substring_element}  50
        RETURN    ${Final_date}

TMS_SAE Complete Cancellation Page
       [Arguments]  ${test_data}
       ${cancellation_Date}=  TMS_SAE Select a Random Date
       input text  ${ID-UMS-Cancellation-Date}  ${cancellation_Date}
       check and select from list by label  ${ID-UMS-Cancellation.Method}    ${test_data['Cancellation_Method']}
       check and enter input  ${ID-UMS-Enter_UW_Reason}   ${test_data['Enter_Reasonfor_UW_AllOther']}
       click element  ${ID-UMS-CancellationApply&Continue}
       wait until element is not visible   globalAjaxLoading  50
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${ID-UMS-Rating}
       wait until element is not visible   globalAjaxLoading  100

#TMS_SAE
Select a Random Date TMS_SAE
       ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       ${Substring_element}=    Get Substring Value    ${element}  15  25
       log to console  date and month:${Substring_element}
       ${Renewal_Substring_element}=    Add Number of Days to the Date  ${Substring_element}  50
       RETURN    ${Renewal_Substring_element}

Pick Expiry Date SAE
       wait until element is not visible   globalAjaxLoading  100
       ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
       ${Substring_element}=    Get Substring Value    ${element}  28  38
       set test variable  ${Substring_element}
       log to console  ${Substring_element}

Pick Start date SAE
       wait until element is not visible   globalAjaxLoading  100
       ${PolicyText}=  get text  //td[b[text()='POLICY:']]//following-sibling::td
       ${StartDate}=    Get Substring Value    ${PolicyText}  15  25
       set test variable  ${StartDate}
       log to console  start date is:${StartDate}
       wait until element is not visible   globalAjaxLoading  100
       Subtract x Days from the Renewal Start Date

Pick Renewal Date SAE
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Renewal_Substring_element}=    Get Substring Value    ${element}  15  25
        set test variable  ${Renewal_Substring_element}
        log to console  ${Renewal_Substring_element}

## TMS_MGMT LIAB Non Prof
TMS_MGMT_LIAB_NFP Pick Expiry Date
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Substring_element}=    Get Substring Value    ${element}  29  39
        set test variable  ${Substring_element}
        log to console  date:${Substring_element}

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

TMS_MGMT_LIAB_NFP Fetch Start Date
        wait until element is not visible   globalAjaxLoading  100
        ${PolicyText}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Renewal_Substring_element}=    Get Substring Value    ${PolicyText}  16  26
        set test variable  ${Renewal_Substring_element}
        log to console  start date is:${Renewal_Substring_element}
        wait until element is not visible   globalAjaxLoading  100

TMS_MGMT_LIAB_NFP Pick Start date
        wait until element is not visible   globalAjaxLoading  100
        ${PolicyText}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${StartDate}=    Get Substring Value    ${PolicyText}  16  26
        set test variable  ${StartDate}
        log to console  start date is:${StartDate}
        wait until element is not visible   globalAjaxLoading  100
        Subtract x Days from the Renewal Start Date

TMS_MGMT_LIAB Complete Cancellation Page
       [Arguments]  ${test_data}
       ${cancellation_Date}=  TMS_MGMT_LIAB_NFP Select a Random Date
       input text  ${ID-UMS-Cancellation-Date}  ${cancellation_Date}
       check and select from list by label  ${ID-UMS-Cancellation.Method}    ${test_data['Cancellation_Method']}
       check and enter input  ${ID-UMS-Enter_UW_Reason}   ${test_data['Enter_Reasonfor_UW_AllOther']}
       click element  ${ID-UMS-CancellationApply&Continue}
       wait until element is not visible   globalAjaxLoading  50
       wait until element is enabled    ${ID-UW-UNDERWRITING}  60
       mouse over  ${ID-UW-UNDERWRITING}
       wait until element is not visible   globalAjaxLoading  100
       click element  ${ID-UMS-Rating}
       wait until element is not visible   globalAjaxLoading  100

TMS_MGMT_LIAB_NFP Select a Random Date
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Substring_element}=    Get Substring Value    ${element}  16  26
        log to console  ${Substring_element}
        ${Final_date}=    Add Number of Days to the Date  ${Substring_element}  50
        RETURN    ${Final_date}

TMS_MGMT_LIAB_NFP Pick Renewal Date
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        log to console  ${element}
        ${Renewal_Substring_element}=    Get Substring Value    ${element}  16  26
        log to console  ${Renewal_Substring_element}
        set test variable  ${Renewal_Substring_element}

Return date 100 Days prior to renewal date for MGMT LIAB
       wait until element is not visible   globalAjaxLoading  10
       ${Renewal_Substring_element}=    Get Substring Value    ${element}  16  26
       log to console  ${Substring_element}
       ${Renewal_Final_date}=    Subtract 100 Days from the Renewal Date for MGMT LIAB  ${Renewal_Substring_element}
       set testvariable  ${Renewal_Final_date}
       log to console  ${Renewal_Final_date}
       RETURN    ${Renewal_Final_date}

Subtract 119 Days from the Renewal Date for MGMT LIAB
       [Arguments]  ${element}
       ${month}=    get substring    ${element}    0    2
       ${date}=    get substring    ${element}    3    5
       ${year}=    get substring    ${element}    6
       ${Eff_Enddate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
       ${End-date}=   Subtract Time From Date    ${Eff_Enddate}    119 days
       ${T_year}=    get substring    ${End-date}  0  4
       ${T_month}=    get substring    ${End-date}    5    7
       ${T_date}=    get substring    ${End-date}    8    10
       ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
       RETURN    ${Terminate_date}

Subtract 100 Days from the Renewal Date for MGMT LIAB
       [Arguments]  ${element}
       ${month}=    get substring    ${element}    0    2
       ${date}=    get substring    ${element}    3    5
       ${year}=    get substring    ${element}    6
       ${Eff_Enddate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
       ${End-date}=   Subtract Time From Date    ${Eff_Enddate}    100 days
       ${T_year}=    get substring    ${End-date}  0  4
       ${T_month}=    get substring    ${End-date}    5    7
       ${T_date}=    get substring    ${End-date}    8    10
       ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
       RETURN    ${Terminate_date}

Set UMS Date 119 Days Prior to Effective Renewal Date for MGMT LIAB NFP
        ${Ren_Final_date}=    Subtract 119 Days from the Renewal Date for MGMT LIAB  ${Renewal_Substring_element}
        set testvariable  ${Ren_Final_date}
        log to console  ${Ren_Final_date}
        ${calc-Ren-date}=  Subtract time from date  ${Ren_Final_date}  0  date_format=%m/%d/%Y
        log to console  ${calc-Ren-date}
        ${format-calc-Ren-date}=  Convert date  ${calc-Ren-date}  result_format=%m/%d/%Y
        Set testvariable  ${Ren-application-date}  ${format-calc-Ren-date}
        log to console  ${Ren-application-date}
        @{Ren-dates}=  Split string  ${Ren-application-date}  /
        log to console  Split Date= @{Ren-dates}
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{Ren-dates}
        click element  ${ID-UMS-Submitoffset}

Set UMS Date 100 Days Prior to Effective Renewal Date for MGMT LIAB NFP
        ${Ren_Final_date}=    Subtract 100 Days from the Renewal Date for MGMT LIAB  ${Renewal_Substring_element}
        set testvariable  ${Ren_Final_date}
        log to console  ${Ren_Final_date}
        ${calc-Ren-date}=  Subtract time from date  ${Ren_Final_date}  0  date_format=%m/%d/%Y
        log to console  ${calc-Ren-date}
        ${format-calc-Ren-date}=  Convert date  ${calc-Ren-date}  result_format=%m/%d/%Y
        Set testvariable  ${Ren-application-date}  ${format-calc-Ren-date}
        log to console  ${Ren-application-date}
        @{Ren-dates}=  Split string  ${Ren-application-date}  /
        log to console  Split Date= @{Ren-dates}
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{Ren-dates}
        click element  ${ID-UMS-Submitoffset}

Select from Coverages for MGMT NFP
        wait until element is not visible   globalAjaxLoading  200
        wait until element is visible  (//tr//th[contains(text(),'Program')]//following-sibling::td//select/option)[2]
        ${programName}=  get text  (//tr//th[contains(text(),'Program')]//following-sibling::td//select/option)[2]
        log to console  get text:${programName}
        run keyword if  '${programName}'=='REALESTATE'  select checkbox  ${EPL-Coverage}
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible   ${ApplyChanges-Button}
        click element   ${ApplyChanges-Button}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible  ${DeductibleValue}
        clear element text    ${DeductibleValue}
        input text  ${DeductibleValue}   2
        click element   ${ID-UMS-CancellationApply&Continue}
        log to console  Rating base page reached
        wait until element is not visible   globalAjaxLoading  100
        click element   ${ID-UMS-CancellationApply&Continue}
        log to console  Limit/Deductibles options page reached
        wait until element is not visible   globalAjaxLoading  100
        run keyword if  '${programName}'=='REALESTATE'  run keywords  wait until element is visible   ${FullTimeValue}  AND  input text  ${FullTimeValue}  1000
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        select checkbox  ${CoverageSelectAllCheckboxes}
        click element   ${ID-UMS-CancellationApply&Continue}
        log to console  Quote options page reached
        wait until element is not visible   globalAjaxLoading  100
        #select checkbox  ${CoverageSelectAllCheckboxes}
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        ${Apply_Changes}=  Run Keyword And Return Status  Element Should Be Visible   ${ApplyChanges-Button}
        Run Keyword If  ${Apply_Changes}    click element   ${ApplyChanges-Button}
        ${Next}=  Run Keyword And Return Status  Element Should Be Visible   ${ID-UMS-Cancellation-Next}
        Run Keyword If  ${Next}    click element   ${ID-UMS-Cancellation-Next}
        #Wait Until Element Is Visible    //input[@value='Review']  5s
        #Scroll Element Into View  //input[@value='Review']
        #click element     //input[@value='Review']
        #click element  ${ID-UMS-Submit}
        #log to console  reached end opt page

#Cyber PVT Ltd Ram added
Pick Expiry Date for Cyber
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Substring_element}=    Get Substring Value    ${element}  31  41
        set test variable  ${Substring_element}
        log to console  ${Substring_element}

Pick Renewal Date for CYBER_PVT_ENT
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Renewal_Substring_element}=    Get Substring Value    ${element}  18  28
        set test variable  ${Renewal_Substring_element}
        log to console  ${Renewal_Substring_element}

Set UMS Date 100 Days Prior to Effective Renewal Date for CYBER_PVT_ENT
        ${Ren_Final_date}=    Subtract 100 Days from the Renewal Date for CYBER_PVT_ENT  ${Renewal_Substring_element}
        set testvariable  ${Ren_Final_date}
        log to console  ${Ren_Final_date}
        ${calc-Ren-date}=  Subtract time from date  ${Ren_Final_date}  0  date_format=%m/%d/%Y
        log to console  ${calc-Ren-date}
        ${format-calc-Ren-date}=  Convert date  ${calc-Ren-date}  result_format=%m/%d/%Y
        Set testvariable  ${Ren-application-date}  ${format-calc-Ren-date}
        log to console  ${Ren-application-date}
        @{Ren-dates}=  Split string  ${Ren-application-date}  /
        log to console  Split Date= @{Ren-dates}
        click element  ${ID-UMS-ChangeDate}
        click element  ${ID-UMS-DatePicker}
        Select date  @{Ren-dates}
        click element  ${ID-UMS-Submitoffset}

Subtract 100 Days from the Renewal Date for CYBER_PVT_ENT
       [Arguments]  ${element}
       ${month}=    get substring    ${element}    0    2
       ${date}=    get substring    ${element}    3    5
       ${year}=    get substring    ${element}    6
       ${Eff_Enddate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
       ${End-date}=   Subtract Time From Date    ${Eff_Enddate}    100 days
       ${T_year}=    get substring    ${End-date}  0  4
       ${T_month}=    get substring    ${End-date}    5    7
       ${T_date}=    get substring    ${End-date}    8    10
       ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
       RETURN    ${Terminate_date}

Pick Start date for Cyber
        wait until element is not visible   globalAjaxLoading  100
        ${PolicyText}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${StartDate}=    Get Substring Value    ${PolicyText}  17  27
        set test variable  ${StartDate}
        log to console  start date is:${StartDate}
        wait until element is not visible   globalAjaxLoading  100
        Subtract x Days from the Renewal Start Date

Verify Policy Status 1
        [Arguments]     ${test_data}
        run keyword and continue on failure     run keyword if     '${Policy_Status}'==' ${test_data['Policy Status1']}'     log to console    Policy Status Matches and Verified
        ...     ELSE     run keywords     log to console     Policy Status is not matching     AND     Close Browser

Verify Policy Status 2
        [Arguments]     ${test_data}
        run keyword and continue on failure    run keyword if     '${Policy_Status}'==' ${test_data['Policy Status2']}'     log to console    Policy Status Matches and Verified
        ...    ELSE    run keywords    log to console    Policy Status is not matching    AND    Close Browser

Verify Policy Status 3
        [Arguments]     ${test_data}
        run keyword and continue on failure    run keyword if     '${Policy_Status}'==' ${test_data['Policy Status3']}'     log to console    Policy Status Matches and Verified
        ...    ELSE    run keywords    log to console    Policy Status is not matching    AND    Close Browser

Pick Renewal Date BR
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Renewal_Substring_element1}=    Fetch From Right   ${element}  ,
        ${Renewal_Substring_element}=    Get Substring  ${Renewal_Substring_element1}  1  11
        set test variable  ${Renewal_Substring_element}
        log to console  ${Renewal_Substring_element}

Pick Expiration Date BR
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Exp_Date}=  Get Substring Value    ${element}  29  39
        ${Substring_element}=    Subtract Time From Date   ${Exp_Date}  2 days
        set test variable  ${Substring_element}
        log to console  ${Substring_element}

Pick Renewal Raven
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Renewal_Substring_element}=    Get Substring Value    ${element}  21  31
        set test variable  ${Renewal_Substring_element}
        log to console  ${Renewal_Substring_element}

Pick Renewal Date MGMT-LIAB
        wait until element is not visible   globalAjaxLoading  100
        ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        ${Renewal_Substring_element}=    Get Substring Value    ${element}  15  26
        set test variable  ${Renewal_Substring_element}
        log to console  ${Renewal_Substring_element}

Adding Endorsement
        [Arguments]    ${test_data}
        wait until element is visible    ${ID-UMS-UNDERWRITING}
        mouse over    ${ID-UMS-UNDERWRITING}
        wait until element is visible    ${ID-UMS-Endorsements}
        click element    ${ID-UMS-Endorsements}
        wait until element is visible    ${ID-UMS-Add-Endorsement}    timeout=10s
        click element    ${ID-UMS-Add-Endorsement}
        Search with Endorsement title   ${test_data}

Search with Endorsement title
        [Arguments]    ${test_data}
        wait until element is visible    ${ID_Title_Field}    timeout=10s
        sleep  2s
        Input Text   ${ID_Title_Field}    ${test_data['Title']}
        wait until element is visible    ${ID-UMS-ADD-ENDORSEMENT-Search}  300
        click element    ${ID-UMS-ADD-ENDORSEMENT-Search}
        sleep  4s
        Run Keyword If    '${test_data['Program']}'=='BUILDERSRISK'  run keywords   wait until element is visible    ${BR_EndorsementRecord}    AND
        ...    click element    ${BR_EndorsementRecord}
        Run Keyword If    '${test_data['Program']}'=='MGMT-LIAB'    run keywords   wait until element is visible    //a[contains(text(),'${test_data['Title']}')]    AND
        ...    click element    //a[contains(text(),'${test_data['Title']}')]
        Run Keyword If    '${test_data['Program']}'=='SAE'    run keywords   wait until element is visible    //a[contains(text(),'${test_data['Name']}')]  20s    AND
        ...    click element    //a[contains(text(),'${test_data['Name']}')]
        Run Keyword If    '${test_data['Program']}' in ['REALESTATE', 'IA']   click element    //a[contains(text(),'${test_data['Name']}')]
        Run Keyword If    '${test_data['Program']}'=='K&R'    run keywords   Sleep  2    //a[contains(text(),'${test_data['Name']}')]    AND
        ...    click element    //a[contains(text(),'${test_data['Name']}')]
        Run Keyword If    '${test_data['Program']}'=='VIMMPROPERTY'    run keywords   Sleep  2    //a[contains(text(),'${test_data['Name']}')]    AND
        ...    click element    //a[contains(text(),'${test_data['Name']}')]
        Run Keyword If    '${test_data['Program']}'=='ML-PRIVATE'    run keywords   wait until element is visible    //a[contains(text(),'${test_data['Title']}')]    AND
    ...    click element    //a[contains(text(),'${test_data['Title']}')]
        wait until element is visible   ${Name_CarryForwardCB}    15
        click element    ${Name_CarryForwardCB}
        wait until element is visible    ${Id_PremiumField}
        Check and enter input   ${Id_PremiumField}    ${test_data['Endorsement Premium']}
        #Log To Console    ${test_data['Freeform Text']}
        IF    '${test_data['Freeform Text']}'!= 'nan'
            ${FreeformText}=    run keyword and return status    page should contain element    ${Id_FreeformText}
            Run Keyword If    '${FreeformText}'=='True'    input text    ${Id_FreeformText}    ${test_data['Freeform Text']}
        END
        wait until element is visible    ${ID-UMS-End-SAVE}
        scroll element into view    ${ID-UMS-End-SAVE}
        click element    ${ID-UMS-End-SAVE}

Adding endrosment for K&R
        [Arguments]    ${testdata}
        wait until element is not visible   globalAjaxLoading  200
        Click Element    ${K&R_Coverage_tab}
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible   ${ApplyChanges-Button}
        click element   ${ApplyChanges-Button}
        wait until element is not visible   globalAjaxLoading  100
        Log To Console    Navigated to Rating base page
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        Log To Console    Navigated to Modifiers page
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        Log To Console    Navigated to Limit&Deductible page
        Add Endorsements
        Wait Until Element Is Visible    ${ID-UMS-Add-Endorsement}    timeout=10s
        click element    ${ID-UMS-Add-Endorsement}
        wait until element is visible    ${ID_Name_Field}    timeout=10s
        input text    ${ID_Name_Field}    ${test_data['Name']}
        wait until element is visible    ${ID-UMS-ADD-ENDORSEMENT-Search}
        click element    ${ID-UMS-ADD-ENDORSEMENT-Search}
        wait until element is visible    ${K&R_EndorsementRecord}
        click element    ${K&R_EndorsementRecord}
        wait until element is visible   ${Name_CarryForwardCB}
        click element    ${Name_CarryForwardCB}
        wait until element is visible    ${Id_PremiumField}  timeout=10s
        clear element text    ${Id_PremiumField}
        input text    ${Id_PremiumField}    ${test_data['Endorsement Premium']}
        wait until element is visible    ${ID-UMS-End-SAVE}
        scroll element into view    ${ID-UMS-End-SAVE}
        click element    ${ID-UMS-End-SAVE}
        wait until element is not visible   globalAjaxLoading  50
        wait until element is enabled    ${ID-UW-UNDERWRITING}  60
        mouse over  ${ID-UW-UNDERWRITING}
        wait until element is not visible   globalAjaxLoading  100
        click element  ${Underwritting_Rating}
        wait until element is not visible   globalAjaxLoading  100
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        Log To Console    Navigated to quote options page
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        Log To Console    Navigated to Endrosment options page
        wait until element is not visible   globalAjaxLoading  100
        Select Checkbox    ${Checkbox-Endrosmentoption}
        click element  ${ID-UMS-CancellationApply&Continue}
        wait until element is visible   ${ApplyChanges-Button}
        click element   ${ApplyChanges-Button}
        wait until element is not visible   globalAjaxLoading  100
        Log To Console    Navigated to Bind Endorsement page

Edit and Delete Endorsement
        [Arguments]    ${test_data}
        wait until element is visible    ${Edit_Endorsement_Link}
        click element    ${Edit_Endorsement_Link}
        wait until element is visible    ${Id_PremiumField}
        clear element text    ${Id_PremiumField}
        input text    ${Id_PremiumField}    ${test_data['Endorsement Premium']}0
        wait until element is visible    ${ID-UMS-End-SAVE}
        log to console    Endorsement Edited Successfully
        scroll element into view    ${ID-UMS-End-SAVE}
        click element    ${ID-UMS-End-SAVE}
        wait until element is visible    ${Delete_Endorsement_Link}
        sleep    1s
        click element    ${Delete_Endorsement_Link}
        log to console    Endorsement Deleted Successfully

Adding Endorsement for REO
        [Arguments]    ${test_data}
        wait until element is visible    ${ID-UMS-UNDERWRITING}
        mouse over    ${ID-UMS-UNDERWRITING}
        wait until element is visible    ${ID-UMS-Endorsements}
        click element    ${ID-UMS-Endorsements}
        wait until element is visible    ${ID-UMS-Add-Endorsement}    timeout=10s
        click element    ${ID-UMS-Add-Endorsement}
        wait until element is visible    ${ID_Title_Field}    timeout=10s
        input text    ${ID_Title_Field}    ${test_data['Title']}
        wait until element is visible    ${ID-UMS-ADD-ENDORSEMENT-Search}
        click element    ${ID-UMS-ADD-ENDORSEMENT-Search}
        wait until element is visible    ${REO_EndorsementRecord}
        click element    ${REO_EndorsementRecord}
        wait until element is visible   ${Name_CarryForwardCB}
        click element    ${Name_CarryForwardCB}
        wait until element is visible    ${Id_PremiumField}
        clear element text    ${Id_PremiumField}
        input text    ${Id_PremiumField}    ${test_data['Endorsement Premium']}
        #${FreeformText}=    run keyword and return status    page should contain element    ${Id_FreeformText}
        #IF    '${FreeformText}'=='True'    input text    ${Id_FreeformText}    ${test_data['Freeform Text']}
        wait until element is visible    ${ID-UMS-SAVE}
        scroll element into view    ${ID-UMS-SAVE}
        click element    ${ID-UMS-SAVE}

Endorsement Bind No Additional Premium for REO
        [Arguments]    ${test_data}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible    ${Link_Bind_Issue}
        mouse over    ${Link_Bind_Issue}
        wait until element is visible    ${Link_Bind}
        click element    ${Link_Bind}
        wait until element is visible    ${Checkbox_NoAdditionalPremium}
        click element    ${Checkbox_NoAdditionalPremium}
        wait until element is visible    ${Checkbox_AllCoverages}
        click element    ${Checkbox_AllCoverages}
        select radio button  Selected  False
        wait until element is visible    ${ID-BE-Apply&Continue}
        scroll element into view    ${ID-BE-Apply&Continue}
        click element    ${ID-BE-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        log to console    Navigated to Endorsements To Attach
        click element    ${ID-BE-Apply&Continue}
        Wait Until Element Is Visible  ${ID-BE-Apply&Continue}  5s
        click element    ${ID-BE-Apply&Continue}
        log to console    Navigated to Payments
        Click Element    ${Button_AddReceivable}
        wait until element is not visible   globalAjaxLoading  100
        Wait Until Element Is Visible  ${Field_Amount}  10s
        Check and enter input    ${Field_Amount}    ${test_data['Endorsement Premium']}
        Click Element    ${Button_Add_Receivable2}
        Click Element    ${Button_Save}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible    ${Button_Next}
        click element    ${Button_Next}
        wait until element is not visible   globalAjaxLoading  100
        log to console    Navigated to Post Endorsement
        Wait Until Element Is Visible    ${Button_Submit}
        Get Policy Status for Endrosement   ${test_data}
        Verify Policy Status 1    ${test_data}
        select radio button    Action    Send
        Scroll Element Into View    ${Button_Submit}
        Wait Until Element Is Visible    ${Button_Submit}
        click element    ${Button_Submit}
        Get Policy Status for Endrosement    ${test_data}
        Verify Policy Status 2    ${test_data}

Adding Endorsement for IA
        [Arguments]    ${test_data}
        wait until element is visible    ${ID-UMS-UNDERWRITING}
        mouse over    ${ID-UMS-UNDERWRITING}
        wait until element is visible    ${ID-UMS-Endorsements}
        click element    ${ID-UMS-Endorsements}
        wait until element is visible    ${ID-UMS-Add-Endorsement}    timeout=10s
        click element    ${ID-UMS-Add-Endorsement}
        wait until element is visible    ${ID_Title_Field}    timeout=10s
        input text    ${ID_Title_Field}    ${test_data['Title']}
        wait until element is visible    ${ID-UMS-ADD-ENDORSEMENT-Search}
        click element    ${ID-UMS-ADD-ENDORSEMENT-Search}
        wait until element is visible    ${IA_EndorsementRecord}    timeout=10s
        Sleep    2s
        click element    ${IA_EndorsementRecord}
        wait until element is visible   ${Name_CarryForwardCB}
        click element    ${Name_CarryForwardCB}
        wait until element is visible    ${Id_PremiumField}
        clear element text    ${Id_PremiumField}
        input text    ${Id_PremiumField}    ${test_data['Endorsement Premium']}
        #${FreeformText}=    run keyword and return status    page should contain element    ${Id_FreeformText}
        #IF    '${FreeformText}'=='True'    input text    ${Id_FreeformText}    ${test_data['Freeform Text']}
        wait until element is visible    ${ID-UMS-SAVE}
        scroll element into view    ${ID-UMS-SAVE}
        click element    ${ID-UMS-SAVE}

Complete Cancellation for K&R
        [Arguments]  ${test_data}
        ${cancellation_Date}=  Select a Random Date for K&R
        input text  ${ID-UMS-Cancellation-Date}  ${cancellation_Date}
        check and select from list by label  ${ID-UMS-Cancellation.Method}    ${test_data['Cancellation_Method']}
        check and enter input  ${ID-UMS-Enter_UW_Reason}   ${test_data['Enter_Reasonfor_UW_AllOther']}
        click element  ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  50
        select radio button    Action    Review
        click element  ${ID-UMS-Cancellation-Submit}
        wait until element is not visible   globalAjaxLoading  100
        ${Policy_Status}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
        log to console  ${Policy_Status}
        wait until element is not visible   globalAjaxLoading  100

#K&R

Select a Random Date for K&R
    ${element}=    get text    //td[b[text()='POLICY:']]//following-sibling::td
    ${Substring_element}=    Get Substring Value    ${element}  15  25
    log to console  ${Substring_element}
    ${Final_date}=    Add Number of Days to the Date  ${Substring_element}  50
    #set test variable  ${Final_date}
    RETURN    ${Final_date}

#CE
Click Coverages Button
        wait until element is not visible   globalAjaxLoading  10
        wait until element is visible    ${UMS_Coverages_Button}    15
        mouse over    ${UMS_Coverages_Button}
        click element    ${UMS_Coverages_Button}
        wait until element is not visible   globalAjaxLoading  100

Uncheck TRIA Checkbox
        wait until element is not visible   globalAjaxLoading  100
        ${CB_Status}=    run keyword and return status    checkbox should be selected    ${CE_TRIA_Checkbox}
        Run Keyword If    '${CB_Status}'=='True'    unselect checkbox    ${CE_TRIA_Checkbox}

Apply Changes Button Confirmation
        wait until element is not visible   globalAjaxLoading  100
        ${Status_ApplyChanges}=    run keyword and return status    page should contain element    ${ID-DE-ApplyChanges}
        Run Keyword If    '${Status_ApplyChanges}'=='True'    run keywords   scroll element into view  ${ID-DE-ApplyChanges}  AND
        ...  click element   ${ID-DE-ApplyChanges}

Care Condition of Equipmemt CE
        [Arguments]    ${test_data}
        log to console    Reached UMS Modifiers page
        wait until element is not visible   globalAjaxLoading  100
        Check and enter input    ${CE_CareConditionEquipment}    ${test_data['Care Condition of Equipment']}

Cooperation of Owners CE
        [Arguments]    ${test_data}
        wait until element is not visible   globalAjaxLoading  100
        Check and enter input    ${CE_CooperationOfOwners}    ${test_data['Cooperation of Owners']}

Check All Checkbox Quote Options
        log to console    Reached UMS Quote options page
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible    ${QuoteOptionsCheckAll_Checkbox}
        select checkbox    ${QuoteOptionsCheckAll_Checkbox}

Check All Checkbox Endorsement Options
        log to console    Reached UMS Endorsement options page
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible    ${QuoteOptionsCheckAll_Checkbox}
        Scroll Element Into View     ${QuoteOptionsCheckAll_Checkbox}
        sleep  1.2s
        select checkbox    ${QuoteOptionsCheckAll_Checkbox}

Verify Ready for Sending
        ${ReadyforSending_Text}=    run keyword and return status    page should contain    Ready for sending
        Run Keyword If    '${ReadyforSending_Text}'=='True'    log to console    Ready for sending text verified
        ...    ELSE    log to console    Ready for sending text not appeared in the page

Check TRIA Checkbox
        wait until element is not visible   globalAjaxLoading  100
        ${CB_Status}=    run keyword and return status    checkbox should be selected    ${CE_TRIA_Checkbox}
        Run Keyword If   '${CB_Status}'=='False'    select checkbox    ${CE_TRIA_Checkbox}

Check EQ Checkbox
        wait until element is not visible   globalAjaxLoading  100
        ${CB_Status}=    run keyword and return status    checkbox should be selected    ${CE_EQCoverage}
        Run Keyword If    '${CB_Status}'=='False'    select checkbox    ${CE_EQCoverage}


Change Status Pending to Quote for Email failed not to send
        wait until element is visible  ${ID-UMS-Quote-letter}  18s
        Click Element    ${ID-Click-Quote-Letter}
        Scroll Element Into View    ${Letter_mailCopy}
        Input Text    ${Letter_mailCopy}    GenerateError1@fail.com
        Scroll Element Into View    ${ID-UMS-Submit}
        Wait Until Element is visible    ${ID-UMS-Submit}     timeout=5s
        Set Focus To Element    ${ID-UMS-Submit}
        click element  ${ID-UMS-Submit}

Change Status Pending to Quote for Email failed not to send for Builders Risk
        wait until element is visible  ${Letter_mailCopy}  18s
        Scroll Element Into View    //*[@id="LetterModel_MailCopy"]
        Input Text    ${Letter_mailCopy}    GenerateError1@fail.com
        Scroll Element Into View    ${ID-UMS-Submit}
        Wait Until Element is visible    ${ID-UMS-Submit}     timeout=5s
        Set Focus To Element    ${ID-UMS-Submit}
        click element  ${ID-UMS-Submit}
	
Click Journal Tab
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Text_JournalTab}
    mouse over    ${Text_JournalTab}
    click element    ${Text_JournalTab}

Create New Journal
    [Arguments]    ${test_data}
    Click Journal Tab
    wait until element is visible    ${Link_CreateNewJournal}
    click element    ${Link_CreateNewJournal}
    wait until element is visible    ${Dropdown_JournalType}
    Check and select from list by label    ${Dropdown_JournalType}    ${test_data['Journal Type']}
    Check and enter input   ${ID_JournalDescription}    ${test_data['Journal Description']}
    Check and enter input    ${ID_JournalDetails}    ${test_data['Journal Details']}
    wait until element is visible    ${Button_JournalCreate}
    scroll element into view    ${Button_JournalCreate}
    click element    ${Button_JournalCreate}
    wait until element is not visible   globalAjaxLoading  100

Add limit & Deductibles
        [Arguments]    ${testdata}
        wait until element is not visible   globalAjaxLoading  200
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Click Element    ${SAE_Limit/deductibles_tab}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Clear Element Text    ${SAE_limit2}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Clear Element Text    ${SAE_Agg_limit2}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Clear Element Text    ${SAE_Deductibles_limit2}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Clear Element Text    ${SAE_limit3}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Clear Element Text    ${SAE_Agg_limit3}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Clear Element Text    ${SAE_Deductibles_limit3}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Check and enter input    ${SAE_limit3}    ${testdata['limit3_Value3']}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Check and enter input    ${SAE_Agg_limit3}    ${testdata['Agg_limit3']}
        Run Keyword If  '${test_data['Division']}'!='INDAPPR'   Check and enter input    ${SAE_Deductibles_limit3}     ${testdata['Deductibles_limit3']}
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible   ${ApplyChanges-Button}
        click element   ${ApplyChanges-Button}

Endorsement Bind Non Premium ERP
    [Arguments]    ${test_data}
    Wait Until Element Is Not Visible    globalAjaxLoading  100
    wait until element is visible    ${Link_Bind_Issue}
    mouse over    ${Link_Bind_Issue}
    wait until element is visible    ${Link_Bind}
    click element    ${Link_Bind}
    wait until element is visible    ${Checkbox_NoAdditionalPremium}
    click element    ${Checkbox_NoAdditionalPremium}
    wait until element is visible    ${Checkbox_AllCoverages}
    click element    ${Checkbox_AllCoverages}
    wait until element is visible    ${Checkbox_E&O}
    click element    ${Checkbox_E&O}
    wait until element is visible    ${Checkbox_Don't_Pro_Rate}
    click element    ${Checkbox_Don't_Pro_Rate}
    wait until element is visible    ${Checkbox_ERP2}
    click element    ${Checkbox_ERP2}
    wait until element is visible   ${Checkbox_ERP_Don't_Pro_Rate}
    click element   ${Checkbox_ERP_Don't_Pro_Rate}
    Run Keyword If  '${test_data['Division']}'=='INDAPPR'   click element   ${Checkbox_ERP2_IA}
    Run Keyword If  '${test_data['Division']}'=='INDAPPR'   click element   ${Checkbox_ERP2_Don't_Pro_Rate_IA}
    select radio button  Selected  False
    wait until element is visible    ${ID-BE-Apply&Continue}
    scroll element into view    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Endorsements To Attach
    click element    ${ID-BE-Apply&Continue}
    Wait Until Element Is Visible    ${ID-BE-Apply&Continue}  10s
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Payments
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Wait Until Element Is Visible    ${Button_Submit}
    Get Policy Status for Endrosement ERP   ${test_data}
    Verify Policy Status 1    ${test_data}
    select radio button    Action    Send
    Scroll Element Into View    ${Button_Submit}
    Wait Until Element Is Visible    ${Button_Submit}
    click element    ${Button_Submit}
    Get Policy Status for Endrosement ERP    ${test_data}
    Verify Policy Status 2    ${test_data}

Add limit & Deductibles for Unlimited ERP
        [Arguments]    ${testdata}
        wait until element is not visible   globalAjaxLoading  200
        Click Element    ${SAE_Limit/deductibles_tab}
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible   ${ApplyChanges-Button}
        click element   ${ApplyChanges-Button}

Endorsement Bind Non Premium for Unlimited ERP
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Link_Bind_Issue}
    mouse over    ${Link_Bind_Issue}
    wait until element is visible    ${Link_Bind}
    click element    ${Link_Bind}
    wait until element is visible    ${Checkbox_NoAdditionalPremium}
    click element    ${Checkbox_NoAdditionalPremium}
    wait until element is visible    ${Checkbox_AllCoverages}
    click element    ${Checkbox_AllCoverages}
    wait until element is visible    ${Checkbox_E&O}
    click element    ${Checkbox_E&O}
    wait until element is visible    ${Checkbox_Don't_Pro_Rate}
    click element    ${Checkbox_Don't_Pro_Rate}
    wait until element is visible    ${Checkbox_Unlimited}
    click element    ${Checkbox_Unlimited}
    wait until element is visible   ${Checkbox_ERP_Unlimited_Don't_Pro_Rate}
    click element   ${Checkbox_ERP_Unlimited_Don't_Pro_Rate}
    Run Keyword If  '${test_data['Division']}'=='INDAPPR'   click element   ${Checkbox_ERP3_IA}
    Run Keyword If  '${test_data['Division']}'=='INDAPPR'   click element   ${Checkbox_ERP3_Don't_Pro_Rate_IA}
    select radio button  Selected  False
    wait until element is visible    ${ID-BE-Apply&Continue}
    scroll element into view    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Endorsements To Attach
    click element    ${ID-BE-Apply&Continue}
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}  10s
    Click Element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Payments
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Button_Next}
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Wait Until Element Is Visible    ${Button_Submit}
    Get Policy Status for Endrosement ERP   ${test_data}
    Verify Policy Status 1    ${test_data}
    Sleep    2
    Select Radio Button        Action    Send
    Scroll Element Into View    ${Button_Submit}
    Wait Until Element Is Visible    ${Button_Submit}
    click element    ${Button_Submit}
    Get Policy Status for Endrosement ERP    ${test_data}
    Verify Policy Status 2    ${test_data}

Endorsement Bind Non Premium for REO with ERP for Extended Reporting Period
    [Arguments]    ${test_data}
    Set Selenium Speed    0.2s
    wait until element is visible    ${Link_Bind_Issue}
    mouse over    ${Link_Bind_Issue}
    wait until element is visible    ${Link_Bind}
    click element    ${Link_Bind}
    wait until element is visible    ${Checkbox_NoAdditionalPremium}
    click element    ${Checkbox_NoAdditionalPremium}
    wait until element is visible    ${Checkbox_AllCoverages}
    click element    ${Checkbox_AllCoverages}
    wait until element is visible    ${Checkbox_E&O}
    click element    ${Checkbox_E&O}
    wait until element is visible    ${Checkbox_Don't_Pro_Rate}
    click element    ${Checkbox_Don't_Pro_Rate}
    select radio button  Selected  False
    wait until element is visible    ${ID-BE-Apply&Continue}
    scroll element into view    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Endorsements To Attach
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Payments
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Wait Until Element Is Visible    ${Button_Submit}
    Get Policy Status for Endrosement   ${test_data}
    Verify Policy Status 1    ${test_data}
    select radio button    Action    Send
    Scroll Element Into View    ${Button_Submit}
    Wait Until Element Is Visible    ${Button_Submit}
    click element    ${Button_Submit}
    Get Policy Status for Endrosement    ${test_data}
    Verify Policy Status 2    ${test_data}

Add limit & Deductibles for SAE
        [Arguments]    ${testdata}
        wait until element is visible  ${SAE_Limit/deductibles_tab}
        Click Element    ${SAE_Limit/deductibles_tab}
        Clear Element Text    ${SAE_limit0}
        Clear Element Text    ${SAE_Agg_limit0}
        Clear Element Text    ${SAE_Deductibles_limit0}
        Clear Element Text    ${SAE_limit1}
        Clear Element Text    ${SAE_Agg_limit1}
        Clear Element Text    ${SAE_Deductibles_limit1}
        Clear Element Text    ${SAE_limit2}
        Clear Element Text    ${SAE_Agg_limit2}
        Clear Element Text    ${SAE_Deductibles_limit2}
        Clear Element Text    ${SAE_limit3}
        Clear Element Text    ${SAE_Agg_limit3}
        Clear Element Text    ${SAE_Deductibles_limit3}
        Check and enter input    ${SAE_limit0}    ${testdata['limit0_Value0']}
        Check and enter input    ${SAE_Agg_limit0}    ${testdata['Agg_limit0']}
        Check and enter input    ${SAE_Deductibles_limit0}     ${testdata['Deductibles_limit0']}
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        wait until element is visible   ${ApplyChanges-Button}
        click element   ${ApplyChanges-Button}
        wait until element is not visible   globalAjaxLoading  100
        click element   ${ID-UMS-CancellationApply&Continue}
        wait until element is not visible   globalAjaxLoading  100