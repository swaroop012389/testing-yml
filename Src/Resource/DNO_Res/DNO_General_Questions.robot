*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../Resource/DNO_Res/DNO_General_Information.robot

*** Variables ***
${ML_GQ_Type_of_non_Profit}=   //input[@role='combobox']
#${ML_GQ_Select-Result-Label}=    //div[@class='select2-result-label']
#${ML_GQ_DNO}=  //span[@id='DnoCoverage_labelText']
#${ML_GQ_EPL}=  //span[@id='EplCoverage_labelText']
#${ML_GQ_Fiduciary}=    //span[@id='FiduciaryCoverage_labelText']
${ML_GQ_DNO_checkbox}=   (//input[@type='checkbox'])[1]
${ML_GQ_EPL_checkbox}=  (//input[@type='checkbox'])[2]
${ML_GQ_Fiduciary_checkbox}=   (//input[@type='checkbox'])[3]
${ML_GQ_Crime_checkbox}=   (//input[@type='checkbox'])[4]
${MLP_GQ_EPL_checkbox}=  (//input[@type='checkbox'])[2]
${MLP_GQ_Fiduciary_checkbox}=   (//input[@type='checkbox'])[3]
${MLP_GQ_Crime_checkbox}=   (//input[@type='checkbox'])[4]
${ML_GQ_DNO_Current_Limit}=    //input[@name='DNOCurrentLimit']
${ML_GQ_EPL_Current_Limit}=    //input[@name='EPLCurrentLimit']
${ML_GQ_Fiduciary_Current_Limit}=  //input[@name='FiduciaryCurrentLimit']
${ML_GQ_Crime_Current_Limit}=  //input[@name='CrimeCurrentLimit']
${ML_GQ_DNO_Current_Retention}=  //input[@name='DNOCurrentRetention']
${ML_GQ_EPL_Current_Retention}=  //input[@name='EPLCurrentRetention']
${ML_GQ_Fiduciary_Current_Retention}=  //input[@name='FiduciaryCurrentRetention']
${ML_GQ_Crime_Current_Retention}=  //input[@name='CrimeCurrentRetention']
${ML_GQ_DNO_Requested_Limit}=    //input[@name='DNODesiredLimit']
${ML_GQ_EPL_Requested_Limit}=   //input[@name='EPLDesiredLimit']
${ML_GQ_Fiduciary_Requested_Limit}=  //input[@name='FiduciaryDesiredLimit']
${ML_GQ_Crime_Requested_Limit}=  //input[@name='CrimeDesiredLimit']
${ML_GQ_DNO_Requested_Retention}=  //input[@name='DNORetention']
${ML_GQ_EPL_Requested_Retention}=  //input[@name='EPLRetention']
${ML_GQ_Fiduciary_Requested_Retention}=  //input[@name='FiduciaryRetention']
${ML_GQ_Crime_Requested_Retention}=  //input[@name='CrimeRetention']
#${ML_GQ_PlsProvideDetails}=    //textarea[@id='IsDeclinedCancRenewedExplanation']
${ML_GQ_Total_Premium_Ex_Cov}=    //input[@name='ExistingPremium']
#${Name-DNOSeperateShared}=    DNOSeperateShared
${ML_GQ_DNOCurrentPNPLitDate}=    //input[@name='DNOCurrentPNPLitDate']
${ML_GQ_EPLCurrentPNPLitDate}=    //input[@name='EPLCurrentPNPLitDate']
${ML_GQ_FiduciaryCurrentPNPLitDate}=    //input[@name='FiduciaryCurrentPNPLitDate']
${Non-Profit_Management_Liability} =    //p[text()='Non-profit Management Liability']
${MLP_GQ_DNORequestedrentention}=    (//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedEnd MuiAutocomplete-input MuiAutocomplete-inputFocused css-3xklx'])[1]
${MLP_GQ_EPLRequestedrentention}=   (//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedEnd MuiAutocomplete-input MuiAutocomplete-inputFocused css-3xklx'])[2]
#${MLP_GQ_Crime_Requested_Retention}=  (//em[text()='Select One'])
${MLP_GQ_FDU_Requested_Retention}=  //input[@name='FiduciaryRetention']
${ML_GQ_FEIN}=   //input[@name='FEIN']
${ML_GQ_No_Of_Lawyers}=  //input[@name='NoOfLawyers']
@{NFP_Decline_OrgType}=  Adoption - Counselor   Advocacy - Animal Rights  Adoption - Facilitator   Advocacy - Animal Rights   Advocacy - Civil Liberties   Advocacy - Environmental Conservation/Development   Advocacy - Gun control/rights   Advocacy - Right to Life/Pro-Choice   Economic Development Organization   Alternaitve Incarceration   Assisted Living for Seniors and the disabled   Collegiate Athletic Governing Bodies or Conferences - Division I   Collegiate Athletic Governing Bodies or Conferences Division II   Collegiate Athletic Governing Bodies or Conferences - Division III   High School Athletic Governing Bodies or Cinferences   Boy Scouts / Girl Scouts   Cannabis (including medical recreational marijuana ); Cannabis sales; Cannibus manufacturing; Cannabis distribution   Community Health Center   Consumer Credit Counseling; Consumer Credit Reporting Agencies; Credit Bureau   Coop - Electrical   Coop - Ethanol/Gas   Credit and.or Bankruptcy Counseling   Credit Union   Crematory   Day Care / Child Care   Dog/Kennel Club   Education - Boarding School   Education – Private School    Education – Non-Profit Trade School    Education – Non-Profit Vocational School    Education - Preschool / Headstart   Education - For-Profit Trade/ Vocational School   Education - For-Profit College   Education - Colleges/Universities /Higher Education   Education - Public School or Public School Districts   Family Planning Services   Financial Institution   Foster Care   Foundations - College/University - Division I   Government Entities; Port Authority; Public Officials/Municipalities   Group Home   Gun Clubs   Healthcare Facility   Hospice; Long-term Health-care   Hospital; Hospital Systems; Education/Hospital Systems   Houses of Worship; National/Regional/Local Churches and Religious Organizations   Insurance Company   Insurance Trust   Joint Apprenticeship Trusts/Learning Trusts/Training Trusts   Labor Organizations/LMTs   Law Firms; Public Defenders   Legal Defense Fund   Loan Authority   Lobbying    Membership Organization - Political   Mining   Native American / Tribal   Nudist Colony   Political Action Committee   Political Campaign(s)   Political Candidate   Political Party   Professional Sports Associations/Leagues   Public Transportation   Quasi-Government Entities   Residential Care   Skilled Nursing    Timeshare   Tobacco, E-cig or vaping manufacturing or distribution    Insurance Trust; Joint Apprenticeship Trusts/Learning Trusts/Training Trusts   Workers Comp Self Insured Program

*** Keywords ***
DNO General Questions
        [Arguments]    &{test_data}
        sleep  5s
        run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  Wait Until Page Contains   Does your client have existing coverage?
       #run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  wait until element is visible    //input[@name='ExistingCoverage' and @value='${test_data['Does your client have existing coverage?']}']    40s
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Wait Until Page Contains Element  ${ML_GQ_Type_of_non_Profit}   20s
        IF    '${test_data['Program']}' != 'ML-PRIVATE'
#            Click element    ${ML_GQ_Type_of_non_Profit}
            sleep  1s
            Select Value from Dropdown  ${ML_GQ_Type_of_non_Profit}    ${test_data['Type of Non Profit']}
#           Input Text    ${ML_GQ_Type_of_non_Profit}    ${test_data['Type of Non Profit']}
#            Scroll Element Into View    //input[@value='${test_data['Type of Non Profit']}']
#            Wait Until Element Is Visible    //input[@value='${test_data['Type of Non Profit']}']    10s
            sleep  1s
#            Click element   //input[@value='${test_data['Type of Non Profit']}']
        END
        sleep  2s
        click element   //input[@name='ExistingCoverage' and @value='${test_data['Does your client have existing coverage?']}']
        sleep  1s
        Run Keyword If    '${test_data['Program']}' == 'ML-PRIVATE'  GI Effective Date  &{test_data}
        wait until element is not visible   globalAjaxLoading  100
        run keyword if    '${test_data["Does your client have existing coverage?"]}' == 'YES'   Input text    ${ML_GQ_Total_Premium_Ex_Cov}    ${test_data['Total premium for existing coverage']}
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'   Other General Questions  &{test_data}
        #Set Variable   ${Coverage Type}   ${EMPTY}
        ${Coverage Type}=  run keyword if  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Set Variable   existing  ELSE  set variable  requested
        run keyword if   '${test_data['DNO']}' == 'YES'     Coverages DNO  ${Coverage Type}  ${test_data}
        sleep  0.2s
        run keyword if   '${test_data['EPL']}' == 'YES'    Coverages EPL   ${Coverage Type}  ${test_data}
        sleep  0.2s
        run keyword if   '${test_data['Fiduciary']}' == 'YES'   Coverages Fiduciary  ${Coverage Type}  ${test_data}
        sleep  0.2s
        run keyword if   '${test_data['Crime Coverage']}' == 'YES'   Coverages Crime   ${Coverage Type}  ${test_data}
        sleep  0.2s
        run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  Other General Questions  &{test_data}
        run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  click element   //input[@name='ClaimsInPast' and @value='${test_data['past 36 months has the Applicant, or any subsidiary']}']
        run keyword if    '${test_data["Does your client have existing coverage?"]}' == 'YES'   Input text    ${ML_GQ_Total_Premium_Ex_Cov}    ${test_data['Total premium for existing coverage']}
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'   click element   //input[@name='ClaimsInPast' and @value='${test_data['Open Claims two matters in last 5 years?']}']
#       #run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  FEIN Check  &{test_data}
        continue Click RE
        Wait Until Element Is Not Visible    globalajaxLoading  200
        sleep  3s

Other General Questions
        [Arguments]  &{test_data}
        #Execute Javascript  window.scrollTo(0,1000)
        #run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  click element   //input[@name='SeperateShared' and @value='${test_data['Shared limits for the selected coverage(s)?']}']
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  click element    //input[@name='KnRCoverage' and @value='${test_data['Would you like KNR coverage?']}']
        run keyword if  '${test_data['Program']}' == 'ML-PRIVATE' and '${test_data['State']}' != 'Florida'  click element    //input[@name='KnRCoverage' and @value='${test_data["Would you like KNR coverage?"]}']
        click element    //input[@name='EmployedLawyersCoverageYesNO' and @value='${test_data['Are you Interested in ELL coverage?']}']
        wait until element is not visible   globalAjaxLoading  100
        run keyword if    '${test_data["Are you Interested in ELL coverage?"]}' == 'YES'  Wait Until Element Is Visible    ${ML_GQ_No_Of_Lawyers}
        run keyword if    '${test_data["Are you Interested in ELL coverage?"]}' == 'YES'  Input text  ${ML_GQ_No_Of_Lawyers}  ${test_data['How many lawyers does the organization have on staff?']}

Claims
    [Arguments]  &{test_data}
    ${OpenClaim-Status} =    run keyword and return status    Element Should Be Visible    //input[@name='ClaimsInPast' and @value='${test_data['Open Claims two matters in last 5 years?']}']
    run keyword if    ${OpenClaim-Status}  click element     //input[@name='ClaimsInPast' and @value='${test_data['Open Claims two matters in last 5 years?']}']

FEIN Check
        [Arguments]  &{test_data}
        click element   //input[@name='FeinYesNo' and @value='${test_data['Does the applicant have a FEIN?']}']
        sleep  3s
        run keyword if  '${test_data["Does the applicant have a FEIN?"]}' == 'YES'   Input text  ${ML_GQ_FEIN}  ${test_data['What is the applicant’s FEIN?']}

Get Work_ID
        ${Work-Id}=    get text    ${RE-Workid}
        ${Name-work-id1}=    fetch from right    ${Work-Id}    (
        ${Name-work-id}=    remove string    ${Name-work-id1}    )
        ${ID}=  fetch from right  ${Name-work-id}  :${Space}
        Set global Variable  ${WorkID}  ${ID}
        log to console    WORK ${Name-work-id}

Navigate to Non-Profit_Management_Liability
        Execute Javascript    window.scrollTo(0,50)
        wait until element is enabled  ${Non-Profit_Management_Liability}    10
        click element    ${Non-Profit_Management_Liability}

NFP Decline check
    [Arguments]  &{test_data}
    Select Value from Dropdown  ${ML_GQ_Type_of_non_Profit}    ${test_data['Type of Non Profit']}
    Sleep    1s
    Continue Click RE
    Sleep    5s

Sublimit Coverages Page
      Wait Until Element Is Visible    ${IDcontinue}  20s
      Execute Javascript    window.scrollTo(0,300)
      Scroll Element Into View    ${IDcontinue}
      continue Click RE
      sleep  5s

Coverages DNO
        [Arguments]    ${Coverage Type}  ${test_data}

        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Input Text   ${ML_GQ_DNO_Current_Limit}  ${test_data['DNO_Current Limit']}
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Input Text   ${ML_GQ_DNO_Current_Retention}  ${test_data['DNO_Current Retention']}
        #Execute Javascript  window.scrollTo(0,500)
        sleep  3s
        Select Value from Dropdown   ${ML_GQ_DNO_Requested_Limit}   ${test_data['DNO_Requested Limit']}
        sleep  3s
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input Text  ${ML_GQ_DNO_Requested_Retention}  ${test_data['DNO_Requested Retention']}  ELSE  Select Value from Dropdown    ${MLP_GQ_DNORequestedrentention}    ${test_data['DNO_Requested Retention']}
        sleep  1s
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Click element  //input[@name='DNOSeperateShared' and @value='${test_data['DNO_Shared']}']
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Select DNO P&P Date  ${test_data}

Select DNO P&P Date
        [Arguments]    ${test_data}
        click element    //input[@name='DNOCurrPnPLitDateYesUnknown' and @value='${test_data['DNO_Current P&P lit date']}']
        sleep  1s
        run keyword if    '${test_data["DNO_Current P&P lit date"]}' == 'YES'    Press keys    ${ML_GQ_DNOCurrentPNPLitDate}    ${test_data['DNO_Date']}

Coverages EPL
        [Arguments]    ${Coverage Type}  ${test_data}

        Scroll Element Into View    ${MLP_GQ_Crime_checkbox}
        run keyword if    '${test_data['Program']}' == 'ML-PRIVATE'    Click Element  ${MLP_GQ_EPL_checkbox}  ELSE  Click Element  ${ML_GQ_EPL_checkbox}
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Input text   ${ML_GQ_EPL_Current_Limit}  ${test_data['EPL_Current Limit']}
        sleep  0.5s
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Input text   ${ML_GQ_EPL_Current_Retention}  ${test_data['EPL_Current Retention']}
        sleep  1s
        Select Value from Dropdown    ${ML_GQ_EPL_Requested_Limit}   ${test_data['EPL_Requested Limit']}
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input text  ${ML_GQ_EPL_Requested_Retention}  ${test_data['EPL_Requested Retention']}  ELSE  Select Value from Dropdown   ${MLP_GQ_EPLRequestedrentention}   ${test_data['EPL_Requested Retention']}
        sleep  0.5s
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Click element    //input[@name='EPLSeperateShared' and @value='${test_data['EPL_Shared']}']
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Select EPL P&P Date  ${test_data}

Select EPL P&P Date
        [Arguments]    ${test_data}
        click element    //input[@name='EPLCurrPnPLitDateYesUnknown' and @value='${test_data['EPL_Current P&P lit date']}']
        sleep  1s
        run keyword if    '${test_data["EPL_Current P&P lit date"]}' == 'YES'    Press Keys    ${ML_GQ_EPLCurrentPNPLitDate}    ${test_data['EPL_Date']}

Coverages Fiduciary
        [Arguments]    ${Coverage Type}  ${test_data}
        run keyword if    '${test_data['Program']}' == 'ML-PRIVATE'   Click Element  ${MLP_GQ_Fiduciary_checkbox}     ELSE      Click Element  ${ML_GQ_Fiduciary_checkbox}
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Input Text   ${ML_GQ_Fiduciary_Current_Limit}  ${test_data['FDU_Current Limit']}
        sleep  0.5s
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Input Text   ${ML_GQ_Fiduciary_Current_Retention}  ${test_data['FDU_Current Retention']}
        sleep  1s
        Select Value from Dropdown   ${ML_GQ_Fiduciary_Requested_Limit}   ${test_data['FDU_Requested Limit']}
        sleep  2s
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input Text  ${ML_GQ_Fiduciary_Requested_Retention}  ${test_data['FDU_Requested Retention']}  ELSE  Select Value from Dropdown  ${MLP_GQ_FDU_Requested_Retention}  ${test_data['FDU_Requested Retention']}
        sleep  1s
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  click element  //input[@name='FiduciarySeperateShared' and @value='${test_data['FDU_Shared']}']
        sleep  1s
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Select FDU P&P Date  ${test_data}

Select FDU P&P Date
        [Arguments]    ${test_data}
        click element   //input[@name='FiduciaryCurrPnPLitDateYesUnknown' and @value='${test_data['FDU_Current P&P lit date']}']
        sleep  1s
        run keyword if    '${test_data["FDU_Current P&P lit date"]}' == 'YES'    Press Keys   ${ML_GQ_FiduciaryCurrentPNPLitDate}    ${test_data['FDU_Date']}

Coverages Crime
        [Arguments]    ${Coverage Type}  ${test_data}
        run keyword if    '${test_data['Program']}' == 'ML-PRIVATE'    Click Element  ${MLP_GQ_Crime_checkbox}    ELSE      Click Element  ${ML_GQ_Crime_checkbox}
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Input Text   ${ML_GQ_Crime_Current_Limit}  ${test_data['Crime_Current Limit']}
        Run Keyword If  '${test_data["Does your client have existing coverage?"]}' == 'YES'  Input Text   ${ML_GQ_Crime_Current_Retention}  ${test_data['Crime_Current Retention']}
        Select Value from Dropdown   ${ML_GQ_Crime_Requested_Limit}   ${test_data['Crime_Requested Limit']}
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  Input Text   ${ML_GQ_Crime_Requested_Retention}  ${test_data['Crime_Requested Retention']}  ELSE  Select Value from Dropdown  ${ML_GQ_Crime_Requested_Retention}  ${test_data['Crime_Requested Retention']}

Organizational Type_Check
        [Arguments]    &{test_data}
        Click element    //b[@role='presentation']
        Input text    ${ML_GQ_Type_of_non_Profit}    ${test_data['Type of Non Profit']}
        Click element    ${ML_GQ_Select-Result-Label}
        Get Work_ID
        wait until element is not visible   globalAjaxLoading  30
        ${Decline_msg}=  get text  ${ID-Org_Decline_msg}
        wait until element is not visible   globalAjaxLoading  60
        log to console  Decline_Message:${Decline_msg}
        wait until element is not visible   globalAjaxLoading  80

