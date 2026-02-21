*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/IA_Res/RE.robot
Resource    ../Generic.robot

*** Variables ***
${IA_Home_Page_Individual&Appraisers}    //p[contains(text(),'Individual Appraisers E&O')]
${IA_GI_Firm_Name}                       //input[@name='TradeOrDBANameIA']
${IA_GI_Email_Address}                   //input[@name='ApplicantEmailIA']
${IA_GI_Last_Name}                       //input[@name='PrimaryContactLastNameIA']
${IA_GI_First_Name}                      //input[@name='PrimaryContactFirstNameIA']
${IA_GI_EffectiveDate}                   //input[@name='EffectiveDateIA']
${IA_GI_ExpiryDate}                      //input[@name='ExpirationDateIA']
${IA_GI_Client_Suggestion_Popup}         //h2
${ID-GQ-ProvideName-IA}                  //input[@name='AppraisalMgmtCompName1']
${IA_GI_Applicant_Address}               //input[@name='applicantGoogleAddress']
${IA_GQ_Prcnt_Revenue}                   //input[@name='PercentageRnvByAmcIA']
${IA_GQ_Appraisal_Firm_Name}             //input[@data-label='Provide the name of the appraisal firms the applicant does work for.|AppraisalFirmName1']
${IA_GQ_Management_Companies}            id=CompanyName1IA
${IA_GQ_Applicant_Experience_Appraisar}  //input[@name='AppraiserYrsOfExp']
${IA_GQ_State_Dropdown_Icon}             (//input[@role='combobox'])[2]
${IA_PCCH_Error_Ommission_Text}          //label[text()='Does the applicant currently have real estate appraisal errors & omissions insurance?']
${IA_PCCH_Rretroactive}                  //input[@name='PriorCoverage_03']
${IA_PCCH_Policy_Period}                 //input[@name='tableInputs[0].EO_History_EffectiveDate']
${IA_PCCH_Carrier_History}               //input[@name='tableInputs[0].EO_History_Carrier']
${IA_PCCH_Limit_Liability}               //input[@name='tableInputs[0].EO_History_Limit']
${IA_PCCH-Deductible}                    //input[@name='tableInputs[0].EO_History_Deductible']
${IA_PCCH_Annual_Premium}                //input[@name='tableInputs[0].EO_History_Premium']
${IA_PCCH_Claim_Type}                    //input[@name='tableInputs[0].ClaimHistory_OpenClosed']
${IA_PCCH_Total_Claims}                  //input[@name='ClaimsHistory_02']
${IA_PCCH_Total_Amount}                  //input[@name='ClaimsHistory_03']
${IA_PCCH_Date_Claim}                    //input[@name='tableInputs[0].ClaimHistory_Date']
${IA_PCCH_Description_Claim}             //input[@name='tableInputs[0].ClaimHistory_Description']
${IA_PCCH_Total_Incurred}                //input[@name='tableInputs[0].ClaimHistory_TotalIncurred']
${IA_PCCH_Former_Companies}              DidMatterReportedIA
${IA_PCCH_Date_Circumstance}             //input[@name='tableInputs[0].Circumstance_Date']
${IA_PCCH_Description}                   //input[@name='tableInputs[0].Circumstance_Description']
${IA_PCCH_Details_Revoked}               //textarea[@name='LicenseRevoked_Explanation']
${IA_AI_Total_Income_Fiscal_Year}        //input[@name='ApplicantIncome']
${IA_AI_Prcnt_Residential}               //input[@name='Residential']
${IA_AI_Prcnt_Commercial}                //input[@name='Commercial']
${IA_AI_Prcnt_Property_Value}            //input[@name='AvgSalePrice']
${IA_AI_Prcnt_Ownership_Interest}        appriaseEstateWithOwnInterest
${IA_BCI_Billing_Preferences}            //input[@name='BillingPreferences']
${IA_Quote_Options_Header_Text}          (//input[@type='checkbox'])[1]
${IA_Policy_Summay_header_Text}          (//p[text()='Policy Summary'])[2]
${IA_Policy_Summay_Policy_Status}        //td[text()='Policy Issued']
@{all-list-of-states}                    Alabama  Alaska  Arizona  Arkansas  California  Colorado  Connecticut  Delaware  District Of Columbia  Florida  Georgia  Hawaii  Idaho  Illinois  Indiana  Iowa  Kansas  Kentucky  Louisiana  Maine  Maryland  Massachusetts  Michigan  Minnesota  Mississippi  Missouri  Montana  Nebraska  Nevada  New Hampshire  New Jersey  New Mexico  New York  North Carolina  North Dakota  Ohio  Oklahoma  Oregon  Pennsylvania  Puerto Rico  Rhode Island  South Carolina  South Dakota  Tennessee  Texas  Utah  Vermont  Virginia  Virgin Islands  Washington  West Virginia  Wisconsin  Wyoming


*** Keywords ***
Navigate to Individual Appraisers
    Wait Until Element Is Visible  ${IA_Home_Page_Individual&Appraisers}  10s
    click element  ${IA_Home_Page_Individual&Appraisers}

IA General Information
    [Arguments]   ${test_data}
    Wait Until Element Is Visible   ${IA_GI_First_Name}   20s
    Fetch V2 Work ID
    Execute Javascript    window.scrollTo(0, 0)
    Click Element   ${IA_GI_First_Name}
    Input Text  ${IA_GI_First_Name}  ${test_data['FirstName']}
    Input Text  ${IA_GI_Last_Name}  ${test_data['Lastname']}
    Input Text  ${IA_GI_Firm_Name}  ${test_data['Firm Name']}
    Input Text  ${IA_GI_Email_Address}  ${test_data['Email']}
    Input Text    ${IA_GI_Applicant_Address}  ${test_data['Applicant Address']}
    sleep  2s
    Press Keys    ${IA_GI_Applicant_Address}   ARROW_DOWN
    Press Keys    ${IA_GI_Applicant_Address}   RETURN
    Scroll Element Into View     ${IA_GI_EffectiveDate}
    ${Date}  timelocal
    ${Current_Eff_Date}=    get current date    result_format=%m/%d/%Y
    Press Keys    ${IA_GI_EffectiveDate}  ${Current_Eff_Date}
    Click Element  ${IA_GI_ExpiryDate}
    continue Click RE
    Accept Clearance Popup

IA General Questions
    [Arguments]   ${test_data}
    Set Selenium Implicit Wait    10s
    Click Element       //input[@value='${test_data['What type of appraiser is the applicant?']}']
    run keyword if  '${test_data['What type of appraiser is the applicant?']}' == 'LICENSEDCERTIFIEDAPPRAISER'
    ...  Select Applicant Experience as an Appraiser    ${test_data}
    Click Element       //input[@value='${test_data['Does the applicant perform appraisal services for other appraisal firms?']}']
    run keyword if  '${test_data['Does the applicant perform appraisal services for other appraisal firms?']}' == 'YES'    Check and enter input    ${IA_GQ_Appraisal_Firm_Name}    ${test_data['Provide the name of the appraisal firms the applicant does work for']}
    Check and enter input   ${IA_GQ_Prcnt_Revenue}     ${test_data['In the past 12 months, what percentage of the applicants revenue was derived from work completed for an appraisal management company?']}
    IF    ${test_data['In the past 12 months, what percentage of the applicants revenue was derived from work completed for an appraisal management company?']} > 0
    Check and enter input   ${ID-GQ-ProvideName-IA}     ${test_data['Provide the name of the appraisal management companies the applicant does work for']}
    END
    run keyword if  '${test_data['What type of appraiser is the applicant?']}' == 'LICENSEDCERTIFIEDAPPRAISER'
    ...  Select Applicant Licensed State    ${test_data}
    Run Keyword If  '${test_data['What type of appraiser is the applicant?']}' == 'TRAINEE'  Click Element   //input[@name='Trainee' and @value="${test_data['Has the applicant passed the initial exam (if required) or any other state requirements?']}"]
    continue Click RE

Select Applicant Licensed State
    [Arguments]   ${test_data}
#    Scroll Element Into View    ${IA_GQ_State_Dropdown_Icon}
     Select Value From Dropdown        ${IA_GQ_State_Dropdown_Icon}  ${test_data[' In what state(s) does the applicant hold a valid appraisers license or certification?']}
#    Press Keys    NONE   ${test_data[' In what state(s) does the applicant hold a valid appraisers license or certification?']}
#    Press Keys    NONE   ARROW_DOWN
#    Press Keys    NONE   RETURN

Select Applicant Experience as an Appraiser
    [Arguments]   ${test_data}
    Select Value From Dropdown   ${IA_GQ_Applicant_Experience_Appraisar}  ${test_data['How many years of experience does the applicant have as an appraiser?']}
#    Click Element    ${IA_GQ_Applicant_Experience_Appraisar}
#    sleep  0.5s
#    Click Element    //li/span[text()='${test_data['How many years of experience does the applicant have as an appraiser?']}']

Provide name appraisal management companies firms IA
    press keys  secondaryActions   RETURN
    wait until element is not visible  ${ID_Pleasewait}   30
    Check and enter input  ${IA_GQ_Management_Companies}  test auto

IA Prior Coverage and Claims History
    [Arguments]  ${test_data}
    Wait Until Page Contains Element   //input[@name='REOInsurance' and @value='NO']     10s
    ${errors&omissions}=    Set Variable    ${test_data['Does the applicant currently have real estate appraisal errors & omissions insurance?']}
    ${claims5years}=    Set Variable    ${test_data['Have any claims been made against the applicant within the past 5 years? Include violation of fair housing laws or licensing board complaints.']}
    ${aware-any-act}=    Set Variable    ${test_data['Is the applicant aware of any act, error, omission or other circumstance they expect to be the basis of claim or suit against them within the past 5 years?']}
    ${revoked/suspended}=    Set Variable    ${test_data['Has the applicants license ever been revoked/suspended?']}
    ${P1}=    Set Variable    ${test_data['Does the applicant have full retroactive coverage?']}
    ${P2}=    Set Variable    ${test_data['Limit of Liability']}
    ${P3}=    Set Variable    ${test_data['Deductible']}
    ${P4}=    Set Variable    ${test_data['Annual Premium']}
    ${C1}=    Set Variable    ${test_data['Total number of claims']}
    ${C2}=    Set Variable    ${test_data['Has the information provided above been reported to the applicants current or former insurance companies?']}
    ${C3}=    Set Variable    ${test_data['Date of Circumstance']}
    ${C4}=    Set Variable    ${test_data['Description of circumstance']}
    ${C5}=    Set Variable    ${test_data['Description applicants license ever been revoked/suspended?']}
    Log To Console    ${C3}
    Log To Console    ${C4}
    Execute Javascript    window.scrollTo(0, 0)
    Click Element      //input[@name='REOInsurance' and @value='${errors&omissions}']
    run keyword if  '${errors&omissions}' == 'YES'  Full retroactive coverage  ${P1}  ${P2}  ${P3}  ${P4}
    Click Element    //input[@name='AnyClaims' and @value='${claims5years}']
    run keyword if  '${claims5years}' == 'YES'  Any claims applicant made 5 years Include violation  ${C1}  ${C2}  ${test_data}
    Click Element    //input[@name='AwareOfEO' and @value='${aware-any-act}']
    run keyword if  '${aware-any-act}' == 'YES'  Date of Circumstance Description IA     ${C3}   ${C4}     ${C2}
    Click Element    //input[@name='LicenseRevoked' and @value='${revoked/suspended}']
    run keyword if  '${revoked/suspended}' == 'YES'  Please provide details IA   ${C5}
    Continue Click RE


Full retroactive coverage
    [Arguments]  ${P1}  ${P2}  ${P3}  ${P4}
    ${todaytime}  timelocal
    Click Element     //input[@name='FullRetroactiveCoverage' and @value='${P1}']
    run keyword if  '${P1}' == 'NO'  Provide the retroactive
    Press Keys    ${IA_PCCH_Policy_Period}  ${todaytime}
    Input Text    ${IA_PCCH_Carrier_History}    ABC Test
    Input Text    ${IA_PCCH_Limit_Liability}    ${P2}
    Input Text    ${IA_PCCH-Deductible}   ${P2}
    Input Text    ${IA_PCCH_Annual_Premium}    ${P4}

Any claims applicant made 5 years Include violation
    [Arguments]  ${C1}  ${C2}  ${test_data}
    Input Text  ${IA_PCCH_Total_Claims}  ${C1}
    Click Element      //input[@name='matterReported' and @value='${C2}']
    Input Text  ${IA_PCCH_Total_Amount}  '4233'
    run keyword if  2 < ${C1} < 999  Provide a loss run table below  ${test_data}

Provide a loss run table below
    [Arguments]    ${test_data}
    Run Keyword If    "${test_data['Does the applicant currently have real estate appraisal errors & omissions insurance?']}"=="YES"  Click Element    (//button[text()='Add'])[2]
    Run Keyword If    "${test_data['Does the applicant currently have real estate appraisal errors & omissions insurance?']}"=="NO"  Click Element    //button[text()='Add']
    Press Keys    ${IA_PCCH_Date_Claim}  '11-13-2019'
    Input Text  ${IA_PCCH_Description_Claim}  Sample message
    Select Value From Dropdown  ${IA_PCCH_Claim_Type}  Closed
#    Click Element    //li[normalize-space()='Closed']
    Input Text  ${IA_PCCH_Total_Incurred}  '2543'

Provide the retroactive
    ${todaytime}  timelocal
    Press Keys     ${IA_PCCH_Rretroactive}  '${todaytime}'
    press keys  ${IA_PCCH_Rretroactive}  RETURN

Date of Circumstance Description IA
    [Arguments]  ${C3}  ${C4}   ${C2}
    Press Keys        ${IA_PCCH_Date_Circumstance}  ${C3}
    Input Text   ${IA_PCCH_Description}  ${C4}
    Click Element      //input[@name='matterReported' and @value='${C2}']

Please provide details IA
    [Arguments]  ${C5}
    Check and enter input  ${IA_PCCH_Details_Revoked}   ${C5}

IA Applicant Income
    [Arguments]    ${test_data}
    Input Text    ${IA_AI_Total_Income_Fiscal_Year}  ${test_data['Provide the applicants total appraisal income for the past fiscal year. If the applicant is new in business, provide an estimate for the next 12 months.']}
    Input Text    ${IA_AI_Prcnt_Residential}  ${test_data['What percentage of the applicants total appraisal income was from residential appraisals?']}
    Input Text    ${IA_AI_Prcnt_Commercial}  ${test_data['What percentage of the applicants total appraisal income was from commercial appraisals']}
    Input Text    ${IA_AI_Prcnt_Property_Value}  ${test_data['What is the property value of the applicants largest appraisal in the last 12 months?']}
    Click Element    //input[@name='AppraiseEstateWithOwnInterest' and @value='${test_data['Does the applicant appraise real estate in which they have an ownership interest?']}']
    Continue Click RE

IA Quote Options
    [Arguments]  ${test_data}
     Wait Until Page Contains Element    ${IA_Quote_Options_Header_Text}  30s
     Continue Click RE

IA Generate Quote
    [Arguments]  ${test_data}
    ${technical_Issue}=  Run Keyword And Return Status    Wait Until Page Contains Element    //div[contains(text(),'Sorry')]  20s
    Run Keyword If  ${technical_Issue}  Reload Page
    ${element-check}  Run Keyword and Return status  Wait Until Page Contains Element  //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  60s
    Run Keyword if  ${element-check}  UMS Release hold
    Wait Until Element Is Visible    //p[text()="Quote Option ${test_data['Quote options']}"]  30s
    click element  //p[text()="Quote Option ${test_data['Quote options']}"]
    Continue Click Generate Quote

IA Billing and Contact Information
    [Arguments]  ${test_data}
    Execute Javascript    window.scrollTo(0, 0)
    Select Value From Dropdown    ${IA_BCI_Billing_Preferences}  ${test_data['Billing Preference']}
#    click element  //li[normalize-space()="${test_data['Billing Preference']}"]
    Continue Click RE

IA Issue Policy
    Continue Click Generate Quote

IA Policy Summary
    Wait Until Element Is Visible    ${IA_Policy_Summay_header_Text}  200s
    ${policy_status}=  Get Text    ${IA_Policy_Summay_Policy_Status}
    Run Keyword If  '${policy_status}'!='Policy Issued'     Fail