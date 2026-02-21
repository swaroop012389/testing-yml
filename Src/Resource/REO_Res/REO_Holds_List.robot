*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${UMS-PH-Additional Coverage Request}=    //label[text()='Additional Coverage Request']
${UMS-PH-Appointment License Information Missing}=    //label[text()='Appointment License Information Missing']
${UMS-PH-Appraisal Services Hold}=    //label[text()='Appraisal Services Hold']
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
${UMS-PH-Deductible Hold}=    //label[text()='Deductible Hold']
${UMS-PH-Discrimination Sublimit}=   //label[text()='Discrimination Sublimit']
${UMS-PH-Dual Agency Hold}=    //label[text()='Dual Agency Hold']
${UMS-PH-Dual Agent Hold}=    //label[text()='Dual Agent Hold']
${UMS-PH-EPLI limits higher than $500,000}=    //label[text()='EPLI limits higher than $500,000']
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
${UMS-PH-Revenue above $2 million}=    //label[text()='Revenue above $2 million']
${UMS-PH-Service or Activity Question’s Revenue is 25-40%}=    //label[text()='Service or Activity Question’s Revenue is 25-40%']
${UMS-PH-Service/ Activity Greater than 40%}=    //label[text()='Service/ Activity Greater than 40%']
${UMS-PH-Single Client Hold}=    //label[text()='Single Client Hold']
${UMS-PH-State}=    //label[text()='State']
${UMS-PH-Tax Lookup Failure New Business}=    //label[text()='Tax Lookup Failure New Business']
${UMS-PH-UnderWriter Hold}=    //label[text()='UnderWriter Hold']
${UMS-PH-Washington State Hold}=    //label[text()='Washington State Hold']
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
${UMS-PHCB-Deductible Hold}=    //input[@id='PolicyFlags_15__Value']
${UMS-PHCB-Discrimination Sublimit}=    //input[@id='PolicyFlags_16__Value']
${UMS-PHCB-Dual Agency Hold}=    //input[@id='PolicyFlags_17__Value']
${UMS-PHCB-Dual Agent Hold}=    //input[@id='PolicyFlags_18__Value']
${UMS-PHCB-EPLI limits higher than $500,000}=    //input[@id='PolicyFlags_19__Value']
${UMS-PHCB-Exclusive Listing}=    //input[@id='PolicyFlags_20__Value']
${UMS-PHCB-Firm Type}=    //input[@id='PolicyFlags_21__Value']
${UMS-PHCB-High Value Property Hold}=    //input[@id='PolicyFlags_22__Value']
#${UMS-PHCB-Include in expo process}=    //input[@id='PolicyFlags_21__Value']
${UMS-PHCB-License Suspended or Revoked}=    //input[@id='PolicyFlags_23__Value']
${UMS-PHCB-Limits}=    //input[@id='PolicyFlags_24__Value']
${UMS-PHCB-Low Income}=    //input[@id='PolicyFlags_25__Value']
${UMS-PHCB-Management of Associations Decline}=    //input[@id='PolicyFlags_26__Value']
${UMS-PHCB-Mortgage Banker/ Escrow Decline}=    //input[@id='PolicyFlags_27__Value']
${UMS-PHCB-Mortgage Brokerage Own Funds Decline}=    //input[@id='PolicyFlags_28__Value']
${UMS-PHCB-No Income}=    //input[@id='PolicyFlags_29__Value']
${UMS-PHCB-Other income >40%}=    //input[@id='PolicyFlags_30__Value']
${UMS-PHCB-Other Staff}=    //input[@id='PolicyFlags_31__Value']
${UMS-PHCB-Owned Property Hold}=    //input[@id='PolicyFlags_32__Value']
${UMS-PHCB-Part Time}=    //input[@id='PolicyFlags_33__Value']
${UMS-PHCB-Policy Term different from Annual}=    //input[@id='PolicyFlags_34__Value']
${UMS-PHCB-Portal Ineligible}=    //input[@id='PolicyFlags_35__Value']
${UMS-PHCB-Quoted premium greater than $10,000}=    //input[@id='PolicyFlags_36__Value']
${UMS-PHCB-Quoted Premium is 0}=    //input[@id='PolicyFlags_37__Value']
${UMS-PHCB-Referral income >40%}=    //input[@id='PolicyFlags_38__Value']
${UMS-PHCB-Revenue above $2 million}=    //input[@id='PolicyFlags_39__Value']
${UMS-PHCB-Service or Activity Question’s Revenue is 25-40%}=    //input[@id='PolicyFlags_40__Value']
${UMS-PHCB-Service/ Activity Greater than 40%}=    //input[@id='PolicyFlags_41__Value']
${UMS-PHCB-Single Client Hold}=    //input[@id='PolicyFlags_42__Value']
${UMS-PHCB-State}=    //input[@id='PolicyFlags_43__Value']
${UMS-PHCB-Tax Lookup Failure New Business}=    //input[@id='PolicyFlags_44__Value']
${UMS-PHCB-UnderWriter Hold}=    //input[@id='PolicyFlags_45__Value']
${UMS-PHCB-Washington State Hold}=    //input[@id='PolicyFlags_46__Value']
${UMS-PHCB-Years Licensed}=    //input[@id='PolicyFlags_47__Value']

*** Keywords ***
Policy-Holds List
    log to console    Selected Policy Holds:
    ${Additional coverage request}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Additional Coverage Request}
    ${Text_status}=    run keyword if   ${Additional coverage request}    get text     ${UMS-PH-Additional Coverage Request}
    run keyword if    ${Additional coverage request}    log to console    ${Text_status}
    ${Appointment License Information Missing}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Appointment License Information Missing}
    ${Text1_status}=    run keyword if   ${Appointment License Information Missing}    get text     ${UMS-PH-Appointment License Information Missing}
    run keyword if    ${Appointment License Information Missing}    log to console    ${Text1_status}
    ${Appraisal Services Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Appraisal Services Hold}
    ${Text2_status}=    run keyword if   ${Appraisal Services Hold}    get text     ${UMS-PH-Appraisal Services Hold}
    run keyword if    ${Appraisal Services Hold}    log to console    ${Text2_status}
    ${BPO income >40%}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-BPO income >40%}
    ${Text3_status}=    run keyword if   ${BPO income >40%}    get text     ${UMS-PH-BPO income >40%}
    run keyword if    ${BPO income >40%}    log to console    ${Text3_status}
    ${Broker Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Broker Hold}
    ${Text4_status}=    run keyword if   ${Broker Hold}    get text     ${UMS-PH-Broker Hold}
    run keyword if   ${Broker Hold}    log to console    ${Text4_status}
    ${Broker License Information Missing}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Broker License Information Missing}
    ${Text5_status}=    run keyword if   ${Broker License Information Missing}    get text     ${UMS-PH-Broker License Information Missing}
    run keyword if    ${Broker License Information Missing}    log to console    ${Text5_status}
    ${Business Brokerage Decline}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Business Brokerage Decline}
    ${Text6_status}=    run keyword if   ${Business Brokerage Decline}    get text     ${UMS-PH-Business Brokerage Decline}
    run keyword if    ${Business Brokerage Decline}    log to console    ${Text6_status}
    ${Business Brokerage Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Business Brokerage Hold}
    ${Text7_status}=    run keyword if   ${Business Brokerage Hold}    get text     ${UMS-PH-Business Brokerage Hold}
    run keyword if    ${Business Brokerage Hold}    log to console    ${Text7_status}
    ${Circumstance}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Circumstance}
    ${Text8_status}=    run keyword if   ${Circumstance}    get text     ${UMS-PH-Circumstance}
    run keyword if    ${Circumstance}    log to console    ${Text8_status}
    ${Claims}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Claims}
    ${Text9_status}=    run keyword if   ${Claims}    get text     ${UMS-PH-Claims}
    run keyword if    ${Claims}    log to console    ${Text9_status}
    ${Clearance hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Clearance hold}
    ${Text10_status}=    run keyword if   ${Clearance hold}    get text     ${UMS-PH-Clearance hold}
    run keyword if    ${Clearance hold}    log to console    ${Text10_status}
    ${Commercial Mortgage Brokerage Decline}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Commercial Mortgage Brokerage Decline}
    ${Text11_status}=    run keyword if   ${Commercial Mortgage Brokerage Decline}    get text     ${UMS-PH-Commercial Mortgage Brokerage Decline}
    run keyword if    ${Commercial Mortgage Brokerage Decline}    log to console    ${Text11_status}
    ${Construction Development Questionnaire Review}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Construction Development Questionnaire Review}
    ${Text12_status}=    run keyword if   ${Construction Development Questionnaire Review}    get text     ${UMS-PH-Construction Development Questionnaire Review}
    run keyword if    ${Construction Development Questionnaire Review}    log to console    ${Text12_status}
    ${Construction Development Sublimit Coverage}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Construction Development Sublimit Coverage}
    ${Text13_status}=    run keyword if   ${Construction Development Sublimit Coverage}    get text     ${UMS-PH-Construction Development Sublimit Coverage}
    run keyword if    ${Construction Development Sublimit Coverage}    log to console    ${Text13_status}
    ${Consulting Services}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Consulting Services}
    ${Text14_status}=    run keyword if   ${Consulting Services}    get text     ${UMS-PH-Consulting Services}
    run keyword if    ${Consulting Services}    log to console    ${Text14_status}
    ${Deductible Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Deductible Hold}
    ${Text15_status}=    run keyword if   ${Deductible Hold}    get text     ${UMS-PH-Deductible Hold}
    run keyword if    ${Deductible Hold}    log to console    ${Text15_status}
    ${Discrimination Sublimit}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Discrimination Sublimit}
    ${Text16_status}=    run keyword if   ${Discrimination Sublimit}    get text     ${UMS-PH-Discrimination Sublimit}
    run keyword if    ${Discrimination Sublimit}    log to console    ${Text16_status}
    ${Dual Agency Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Dual Agency Hold}
    ${Text17_status}=    run keyword if   ${Dual Agency Hold}    get text     ${UMS-PH-Dual Agency Hold}
    run keyword if    ${Dual Agency Hold}    log to console    ${Text17_status}
    ${Dual Agent Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Dual Agent Hold}
    ${Text18_status}=    run keyword if   ${Dual Agent Hold}    get text     ${UMS-PH-Dual Agent Hold}
    run keyword if    ${Dual Agent Hold}    log to console    ${Text18_status}
    ${EPLI limits higher than $500,000}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-EPLI limits higher than $500,000}
    ${Text19_status}=    run keyword if   ${EPLI limits higher than $500,000}    get text    ${UMS-PH-EPLI limits higher than $500,000}
    run keyword if    ${EPLI limits higher than $500,000}    log to console    ${Text19_status}
    ${Exclusive Listing}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Exclusive Listing}
    ${Text20_status}=    run keyword if   ${Exclusive Listing}    get text     ${UMS-PH-Exclusive Listing}
    run keyword if    ${Exclusive Listing}    log to console    ${Text20_status}
    ${Firm Type}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Firm Type}
    ${Text21_status}=    run keyword if   ${Firm Type}    get text     ${UMS-PH-Firm Type}
    run keyword if    ${Firm Type}    log to console    ${Text21_status}
    ${High Value Property Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-High Value Property Hold}
    ${Text22_status}=    run keyword if   ${High Value Property Hold}    get text     ${UMS-PH-High Value Property Hold}
    run keyword if    ${High Value Property Hold}    log to console    ${Text22_status}
    #${Include in expo process}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Include in expo process}
    #${Text21_status}=    run keyword if   ${Include in expo process}    get text     ${UMS-PH-Include in expo process}
    #run keyword if    ${Include in expo process}    log to console    ${Text21_status}
    ${License Suspended or Revoked}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-License Suspended or Revoked}
    ${Text23_status}=    run keyword if   ${License Suspended or Revoked}    get text     ${UMS-PH-License Suspended or Revoked}
    run keyword if    ${License Suspended or Revoked}    log to console    ${Text23_status}
    ${Limits}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Limits}
    ${Text24_status}=    run keyword if   ${Limits}    get text     ${UMS-PH-Limits}
    run keyword if    ${Limits}    log to console    ${Text24_status}
    ${Low Income}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Low Income}
    ${Text25_status}=    run keyword if   ${Low Income}    get text     ${UMS-PH-Low Income}
    run keyword if    ${Low Income}    log to console    ${Text25_status}
    ${Management of Associations Decline}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Management of Associations Decline}
    ${Text26_status}=    run keyword if   ${Management of Associations Decline}    get text     ${UMS-PH-Management of Associations Decline}
    run keyword if    ${Management of Associations Decline}    log to console    ${Text26_status}
    ${Mortgage Banker/ Escrow Decline}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Mortgage Banker/ Escrow Decline}
    ${Text27_status}=    run keyword if   ${Mortgage Banker/ Escrow Decline}    get text     ${UMS-PH-Mortgage Banker/ Escrow Decline}
    run keyword if    ${Mortgage Banker/ Escrow Decline}    log to console    ${Text27_status}
    ${Mortgage Brokerage Own Funds Decline}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Mortgage Brokerage Own Funds Decline}
    ${Text28_status}=    run keyword if   ${Mortgage Brokerage Own Funds Decline}    get text     ${UMS-PH-Mortgage Brokerage Own Funds Decline}
    run keyword if    ${Mortgage Brokerage Own Funds Decline}    log to console    ${Text28_status}
    ${No Income}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-No Income}
    ${Text29_status}=    run keyword if   ${No Income}    get text     ${UMS-PH-No Income}
    run keyword if    ${No Income}    log to console    ${Text29_status}
    ${Other income >40%}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Other income >40%}
    ${Text30_status}=    run keyword if   ${Other income >40%}    get text     ${UMS-PH-Other income >40%}
    run keyword if    ${Other income >40%}    log to console    ${Text30_status}
    ${Other Staff}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Other Staff}
    ${Text31_status}=    run keyword if   ${Other Staff}    get text     ${UMS-PH-Other Staff}
    run keyword if    ${Other Staff}    log to console    ${Text31_status}
    ${Owned Property Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Owned Property Hold}
    ${Text32_status}=    run keyword if   ${Owned Property Hold}    get text     ${UMS-PH-Owned Property Hold}
    run keyword if    ${Owned Property Hold}    log to console    ${Text32_status}
    ${Part Time}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Part Time}
    ${Text33_status}=    run keyword if   ${Part Time}    get text     ${UMS-PH-Part Time}
    run keyword if    ${Part Time}    log to console    ${Text33_status}
    ${Policy Term different from Annual}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Policy Term different from Annual}
    ${Text34_status}=    run keyword if   ${Policy Term different from Annual}    get text     ${UMS-PH-Policy Term different from Annual}
    run keyword if    ${Policy Term different from Annual}    log to console    ${Text34_status}
    ${Portal Ineligible}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Portal Ineligible}
    ${Text35_status}=    run keyword if   ${Portal Ineligible}    get text     ${UMS-PH-Portal Ineligible}
    run keyword if    ${Portal Ineligible}    log to console    ${Text35_status}
    ${Quoted premium greater than $10,000}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Quoted premium greater than $10,000}
    ${Text36_status}=    run keyword if   ${Quoted premium greater than $10,000}    get text     ${UMS-PH-Quoted premium greater than $10,000}
    run keyword if    ${Quoted premium greater than $10,000}    log to console    ${Text36_status}
    ${Quoted Premium is 0}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Quoted Premium is 0}
    ${Text37_status}=    run keyword if   ${Quoted Premium is 0}    get text     ${UMS-PH-Quoted Premium is 0}
    run keyword if    ${Quoted Premium is 0}    log to console    ${Text37_status}
    ${Referral income >40%}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Referral income >40%}
    ${Text38_status}=    run keyword if   ${Referral income >40%}    get text     ${UMS-PH-Referral income >40%}
    run keyword if    ${Referral income >40%}    log to console    ${Text38_status}
    ${Revenue above $2 million}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Revenue above $2 million}
    ${Text39_status}=    run keyword if   ${Revenue above $2 million}    get text     ${UMS-PH-Revenue above $2 million}
    run keyword if    ${Revenue above $2 million}    log to console    ${Text39_status}
    ${Service or Activity Questions Revenue is 25-40%}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Service or Activity Question’s Revenue is 25-40%}
    ${Text40_status}=    run keyword if   ${Service or Activity Questions Revenue is 25-40%}    get text     ${UMS-PH-Service or Activity Question’s Revenue is 25-40%}
    run keyword if    ${Service or Activity Questions Revenue is 25-40%}    log to console    ${Text40_status}
    ${Service/ Activity Greater than 40%}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Service/ Activity Greater than 40%}
    ${Text41_status}=    run keyword if   ${Service/ Activity Greater than 40%}    get text     ${UMS-PH-Service/ Activity Greater than 40%}
    run keyword if    ${Service/ Activity Greater than 40%}    log to console    ${Text41_status}
    ${Single Client Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Single Client Hold}
    ${Text42_status}=    run keyword if   ${Single Client Hold}    get text     ${UMS-PH-Single Client Hold}
    run keyword if    ${Single Client Hold}    log to console    ${Text42_status}
    ${State}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-State}
    ${Text43_status}=    run keyword if   ${State}    get text     ${UMS-PH-State}
    run keyword if    ${State}    log to console    ${Text43_status}
    ${Tax Lookup Failure New Business}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Tax Lookup Failure New Business}
    ${Text44_status}=    run keyword if   ${Tax Lookup Failure New Business}    get text     ${UMS-PH-Tax Lookup Failure New Business}
    run keyword if    ${Tax Lookup Failure New Business}    log to console    ${Text44_status}
    ${UnderWriterHold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-UnderWriter Hold}
    ${Text45_status}=    run keyword if   ${UnderWriterHold}    get text     ${UMS-PH-UnderWriter Hold}
    run keyword if    ${UnderWriterHold}    log to console    ${Text45_status}
    ${Washington State Hold}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Washington State Hold}
    ${Text46_status}=    run keyword if   ${Washington State Hold}    get text     ${UMS-PH-Washington State Hold}
    run keyword if    ${Washington State Hold}    log to console    ${Text46_status}
    ${Years Licensed}=    run keyword and return status    checkbox should be selected    ${UMS-PHCB-Years Licensed}
    ${Text47_status}=    run keyword if   ${Years Licensed}    get text     ${UMS-PH-Years Licensed}
    run keyword if    ${Years Licensed}    log to console    ${Text47_status}