*** Settings ***
Library  DateTime
Library  Collections
Library  String
Library  SeleniumLibrary
Resource  ../../Resource/UMS.robot


*** Variables ***
${UMS_Portal_Questions_Link}=    link=Portal Questions
${UMS_Firm_Name}=    (//tr/td[@class='value'])[1]
${UMS_Eff_Date}=    (//tr/td[@class='value'])[2]
${UMS_AddresslLine1}=    (//tr/td[@class='value'])[3]
${UMS_First_Name}=    (//tr/td[@class='value'])[4]
${UMS_Exp_Date}=    (//tr/td[@class='value'])[5]
${UMS_Last_Name}=    (//tr/td[@class='value'])[7]
${UMS_Email_Address}=    (//tr/td[@class='value'])[8]
${UMS_City}=    (//tr/td[@class='value'])[9]
${UMS_Website}=    (//tr/td[@class='value'])[11]
${UMS_State}=    (//tr/td[@class='value'])[12]
${UMS_Zip_Code}=    (//tr/td[@class='value'])[13]
${UMS_GI_Firm_Name}=    //input[@id='PolicyAnswers_2__Answer']
${UMS_GI_First_Name}=    //input[@id='PolicyAnswers_4__Answer']
${UMS_GI_Last_Name}=    //input[@id='PolicyAnswers_5__Answer']
${UMS_GI_Email_Address}=    //input[@id='PolicyAnswers_7__Answer']
${UMS_GI_Website}=    //input[@id='PolicyAnswers_9__Answer']
${UMS_GI_AddresslLine1}=    //input[@id='PolicyAnswers_12__Answer']
${UMS_GI_City}=    //input[@id='PolicyAnswers_13__Answer']
${UMS_GI_Zip_Code}=    //input[@id='PolicyAnswers_15__Answer']
${UMS_BCD_Desc_BA}=    //input[@id='PolicyAnswers_19__Answer']
${UMS_BCD_No_Employees}=    //input[@id='PolicyAnswers_21__Answer']
${UMS_BCD_12Month_Gross_Rev}=    //input[@id='PolicyAnswers_22__Answer']
${UMS_BCD_NAIC_Code}=    //input[@id='PolicyAnswers_26__Answer']
${UMS_BCD_LimitOfLiability}=    //input[@id='PolicyAnswers_31__Answer']
${UMS_BCD_Deductible}=    //input[@id='PolicyAnswers_32__Answer']
${UMS_BCD_DisclaimerQuestion_1}=    //input[@id='PolicyAnswers_55__Answer']
${UMS_BCD_DisclaimerQuestion_2}=    //input[@id='PolicyAnswers_56__Answer']
${UMS_BCD_DisclaimerQuestion_3}=    //input[@id='PolicyAnswers_57__Answer']
${UMS_BCD_DisclaimerQuestion_4}=    //input[@id='PolicyAnswers_58__Answer']
${ID-UMS-UNDERWRITING}=  //a[contains(text(),'UNDERWRITING')]
${ID-UMS-Cancellation-Submit}=  id=Submit

*** Keywords ***
Cyber UMS Release hold
        Go to UMS
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element  id=idReleaseAll
        click element  //input[@value='Save']
        wait until element is visible  ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Rating
        Click Element     //td[@id='OPTION1']
        Change the Policy Status From Pending to Quoted
#        Click Element    //a[normalize-space()='Quote Letter']
#        select radio button  Action  Review
#        click element  ${ID-UMS-Cancellation-Submit}
        Close UMS window

Navigate To Portal Questions Page
    wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
    mouse over  ${ID-UMS-UNDERWRITING}
    click element  ${UMS_Portal_Questions_Link}
    log to console    Navigates To Portal Question Page
    wait until element is not visible    globalAjaxLoading    10

Verify V2 General Information Details Matches On UMS Side
    [Arguments]    &{test_data}
    wait until element is not visible    globalAjaxLoading    10
    log to console    "Verifying If General Information Details From V2 Are Matching With UMS Inputs"
    ${UMS_FirmName_Text}=    get text    ${UMS_Firm_Name}
    run keyword if  '${UMS_FirmName_Text}'=='${test_data['Firm Name']}'  log to console  Firm Name From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Firm Name is Not Matching on UMS    AND    close browser
    ${UMS_AddLine1_Text}=    get text    ${UMS_AddresslLine1}
    run keyword if  '${UMS_AddLine1_Text}'=='${test_data['AddressLine']}'  log to console  AddressLine1 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    AddressLine1 is Not Matching on UMS    AND    sleep  1s
    ${UMS_FirstName_Text}=    get text    ${UMS_First_Name}
    run keyword if  '${UMS_FirstName_Text}'=='${test_data['FirstName']}'  log to console  First Name From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    First Name is Not Matching on UMS    AND    close browser
    ${UMS_LastName_Text}=    get text    ${UMS_Last_Name}
    run keyword if  '${UMS_LastName_Text}'=='${test_data['Lastname']}'  log to console  Last Name From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Last Name is Not Matching on UMS    AND    close browser
    ${UMS_EMail_Text}=    get text    ${UMS_Email_Address}
    run keyword if  '${UMS_EMail_Text}'=='${test_data['Email']}'  log to console  Email Address From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Email Address is Not Matching on UMS    AND    close browser
    ${UMS_City_Text}=    get text    ${UMS_City}
    run keyword if  '${UMS_City_Text}'=='${test_data['City']}'  log to console  City Name From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    City Name is Not Matching on UMS    AND    close browser
    ${UMS_Website_Text}=    get text    ${UMS_Website}
    run keyword if  '${UMS_Website_Text}'=='${test_data['Applicant Website']}'  log to console  Applicant Website From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Applicant Website is Not Matching on UMS    AND    close browser
    ${UMS_ZipCode_Text}=    get text    ${UMS_Zip_Code}
    log to console  ${UMS_ZipCode_Text}
    run keyword if  '${UMS_ZipCode_Text}'=='${test_data['ZipCode']}'  log to console  ZipCode From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    ZipCode is Not Matching on UMS    AND    close browser

Verify V2 General Information Details Matches On UMS Side Under Poertal Questions
    [Arguments]    &{test_data}
    wait until element is not visible    globalAjaxLoading    10
    log to console    "Verifying If General Information Details From V2 Are Matching With UMS Inputs Under Portlal Questions"
    scroll element into view  ${UMS_GI_Firm_Name}
    ${UMS_GI_FirmName_Text}=    get value    ${UMS_GI_Firm_Name}
    run keyword if  '${UMS_GI_FirmName_Text}'=='${test_data['Firm Name']}'  log to console  Firm Name From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Firm Name is Not Matching on UMS    AND    close browser
    ${UMS_GI_FirstName_Text}=    get value    ${UMS_GI_First_Name}
    run keyword if  '${UMS_GI_FirstName_Text}'=='${test_data['FirstName']}'  log to console  First Name From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    First Name is Not Matching on UMS    AND    close browser
    ${UMS_GI_LastName_Text}=    get value    ${UMS_GI_Last_Name}
    run keyword if  '${UMS_GI_LastName_Text}'=='${test_data['Lastname']}'  log to console  Last Name From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Last Name is Not Matching on UMS    AND    close browser
    ${UMS_GI_EMail_Text}=    get value    ${UMS_GI_Email_Address}
    run keyword if  '${UMS_GI_EMail_Text}'=='${test_data['Email']}'  log to console  Email Address From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Email Address is Not Matching on UMS    AND    close browser
    ${UMS_GI_Website_Text}=    get value    ${UMS_GI_Website}
    run keyword if  '${UMS_GI_Website_Text}'=='${test_data['Applicant Website']}'  log to console  Applicant Website From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Applicant Website is Not Matching on UMS    AND    close browser
    ${UMS_GI_AddLine1_Text}=    get value    ${UMS_GI_AddresslLine1}
    run keyword if  '${UMS_GI_AddLine1_Text}'=='${test_data['AddressLine']}'  log to console  AddressLine1 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    AddressLine1 is Not Matching on UMS    AND    close browser
    ${UMS_GI_City_Text}=    get value    ${UMS_GI_City}
    run keyword if  '${UMS_GI_City_Text}'=='${test_data['City']}'  log to console  City Name From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    City Name is Not Matching on UMS    AND    close browser
    ${UMS_GI_ZipCode_Text}=    get value    ${UMS_GI_Zip_Code}
    run keyword if  '${UMS_GI_ZipCode_Text}'=='${test_data['ZipCode']}'  log to console  ZipCode From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    ZipCode is Not Matching on UMS    AND    close browser

Verify V2 Basic Company Details Matches On UMS Side
    [Arguments]    &{test_data}
    wait until element is not visible    globalAjaxLoading    10
    scroll element into view   ${UMS_BCD_Deductible}
    log to console    "Verifying If Basic Company Details From V2 Are Matching With UMS Inputs"
    ${UMS_Desc_BA_Text}=    get value    ${UMS_BCD_Desc_BA}
    run keyword if  '${UMS_Desc_BA_Text}'=='${test_data['Description Of Business Activities']}'  log to console  Description Of Business Activities From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Description Of Business Activities is Not Matching on UMS    AND    close browser
    ${UMS_No_Emp_Text}=    get value    ${UMS_BCD_No_Employees}
    run keyword if  '${UMS_No_Emp_Text}'=='${test_data['No. Of Employees']}'  log to console  No. Of Employees From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    No. Of Employees is Not Matching on UMS    AND    close browser
    ${UMS_12Month_Revenue}=    get value    ${UMS_BCD_12Month_Gross_Rev}
    run keyword if  '${UMS_12Month_Revenue}'=='${test_data['Last 12 Months Gross Revenue']}'  log to console  Last 12 Months Gross Revenue From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Last 12 Months Gross Revenue is Not Matching on UMS    AND    close browser
    ${UMS_NAIC_Code_Text}=    get value    ${UMS_BCD_NAIC_Code}
    run keyword if  '${UMS_NAIC_Code_Text}'=='${test_data['NAIC Code Number']}'  log to console  NAIC Code From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    NAIC Code is Not Matching on UMS    AND    close browser
    ${UMS_Limit_Of_Liability_Text}=    get value    ${UMS_BCD_LimitOfLiability}
    run keyword if  '${UMS_Limit_Of_Liability_Text}'=='${test_data['Limit Of Liability Text']}'  log to console  Limit Of Liability Value From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Limit Of Liability Value is Not Matching on UMS    AND    close browser
    ${UMS_Deductible_Text}=    get value    ${UMS_BCD_Deductible}
    run keyword if  '${UMS_Deductible_Text}'=='${test_data['Deductible Text']}'  log to console  Deductible Value From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Deductible Value is Not Matching on UMS    AND    close browser

Verify Disclaimer Question Answers on UMS Portal Question Page
    [Arguments]    &{test_data}
    wait until element is not visible    globalAjaxLoading    10
    scroll element into view   ${UMS_BCD_DisclaimerQuestion_4}
    log to console    "Verifying If Disclaimer Question Answers From V2 Are Matching With UMS Inputs"
    ${UMS_DiscQ1_Text}=    get value    ${UMS_BCD_DisclaimerQuestion_1}
    run keyword if  '${UMS_DiscQ1_Text}'=='${test_data['Has your client experienced a cyber event in the past three years that has resulted in a direct financial loss of more than $10,000?']}'
    ...    log to console  Answer To Disclaimer Question 1 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Answer To Disclaimer Question 1 is Not Matching on UMS    AND    close browser
    ${UMS_DiscQ2_Text}=    get value    ${UMS_BCD_DisclaimerQuestion_2}
    run keyword if  '${UMS_DiscQ2_Text}'=='${test_data['Has your client had any legal action brought or threatened against them in the last five years as a direct result of a cyber event?']}'
    ...    log to console  Answer To Disclaimer Question 2 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Answer To Disclaimer Question 2 is Not Matching on UMS    AND    close browser
    ${UMS_DiscQ3_Text}=    get value    ${UMS_BCD_DisclaimerQuestion_3}
    run keyword if  '${UMS_DiscQ3_Text}'=='${test_data['Has your client had a regulatory action initiated against them in the last five years as a direct result of a cyber event?']}'
    ...    log to console  Answer To Disclaimer Question 3 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Answer To Disclaimer Question 3 is Not Matching on UMS    AND    close browser
    ${UMS_DiscQ4_Text}=    get value    ${UMS_BCD_DisclaimerQuestion_4}
    run keyword if  '${UMS_DiscQ4_Text}'=='${test_data['Has your client been involved in the direct supply of goods or services to the cannabis industry, nor are they involved directly in the use or supply of cryptocurrency?']}'
    ...    log to console  Answer To Disclaimer Question 4 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Answer To Disclaimer Question 4 is Not Matching on UMS    AND    close browser

Verify Edited Disclaimer Question Answers on UMS Side
    [Arguments]    &{test_data}
    scroll element into view   ${UMS_BCD_DisclaimerQuestion_4}
    log to console    "Verifying If Disclaimer Question Answers From V2 Are Matching With UMS Inputs"
    ${UMS_DiscQ1_Text}=    get value    ${UMS_BCD_DisclaimerQuestion_1}
    run keyword if  '${UMS_DiscQ1_Text}'=='${test_data['Edited First Q ans']}'
    ...    log to console  Edited Answer To Disclaimer Question 1 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited Answer To Disclaimer Question 1 is Not Matching on UMS    AND    close browser
    ${UMS_DiscQ2_Text}=    get value    ${UMS_BCD_DisclaimerQuestion_2}
    run keyword if  '${UMS_DiscQ2_Text}'=='${test_data['Edited Second Q ans']}'
    ...    log to console  Edited Answer To Disclaimer Question 2 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited Answer To Disclaimer Question 2 is Not Matching on UMS    AND    close browser
    ${UMS_DiscQ3_Text}=    get value    ${UMS_BCD_DisclaimerQuestion_3}
    run keyword if  '${UMS_DiscQ3_Text}'=='${test_data['Edited Third Q ans']}'
    ...    log to console  Edited Answer To Disclaimer Question 3 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited Answer To Disclaimer Question 3 is Not Matching on UMS    AND    close browser
    ${UMS_DiscQ4_Text}=    get value    ${UMS_BCD_DisclaimerQuestion_4}
    run keyword if  '${UMS_DiscQ4_Text}'=='${test_data['Edited Fourth Q ans']}'
    ...    log to console  Edited Answer To Disclaimer Question 4 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited Answer To Disclaimer Question 4 is Not Matching on UMS    AND    close browser

Verify Edited V2 Basic Company Details Matches On UMS Side
    [Arguments]    &{test_data}
    wait until element is not visible    globalAjaxLoading    10
    scroll element into view   ${UMS_BCD_Deductible}
    log to console    "Verifying If Edited Basic Company Details From V2 Are Matching With UMS Inputs"
    ${UMS_No_Emp_Text}=    get value    ${UMS_BCD_No_Employees}
    run keyword if  '${UMS_No_Emp_Text}'=='${test_data['Edited No. Of Employees']}'  log to console  Edited No. Of Employees From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited No. Of Employees are Not Matching on UMS    AND    close browser
    ${UMS_12Month_Revenue}=    get value    ${UMS_BCD_12Month_Gross_Rev}
    run keyword if  '${UMS_12Month_Revenue}'=='${test_data['Edited Last 12 Months Gross Revenue']}'  log to console  Edited Last 12 Months Gross Revenue From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited Last 12 Months Gross Revenue is Not Matching on UMS    AND    close browser
    ${UMS_Limit_Of_Liability_Text}=    get value    ${UMS_BCD_LimitOfLiability}
    run keyword if  '${UMS_Limit_Of_Liability_Text}'=='${test_data['Edited Limit Of Liability Text']}'  log to console  Edited Limit Of Liability Value From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited Limit Of Liability Value is Not Matching on UMS    AND    close browser

Verify If Edited V2 General Information Details Matches On UMS Side
    [Arguments]    &{test_data}
    scroll element into view    ${UMS_GI_Website}
    ${UMS_GI_Website_Text}=    get value    ${UMS_GI_Website}
    run keyword if  '${UMS_GI_Website_Text}'=='${test_data['Edited Applicant Website']}'  log to console  Edited Applicant Website From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited Applicant Website is Not Matching on UMS    AND    close browser
    ${UMS_GI_AddLine1_Text}=    get value    ${UMS_GI_AddresslLine1}
    run keyword if  '${UMS_GI_AddLine1_Text}'=='${test_data['Edited AddressLine']}'  log to console  Edited AddressLine1 From V2 and UMS Matches, Verified
    ...    ELSE    run keywords    log to console    Edited AddressLine1 is Not Matching on UMS    AND    close browser