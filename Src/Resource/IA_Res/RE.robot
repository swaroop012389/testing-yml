*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${Real_Estate_E&O} =  xpath=(//a[contains(text(),'Start a new quote')])[1]
${IDFirmName} =  id=FirmName
${IDFirstName} =  id=PrimaryContactFirstName
${IDLastName} =  id=PrimaryContactLastName
${ID_E-mailAddress} =  id=ApplicantEmail
${ID_EffectiveDate} =  id=EffectiveDate
${ID_ExpirationDate} =  id=ExpirationDate
${ID_AddressLine} =  id=ApplicantMailingAddress1
${ID-GI-Effective-Date-RE} =  EffectiveDate
${ID_City} =  id=ApplicantMailingCity
${ID_State} =  id=ApplicantMailingState
${RE_County_ID}=  id=ApplicantMailingCounty
${ID_Zip-Code} =  id=ApplicantMailingZip
${IDcontinue} =  //input[@id='continueButton']
${ID_wait-One-moment-please} =  //*[@id="lb_please_wait"]/div/div/div/p  #//div[@id='lb_please_wait']/div/div/div/p
${ID_Pleasewait} =  //*[@id="pleaseWait"]/div/div  #//div[@id='pleaseWait']/div/div/span
${ID-GQ-NRDS ID-RE} =  id=MemberNRDSExplanation
${ID-GQ-Agreement-Explaination} =  id=ExclusiveListingAgreement_Explanation
${ID-GQ-Firm-Type} =  id=GeneralPartyInfoNameInfoLegalEntityCd
${Name-GQ-License3Yrs} =  LicenseLessThan3
${ID-GQ-FranchiseName} =  id=PartOfRealEstateFranchiseName
${ID-Total-claims} =  id=NumberOfClaims
${ID-Total-incurred-amount} =  id=TotalIncurredAmount
${ID-Date-of-claim} =  id=dateOfClaim0
${ID-Description-Claim} =  id=descOfClaim0
${ID-Open-Closed} =  id=claimStatus0
${ID-Total-Incurred} =  id=totalIncurredAmt0
${ID-Date-Circumstance} =  id=eoDateOfClaim0
${ID-Date-Description} =  id=eoDescOfClaim0
${ID-OP-Developer} =  id=develoeprName0
${ID-OP-Ownership} =  id=ownershipPct0
${ID-OP-Commission} =  id=annualComm0
${ID-OP-ServiceType} =  id=typeOfService0
${ID-OP-Description} =  id=desc0
${ID-OP-Units} =  id=numUnits0
${ID-OP-Lease25} =  id=Own25PctLeaseExplanation
${ID-OP-Sell25} =  id=Own25PctSellExplanation
${ID-OP-Manage25} =  id=Own25PctManageExplanation
${ID-OP-DerEx} =  id=DeriveMorethan25PctExplanation
${ID-OP-ExclEx} =  id=ExclusiveListingExplanation
${ID-PC-Policy-Period-RE} =  id=policyPeriodEffectiveDate0
${ID-PC-Limit-Liability-RE} =  limitOfLiability0
${ID-PC-Deductible-RE} =  deductible0
${ID-PC-Annual-Premium-RE} =  annualPremium0
${ID-PC-Insurance-Carrier-RE} =  insuranceCarrier0
${ID-PC-retroactive-RE} =  id=RetroactiveDate
${ID-Billing-preferences} =  id=billingPreferences
${ID-Payment plan} =  id=DBPayPlan
${ID-primary-contact} =  id=accntgnPrmryCntct_0

${ID-licence-suspension} =  id=QuestionAnswerLicenseRevokedExplanation
${ID-many-years-held-licence-agent} =  id=LicenseTermAgent
${ID-many-years-licence-broker} =  id=LicenseTermBroker

${ID-Staff-Principals-partners-directors-FT} =  id=numEmployeesFullTime00
${ID-Staff-REagents-brokers-independent-contractors-FT} =  id=numEmployeesFullTime0
${ID-Staff-REagents-brokers-independent-contractors-PT} =  id=numEmployeesPartTime0
${ID-Staff-Property-managers-FT} =  id=numEmployeesFullTime1
${ID-Staff-Property-managers-PT} =  id=numEmployeesPartTime1
${ID-Staff-Total-Maintenance-FT} =  id=numMaintenceStaff1
${ID-Staff-Appraisers-FT} =  id=numEmployeesFullTime2
${ID-Staff-Appraisers-PT} =  id=numPartTime2
${ID-Staff-Referral-FT} =  id=numFullTime3
${ID-Staff-Referral-PT} =  id=numPartTime3
${ID-Staff-Clerical/administrative-FT} =  id=numFullTime4
${ID-Staff-Clerical/administrative-PT} =  id=numPartTime4
${ID-Staff-Other-FT} =  id=numFullTime5
${ID-Staff-Other-PT} =  id=numPartTime5
${ID-held-these-real-estate-licenses} =  id=ProducerInfoLicenseLicenseTermOtherClass
${ID-Staff-Information} =  id=LicenseTermOther
${IFAS} =  Revenue
${check} =  YesNo
${AI_TNum} =  TransactionNum
${AI_Inc} =  Income
${ID-Staff-Please-describe} =  id=OtherDesc1

${ID-AI-applicant-total-gross-income-date} =  id=ErrorsAndOmissionsLineBusiness_BusinessInfo_FinancialStatementInfo_FiscalDate

${ID-AII-Average-Sale-price-RP} =  id=avgSalePrcResProp
${ID-AII-Percentage-Home-Prot-RP} =  id=prcntHomeProtPrgm
${ID-AII-Percentage-Disclosure-RP} =  id=prctResPropSold
${ID-AII-Applicant-Buyer-Seller-RP} =  id=byrSllrPrcnt
${ID-AII-Agent-Buyer-Seller-RP} =  id=sameAgntbyrSllrPrcnt
${ID-AII-Percentage-Forclosure} =  id=forclosurePrcnt

${ID-RM-12months-75%-applicant-staff} =  ErrorsAndOmissionsLineBusiness.QuestionAnswer[QuestionCd='NatlAssociationOfRealtors'].YesNoCd

${ID-IP-EffectiveDate} =  id=effectiveDateIssuance
${ID-IP-Premium} =  id=quoteOptionTotalPremium
${ID-IP-Premium1} =  //input[contains(@id, 'quoteOptionTotalPremium')]

${ID-Alert-display} =  id=initialDisplayMessages

${ID-FileType} =  id=fileTypeCode

${ID-V2portal-refresh} =  id=saveAndExitButton
${ID-UMS-BIND/ISSUE-Tab} =  link=BIND/ISSUE
${ID-UMS-Payments-link} =  link=Payments
${ID-UMS-Paymentplan} =  id=PaymentPlan


${ID-duplicatepolicy-error} =  id=referredUWMsgId
${ID-v2-homepage} =  //*[@id="home"]
${ID-BI-Billing_preferences}=  id=billingPreferences
${ID-BCI-Billing-preferences-IA} =  id=billingPreferencesIA

@{all-list-of-states} =  Alabama  Alaska  Arizona  Arkansas  California  Colorado  Connecticut  Delaware  District Of Columbia  Florida  Georgia  Hawaii  Idaho  Illinois  Indiana  Iowa  Kansas  Kentucky  Louisiana  Maine  Maryland  Massachusetts  Michigan  Minnesota  Mississippi  Missouri  Montana  Nebraska  Nevada  New Hampshire  New Jersey  New Mexico  New York  North Carolina  North Dakota  Ohio  Oklahoma  Oregon  Pennsylvania  Puerto Rico  Rhode Island  South Carolina  South Dakota  Tennessee  Texas  Utah  Vermont  Virginia  Virgin Islands  Washington  West Virginia  Wisconsin  Wyoming
@{firm-types} =  Sole Proprietorship  Partnership/LLP  Corporation  Limited Liability Company  Independent Contractor  Other
&{page_list} =  agencyInformationPage_menuLink=Insurance Agency Information  genInformationPage_menuLink=General Information  generalQuestionsPage_menuLink=General Questions  claimsHistoryPage_menuLink=Claims History  staffInformationPage_menuLink=Staff Information  incomeFromAlternativeServicesPage_menuLink=Income From Alternative Services  ownedProperty_menuLink=Owned Properties  applicantIncomePage_menuLink=Applicant Income  firmIncomeAdditionalInformationPage_menuLink=Additional Income Information  riskManagementPage_menuLink=Risk Management  priorCoveragePage_menuLink=Prior Coverage  coverageOptionsPage_menuLink=Quote Options  coverageSelection_menuLink=Quote Options  quoteDisplayPage_menuLink=Generate Quote  rapidQuoteLinksPage_menuLink=View Quote Letter  billingContact_menuLink=Billing and Contact Information  issuePolicyPage_menuLink=Issue Policy  policySummary_menuLink=Policy Summary

*** Keywords ***
Rapid quote
        Login V2
        Login Real Estate E&O
        Insurance Agency Information
        General Information
        General Questions
        Claims History
        Prior Coverage
        Quote Options
        View Quote
        Billing and Contact Information
        Issue Policy

Long Form
        Login V2
        Login Real Estate E&O
        Insurance Agency Information
        General Information
        General Questions
        Claims History
        Staff Information
        Income From Alternative Services
        Owned Properties
        Applicant Income
        Additional Income Information
        Risk Management
        Prior coverage
        Quote Options
        UMS remove hold
        Generate Quote
        Billing and Contact Information
        Issue Policy

Rapid quote Check Retro
        [Arguments]  ${retro_type}
        Rapid quote  ${retro_type}


General information
        [Arguments]  ${data_to_read}=Value1
        run keyword if  '${data_to_read}' != 'Value1'  Reassign values  General Information  ${file_path}  ${data_to_read}
        RE General Information  @{test_data['General Information']}  @{test_data['General Questions'][0:6]}

General Questions
        RE General Questions   @{test_data['General Questions']}

Claims History
        RE Claims History  @{test_data['Claims History']}

Staff Information
        RE Staff Information  @{test_data['Staff Information']}

Income From Alternative Services
        RE Income From Alternative Services  @{test_data['Income From Alternative Services']}

Owned Properties
        RE Owned Properties  @{test_data['Owned properties']}

Applicant Income
        RE Applicant Income  @{test_data['Applicant Income']}

Additional Income Information
        RE Additional Income Information  @{test_data['Additional Income information']}

Risk Management
        RE Risk Management  @{test_data['Risk Management']}

Prior Coverage
        RE Prior Coverage  @{test_data['Prior Coverage']}

Quote Options
        RE Quote Options  @{test_data['Quote Options']}

View Quote
        RE View Quote  @{test_data['Quote Options']}

Generate quote
        RE Generate quote  @{test_data['Quote Options']}

Billing and Contact Information
        RE Billing and Contact Information  @{test_data['Billing and Contact Information']}

Issue policy
        RE Issue policy

#Login V2
        #Login to Victor page


Login Real Estate E&O
        Navigate to Real Estate E&O

Navigate to Real Estate E&O
        set selenium implicit wait  30
        wait until element is enabled  ${Real_Estate_E&O}  10
        click element  ${Real_Estate_E&O}


#Continue Click RE
        #set selenium implicit wait  5
        #set focus to element  ${IDcontinue}
        #sleep  0.5
        #mouse up  ${IDcontinue}
        #click element  ${IDcontinue}  CTRL+ALT

#Check and click
        #[Arguments]  ${page}
        #wait until element is not visible  ${ID_wait-One-moment-please}  30
        #wait until element is not visible  ${ID_Pleasewait}   30
        #${title} =  Get element attribute  class:active.list-group-item  id
        #${cur_page} =  Get from dictionary  ${page_list_IA}  ${title}
        #run keyword if  '${page}' != '${cur_page}'  run keywords  Wait Until Element Is Enabled  link:${page}  AND  Click element  link:${page}


#Check and enter input
        #[Arguments]  ${locator}  ${data}
        #Run Keyword if  "${data}" != "nan"  Run Keywords  Clear element text  ${locator}  AND  press keys  ${locator}  ${data}

#Check and enter date
        #[Arguments]  ${locator}  ${date}
        #@{jscriptid} =  Split string  ${locator}  =
        #Run Keyword if  "${date}" != "nan"  Run Keywords  press keys  ${locator}  '${date}'  AND  execute javascript  document.getElementById("${jscriptid[1]}").value = "${date}";

#Check and select from list by label
        #[Arguments]  ${locator}  ${data}
        #Run Keyword if  "${data}" != "nan"  select from list by label  ${locator}  ${data}

#Write Log
        #[Arguments]  ${msg}
        #Set Test Message  ${msg}\n  append=yes
        #Log to console  ${msg}

Reassign values
        [Arguments]  ${page-name}  ${file_path}  ${data_to_read}
        ${new_data} =  Read data file  ${file_path}  ${data_to_read}
        Set to dictionary  ${test_data}  ${page-name}  ${new_data['${page-name}']}

#Check expiry greater than 1 year
        #[Arguments]  ${action}  ${msg}
        #Check and click  General Information
        #${exp-date} =  Get value  ${ID_ExpirationDate}
        #${new-exp-date} =  Add time to date  ${exp-date}  365 days  date_format=%m-%d-%Y
        #${format-new-exp-date} =  Convert date  ${new-exp-date}  result_format=%m-%d-%Y
        #Check and enter date  ${ID_ExpirationDate}  ${format-new-exp-date}
        #Press Keys  ${ID_ExpirationDate}  RETURN
        #Continue Click RE
        #${alert-msg} =  Get text  ${ID-Alert-display}
        #Run Keyword if  '${msg}' == '${alert-msg}'  Write Log  Expiry date error message check successful  ELSE  Write Log  Expiry date error message check failed
        #Check and perform action  ${action}  ${ID_ExpirationDate}  ${exp-date}

Check number of claims
        [Arguments]  ${action}  ${msg}
        Check and click  Claims History
        ${claims-count} =  Get value  ${ID-Total-claims}
        ${new-claims-count} =  Set variable  1000
        Check and enter input  ${ID-Total-claims}  ${new-claims-count}
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        ${alert-msg} =  Get text  ${ID-Alert-display}
        Run Keyword if  '${msg}' == '${alert-msg}'  Write Log  Claims history details warning check successful  ELSE  Write Log  Claims history details warning check failed
        Check and click  Claims History
        Check and perform action  ${action}  ${ID-Total-claims}  ${claims-count}

Check UW hold
        [Arguments]  ${action}  ${msg}
        ${alert-msg} =  Get text  ${ID-Alert-display}
        Run Keyword if  '${msg}' == '${alert-msg}'  Write Log  UW hold message check successful  ELSE  Write Log  UW hold message check failed
        Check and perform action  ${action}

Check quote options
        [Arguments]  ${action}  ${msg}
        ${alert-msg} =  Get text  ${ID-Alert-display}
        Run Keyword if  '${msg}' == '${alert-msg}'  Write Log  Select premium warning message check successful  ELSE  Write Log  Select premium warning message check failed

Check policy info
        ${gen-effective-date} =  Get value  ${ID-IP-EffectiveDate}
        ${gen-policy-premium} =  Get value  ${ID-IP-Premium1}
        Run Keyword if  '${effective-date}' == '${gen-effective-date}'  Write Log  Effective date check done. Generated policy effective date is ${gen-effective-date}  ELSE  Write Log  Generated policy effective date mismatch. Please check
        Run Keyword if  '${selected-premium}' == '${gen-policy-premium}'  Write Log  Premium amount check done. Final premium is ${gen-policy-premium}  ELSE  Write Log  Premium amount mismatch. Please check
        #log to console  ${gen-effective-date}${gen-policy-premium}${effective-date}${selected-premium}

Check and perform action
        [Arguments]  ${action}  ${locator}=default  ${value}=default
        Run Keyword if  '${action}' == 'Rollback'  Run Keywords  Check and enter date  ${locator}  ${value}  AND  Continue Click RE
        Run Keyword if  '${action}' == 'Continue'  Continue Click RE

RE General Information
        Check and click  General Information
        [Arguments]  ${dummy}  ${Applicant-Name}  ${First-Name}  ${Last-Name}  ${E-mailAddress}  ${effective-date}  ${expiry-date}  ${Address-Line}  ${City}  ${State-value}  ${Zip-Code}  ${REALTORS}  ${NRDS-ID}  ${franchise}  ${franchiseName}  ${other-franchisename}  ${applicant's-firm}
        Check and enter input  ${IDFirmName}  ${Applicant-Name}
        Check and enter input  ${IDFirstName}  ${First-Name}
        Check and enter input  ${IDLastName}  ${Last-Name}
        Check and enter input  ${ID_E-mailAddress}  ${E-mailAddress}
        run keyword if  '${REALTORS}' == 'YES'  Run keywords  select radio button    MemberNRDS   ${REALTORS}  AND  Provide the applicant's NRDS ID  ${NRDS-ID}
        run keyword if  '${franchise}' == 'YES'  Run keywords  select radio button    PartOfRealEstateFranchise  ${franchise}  AND  Select the applicant's franchise  ${franchiseName}
        Check and select from list by label  ${ID-GQ-Firm-Type}  ${applicant's-firm}
        @{firmtype} =  Get list items   ${ID-GQ-Firm-Type}
        Remove from list  ${firmtype}  0
        ${all-firm-types} =  Run Keyword and Return Status  Lists should be equal  ${firm-types}  ${firmtype}
        Run Keyword if  ${all-firm-types}   Write Log  All firm types available in the dropdown list  ELSE  Write Log  There are some firm types missing!Please check
        ${Date} =  timelocal
        run keyword if  '${effective-date}' == 'current'  Set test variable  ${effective-date}  ${Date}  ELSE  Set test variable  ${effective-date}  ${effective-date}
        Check and enter date  id=${ID-GI-Effective-Date-RE}  ${effective-date}
        #log to console  ${effective-date}
        Press Keys  ${ID_EffectiveDate}  RETURN
        Check and enter input  ${ID_AddressLine}  ${Address-Line}
        Check and enter input  ${ID_City}  ${City}
        @{states} =  Get list items   ${ID_State}
        Remove from list  ${states}  0
        Remove from list  ${states}  0
        #log to console  ${states}
        ${all-states} =  Run Keyword and Return Status  Lists should be equal  ${states}  ${all-list-of-states}
        Run Keyword if  ${all-states}   Write Log  All US states are available in the dropdown list  ELSE  Write Log  Some US states are missing!Please check
        Check and select from list by label  ${ID_State}  ${State-value}
#        Check And Enter Input   ${RE_County_ID}  UNION
        Check and enter input  ${ID_Zip-Code}  ${Zip-Code}
        ${exp-date} =  Get value  ${ID_ExpirationDate}
        ${calc-date} =  Add time to date  ${effective-date}  365 days  date_format=%m-%d-%Y
        ${format-calc-date} =  Convert date  ${calc-date}  result_format=%m-%d-%Y
        Run Keyword if  '${format-calc-date}' == '${exp-date}'  Write Log  Expiry date check successful.Effective date is ${effective-date} and Expiry date is ${exp-date}  ELSE  Write Log  Expiry date check failed.Effective date is ${effective-date} and Expiry date is ${exp-date}
        set test variable  ${policy-exp-date}  ${exp-date}
        #execute javascript   $('#ApplicantMailingZip.form-control').val('${Zip-Code}')
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        ${sign-check} =  Run Keyword and Return status  Page should contain  Suggestions
        Run Keyword if  ${sign-check}  Suggestion Name Address match click
        Run Keyword if  'Check expiry greater than 1 year' in ${test_checks}  Check expiry greater than 1 year  @{test_checks['Check expiry greater than 1 year']}
        wait until element is not visible  ${IDFirmName}

RE General Questions
        Check and click  General Questions
        [Arguments]  ${REALTORS}  ${NRDS-ID}  ${franchise}  ${franchiseName}  ${other-franchisename}  ${applicant's-firm}  ${licensed}  ${gross-commission}  ${services-involving}   ${licensed5}  ${revenues25%}  ${agreement}  ${detail}
        wait until element is visible  ${Name-GQ-License3Yrs}
        select radio button  ${Name-GQ-License3Yrs}  ${licensed}
        run keyword if  '${licensed}' == 'NO'  Applicant anticipate making $150,000 gross commission  ${gross-commission}  ${services-involving}  ${licensed5}  ${revenues25%}  ${agreement}  ${detail}
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Provide the applicant's NRDS ID
        [Arguments]  ${NRDS-ID}
        Check and enter input  ${ID-GQ-NRDS ID-RE}   ${NRDS-ID}

Select the applicant's franchise
        [Arguments]  ${franchiseName}
        Check and select from list by label    ${ID-GQ-FranchiseName}  ${franchiseName}

Applicant anticipate making $150,000 gross commission
        [Arguments]  ${gross-commission}  ${services-involving}  ${licensed5}  ${revenues25%}  ${agreement}  ${detail}
        select radio button  GrossCommision    ${gross-commission}
        run keyword if  '${gross-commission}' == 'NO'  Applicant provide services involving  ${services-involving}  ${licensed5}  ${revenues25%}  ${agreement}  ${detail}

Applicant provide services involving
        [Arguments]  ${services-involving}  ${licensed5}  ${revenues25%}  ${agreement}  ${detail}
        select radio button  ApplicantProvideServices    ${services-involving}
        run keyword if  '${services-involving}' == 'NO'  Employ more than 5 licensed real estate agents  ${licensed5}  ${revenues25%}  ${agreement}  ${detail}

Employ more than 5 licensed real estate agents
        [Arguments]  ${licensed5}  ${revenues25%}  ${agreement}  ${detail}
        select radio button  MoreThan5Agents    ${licensed5}
        run keyword if  '${licensed5}' == 'NO'  Total revenues from a single client  ${revenues25%}  ${agreement}  ${detail}

Total revenues from a single client
        [Arguments]  ${revenues25%}  ${agreement}  ${detail}
        select radio button  MoreThan25PctRevenueSingleClient    ${revenues25%}
        run keyword if  '${revenues25%}' == 'NO'  Maintain exclusive listing agreement  ${agreement}  ${detail}

Maintain exclusive listing agreement
        [Arguments]  ${agreement}  ${detail}
        select radio button  ExclusiveListingAgreement    ${agreement}
        run keyword if  '${agreement}' == 'YES'  Enter agreement detail  ${detail}

Enter agreement detail
        [Arguments]  ${detail}
        Check and enter input  ${ID-GQ-Agreement-Explainatio}  ${detail}

RE Claims History
        Check and click  Claims History
        [Arguments]  ${any-claims}  ${Total-number}  ${Claim-amount}  ${claim-date}  ${claim-description}  ${status}  ${total-incurred}  ${aware}  ${date}  ${description}  ${revoked}  ${detail}
        select radio button  ClaimsYesNo  ${any-claims}
        run keyword if  '${any-claims}' == 'YES'  Total number claims amount  ${Total-number}  ${Claim-amount}  ${claim-date}  ${claim-description}  ${status}  ${total-incurred}
        select radio button    AwareActYesNo  ${aware}
        run keyword if  '${aware}' == 'YES'  Date of Circumstance Description aware  ${date}  ${description}
        select radio button    QuestionAnswerLicenseRevoked  ${revoked}
        run keyword if  '${revoked}' == 'YES'  Please provide details revoked/suspended  ${detail}
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        Run Keyword if  'Check number of claims' in ${test_checks}  Check number of claims  @{test_checks['Check number of claims']}

Total number claims amount
        [Arguments]  ${Total-number}  ${Claim-amount}  ${claim-date}  ${claim-description}  ${status}  ${total-incurred}
        Check and enter input  ${ID-Total-claims}  ${Total-number}
        Check and enter input  ${ID-Total-incurred-amount}  ${Claim-amount}
        run keyword if  2 < ${Total-number} < 999  Date & Description Of Claim Total Incurred  ${claim-date}  ${claim-description}  ${status}  ${total-incurred}

Date & Description Of Claim Total Incurred
        [Arguments]  ${claim-date}  ${claim-description}  ${status}  ${total-incurred}
        #log to console  ${claim-date}
        Check and enter date  ${ID-Date-of-claim}  ${claim-date}
        #execute javascript  document.getElementById('dateOfClaim0').value = '${claim-date}'
        Check and enter input  ${ID-Description-Claim}   ${claim-description}
        Check and select from list by label  ${ID-Open-Closed}  ${status}
        Check and enter input  ${ID-Total-Incurred}  ${total-incurred}

Date of Circumstance Description aware
        [Arguments]  ${date}  ${description}
        Check and enter date  ${ID-Date-Circumstance}   ${date}
        #execute javascript  document.getElementById("eoDateOfClaim0").value = '${date}'
        Check and enter input  ${ID-Date-Description}  ${description}

Please provide details revoked/suspended
        [Arguments]  ${detail}
        Check and enter input  ${ID-licence-suspension}  ${detail}


RE Staff Information
        Check and click  Staff Information
        [Arguments]    ${agent}  ${broker}  ${professional}  ${other-list}  ${years}  ${Principals-ft}  ${contractors-ft}  ${contractors-pt}  ${managers-ft}  ${managers-pt}  ${maintenance-ft}  ${Appraisers-ft}  ${Appraisers-pt}  ${Referral-ft}  ${Referral-pt}  ${Clerical-ft}  ${Clerical-pt}  ${Others-ft}  ${Others-pt}  ${Please-describe}
        run keyword if  ${agent} > 0  Check and enter input  ${ID-many-years-held-licence-agent}  ${agent}
        run keyword if  ${broker} > 0  Check and enter input  ${ID-many-years-licence-broker}   ${broker}
        run keyword if  '${professional}' == 'YES'  Run keywords  Please list the others license(s) held  ${other-list}  ${years}  AND  Select Radio Button  anyOtherProfLicenses   1
        run keyword if  ${Principals-ft} > 0  Check and enter input  ${ID-Staff-Principals-partners-directors-FT}   ${Principals-ft}
        run keyword if  ${contractors-ft} > 0   Check and enter input  ${ID-Staff-REagents-brokers-independent-contractors-FT}   ${contractors-ft}
        run keyword if  ${contractors-pt} > 0   Check and enter input  ${ID-Staff-REagents-brokers-independent-contractors-PT}   ${contractors-pt}
        run keyword if  ${managers-ft} > 0      Check and enter input  ${ID-Staff-Property-managers-FT}   ${managers-ft}
        run keyword if  ${managers-pt} > 0      Check and enter input  ${ID-Staff-Property-managers-PT}   ${managers-pt}
        run keyword if  ${managers-ft} > 0 or ${managers-pt} > 0  press keys  ${ID-Staff-Property-managers-FT}  RETURN
        run keyword if  ${managers-ft} > 0 or ${managers-pt} > 0   Check and enter input  ${ID-Staff-Total-Maintenance-FT}   ${maintenance-ft}
        run keyword if  ${Appraisers-ft} > 0    Check and enter input  ${ID-Staff-Appraisers-FT}   ${Appraisers-ft}
        run keyword if  ${Appraisers-pt} > 0    Check and enter input  ${ID-Staff-Appraisers-PT}   ${Appraisers-pt}
        run keyword if  ${Referral-ft} > 0      Check and enter input  ${ID-Staff-Referral-FT}   ${Referral-ft}
        run keyword if  ${Referral-pt} > 0      Check and enter input  ${ID-Staff-Referral-PT}   ${Referral-pt}
        run keyword if  ${Clerical-ft} > 0      Check and enter input  ${ID-Staff-Clerical/administrative-FT}  ${Clerical-ft}
        run keyword if  ${Clerical-pt} > 0      Check and enter input  ${ID-Staff-Clerical/administrative-PT}  ${Clerical-pt}
        run keyword if  ${Others-ft} > 0        Check and enter input  ${ID-Staff-Other-FT}   ${Others-ft}
        run keyword if  ${Others-pt} > 0        Check and enter input  ${ID-Staff-Other-FT}   ${Others-pt}
        wait until element is not visible  ${ID_Pleasewait}   30
        press keys  ${ID-Staff-Other-PT}  RETURN
        run keyword if  ${Others-ft} > 0 or ${Others-pt} > 0  Check and enter input  ${ID-Staff-Please-describe}   ${Please-describe}
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Please list the others license(s) held
        [Arguments]  ${other-list}  ${years}
        Check and enter input  ${ID-held-these-real-estate-licenses}  ${other-list}
        Check and enter input  ${ID-Staff-Information}  ${years}


RE Income From Alternative Services
        Check and click  Income From Alternative Services
        [Arguments]    ${involved}  ${EIS}  ${EIS_percentage}  ${PP}  ${PP_percentage}  ${exc}  ${exc_percentage}  ${RED}  ${RED_percentage}  ${CM}  ${CM_percentage}  ${ST}  ${ST_percentage}  ${AM}  ${AM_percentage}  ${TAE}  ${TAE_percentage}  ${HMRV}  ${HMRV_percentage}  ${MB}  ${MB_percentage}  ${FMG}  ${FMG_percentage}  ${BV}  ${BV_percentage}
        Select Radio Button  AnyAlternativeIncome  ${involved}
        run keyword if  '${involved}' == 'YES'  Enter other services info  ${EIS}  ${EIS_percentage}  ${PP}  ${PP_percentage}  ${exc}  ${exc_percentage}  ${RED}  ${RED_percentage}  ${CM}  ${CM_percentage}  ${ST}  ${ST_percentage}  ${AM}  ${AM_percentage}  ${TAE}  ${TAE_percentage}  ${HMRV}  ${HMRV_percentage}  ${MB}  ${MB_percentage}  ${FMG}  ${FMG_percentage}  ${BV}  ${BV_percentage}
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Enter other services info
        [Arguments]  ${EIS}  ${EIS_percentage}  ${PP}  ${PP_percentage}  ${exc}  ${exc_percentage}  ${RED}  ${RED_percentage}  ${CM}  ${CM_percentage}  ${ST}  ${ST_percentage}  ${AM}  ${AM_percentage}  ${TAE}  ${TAE_percentage}  ${HMRV}  ${HMRV_percentage}  ${MB}  ${MB_percentage}  ${FMG}  ${FMG_percentage}  ${BV}  ${BV_percentage}
        run keyword if  '${EIS}' == 'YES'  Applicant involved services listed  EIS  ${EIS_percentage}
        run keyword if  '${PP}' == 'YES'  Applicant involved services listed  PP  ${PP_percentage}
        run keyword if  '${exc}' == 'YES'  Applicant involved services listed  exc  ${exc_percentage}
        run keyword if  '${RED}' == 'YES'  Applicant involved services listed  RED  ${RED_percentage}
        run keyword if  '${CM}' == 'YES'  Applicant involved services listed  CM  ${CM_percentage}
        run keyword if  '${ST}' == 'YES'  Applicant involved services listed  ST  ${ST_percentage}
        run keyword if  '${AM}' == 'YES'  Applicant involved services listed  AM  ${AM_percentage}
        run keyword if  '${TAE}' == 'YES'  Applicant involved services listed  TAE  ${TAE_percentage}
        run keyword if  '${HMRV}' == 'YES'  Applicant involved services listed  HMRV  ${HMRV_percentage}
        run keyword if  '${MB}' == 'YES'  Applicant involved services listed  MB  ${MB_percentage}
        run keyword if  '${FMG}' == 'YES'  Applicant involved services listed  FMG  ${FMG_percentage}
        run keyword if  '${BV}' == 'YES'  Applicant involved services listed  BV  ${BV_percentage}


Applicant involved services listed
        [Arguments]    ${element}  ${percentage}
        Select checkbox  id=${element}${check}
        wait until element is not visible  ${ID_Pleasewait}   5
        Check and enter input  id=${element}${IFAS}   ${percentage}
        wait until element is not visible  ${ID_Pleasewait}   5
        execute javascript  document.getElementById("${element}${IFAS}").value = '${percentage}'

RE Owned Properties
        Check and click  Owned Properties
        [Arguments]    ${services}  ${own}  ${sell}  ${name}  ${ownership}  ${comm}  ${type}  ${description}  ${units}  ${lease25%}  ${lease_percentage}  ${sell25%}  ${sell_percentage}  ${manage25%}  ${manage_percentage}  ${single%}  ${explain}  ${exclusive}  ${explain1}
        Select Radio Button  OwnedPropServices  ${services}
        run keyword if  '${services}' == 'YES'  Own Property Info  ${own}  ${sell}  ${name}  ${ownership}  ${comm}  ${type}  ${description}  ${units}  ${lease25%}  ${lease_percentage}
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Own Property Info
        [Arguments]  ${own}  ${sell}  ${name}  ${ownership}  ${comm}  ${type}  ${description}  ${units}  ${lease25%}  ${lease_percentage}
        run keyword if  '${own}' == 'YES'  Run keywords  click element  id=constructDevelopPropYesNo  AND  Property additional details  ${sell}  ${name}  ${ownership}  ${comm}  ${type}  ${description}  ${units}
        run keyword if  '${lease25%}' == 'YES'  Enter additional info  Own25PctLeaseYesNo  ${ID-OP-Lease25}  ${lease_percentage}
        run keyword if  '${sell25%}' == 'YES'  Enter additional info  Own25PctSellYesNo  ${ID-OP-Sell25}  ${sell_percentage}
        run keyword if  '${manage25%}' == 'YES'  Enter additional info  Own25PctManageYesNo  ${ID-OP-Manage25}  ${manage_percentage}
        run keyword if  '${single%}' == 'YES'  Enter additional info  DeriveMorethan25PctYesNo  ${ID-OP-DerEx}  ${explain}
        run keyword if  '${exclusive}' == 'YES'  Enter additional info  ExclusiveListingExplanation  ${ID-OP-ExclEx}  ${explain1}

Property additional details
        [Arguments]  ${sell}  ${name}  ${ownership}  ${comm}  ${type}  ${description}  ${units}
        Select radio button  sellPropDevOth  ${sell}
        Check and enter input  ${ID-OP-Developer}  ${name}
        Check and enter input  ${ID-OP-Ownership}  ${ownership}
        Check and enter input  ${ID-OP-Commission}  ${comm}
        Check and enter input  ${ID-OP-ServiceType}  ${type}
        Check and enter input  ${ID-OP-Description}  ${description}
        Check and enter input  ${ID-OP-Units}  ${units}

Enter additional info
        [Arguments]  ${chk-box}  ${id}  ${info}
        click element  id=${chk-box}
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        Check and enter input  ${id}  ${info}

RE Applicant Income
        Check and click  Applicant Income
        [Arguments]    ${date}  ${resi-Trans}  ${resi-Inc}  ${comm-Trans}  ${comm-Inc}  ${land-Trans}  ${land-Inc}  ${farm-Trans}  ${farm-Inc}  ${ResR-Trans}  ${ResR-Inc}  ${ComR-Trans}  ${ComR-Inc}  ${ReaE-Trans}  ${ReaE-Inc}  ${ResP-Trans}  ${ResP-Inc}  ${ComH-Trans}  ${ComH-Inc}  ${Mgmt-Trans}  ${Mgmt-Inc}  ${Mrtg-Trans}  ${Mrtg-Inc}  ${BusO-Trans}  ${BusO-Inc}  ${Real-Trans}  ${Real-Inc}  ${Auct-Trans}  ${Auct-Inc}  ${Refe-Trans}  ${Refe-Inc}  ${BPO-Trans}  ${BPO-Inc}  ${Othe-Trans}  ${Othe-Inc}
        Check and enter date  ${ID-AI-applicant-total-gross-income-date}   ${date}
        run keyword if  ${resi-Trans} > 0  Transaction details  residentialBrokerage  ${resi-Trans}  ${resi-Inc}
        run keyword if  ${comm-Trans} > 0  Transaction details  commercialInd  ${comm-Trans}  ${comm-Inc}
        run keyword if  ${land-Trans} > 0  Transaction details  landLot  ${land-Trans}  ${land-Inc}
        run keyword if  ${farm-Trans} > 0  Transaction details  farmAgri  ${farm-Trans}  ${farm-Inc}
        run keyword if  ${ResR-Trans} > 0  Transaction details  ResReaEstApp  ${ResR-Trans}  ${ResR-Inc}
        run keyword if  ${ComR-Trans} > 0  Transaction details  ComReaEstApp  ${ComR-Trans}  ${ComR-Inc}
        run keyword if  ${ReaE-Trans} > 0  Transaction details  ReaEstLeasFees  ${ReaE-Trans}  ${ReaE-Inc}
        run keyword if  ${ResP-Trans} > 0  Transaction details  ResPropMgmtFees  ${ResP-Trans}  ${ResP-Inc}
        run keyword if  ${ComH-Trans} > 0  Transaction details  ComHabPropMgmtFees  ${ComH-Trans}  ${ComH-Inc}
        run keyword if  ${Mgmt-Trans} > 0  Transaction details  MgmtAssoc  ${Mgmt-Trans}  ${Mgmt-Inc}
        run keyword if  ${Mrtg-Trans} > 0  Transaction details  MrtgBrkr  ${Mrtg-Trans}  ${Mrtg-Inc}
        run keyword if  ${BusO-Trans} > 0  Transaction details  BusOppBrkg  ${BusO-Trans}  ${BusO-Inc}
        run keyword if  ${Real-Trans} > 0  Transaction details  RealEstCons  ${Real-Trans}  ${Real-Inc}
        run keyword if  ${Auct-Trans} > 0  Transaction details  Auctn  ${Auct-Trans}  ${Auct-Inc}
        run keyword if  ${Refe-Trans} > 0  Transaction details  Referrals  ${Refe-Trans}  ${Refe-Inc}
        run keyword if  ${BPO-Trans} > 0  Transaction details  BPO  ${BPO-Trans}  ${BPO-Inc}
        run keyword if  ${Othe-Trans} > 0  Transaction details  Other  ${Othe-Trans}  ${Othe-Inc}
        wait until element is not visible  ${ID_Pleasewait}   30
        Continue Click RE
        #execute javascript  document.getElementById('continueButton').click()
        #execute javascript  $("#continueButton.btn.btn-primary").click()
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Transaction details
        [Arguments]  ${element}  ${Transactions}  ${Income}
        Check and enter input  id=${element}${AI_TNum}  ${Transactions}
        Check and enter input  id=${element}${AI_Inc}  ${Income}

RE Additional Income Information
        Check and click  Additional Income Information
        [Arguments]    ${agreeement}  ${sale-price}  ${warranty}  ${disclosure}  ${represent}  ${same-agent}  ${foreclosure}  ${sfr}  ${mfr}  ${lvl}  ${cip}  ${frf}  ${etp}  ${lds}  ${cpi}  ${row}  ${pp}  ${fzc}  ${other}  ${origin}  ${servicing}  ${uw}  ${lfwc}  ${soliciting}  ${repurchase}  ${resi-exist}  ${resi-new}  ${comm-exist}  ${comm-new}  ${other-exist}  ${other-new}  ${describe}  ${own-funds}
        Check and enter input  ${ID-AII-Average-Sale-price-RP}  ${sale-price}
        Check and enter input  ${ID-AII-Percentage-Home-Prot-RP}  ${warranty}
        Check and enter input  ${ID-AII-Percentage-Disclosure-RP}  ${disclosure}
        Check and enter input  ${ID-AII-Applicant-Buyer-Seller-RP}  ${represent}
        Check and enter input  ${ID-AII-Agent-Buyer-Seller-RP}  ${same-agent}
        Check and enter input  ${ID-AII-Percentage-Forclosure}  ${foreclosure}
        Run keyword if   ${sfr} > 0  Check and enter input  id=singleFamResPrcnt  ${sfr}
        wait until element is not visible  ${ID_Pleasewait}   30
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Set property management
        [Arguments]  ${prop-flag}



RE Risk Management
        Check and click  Risk Management
        [Arguments]    ${R1}  ${R2}  ${R3}
        select radio button  InhousePolProYesNo  ${R1}
        select radio button  AssociationContractFormsYesNo  ${R2}
        run keyword if  '${R3}' == 'YES'  click element    //input[@id="ErrorsAndOmissionsLineBusiness.QuestionAnswer[QuestionCd='NatlAssociationOfRealtors'].YesNoCd_0"]
        run keyword if  '${R3}' == 'NO'  click element    //input[@id="ErrorsAndOmissionsLineBusiness.QuestionAnswer[QuestionCd='NatlAssociationOfRealtors'].YesNoCd_1"]
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

RE Prior Coverage
        Check and click  Prior Coverage
        [Arguments]  ${e&o}  ${isfull}  ${retro-date}  ${policy-date}  ${carrier}  ${limit}  ${deductable}  ${premium}
        select radio button  REOPresent  ${e&o}
        run keyword if  '${e&o}' == 'YES'  Full retroactive coverage RE  ${isfull}  ${retro-date}  ${policy-date}  ${carrier}  ${limit}  ${deductable}  ${premium}
        wait until element is not visible  ${ID_Pleasewait}   30
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Full retroactive coverage RE
        [Arguments]  ${isfull}  ${retro-date}  ${policy-date}  ${carrier}  ${limit}  ${deductable}  ${premium}
        ${todaytime} =  timelocal
        select radio button  fullRetroactiveCoverage  ${isfull}
        run keyword if  '${isfull}' == 'NO'  Provide the retroactive RE  ${retro-date}
        Check and enter date    ${ID-PC-Policy-Period-RE}  ${policy-date}
        #execute javascript  document.getElementById('${ID-PC-Policy-Period-RE}').value = '${policy-date}'
        press keys  ${ID-PC-Policy-Period-RE}  RETURN
        Check and enter input  ${ID-PC-Insurance-Carrier-RE}  ${carrier}
        Check and enter input  ${ID-PC-Limit-Liability-RE}  ${limit}
        Check and enter input  ${ID-PC-Deductible-RE}  ${deductable}
        Check and enter input  ${ID-PC-Annual-Premium-RE}  ${premium}


Provide the retroactive RE
        [Arguments]  ${retro-date}
        ${todaytime} =  timelocal
        Check and enter date  ${ID-PC-retroactive-RE}  ${retro-date}
        press keys  ${ID-PC-retroactive-RE}  RETURN

RE Quote Options
        Check and click  Quote Options
        [Arguments]  ${option}
        ${is_test}=  Evaluate   'NonProd' in '${CONFIG_DATA['V2']['url']}'
        ${radio-index} =  Evaluate  ${option} - 1
        ${element-check} =  Run Keyword and Return status  Page should contain element  id=paymentPlan_${radio-index}
        Run Keyword if  ${element-check}  Set Payment plan  ${radio-index}
        Run Keyword if  '${is_test}' == 'True'  Continue Click RE  ELSE  close browser
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        Run Keyword if  'Check UW hold' in ${test_checks}  Check UW hold  @{test_checks['Check UW hold']}

Set Payment plan
        [Arguments]  ${radio-index}
        click element  id=paymentPlan_${radio-index}
        ${quote-value} =  Get value  id=paymentPlan_${radio-index}
        @{splitquote} =  Split string  ${quote-value}  /
        ${cur-premium} =  Set variable  $${splitquote[3]}
        #log to console  ${cur-premium}
        Set test variable  ${selected-premium}  ${cur-premium}

RE View Quote
        [Arguments]  ${option}
        Check and click  View Quote Letter
        Continue Click RE

RE Generate Quote
        Check and click  Generate Quote
        [Arguments]  ${quoteoption}
        Run Keyword if  'Check quote options' in ${test_checks}  Check quote options  @{test_checks['Check quote options']}
        click element  id=quoteOptionYesNo${quoteoption}
        Set test variable  ${quoteoption}  ${quoteoption}
        ${premium} =  Get value  ${ID-IP-Premium}${quoteoption}
        Set test variable  ${selected-premium}  ${premium}
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

RE Billing and Contact Information
        Check and click  Billing and Contact Information
        [Arguments]  ${Billing-preferencesV}  ${Payment-planV}
        click element  ${ID-Billing-preferences}
        Check and select from list by label  ${ID-Billing-preferences}  ${Billing-preferencesV}
        click element  ${ID-Payment plan}
        Check and select from list by label  ${ID-Payment plan}  ${Payment-planV}
        click element  ${ID-primary-contact}
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

RE Issue Policy
        Check and click  Issue Policy
        #Check policy info
        Continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
        ${sign-check} =  Run Keyword and Return status  Page should contain  Issued Waiting for Signature
        Run Keyword if  ${sign-check}  Write Log  Waiting for signed document  ELSE  Write Log  Policy not generated. Please check
        page should contain  You are nearly done with this policy. To finalize this transaction, please upload a client-signed copy of the application summary using the Upload a Document feature

V2 portal click on Home page
        click element  ${ID-v2-homepage}

Duplicate Policy error Quote page
         ${error-message} =  get text  ${ID-duplicatepolicy-error}
        should be equal  ${error-message}  The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.

#Suggestion Name Address match click
       # execute javascript  document.getElementById("IsUserRetainingEnteredData").click()
        #execute javascript  document.getElementById("contButton").click();

IA LOB Billing and Contact Information testcase
        [Arguments]    &{test_data}
        click element   ${ID-BCI-Billing-preferences-IA}
        Check and select from list by label   ${ID-BI-Billing_preferences}  ${test_data['Billing Preference']}
        #click element  ${ID-BI-Payment plan}
        #Check and select from list by label  ${ID-BI-Payment plan}  ${test_data['Payment Plan']}
        #click element  ${ID-BI-primary-contact}
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30

Upload Document for IA LOB
        [Arguments]    ${test_data}
        ${file}=    set variable    c:\\Users\\Default\\NTUSER.DAT
        wait until element is enabled  //span[@class="has-files"]  10
        ${title} =  Get text  id=lob-title
        #log to console  ${title}
        ${id} =  Get Regexp matches  ${title}  \\d
        ${work-id} =  Evaluate  "".join($id)
        click element  //span[@class="has-files"]
        wait until element is enabled  //*[@id="wia_upload_file"]  10
        Sleep    3
        choose file  //*[@id="wia_upload_file"]  ${file}
        Check and select from list by label  ${ID-FileType}  Signed Application
        Sleep    3
        click element  //*[text()="Upload"]
        click button  //input[@name="saveAndExitButton"]
        Click element  link:Clear All
        wait until element is enabled  //*[contains(text(),'Search Options')]
        wait until element is not visible  ${ID_wait-One-moment-please}  5
        wait until element is not visible  ${ID_Pleasewait}   5
        Click element  //*[contains(text(),'Search Options')]
        input text  id=workItemId  ${work-id}
        Click button  id=searchBtn
        ${policy-number} =  Get text  //*[@id="${work-id}"]/div[3]/table/tbody/tr/td[1]/ul/li[2]
        Write Log  Policy issued. Work id: ${work-id} and ${policy-number}
        ${ext-policy-number} =   Replace string  ${policy-number}  Policy Number:${SPACE}  ${EMPTY}
        set to dictionary    ${test_data}    PolicyNumber=${ext-policy-number}
        log to console    PN:${test_data['PolicyNumber']}
