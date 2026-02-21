*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${ML_FL_Employee_Benefits403}=    (//input[@type='checkbox'])[1]
${ML_FL_Employee_Benefits401}=    (//input[@type='checkbox'])[2]
${ML_FL_Health_And_Welfare}=   (//input[@type='checkbox'])[3]
${ML_FL_DefinedBenefit_PensionPlan}=    (//input[@type='checkbox'])[4]
${ML_FL_Other}=   (//input[@type='checkbox'])[5]
${ML_FL_None}=   (//input[@type='checkbox'])[6]
${MLP_FL_401(k)/Defined Contribution Plan}=   (//input[@type='checkbox'])[1]
${MLP_FL_Defined Benefit/Pension Plan}=    (//input[@type='checkbox'])[2]
${MLP_FL_Health_And_Welfare}=   (//input[@type='checkbox'])[3]
${MLP_FL_ESOP}=    (//input[@type='checkbox'])[4]
${MLP_FL_Other}=   (//input[@type='checkbox'])[5]
${ML_FL_PlanAssets_Income}=    //input[@name='PlanAssetsIncome']

*** Keywords ***
DNO Fiduciary Liability
        [Arguments]    &{test_data}
        IF     '${test_data['Program']}' != 'ML-PRIVATE'
                run keyword if    '${test_data['Employee Benefits 403(B)_Check']}' == 'YES'   Click element   ${ML_FL_Employee_Benefits403}
                run keyword if    '${test_data['Employee Benefits 401(K)_Check']}' == 'YES'    click element    ${ML_FL_Employee_Benefits401}
                run keyword if    '${test_data['Employee Benefits - Health and Welfare_Check']}' == 'YES'    click element    ${ML_FL_Health_And_Welfare}
                run keyword if    '${test_data['Employee Benefits - Defined benefit pension plan_Check']}' == 'YES'    click element    ${ML_FL_DefinedBenefit_PensionPlan}
                run keyword if    '${test_data['Employee Benefits - Other_Check']}' == 'YES'    click element    ${ML_FL_Other}
                run keyword if    '${test_data['Employee Benefits - None_Check']}' == 'YES'    click element    ${ML_FL_None}
                IF   '${test_data['Employee Benefits - Defined benefit pension plan_Check']}' == 'YES'
                    click element  //input[@name='MultiEmployerPlan' and @value='${test_data['Are there any multi-employer plans?']}']
                    click element  //input[@name='Plan90PctFunded' and @value='${test_data['Is the plan at least 90% funded?']}']
                END
                run keyword if    '${test_data['Employee Benefits - Other_Check']}' == 'YES'   click element  //input[@name='MultiEmployerPlan' and @value='${test_data['Are there any multi-employer plans?']}']
                input text  ${ML_FL_PlanAssets_Income}  ${test_data['Plan Assets']}
        ELSE
                Execute Javascript    window.scrollTo(0, 0)
                wait until page contains  401(k)/Defined Contribution Plan     20s
                run keyword if  '${test_data['Employee Benefits 401(K)_Check']}' == 'YES'   click element    ${MLP_FL_401(k)/Defined Contribution Plan}
                run keyword if  '${test_data['Employee Benefits - Defined benefit pension plan_Check']}' == 'YES'   click element    ${MLP_FL_Defined Benefit/Pension Plan}
                run keyword if  '${test_data['Employee Benefits - None_Check']}' == 'YES'   click element    ${MLP_FL_Health_And_Welfare}
                run keyword if  '${test_data['Employee Benefits - Health and Welfare_Check']}' == 'YES'   click element    ${MLP_FL_ESOP}
                run keyword if  '${test_data['Employee Benefits - Other_Check']}' == 'YES'   click element    ${MLP_FL_Other}
                Input text    ${ML_FL_PlanAssets_Income}  ${test_data['Total Plan Assets']}
                Other Fiduciary questions  &{test_data}
        END
        Continue Click RE
        Sleep  2s

NFP Plan Asset
    [Arguments]    &{test_data}
    ${$25 million}=  run keyword and return status    element should be visible    PlanAssetsless100M
    run keyword if    ${$25 million}    select radio button    PlanAssetsless100M    ${test_data["Are the plan assets less than $25 million and administered by a professional asset manager?"]}
    ${$25 millionprofessional}=  run keyword and return status    element should be visible    ${ML_FL_PlanAssets_Income}
    run keyword if    ${$25 millionprofessional}    Input text    ${ML_FL_PlanAssets_Income}    ${test_data['Plan Assets']}

Other Fiduciary questions
    [Arguments]  &{test_data}
    click element   //input[@name='PlanReduceBenefits' and @value='${test_data['Been amended to reduce benefits']}']
    click element   //input[@name='MergedTerminated' and @value='${test_data['Merged, terminated or sold']}']
    click element   //input[@name='DOLInvertigation' and @value='${test_data['Subject to an investigation of DOL, 1RS or similar agency']}']
    click element   //input[@name='ProhibitedTransaction' and @value='${test_data['Filed an exemption for a prohibited transaction']}']
    click element   //input[@name='OutstandingContribution' and @value='${test_data['Had outstanding or delinquent contributions']}']
    click element   //input[@name='MultiEmployerPlan' and @value='${test_data['Had outstanding or delinquent contributions']}']
    Run Keyword If    '${test_data['Employee Benefits - Defined benefit pension plan_Check']}' == 'YES'  click element   //input[@name='Plan90PctFunded' and @value='${test_data["Is the plan at least 90% funded?"]}']

Plan Asset
    [Arguments]    &{test_data}
    scroll element into view    PlanAssetsless100M
    wait until page contains element    PlanAssetsless100M    timeout=30s
    Wait Until Element Is Visible   PlanAssetsless100M    timeout=30s
    set focus to element    PlanAssetsless100M
    select radio button    PlanAssetsless100M    ${test_data["Are the plan assets less than $25 million and administered by a professional asset manager?"]}