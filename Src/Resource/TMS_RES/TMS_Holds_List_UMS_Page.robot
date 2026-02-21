*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot


*** Variables ***
${UMS-PH-Additional Coverage Request1}=    //input[@id='PolicyFlags_0__Value']
${UMS-PH-Appointment License Information Missing1}=    //input[@id='PolicyFlags_1__Value']
${UMS-PH-Max Assets}=   //input[@id='PolicyFlags[15].Id']
${UMS-Review-Financials}=   //input[@id='PolicyFlags[38].Id']
${UMS-PH-Appraisal Services Hold1}=    //input[@id='PolicyFlags_2__Value']
${UMS-PH-BPO income >40%}=    //label[text()='BPO income >40%']
${UMS-PH-Broker Hold}=    //label[text()='Broker Hold']
${UMS-PH-Broker License Information Missing}=    //label[text()='Broker License Information Missing']
${UMS-PH-Business Brokerage Decline}=    //label[text()='Business Brokerage Decline']
${UMS-PH-Business Brokerage Hold}=    //label[text()='Business Brokerage Hold']
${UMS-PH-Circumstance}=    //label[text()='Circumstance']
${UMS-PH-Claims}=    //label[text()='Claims']
${UMS-PH-Clearance hold}=    //label[text()='Clearance hold']
${UMS-PH-Commercial Mortgage Brokerage Decline}=    //label[text()='Commercial Mortgage Brokerage Decline']
${UMS-PH-Construction Development Questionnaire Review}=    //label[text()='Construction Development Questionnaire Review']
${UMS-PH-Construction Development Sublimit Coverage}=    //label[text()='Construction Development Sublimit Coverage']
${UMS-PH-Consulting Services}=    //label[text()='Consulting Services']
${UMS-PH-Deductible greater than $5,000}=    //label[text()='Deductible greater than $5,000']
${UMS-PH-Dual Agency Hold1}=    //label[text()='Dual Agency Hold']
${UMS-PH-Dual Agent Hold1}=    //label[text()='Dual Agent Hold']
${UMS-PH-Exclusive Listing}=    //label[text()='Exclusive Listing']
${UMS-PH-Firm Type}=    //label[text()='Firm Type']
${UMS-PH-High Value Property Hold}=    //label[text()='High Value Property Hold']
${UMS-PH-Include in expo process}=    //label[text()='Include in expo process']
${UMS-PH-License Suspended or Revoked}=    //label[text()='License Suspended or Revoked']
${UMS-PH-Limits}=    //label[text()='Limits']
${UMS-PH-Low Income}=    //label[text()='Low Income']
${UMS-PH-Management of Associations Decline}=    //label[text()='Management of Associations Decline']
${UMS-PH-Mortgage Banker/ Escrow Decline}=    //label[text()='Mortgage Banker/ Escrow Decline']
${UMS-PH-Mortgage Brokerage Own Funds Decline}=    //label[text()='Mortgage Brokerage Own Funds Decline']
${UMS-PH-No Income}=    //label[text()='No Income']
${UMS-PH-Other income >40%}=    //label[text()='Other income >40%']
${UMS-PH-Other Staff}=    //label[text()='Other Staff']
${UMS-PH-Owned Property Hold}=    //label[text()='Owned Property Hold']
${UMS-PH-Part Time}=    //label[text()='Part Time']
${UMS-PH-Policy Term different from Annual}=    //label[text()='Policy Term different from Annual']
${UMS-PH-Portal Ineligible}=    //label[text()='Portal Ineligible']
${UMS-PH-Quoted premium greater than $10,000}=    //label[text()='Quoted premium greater than $10,000']
${UMS-PH-Quoted Premium is 0}=    //label[text()='Quoted Premium is 0']
${UMS-PH-Referral income >40%}=    //label[text()='Referral income >40%']
${UMS-PH-Revenue above $1 million}=    //label[text()='Revenue above $1 million']
${UMS-PH-Service or Activity Question’s Revenue is 25-40%}=    //label[text()='Service or Activity Question’s Revenue is 25-40%']
${UMS-PH-Service/ Activity Greater than 40%}=    //label[text()='Service/ Activity Greater than 40%']
${UMS-PH-Single Client Hold}=    //label[text()='Single Client Hold']
${UMS-PH-State}=    //label[text()='State']
${UMS-PH-Tax Lookup Failure New Business}=    //label[text()='Tax Lookup Failure New Business']
${UMS-PH-UnderWriter Hold}=    //label[text()='UnderWriter Hold']
${UMS-PH-Years Licensed}=    //label[text()='Years Licensed']
${UMS-PHCB-Additional Coverage Request}=    //input[@id='PolicyFlags_0__Value']
${UMS-PHCB-Appointment License Information Missing}=    //input[@id='PolicyFlags_1__Value']
${UMS-PHCB-Appraisal Services Hold}=    //input[@id='PolicyFlags_2__Value']
${UMS-PHCB-BPO income >40%}=    //input[@id='PolicyFlags_3__Value']
${UMS-PHCB-Broker Hold}=    //input[@id='PolicyFlags_4__Value']
${UMS-PHCB-Broker License Information Missing}=    //input[@id='PolicyFlags_5__Value']
${UMS-PHCB-Business Brokerage Decline}=    //input[@id='PolicyFlags_6__Value']
${UMS-PHCB-Business Brokerage Hold}=    //input[@id='PolicyFlags_7__Value']
${UMS-PHCB-Circumstance}=    //input[@id='PolicyFlags_8__Value']
${UMS-PHCB-Claims}=    //input[@id='PolicyFlags_9__Value']
${UMS-PHCB-Clearance hold}=    //input[@id='PolicyFlags_10__Value']
${UMS-PHCB-Commercial Mortgage Brokerage Decline}=    //input[@id='PolicyFlags_11__Value']
${UMS-PHCB-Construction Development Questionnaire Review}=    //input[@id='PolicyFlags_12__Value']
${UMS-PHCB-Construction Development Sublimit Coverage}=    //input[@id='PolicyFlags_13__Value']
${UMS-PHCB-Consulting Services}=    //input[@id='PolicyFlags_14__Value']
${UMS-PHCB-Deductible greater than $5,000}=    //input[@id='PolicyFlags_15__Value']
${UMS-PHCB-Dual Agency Hold}=    //input[@id='PolicyFlags_16__Value']
${UMS-PHCB-Dual Agent Hold}=    //input[@id='PolicyFlags_17__Value']
${UMS-PHCB-Exclusive Listing}=    //input[@id='PolicyFlags_18__Value']
${UMS-PHCB-Firm Type}=    //input[@id='PolicyFlags_19__Value']
${UMS-PHCB-High Value Property Hold}=    //input[@id='PolicyFlags_20__Value']
${UMS-PHCB-Include in expo process}=    //input[@id='PolicyFlags_21__Value']
${UMS-PHCB-License Suspended or Revoked}=    //input[@id='PolicyFlags_22__Value']
${UMS-PHCB-Limits}=    //input[@id='PolicyFlags_23__Value']
${UMS-PHCB-Low Income}=    //input[@id='PolicyFlags_24__Value']
${UMS-PHCB-Management of Associations Decline}=    //input[@id='PolicyFlags_25__Value']
${UMS-PHCB-Mortgage Banker/ Escrow Decline}=    //input[@id='PolicyFlags_26__Value']
${UMS-PHCB-Mortgage Brokerage Own Funds Decline}=    //input[@id='PolicyFlags_27__Value']
${UMS-PHCB-No Income}=    //input[@id='PolicyFlags_28__Value']
${UMS-PHCB-Other income >40%}=    //input[@id='PolicyFlags_29__Value']
${UMS-PHCB-Other Staff}=    //input[@id='PolicyFlags_30__Value']
${UMS-PHCB-Owned Property Hold}=    //input[@id='PolicyFlags_31__Value']
${UMS-PHCB-Part Time}=    //input[@id='PolicyFlags_32__Value']
${UMS-PHCB-Policy Term different from Annual}=    //input[@id='PolicyFlags_33__Value']
${UMS-PHCB-Portal Ineligible}=    //input[@id='PolicyFlags_34__Value']
${UMS-PHCB-Quoted premium greater than $10,000}=    //input[@id='PolicyFlags_35__Value']
${UMS-PHCB-Quoted Premium is 0}=    //input[@id='PolicyFlags_36__Value']
${UMS-PHCB-Referral income >40%}=    //input[@id='PolicyFlags_37__Value']
${UMS-PHCB-Revenue above $1 million}=    //input[@id='PolicyFlags_38__Value']
${UMS-PHCB-Service or Activity Question’s Revenue is 25-40%}=    //input[@id='PolicyFlags_39__Value']
${UMS-PHCB-Service/ Activity Greater than 40%}=    //input[@id='PolicyFlags_40__Value']
${UMS-PHCB-Single Client Hold}=    //input[@id='PolicyFlags_41__Value']
${UMS-PHCB-State}=    //input[@id='PolicyFlags_42__Value']
${UMS-PHCB-Tax Lookup Failure New Business}=    //input[@id='PolicyFlags_43__Value']
${UMS-PHCB-UnderWriter Hold}=    //input[@id='PolicyFlags_44__Value']
${UMS-PHCB-Years Licensed}=    //input[@id='PolicyFlags_45__Value']
${UMS-Save}=    //input[@type='submit']
${ID-UMS-UNDERWRITING} =  //a[contains(text(),'UNDERWRITING')]
${ID-UMS-Rating} =  //a[@class='button button-pill button-primary']
${ID-UMS-Cancellation-Submit} =  //input[@id="idReleaseAll"]
${UMS_Hold3}=    //input[@id='PolicyFlags_3__Value']
${UMS_Hold5}=    //input[@id='PolicyFlags_5__Value']


*** Keywords ***
Navigate to UMS Policy Holds Page
        wait until element is not visible   globalAjaxLoading  100
        ${title} =    get window titles
        Switch Window    title=${title}[1]
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element    ${UMS-ExpandAll}

Select UMS Holds for TMS REO
        wait until element is not visible   globalAjaxLoading  100
        ${Optional-Header}=  run keyword and return status    element should be visible    ${UMS-PH-Additional Coverage Request1}
        run keyword if  ${Optional-Header}  select checkbox  ${UMS-PH-Additional Coverage Request1}
        Select Checkbox   ${UMS-PH-Appointment License Information Missing1}
        Select Checkbox   ${UMS-PH-Appraisal Services Hold1}
        click element  ${UMS-Save}

UMS Releasing the policy
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element  id=idReleaseAll
        click element  //input[@value='Save']
        wait until element is visible  ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Rating

Select UMS Holds for TMS MGMT NFP
        Select Checkbox   ${UMS-PH-Max Assets}
#        Select Checkbox   ${UMS-Review-Financials}
        click element  ${UMS-Save}

 #For TMS Cyber
UMS Hold for Cyber
        wait until element is not visible   globalAjaxLoading  100
        ${title} =    get window titles
        Switch Window    title=${title}[1]
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        click element    ${UMS-ExpandAll}
        wait until element is not visible   globalAjaxLoading  100
        #${Optional-Header}=  run keyword and return status    element should be visible    ${UMS-PH-Additional Coverage Request1}
        #run keyword if  ${Optional-Header}  select checkbox  ${UMS-PH-Additional Coverage Request1}
        Select Checkbox   ${UMS_Hold3}
        Select Checkbox   ${UMS_Hold5}
        click element  ${UMS-Save}