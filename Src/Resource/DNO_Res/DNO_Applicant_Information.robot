*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library    XML
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${ML_AI_Locationstate}=    (//div/em[text()='Select One'])[1]
${ML_AI_US(Non-Union)Full Time Employees1}=    //input[@name='tableInputs[0].USNonUnionFullTimeEmployees']
${ML_AI_USNonUnionIndependent1}=    //input[@name='tableInputs[0].USNUIndependentContractorsLeasedContractors']
${ML_AI_USNUPartTimeSeasonalTempEmp1}=  //input[@name='tableInputs[0].USNUPartTimeSeasonalTempEmp']
${ML_AI_USVolunteers1}=  //input[@name='tableInputs[0].USVolunteers']
${ML_AI_USUEmpFTimePTimeSeasonal1}=  //input[@name='tableInputs[0].EmptyFieldUSNUPartTimeSeasonalTempEmp']
${ML_AI_AllNonUSEmp1}=    //input[@name='tableInputs[0].AllNonUSEmp']
${ML_AI_Addbutton}=  //button[text()='Add']
${ML_AI_US(Non-Union)Full Time Employees2}=    //input[@id='USNonUnionFullTimeEmployees2']
${ML_AI_USNonUnionIndependent2}=    //input[@id='USNUIndependentContractorsLeasedContractors2']
${ML_AI_USNUPartTimeSeasonalTempEmp2}=  //input[@id='USNUPartTimeSeasonalTempEmp2']
${ML_AI_USVolunteers2}=  //input[@id='USVolunteers2']
${ML_AI_USUEmpFTimePTimeSeasonal2}=  //input[@id='USUEmpFTimePTimeSeasonal2']
${ML_AI_AllNonUSEmp2}=    //input[@id='AllNonUSEmp2']
${ML_AI_US(Non-Union)Full Time Employees3}=    //input[@id='USNonUnionFullTimeEmployees3']
${ML_AI_USNonUnionIndependent3}=    //input[@id='USNUIndependentContractorsLeasedContractors3']
${ML_AI_USNUPartTimeSeasonalTempEmp3}=  //input[@id='USNUPartTimeSeasonalTempEmp3']
${ML_AI_USVolunteers3}=  //input[@id='USVolunteers3']
${ML_AI_USUEmpFTimePTimeSeasonal3}=  //input[@id='USUEmpFTimePTimeSeasonal3']
${ML_AI_AllNonUSEmp3}=    //input[@id='AllNonUSEmp3']
${ML_AI_US(Non-Union)Full Time Employees4}=    //input[@id='USNonUnionFullTimeEmployees4']
${ML_AI_USNonUnionIndependent4}=    //input[@id='USNUIndependentContractorsLeasedContractors4']
${ML_AI_USNUPartTimeSeasonalTempEmp4}=  //input[@id='USNUPartTimeSeasonalTempEmp4']
${ML_AI_USVolunteers4}=  //input[@id='USVolunteers4']
${ML_AI_USUEmpFTimePTimeSeasonal4}=  //input[@id='USUEmpFTimePTimeSeasonal4']
${ML_AI_AllNonUSEmp4}=    //input[@id='AllNonUSEmp4']
${ML_AI_US(Non-Union)Full Time Employees5}=    //input[@id='USNonUnionFullTimeEmployees5']
${ML_AI_USNonUnionIndependent5}=    //input[@id='USNUIndependentContractorsLeasedContractors5']
${ML_AI_USNUPartTimeSeasonalTempEmp5}=  //input[@id='USNUPartTimeSeasonalTempEmp5']
${ML_AI_USVolunteers5}=  //input[@id='USVolunteers5']
${ML_AI_USUEmpFTimePTimeSeasonal5}=  //input[@id='USUEmpFTimePTimeSeasonal5']
${ML_AI_AllNonUSEmp5}=    //input[@id='AllNonUSEmp5']
${ML_AI_USFullTime_OS}=    //input[@id='USNonUnionFullTimeEmployeesClass1']
${ML_AI_USIndContractors_OS}=    //input[@id='USNonUnionIndependentContractorsAndOrLeasedContractorsClass1']
${ML_AI_USPartTime_OS}=    //input[@id='USNonUnionPartTimeEmployeesIncludingSeasonalTemporaryAndVolunteersClass1']
${ML_AI_USVolunteers_OS}=    //input[@id='USVolunteersClass1']
${ML_AI_USUnionEmp_OS}=    //input[@id='USUnionEmployeesFullTimePartTimeSeasonaletcClass1']
${ML_AI_AllNonUSEmpTotal}=    //input[@id='AllNonUSEmployeesTotal']
${ML_AI_NoOfEmpMaking1M}=    //input[@name='NoOfEmployeeMaking1M']
${ML_AI_YearEst}=    //input[@name='YearEstablished']
${ML_AI_Terminatedlastyear}=  //input[@name='InvoluntarilyTerminatedEmployeeCount']
${ML_AI_continue}=    //input[@id='continueButton']
${ML_AI_NumEmployeesFullTime}=    id=NumEmployeesFullTime
${ML_AI_NumEmployeesPartTime}=    id=NumEmployeesPartTime
${ML_AI_NumEmployeesVolunteers}=    id=NumEmployeesVolunteers
${ML_AI_LawyersOnStaff}=    LawyersOnStaff
${ML_AI_USNonUnionFullTimeEmployeesCA}=    id=USNonUnionFullTimeEmployeesCA
${ML_AI_USNonUnionFullTimeEmployeesNJ}=    id=USNonUnionFullTimeEmployeesNJ
${ML_AI_USNonUnionFullTimeEmployeesClass2}=    id=USNonUnionFullTimeEmployeesClass2
${ML_AI_USNonUnionFullTimeEmployeesMI}=    //input[@id='USNonUnionFullTimeEmployeesClass_2']
${ML_AI_LeasedContractorsCA}=    id=USNonUnionIndependentContractorsAndOrLeasedContractorsCA
${ML_AI_LeasedContractorsNJ}=    id=USNonUnionIndependentContractorsAndOrLeasedContractorsNJ
${ML_AI_LeasedContractorsClass2}=    id=USNonUnionIndependentContractorsAndOrLeasedContractorsClass2
${ML_AI_LeasedContractorsMI}=    id=USNonUnionIndependentContractorsAndOrLeasedContractorsClass_2
${ML_AI_UIndependentContractorsCA}=    id=USNonUnionPartTimeEmployeesIncludingSeasonalTemporaryAndVolunteersCA
${ML_AI_UIndependentContractorsNJ}=    id=USNonUnionPartTimeEmployeesIncludingSeasonalTemporaryAndVolunteersNJ
${ML_AI_UIndependentContractorsClass2}=    id=USNonUnionPartTimeEmployeesIncludingSeasonalTemporaryAndVolunteersClass2
${ML_AI_UIndependentContractorsMI}=    id=USNonUnionPartTimeEmployeesIncludingSeasonalTemporaryAndVolunteersClass_2
${ML_AI_USVolunteersCA}=    id=USVolunteersCA
${ML_AI_USVolunteersNJ}=    id=USVolunteersNJ
${ML_AI_USVolunteersClass2}=    id=USVolunteersClass2
${ML_AI_USVolunteersMI}=    id=USVolunteersClass_2
${ML_AI_FullTimePartTimeSeasonaletcCA}=    id=USUnionEmployeesFullTimePartTimeSeasonaletcCA
${ML_AI_FullTimePartTimeSeasonaletcNJ}=    id=USUnionEmployeesFullTimePartTimeSeasonaletcNJ
${ML_AI_FullTimePartTimeSeasonaletcClass2}=    id=USUnionEmployeesFullTimePartTimeSeasonaletcClass2
${ML_AI_FullTimePartTimeSeasonaletcMI}=    id=USUnionEmployeesFullTimePartTimeSeasonaletcClass_2
${ML_AI_InvoluntarilyTerminatedEmp}=    //input[@name='InvoluntarilyTerminatedEmployeeCount']
${ML_AI_AnticipatedReductionsInStaff}=    AnticipatedReductionsInStaff
${ML_AI_AntiDiscriminationPolicies}=    AntiDiscriminationPolicies
${ML_AI_HumanResourcesManager}=    HumanResourcesManager
${ML_AI_continue}=    //input[@id='continueButton']
@{states}=    Virgin Islands  New York
#Private
${ML_AIEPL_ForeignEmployees}=  //input[@name='TotalForeignEmployee']
${ML_AIEPL_NoOfEmployeeMaking1M}=   //input[@name='NoOfEmployeeMaking1M']
${ML_AIEPL_Antidiscrimination}=  Antidiscrimination
${ML_AIEPL_AntiHarassment}=  AntiHarassment
${ML_AIEPL_EEOC}=  EEOC
${ML_AIEPL_ADAAccommodation}=  ADAAccommodation
${ML_AIEPL_PoliciesDistributed}=  PoliciesDistributed
${ML_AIEPL_HumanResourcesManager}=  HumanResourcesManager

*** Keywords ***
DNO Applicant Information
        [Arguments]    &{test_data}
       # wait until element is visible  //input[@name='IRSTaxExempt']  50s
        Click element  //input[@name='IRSTaxExempt' and @value='${test_data['Is the organization IRS tax exempt?']}']
        run keyword if    '${test_data['Is the organization IRS tax exempt?']}' == 'NO'  click element  //input[@name='StateNonProfitStatus' and @value='${test_data['Does the organization have state non-profit status?']}']
        click element  //input[@name='CoverageContemplated' and @value='${test_data['Is the organization requesting coverage for any subsidiaries or other entities that are not contemplated in their financials or 990 filings?']}']
        run keyword if  '${test_data['EPL']}' == 'YES'  Fields-AI    &{test_data}
        Sleep  20s



      # wait until element is not visible   globalAjaxLoading  250
      # #Wait Until Element Is Visible  IRSTaxExempt  5s
      # Wait Until Element Is Visible  IRSTaxExempt  10s
      # scroll element into view    IRSTaxExempt
      # wait until page contains element    IRSTaxExempt    timeout=30s
      # Wait Until Element Is Visible   IRSTaxExempt    timeout=30s
      # set focus to element    IRSTaxExempt
      # Element Should Be Visible    IRSTaxExempt
      # select radio button    IRSTaxExempt    ${test_data["Is the organization IRS tax exempt?"]}
      # run keyword if    '${test_data["Is the organization IRS tax exempt?"]}' == 'NO'  Wait Until Element Is Visible  id=StateNonProfitStatus_1  2s
      # run keyword if    '${test_data["Is the organization IRS tax exempt?"]}' == 'NO'    select radio button    StateNonProfitStatus  ${test_data["Does the organization have state non-profit status?"]}
      # Wait Until Element Is Visible   CoverageContemplated
      # Element Should Be Visible    CoverageContemplated
      # select radio button    CoverageContemplated    ${test_data["Is the organization requesting coverage for any subsidiaries or other entities that are not contemplated in their financials or 990 filings?"]}
      # run keyword if  '${test_data['EPL']}' == 'YES'  Fields-AI    &{test_data}
      # Wait Until Element Is Visible  ${ML_AI_YearEst}  5s
      # Set Focus To Element  ${ML_AI_YearEst}
      # sleep  0.5s
      # Set Selenium Speed    0.1s
        #${Year_value}=  get value   ${ML_AI_YearEst}
        #run keyword if   '${Year_value}' == '____'
        Input text  ${ML_AI_YearEst}  ${test_data["Year Established"]}
        continue Click RE
        sleep  5s

Private Employment Officers Liability
    [Arguments]    &{test_data}
    wait until page contains  State   20s
    Fields-AI    &{test_data}
    Input text    ${ML_AIEPL_ForeignEmployees}     ${test_data['Total Foreign Employees']}
    Input text    ${ML_AIEPL_NoOfEmployeeMaking1M}    ${test_data['Employees make more than $125,000 per year?']}
    click element   //input[@name='AntiDiscriminationPolicies' and @value='${test_data['Anti-discrimination']}']
    click element   //input[@name='AntiHarassmentPolicies' and @value='${test_data['Anti harassment']}']
    click element   //input[@name='EEOCPolicies' and @value='${test_data['EEOC']}']
    click element   //input[@name='ADAAccommodationPolicies' and @value='${test_data['ADA Accommodation']}']
    Execute Javascript     window.scrollTo(85, 0)
    Scroll Element Into View    //input[@name='HandbookSigned']
    click element   //input[@name='HandbookSigned' and @value='${test_data['Handbook and signed and returned by each employee?']}']
    Sleep    1s
    click element   //input[@name='HumanResourcesManager' and @value='${test_data['Human Resources manager (or equivalent)?']}']
    Continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    sleep  3s

Fields-AI
        [Arguments]    &{test_data}
         ${No_of_states}=    Set Variable  ${test_data['Provide the total number of state locations']}
        FOR    ${index}    IN RANGE   0  ${No_of_states}
            ${value}=  evaluate  ${index}+1
            ${add_states}=  evaluate  ${No_of_states}-1
            #Scroll Element Into View    ${ML_AI_Locationstate}
            Sleep    1s
            #Click Element   //input[@name='tableInputs[${index}].LocationState']
            Input Text    //input[@name='tableInputs[${index}].LocationState']    ${test_data['Location state${value}']}
            Sleep    2s
            Press Keys    //input[@name='tableInputs[${index}].LocationState']   ARROW_DOWN
            sleep  2s
            Press Keys    //input[@name='tableInputs[${index}].LocationState']   RETURN
            #Select Value from Dropdown   //input[@name='tableInputs[${index}].LocationState']   ${test_data['Location state${value}']}
            Sleep    2s
            run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input text  //input[@name='tableInputs[${index}].USNonUnionFullTimeEmployees']      ${test_data['US(Non-Union)Full Time Employees${value}']}  ELSE  Input text  //input[@name='tableInputs[${index}].USNonUnionFullTimeEmployees']      ${test_data['Full Time (non-Union)-State${value}']}
            run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input text  //input[@name='tableInputs[${index}].USNUIndependentContractorsLeasedContractors']    ${test_data['US(Non-Union)Full Time Independent Employees${value}']}   ELSE  Input text  //input[@name='tableInputs[${index}].USNUIndependentContractorsLeasedContractors']    ${test_data['Independent Contractors/Leased Employees-State${value}']}
            run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input text  //input[@name='tableInputs[${index}].USNUPartTimeSeasonalTempEmp']      ${test_data['US(Non-Union) Part Time Employees, including Seasonal, Temporary, etc${value}']}   ELSE  Input text  //input[@name='tableInputs[${index}].USNUPartTimeSeasonalTempEmp']      ${test_data['Part Time/Seasonal/Temporary (non-Union)-State${value}']}
            run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input text  //input[@name='tableInputs[${index}].USVolunteers']     ${test_data['US Volunteers${value}']}    ELSE  Input text  //input[@name='tableInputs[${index}].USVolunteers']     ${test_data['Volunteers-State${value}']}
            run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input text  //input[@name='tableInputs[${index}].USUEmpFTimePTimeSeasonal']   ${test_data['USUnion Employees (Full Time, Part Time, Seasonal, etc. )${value}']}    ELSE  Input text  //input[@name='tableInputs[${index}].USUEmpFTimePTimeSeasonal']   ${test_data['Independent Contractors/Leased Employees-State${value}']}
            run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input text  //input[@name='tableInputs[${index}].AllNonUSEmp']   ${test_data['All Non U.S. Employees${value}']}
            run keyword if  '${index}' < '${add_states}'   click element  ${ML_AI_Addbutton}
        END

       #Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees1}    10s
       #Input text    ${ML_AI_US(Non-Union)Full Time Employees1}    ${test_data['Full Time (non-Union)-State1']}
       #Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp1}    10s
       #Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp1}    ${test_data['Part Time/Seasonal/Temporary (non-Union)-State1']}
       #Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal1}    10s
       #Input text    ${ML_AI_USUEmpFTimePTimeSeasonal1}    ${test_data['Union-State1']}
       #Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent1}    10s
       #Input text    ${ML_AI_USNonUnionIndependent1}    ${test_data['Independent Contractors/Leased Employees-State1']}
       #Wait Until Element Is Visible      ${ML_AI_USVolunteers1}    10s
       #Input text    ${ML_AI_USVolunteers1}    ${test_data['Volunteers-State1']}
        #Select Value from Dropdown    ${ML_AI_Locationstate}    ${test_data['Location state1']}
        #click element  //input[@name='AnticipatedReductionsInStaff' and @value='${test_data['Are there any anticipated reductions in staff over the next year?']}']
        #click element  //input[@name='AntiDiscriminationPolicies' and @value='${test_data['Does the applicant have written anti-discrimination and anti-sexual harassment policies in place?']}']
        #run keyword if    '${test_data['Does the applicant have written anti-discrimination and anti-sexual harassment policies in place?']}' == 'YES'  click element  //input[@name='HumanResourcesManager' and @value='${test_data['Does the applicant have a Human Resources manager (or equivalent)?']}']
        Run Keyword If   '${test_data['Program']}' != 'ML-PRIVATE'   Other Applicant questions    &{test_data}




EPL ML-Private
        [Arguments]    &{test_data}
       #Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees1}    10s
       #Input text    ${ML_AI_US(Non-Union)Full Time Employees1}    ${test_data['Full Time (non-Union)-State1']}
       #Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp1}    10s
       #Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp1}    ${test_data['Part Time/Seasonal/Temporary (non-Union)-State1']}
       #Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal1}    10s
       #Input text    ${ML_AI_USUEmpFTimePTimeSeasonal1}    ${test_data['Union-State1']}
       #Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent1}    10s
       #Input text    ${ML_AI_USNonUnionIndependent1}    ${test_data['Independent Contractors/Leased Employees-State1']}
       #Wait Until Element Is Visible      ${ML_AI_USVolunteers1}    10s
       #Input text    ${ML_AI_USVolunteers1}    ${test_data['Volunteers-State1']}
       #Select Value from Dropdown    ${ML_AI_Locationstate}    ${test_data['Location state1']}
        click element  //input[@name='AntiDiscriminationPolicies' and @value='${test_data['Anti-discrimination']}']
        click element  //input[@name='AntiHarassmentPolicies' and @value='${test_data['Anti harassment']}']
        click element  //input[@name='EEOCPolicies' and @value='${test_data['EEOC']}']
        click element  //input[@name='ADAAccommodationPolicies' and @value='${test_data['ADA Accommodation']}']
        click element  //input[@name='HandbookSigned' and @value='${test_data['Handbook and signed and returned by each employee?']}']
        click element  //input[@name='HumanResourcesManager' and @value='${test_data['Human Resources manager (or equivalent)?']}']
       # run keyword if    '${test_data['Does the applicant have written anti-discrimination and anti-sexual harassment policies in place?']}' == 'YES'  click element  //input[@name='HumanResourcesManager' and @value='${test_data['Does the applicant have a Human Resources manager (or equivalent)?']}']

        


      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees2}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees2}    ${test_data['Full Time (non-Union)-State2']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp2}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp2}    ${test_data['Part Time/Seasonal/Temporary (non-Union)-State2']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent2}    10s
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal2}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal2}    ${test_data['Union-State2']}
      # Input text    ${ML_AI_USNonUnionIndependent2}    ${test_data['Independent Contractors/Leased Employees-State2']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers2}    10s
      # Input text    ${ML_AI_USVolunteers2}    ${test_data['Volunteers-State2']}
      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees3}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees3}    ${test_data['Full Time (non-Union)-State3']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp3}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp3}    ${test_data['Part Time/Seasonal/Temporary (non-Union)-State3']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent3}    10s
      # Input text    ${ML_AI_USNonUnionIndependent3}    ${test_data['Independent Contractors/Leased Employees-State3']}
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal3}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal3}    ${test_data['Union-State3']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers3}    10s
      # Input text    ${ML_AI_USVolunteers3}    ${test_data['Volunteers-State3']}
      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees4}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees4}    ${test_data['Full Time (non-Union)-State4']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp4}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp4}    ${test_data['Part Time/Seasonal/Temporary (non-Union)-State4']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent4}    10s
      # Input text    ${ML_AI_USNonUnionIndependent4}    ${test_data['Independent Contractors/Leased Employees-State4']}
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal4}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal4}    ${test_data['Union-State4']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers4}    10s
      # Input text    ${ML_AI_USVolunteers4}    ${test_data['Volunteers-State4']}
      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees5}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees5}    ${test_data['Full Time (non-Union)-State5']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp5}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp5}    ${test_data['Part Time/Seasonal/Temporary (non-Union)-State5']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent5}    10s
      # Input text    ${ML_AI_USNonUnionIndependent5}    ${test_data['Independent Contractors/Leased Employees-State5']}
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal5}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal5}    ${test_data['Union-State5']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers5}    10s
      # Input text    ${ML_AI_USVolunteers5}    ${test_data['Volunteers-State5']}

EPL ML-NFP
        [Arguments]    &{test_data}
      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees1}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees1}    ${test_data['US(Non-Union)Full Time Employees1']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent1}    10s
      # Input text    ${ML_AI_USNonUnionIndependent1}    ${test_data['US(Non-Union)Full Time Independent Employees1']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp1}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp1}    ${test_data['US(Non-Union) Part Time Employees, including Seasonal, Temporary, etc1']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers1}    10s
      # Input text    ${ML_AI_USVolunteers1}    ${test_data['US Volunteers1']}
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal1}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal1}    ${test_data['USUnion Employees (Full Time, Part Time, Seasonal, etc. )1']}
      # Wait Until Element Is Visible      ${ML_AI_AllNonUSEmp1}    10s
      # Input text    ${ML_AI_AllNonUSEmp1}    ${test_data['All Non U.S. Employees1']}
      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees2}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees2}    ${test_data['US(Non-Union)Full Time Employees2']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent2}    10s
      # Input text    ${ML_AI_USNonUnionIndependent2}    ${test_data['US(Non-Union)Full Time Independent Employees2']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp2}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp2}    ${test_data['US(Non-Union) Part Time Employees, including Seasonal, Temporary, etc2']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers2}    10s
      # Input text    ${ML_AI_USVolunteers2}    ${test_data['US Volunteers2']}
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal2}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal2}    ${test_data['USUnion Employees (Full Time, Part Time, Seasonal, etc. )2']}
      # Wait Until Element Is Visible      ${ML_AI_AllNonUSEmp2}    10s
      # Input text    ${ML_AI_AllNonUSEmp2}    ${test_data['All Non U.S. Employees2']}
      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees3}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees3}    ${test_data['US(Non-Union)Full Time Employees3']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent3}    10s
      # Input text    ${ML_AI_USNonUnionIndependent3}    ${test_data['US(Non-Union)Full Time Independent Employees3']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp3}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp3}    ${test_data['US(Non-Union) Part Time Employees, including Seasonal, Temporary, etc3']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers3}    10s
      # Input text    ${ML_AI_USVolunteers3}    ${test_data['US Volunteers3']}
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal3}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal3}    ${test_data['USUnion Employees (Full Time, Part Time, Seasonal, etc. )3']}
      # Wait Until Element Is Visible      ${ML_AI_AllNonUSEmp3}    10s
      # Input text    ${ML_AI_AllNonUSEmp3}    ${test_data['All Non U.S. Employees3']}
      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees4}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees4}    ${test_data['US(Non-Union)Full Time Employees4']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent4}    10s
      # Input text    ${ML_AI_USNonUnionIndependent4}    ${test_data['US(Non-Union)Full Time Independent Employees4']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp4}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp4}    ${test_data['US(Non-Union) Part Time Employees, including Seasonal, Temporary, etc4']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers4}    10s
      # Input text    ${ML_AI_USVolunteers4}    ${test_data['US Volunteers4']}
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal4}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal4}    ${test_data['USUnion Employees (Full Time, Part Time, Seasonal, etc. )4']}
      # Wait Until Element Is Visible      ${ML_AI_AllNonUSEmp4}    10s
      # Input text    ${ML_AI_AllNonUSEmp4}    ${test_data['All Non U.S. Employees4']}
      # Wait Until Element Is Visible      ${ML_AI_US(Non-Union)Full Time Employees5}    10s
      # Input text    ${ML_AI_US(Non-Union)Full Time Employees5}    ${test_data['US(Non-Union)Full Time Employees5']}
      # Wait Until Element Is Visible      ${ML_AI_USNonUnionIndependent5}    10s
      # Input text    ${ML_AI_USNonUnionIndependent5}    ${test_data['US(Non-Union)Full Time Independent Employees5']}
      # Wait Until Element Is Visible      ${ML_AI_USNUPartTimeSeasonalTempEmp5}    10s
      # Input text    ${ML_AI_USNUPartTimeSeasonalTempEmp5}    ${test_data['US(Non-Union) Part Time Employees, including Seasonal, Temporary, etc5']}
      # Wait Until Element Is Visible      ${ML_AI_USVolunteers5}    10s
      # Input text    ${ML_AI_USVolunteers5}    ${test_data['US Volunteers5']}
      # Wait Until Element Is Visible      ${ML_AI_USUEmpFTimePTimeSeasonal5}    10s
      # Input text    ${ML_AI_USUEmpFTimePTimeSeasonal5}    ${test_data['USUnion Employees (Full Time, Part Time, Seasonal, etc. )5']}
      # Wait Until Element Is Visible      ${ML_AI_AllNonUSEmp5}    10s
      # Input text    ${ML_AI_AllNonUSEmp5}    ${test_data['All Non U.S. Employees5']}
      # Input text    ${ML_AI_NoOfEmpMaking1M}    ${test_data['How many employees make more than $100,000 per year?']}
        ${Other Applicant questions-check}=  run keyword and return status  page should contain  How many employees have been involuntarily terminated in the last year?
        run keyword if    ${Other Applicant questions-check}    Other Applicant questions     &{test_data}

Other Applicant questions
       [Arguments]    &{test_data}
        Input text  ${ML_AI_NoOfEmpMaking1M}  ${test_data['How many employees make more than $125,000 per year?']}
        Input text    ${ML_AI_InvoluntarilyTerminatedEmp}    ${test_data['How many employees have been involuntarily terminated in the last year?']}
        click element  //input[@name='AnticipatedReductionsInStaff' and @value='${test_data['Are there any anticipated reductions in staff over the next year?']}']
        click element  //input[@name='AntiDiscriminationPolicies' and @value='${test_data['Does the applicant have written anti-discrimination and anti-sexual harassment policies in place?']}']
        run keyword if    '${test_data['Does the applicant have written anti-discrimination and anti-sexual harassment policies in place?']}' == 'YES'  click element  //input[@name='HumanResourcesManager' and @value='${test_data['Does the applicant have a Human Resources manager (or equivalent)?']}']