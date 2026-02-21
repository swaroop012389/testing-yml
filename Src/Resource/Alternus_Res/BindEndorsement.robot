*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource   ../../Resource/Generic.robot
Resource  ../../Resource/TMS_RES/UMS_PAGE.robot
Resource   ../../Resource/UMS.robot


*** Variables ***
${NAME-BE-IsIssueReissueCorrection}=    name=IsIssueReissueCorrection
${NAME-BE-AllRisk}=    //input[@coverageid='473']
${NAME-BE-Optional}=    //input[@coverageid='455']
${ID-BE-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-BE-Apply&Continue}=  //input[@value='Apply & Continue']
${Link_Bind_Issue}=    //a[text()='BIND/ISSUE']
${Link_Bind}=    //a[text()='Bind']
${Checkbox_NoAdditionalPremium}=    //input[@id='NoAdditionalPremium']
${Checkbox_AllCoverages}=    //td[@class='td1']//input[@type='checkbox']
${Text_Endorsement}=    //b[text()='Endorsement
${Text_PaymentSource}=    //td[text()='Payment Source:']
${Button_Next}=    //input[@value='Next']
${Button_AddReceivable}=    //input[@value='Add Receivable']
${Popup_AddReceivable}=    //center//input[@value='Add Receivable']
${Field_Amount}=    //input[@name='Ammount']
${Button_Save}=    //input[@value='Save']
${Button_Submit}=    //input[@id='Submit']
${Generated_Document_Name}=    (//tr/td[contains(text(),'Letter')])[2]
${Generated_Document_Name_ERP}=    (//tr/td[contains(text(),'ERP')])
${Premium_Endorsement_Text}=    //td[contains(text(),'Premium-Endorsement')]
${Link_PolicyInfo}=    //a[contains(@href,'/ViewPolicyInfo')]
${Text_ExpirationDatePolicyInfo}=    id=OrganizationInfoModel_ExpirationDateString
${Text_TopExpDate}=    (//a[@href='#'])[1]
#Private
${Name-SelectedQuoteOptionIds}=  (//input[@name='SelectedQuoteOptionIds'])[last()]
${Name-DontProRatePremiumIds}=  (//input[@name='DontProRatePremiumIds'])[last()]


*** Keywords ***
Bind Endorsement
    [Arguments]    ${testdata}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100
    ${Bind-Endorsement}=    run keyword and return status  element should be visible    ${NAME-BE-IsIssueReissueCorrection}
    run keyword if   ${Bind-Endorsement}    log to console   Navigated to Bind-Endorsement Tab
    Run Keyword If    '${test_data['Program']}'=='Alternus'   Alternus Endorsement
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

Alternus Endorsement
    wait until element is not visible   globalAjaxLoading  100
    run keyword if  '${test_data['New/Renewal Issuance Correction']}' == 'YES'  select checkbox  ${NAME-BE-IsIssueReissueCorrection}
    wait until element is not visible   globalAjaxLoading  150
    ${BE_ALLRISK-Header}=  run keyword and return status    element should be visible    ${NAME-BE-AllRisk}
    run keyword if  ${BE_ALLRISK-Header}  select checkbox  ${NAME-BE-AllRisk}
    wait until element is not visible   globalAjaxLoading  150
    ${Optional-Header}=  run keyword and return status    element should be visible    ${NAME-BE-Optional}
    run keyword if  ${Optional-Header}  select checkbox  ${NAME-BE-Optional}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100

UMS Bind Tab Navigation
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Link_Bind_Issue}
    mouse over    ${Link_Bind_Issue}
    wait until element is visible    ${Link_Bind}
    click element    ${Link_Bind}

Selecting No Additional Premium Checkbox
    wait until element is visible    ${Checkbox_NoAdditionalPremium}
    click element    ${Checkbox_NoAdditionalPremium}

Endorsement Bind No Additional Premium
    [Arguments]    ${test_data}
    UMS Bind Tab Navigation
    Selecting No Additional Premium Checkbox
    wait until element is visible    ${Checkbox_AllCoverages}
    click element    ${Checkbox_AllCoverages}
    run keyword if   '${test_data['TestCaseNumber']}'=='TC_RE_012'  Select Coverage For ERP Endorsement Added
    run keyword if   '${test_data['TestCaseNumber']}'=='TC_RE_013'  Select Coverage For ERP Endorsement Added
    wait until element is visible    ${ID-BE-Apply&Continue}
    scroll element into view    ${ID-BE-Apply&Continue}
    select radio button    Selected    False
    Verify Added Endorsement Title in the List    ${test_data}
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}
    Scroll Element Into View    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Endorsements To Attach
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Add_Receivable_Option}=    run keyword and return status    element should be visible    ${Button_AddReceivable}
    run keyword if    ${Add_Receivable_Option}    Add Receivable    ${test_data}
    log to console    Navigated to Payments
    run keyword if    "${test_data['Type Of Endorsement']}"=="Premium-Endorsement"    Verify Endorsement Description on Payments Page  ${test_data}
    wait until element is visible    ${Button_Next}  10s
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Select Endorsement Radio Button    ${test_data}
    Sleep    5s

Private Bind Endorsement
    [Arguments]    ${test_data}
    Run Keyword If    '${test_data['Endorsement Type']}'!='RUNOFF'   UMS Bind Tab Navigation
    Scroll Element Into View    ${ID-BE-Apply&Continue}
    IF    '${test_data['Endorsement Type']}' in ['ERP','RUNOFF']
           Private ERP Endorsement
    END
    Selecting No Additional Premium Checkbox
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}
    IF    '${test_data['Endorsement Type']}' not in ['ERP','RUNOFF']
        Verify Added Endorsement Title in the List    ${test_data}
    END
    select radio button    Selected    False
    Wait Until Element Is Visible  ${ID-BE-Apply&Continue}
    Scroll Element Into View    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    log to console    Navigated to Endorsements To Attach
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Add_Receivable_Option}=    run keyword and return status    element should be visible    ${Button_AddReceivable}
    run keyword if    ${Add_Receivable_Option}    Add Receivable    ${test_data}
    log to console    Navigated to Payments
    run keyword if    "${test_data['Type Of Endorsement']}"=="Premium-Endorsement"    Verify Endorsement Description on Payments Page  ${test_data}
    wait until element is visible    ${Button_Next}  10s
    Scroll Element Into View  ${Button_Next}
    click element    ${Button_Next}
    wait until element is not visible   globalAjaxLoading  100
    log to console    Navigated to Post Endorsement
    Select Endorsement Radio Button    ${test_data}
    Sleep    5s
    Get Policy Status    ${test_data}
    #Verify Policy Status 1    ${test_data}

Private ERP Endorsement
    Add Endorse
    Search with Endorsement title  ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is enabled  ${Name-SelectedQuoteOptionIds}
    wait until element is visible    ${Name-SelectedQuoteOptionIds}
    click element    ${Name-SelectedQuoteOptionIds}
    click element   ${Name-DontProRatePremiumIds}
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)

RE Bind Endorsement
    wait until element is visible    ${Checkbox_AllCoverages}
    click element    ${Checkbox_AllCoverages}
   # run keyword if   '${test_data['TestCaseNumber']}'=='TC_RE_012'  Select Coverage For ERP Endorsement Added
   # run keyword if   '${test_data['TestCaseNumber']}'=='TC_RE_013'  Select Coverage For ERP Endorsement Added

Select Coverage For ERP Endorsement Added
    Click Element    (//input[@coverageid='456'])[1]
    Scroll Element Into View  (//input[@coverageid='470'])
    Click Element    (//input[@coverageid='470'])
#    Click Element    (//input[@id='CheckboxProRateCalculation_8627548'])
    Select Checkbox    (//input[@name='DontProRatePremiumIds'])[8]

Select Endorsement Radio Button
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Button_Submit}
    select radio button    Action    ${test_data['Post Endorsement Value']}
    wait until element is visible    ${Button_Submit}
    click element    ${Button_Submit}
    #Get Policy Status    ${test_data}
    #Verify Policy Status 1    ${test_data}

Add Receivable
    [Arguments]    ${test_data}
    wait until element is visible    ${Button_AddReceivable}
    click element    ${Button_AddReceivable}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${Field_Amount}    ${test_data['Endorsement Premium']}
    click element    ${Popup_AddReceivable}
    wait until element is not visible   globalAjaxLoading  10
    click element    ${Button_Save}
    wait until element is not visible   globalAjaxLoading  100

Verify Added Endorsement Title in the List
    [Arguments]    ${test_data}
    IF    '${test_data['Program']}' in ['REALESTATE','MGMT-LIAB','ML-PRIVATE']
            wait until element is visible    (//td[contains(text(),'${test_data['Title']}')])
            Wait Until Element Is Visible    (//td[contains(text(),'${test_data['Name']}')])
            ${Endorsement_Title_Name}=    get text  (//td[contains(text(),'${test_data['Title']}')])
            ${Endorsement_Title_Name_1}=    get text  (//td[contains(text(),'${test_data['Name']}')])
            run keyword if    "${Endorsement_Title_Name}"=="${test_data['Title']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
            run keyword if    "${Endorsement_Title_Name_1}"=="${test_data['Name']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
            ...    ELSE    run keywords    log to console    Added Endorsement title is not matching    AND    close browser
    ELSE IF    '${test_data['Program']}' == 'BUILDERSRISK'
            wait until element is visible    (//td[contains(text(),'${test_data['Title']}')])[2]
            ${Endorsement_Title_Name}=    get text  (//td[contains(text(),'${test_data['Title']}')])[2]
            run keyword if    "${Endorsement_Title_Name}"=="${test_data['Title']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
            ...    ELSE    run keywords    log to console    Added Endorsement title is not matching    AND    close browser
    ELSE IF    '${test_data['Program']}' == 'SAE'
            wait until element is visible    //td[contains(text(),'${test_data['Title']}')]
            ${Endorsement_Title_Name}=    get text  //td[contains(text(),'${test_data['Title']}')]
            run keyword if    "${Endorsement_Title_Name}"=="${test_data['Title']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
            ...    ELSE    run keywords    log to console    Added Endorsement title is not matching    AND    close browser
    ELSE IF   '${test_data['Program']}' == 'K&R'
                IF  '${test_data['Name']}' == 'General Endorsement'
                    IF    ${test_data['Endorsement Premium']} == 0
                              wait until element is visible    (//td[contains(text(),'${test_data['Title']}')])[4]
                              Wait Until Element Is Visible    (//td[contains(text(),'${test_data['Name']}')])[3]
                              ${Endorsement_Title_Name}=    get text  (//td[contains(text(),'${test_data['Title']}')])[4]
                              ${Endorsement_Title_Name_2}=    get text  (//td[contains(text(),'${test_data['Name']}')])[3]
                    ELSE
                              wait until element is visible    (//td[contains(text(),'${test_data['Title']}')])[1]
                              Wait Until Element Is Visible    (//td[contains(text(),'${test_data['Name']}')])[2]
                              ${Endorsement_Title_Name}=    get text  (//td[contains(text(),'${test_data['Title']}')])[1]
                              ${Endorsement_Title_Name_2}=    get text  (//td[contains(text(),'${test_data['Name']}')])[2]
                    END
                run keyword if    "${Endorsement_Title_Name}"=="${test_data['Title']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
                run keyword if    "${Endorsement_Title_Name_2}"=="${test_data['Name']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
                ...    ELSE    run keywords    log to console    Added Endorsement title is not matching    AND    close browser
                ELSE
                wait until element is visible    (//td[contains(text(),'${test_data['Title']}')])
                Wait Until Element Is Visible    (//td[contains(text(),'${test_data['Name']}')])
                ${Endorsement_Title_Name}=    get text  (//td[contains(text(),'${test_data['Title']}')])
                ${Endorsement_Title_Name_2}=    get text  (//td[contains(text(),'${test_data['Name']}')])
                run keyword if    "${Endorsement_Title_Name}"=="${test_data['Title']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
                run keyword if    "${Endorsement_Title_Name_2}"=="${test_data['Name']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
                ...    ELSE    run keywords    log to console    Added Endorsement title is not matching    AND    close browser
                END
    ELSE
            wait until element is visible    //td[contains(text(),'${test_data['Title']}')]
            ${Endorsement_Title_Name}=    get text  //td[contains(text(),'${test_data['Title']}')]
            run keyword if    "${Endorsement_Title_Name}"=="${test_data['Title']}"    log to console    Added Endorsement is appeared in the list and title matches, verified
            ...    ELSE    run keywords    log to console    Added Endorsement title is not matching    AND    close browser
    END

Verify Endorsement Description on Payments Page
    [Arguments]    ${test_data}
    wait until element is visible    ${Premium_Endorsement_Text}
    ${Endorsement_Desc}=    get text    ${Premium_Endorsement_Text}
    run keyword if    '${test_data['Type Of Endorsement']}'=='${Endorsement_Desc}'    log to console    Endorsement type is Premium-Endorsement matches and verified
    ...    ELSE    run keywords     log to console   Endorsement type description is not matching on paymenta page after adding receivables    AND    close browser

Verify Generated Document Name
    [Arguments]    ${test_data}
    wait until element is visible    ${Generated_Document_Name}    300s
    ${Document_Name}=    get text    ${Generated_Document_Name}
    run keyword if    '${Document_Name}'=='${test_data['Generated Document Name']}'    log to console    Required document is generated matched and verified
    ...    ELSE    run keywords    log to console    Generated document name is not matching with the requirement    AND    close browser

Click Policy Info Tab
    wait until element is visible    ${Link_PolicyInfo}
    mouse over    ${Link_PolicyInfo}
    click element    ${Link_PolicyInfo}
    wait until element is not visible   globalAjaxLoading  100

Extend Coverage Term
    [Arguments]    ${test_data}
    UMS Bind Tab Navigation
    Selecting No Additional Premium Checkbox
    wait until element is visible    ${Checkbox_AllCoverages}
    click element    ${Checkbox_AllCoverages}
    wait until element is visible    ${ID-BE-Apply&Continue}
    scroll element into view    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${ID-BE-Apply&Continue}
    scroll element into view    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    #Click Policy Info Tab
    ${GetPolicyExpDate}=    get value    ${Text_ExpirationDatePolicyInfo}
    ${GetPolicyExpDate}=    Convert Date    ${GetPolicyExpDate}    date_format=%m/%d/%Y
    ${GetPolicyExpDate1} =	Convert Date	${GetPolicyExpDate}    result_format=%Y/%m/%d
    ${GetPolicyExpDate2}=    Add Time To Date    ${GetPolicyExpDate1}    ${test_data['Days To Add']} days    result_format=%m/%d/%Y
    Check and enter input    ${Text_ExpirationDatePolicyInfo}    ${GetPolicyExpDate2}
    wait until element is visible    ${ID-BE-Apply&Continue}
    scroll element into view    ${ID-BE-Apply&Continue}
    click element    ${ID-BE-Apply&Continue}
    ${GetTopExpDate}=    get text    ${Text_TopExpDate}
    ${GetTopExpDate}=    get substring    ${GetTopExpDate}    28
    Run Keyword If    '${GetTopExpDate}'=='${GetPolicyExpDate2}'    log to console    Expiration Date Extended Successfully
    ...    ELSE    log to console    Expiration Date Not Updated so closing the browser
    ${AddReceivableButtonStatus}=    run keyword and return status    page should contain element    ${Button_AddReceivable}
    Run Keyword If    '${AddReceivableButtonStatus}'=='True'    Add Receivable    ${test_data}
    ...    ELSE    log to console    No Add Receivable Button Is Available In The Page
    wait until element is visible    ${Button_Next}
    click element    ${Button_Next}
    Select Endorsement Radio Button    ${test_data}
    Get Policy Status    ${test_data}
    Verify Policy Status 1    ${test_data}

Verify Generated Document Name for ERP
    [Arguments]    ${test_data}
    wait until element is visible    ${Generated_Document_Name_ERP}    300s
    ${Generated_Document_ERP}=    get text    ${Generated_Document_Name_ERP}
    run keyword if    '${Generated_Document_ERP}'=='${test_data['Generated Document Name']}'    log to console    Required document is generated matched and verified
    ...    ELSE    run keywords    log to console    Generated document name is not matching with the requirement    AND    close browser