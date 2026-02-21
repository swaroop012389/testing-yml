*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${ML_FI_FY}=    (//input[@role='combobox'])[1]
${ML_FI_Prior}=    (//input[@role='combobox'])[2]
${ML_FI_FY_Tot_Rev}=    //input[@name='RecentFiscalYearTotalRevenue']
${ML_FI_FY_Tot_Asset}=    //input[@name='RecentFiscalYearTotalAssets']
${ML_FI_FY_Tot_liabilities}=    //input[@name='RecentFiscalYearTotalLiabilities']
${ML_Prior_FY_Tot_Rev}=    //input[@name='RriorFiscalYearTotalRevenue']
${ML_Prior_FY_Tot_Asset}=   //input[@name='PriorFiscalYearTotalAssets']
${ML_Prior_FY_Tot_liabilities}=  //input[@name='PriorFiscalYearTotalLiabilities']


${ML_FI_RecentFiscalYearTotalRevenueMandatory}=    id=RecentFiscalYearTotalRevenueMandatory
${ML_FI_RecentFiscalYearTotalAssets}=    id=RecentFiscalYearTotalAssets
${ML_FI_continue}=    //input[@id='continueButton']
@{Non-profit}=    Charities
${ID-PF-FY}=    //select[@id='PriorFiscalYear']



#Private
${ML_FI_Total_Asset}=  //input[@name='RecentFiscalYearTotalAssets']
${ML_FI_Total_liabilities}=  //input[@name='RecentFiscalYearTotalLiabilities']
${ML_FI_Total_Revenue}=  //input[@name='RecentFiscalYearTotalRevenue']
${ML_FI_NetIncome}=  //input[@name='RecentNetIncome']
${ML_FI_Cashflow}=  //input[@name='RecentCashFlow']
${ML_FI_publicSecurities}=   (//input[@type='checkbox'])[1]
${ML_FI_mergerAcquisitionDivestiture}=  (//input[@type='checkbox'])[2]
${ML_FI_placementOfSecurities}=  (//input[@type='checkbox'])[3]
${ML_FI_closingsConsolidationsLayoffs}=  (//input[@type='checkbox'])[4]
${ML_FI_violationOfDebtCovenants}=  (//input[@type='checkbox'])[5]
${ML_FI_arrangementWithEditors}=  (//input[@type='checkbox'])[6]

*** Keywords ***
DNO Financial Information
        [Arguments]    &{test_data}
        run keyword if  '${test_data['Most_recent_FY']}' != 'nan'  Select Value from Dropdown   ${ML_FI_FY}   ${test_data['Most_recent_FY']}
        run keyword if  '${test_data['FY_Total_Revenue']}' != 'nan'  Input Text   ${ML_FI_FY_Tot_Rev}   ${test_data['FY_Total_Revenue']}
        run keyword if  '${test_data['FY_Total_Assets']}' != 'nan'   Input text   ${ML_FI_FY_Tot_Asset}   ${test_data['FY_Total_Assets']}
        run keyword if  '${test_data['FY_Total_Liabilities']}' != 'nan'   Input text    ${ML_FI_FY_Tot_liabilities}   ${test_data['FY_Total_Liabilities']}
        run keyword if  '${test_data['Prior_PFY']}' != 'nan'      Select Value from Dropdown   ${ML_FI_Prior}   ${test_data['Prior_PFY']}
        run keyword if  '${test_data['PFY_Total_Revenue']}' != 'nan'   Input text    ${ML_Prior_FY_Tot_Rev}      ${test_data['PFY_Total_Revenue']}
        run keyword if  '${test_data['PFY_Total_Assets']}' != 'nan'    Input text     ${ML_Prior_FY_Tot_Asset}   ${test_data['PFY_Total_Assets']}
        run keyword if  '${test_data['PFY_Total_Liabilities']}' != 'nan'    Input text     ${ML_Prior_FY_Tot_liabilities}    ${test_data['PFY_Total_Liabilities']}
        Execute Javascript    window.scrollTo(0, 400)
        ${Broker_Terms_Checkbox}=  Run Keyword And Return Status   Page Should Contain Element     //input[@type='checkbox']
        Run Keyword If   ${Broker_Terms_Checkbox}  Click Element  //input[@type='checkbox']
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        sleep  16s


Total Revenue
        [Arguments]    &{test_data}
        ${Total-revenue}=  run keyword and return status    element should be visible    ${ML_FI_FY_Tot_Rev}
        run keyword if    ${Total-revenue}    Input text    ${ML_FI_FY_Tot_Rev}    ${test_data['FY_Total_Revenue']}    ELSE    Input text    ${ML_FI_RecentFiscalYearTotalRevenueMandatory}    ${test_data['FY_Total_Revenue']}
        ${Total-Assets}=  run keyword and return status    element should be visible    ${ML_FI_FY_Tot_Asset}
        run keyword if    ${Total-Assets}    Input text    ${ML_FI_FY_Tot_Asset}    ${test_data['FY_Total_Assets']}    ELSE    Input text    ${ML_FI_RecentFiscalYearTotalAssets}   ${test_data['FY_Total_Assets']}
        Check and select from list by label    ${ID-PF-FY}    ${test_data['Prior_PFY']}
        Input text    ${ML_Prior_FY_Tot_Rev}    ${test_data['PFY_Total_Revenue']}
        Input text    ${ML_Prior_FY_Tot_Asset}    ${test_data['PFY_Total_Assets']}
        Input text    ${ML_Prior_FY_Tot_liabilities}    ${test_data['PFY_Total_Liabilities']}

ML Private Financial Information
    [Arguments]    &{test_data}
    Execute Javascript  window.scrollTo(0, 0)
    Wait Until Page Contains Element        //input[@name='RecentFiscalYear']    60s
    Select Value from Dropdown   ${ML_FI_FY}    ${test_data['Most Recent 12 months']}
    Input text  ${ML_FI_Total_Asset}  ${test_data['Total Assets']}
    Input text  ${ML_FI_Total_liabilities}  ${test_data['Total Liabilities']}
    Input text  ${ML_FI_Total_Revenue}  ${test_data['Revenue']}
    Input text  ${ML_FI_NetIncome}  ${test_data['Net Income/Loss']}
    input text  ${ML_FI_Cashflow}  ${test_data['Net Income/Loss']}
    Execute Javascript  window.scrollTo(0, 150)
    IF  '${test_data['Within the last 24 months, or during the next 12 months']}' == 'NO'
         click element     //input[@name='ApplicantAnticipate' and @value='${test_data['Within the last 24 months, or during the next 12 months']}']
    ELSE
         Select Applicant Anticipate  &{test_data}
    END
    click element    //input[@name='AuditorConcern' and @value='${test_data['Auditor issued a going concern within the last three (3) years?']}']
    click element    //input[@name='CoverageContemplated' and @value='${test_data['any subsiduaries or other entities that are not contemplated']}']
    Continue Click RE

Select Applicant Anticipate
    [Arguments]  &{test_data}
    click element    //input[@name='ApplicantAnticipate' and @value='${test_data['Within the last 24 months, or during the next 12 months']}']
    wait until element is not visible   globalAjaxLoading  30
    sleep  4s
    Execute Javascript  window.scrollTo(0, 500)
    Scroll Element Into View    ${ML_FI_publicSecurities}
    Sleep    1s
    Run Keyword If   '${test_data['Any public securities offerings anticipated']}' == 'YES'  Click element   ${ML_FI_publicSecurities}
    Run Keyword If   '${test_data['Any actual or anticipated merger, acquisition or divestiture?']}' == 'YES'  Click element   ${ML_FI_mergerAcquisitionDivestiture}
    Run Keyword If   '${test_data['Any private placement of securities?']}' == 'YES'  Click element   ${ML_FI_placementOfSecurities}
    Run Keyword If   '${test_data['Any closings, consolidations or layoffs?']}' == 'YES'  Click element   ${ML_FI_closingsConsolidationsLayoffs}
    Run Keyword If   '${test_data['Any violation of debt covenants?']}' == 'YES'  Click element   ${ML_FI_violationOfDebtCovenants}
    Run Keyword If   '${test_data['Any reorganisation or arrangement']}' == 'YES'  Click element   ${ML_FI_arrangementWithEditors}


