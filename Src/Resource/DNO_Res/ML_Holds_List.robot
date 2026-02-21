*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${ML-PHCB-D&O Retention/Deductible}=  //input[@id='PolicyFlags[0].Id']
${ML-PHCB-Additional Insured}=    //input[@id='PolicyFlags[1].Id']
${ML-PHCB-Alternative Options Requested}=     //input[@id='PolicyFlags[2].Id']
${ML-PHCB-Claims}=  //input[@id='PolicyFlags[3].Id']
${ML-PHCB-Class of business}=   //input[@id='PolicyFlags[4].Id']
${ML-PHCB-Clearance hold (VICTOR)}=   //input[@id='PolicyFlags[5].Id']
${ML-PHCB-Employed Lawyers Liability}=   //input[@id='PolicyFlags[6].Id']
${ML-PHCB-Employee Count}=     //input[@id='PolicyFlags[7].Id']
${ML-PHCB-Everest API Failure}=   //input[@id='PolicyFlags[8].Id']
${ML-PHCB-Everest OFAC Clearance}=     //input[@id='PolicyFlags[9].Id']
${ML-PHCB-Everest Submission Clearance}=    //input[@id='PolicyFlags[10].Id']
${ML-PHCB-Fiduciary}=      //input[@id='PolicyFlags[11].Id']
${ML-PHCB-Financials}=     //input[@id='PolicyFlags[12].Id']
${ML-PHCB-Include in expo process}=    //input[@id='PolicyFlags[13].Id']
${ML-PHCB-Layoffs Exists}=    //input[@id='PolicyFlags[14].Id']
${ML-PHCB-Limits}=      //input[@id='PolicyFlags[15].Id']
${ML-PHCB-Max Assets}=    //input[@id='PolicyFlags[16].Id']
${ML-PHCB-Minimum Premium}=   //input[@id='PolicyFlags[17].Id']
${ML-PHCB-Non-Renewed}=      //input[@id='PolicyFlags[18].Id']
${ML-PHCB-Organizational Type}=      //input[@id='PolicyFlags[19].Id']
${ML-PHCB-Retail Agent License Error}=    //input[@id='PolicyFlags[20].Id']
${ML-PHCB-Revenues}=  //input[@id='PolicyFlags[21].Id']
${ML-PHCB-State}=    //input[@id='PolicyFlags[22].Id']
${ML-PHCB-Tax exempt status}=      //input[@id='PolicyFlags[23].Id']
${ML-PHCB-Tax Lookup Failure New Business}=    //input[@id='PolicyFlags[24].Id']
${ML-PHCB-Turnover}=    //input[@id='PolicyFlags[25].Id']
${ML-PHCB-Volunteer Count}=    //input[@id='PolicyFlags[26].Id']
${ML-PHCB-Year established}=  //input[@id='PolicyFlags[27].Id']
${ML-PH-$0 D&O Retention/Deductible}=  //label[text()='$0 D&O Retention/Deductible']
${ML-PH-Additional Insured}=  //label[text()='Additional Insured']
${ML-PH-Alternative Options Requested}=  //label[text()='Alternative Options Requested']
${ML-PH-Claims}=  //label[text()='Claims']
${ML-PH-Class of business}=  //label[text()='Class of business']
${ML-PH-Clearance hold (VICTOR)}=  //label[text()='Clearance hold (VICTOR)']
${ML-PH-Employed Lawyers Liability}=  //label[text()='Employed Lawyers Liability']
${ML-PH-Employee Count}=  //label[text()='Employee Count']
${ML-PH-Everest API Failure}=  //label[text()='Everest API Failure']
${ML-PH-Everest OFAC Clearance}=  //label[text()='Everest OFAC Clearance']
${ML-PH-Everest Submission Clearance}=  //label[text()='Everest Submission Clearance']
${ML-PH-Fiduciary}=  //label[text()='Fiduciary']
${ML-PH-Financials}=  //label[text()='Financials']
${ML-PH-Include in expo process}=  //label[text()='Include in expo process']
${ML-PH-Layoffs Exists}=  //label[text()='Layoffs Exists']
${ML-PH-Limits}=  //label[text()='Limits']
${ML-PH-Max Assets}=  //label[text()='Max Assets']
${ML-PH-Minimum Premium}=  //label[text()='Minimum Premium']
${ML-PH-Non-Renewed}=  //label[text()='Non-Renewed']
${ML-PH-Organizational Type}=  //label[text()='Organizational Type']
${ML-PH-Retail Agent License Error}=  //label[text()='Retail Agent License Error']
${ML-PH-Revenues}=  //label[text()='Revenues']
${ML-PH-State}=  //label[text()='State']
${ML-PH-Tax exempt status}=  //label[text()='Tax exempt status']
${ML-PH-Tax Lookup Failure New Business}=  //label[text()='Tax Lookup Failure New Business']
${ML-PH-Turnover}=  //label[text()='Turnover']
${ML-PH-Volunteer Count}=  //label[text()='Volunteer Count']
${ML-PH-Year established}=  //label[text()='Year established']

*** Keywords ***
ML_Policy-Holds List
    log to console    Selected Policy Holds:
    ${D&O Retention/Deductible}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-D&O Retention/Deductible}
    ${Text_status}=    run keyword if   ${D&O Retention/Deductible}    get text     ${ML-PH-D&O Retention/Deductible}
    run keyword if    ${D&O Retention/Deductible}    log to console    ${Text_status}
    ${Additional Insured}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Additional Insured}
    ${Text_status}=    run keyword if   ${Additional Insured}    get text     ${ML-PH-Additional Insured}
    run keyword if    ${Additional Insured}    log to console    ${Text_status}
    ${Alternative Options Requested}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Alternative Options Requested}
    ${Text_status}=    run keyword if   ${Alternative Options Requested}    get text     ${ML-PH-Alternative Options Requested}
    run keyword if    ${Alternative Options Requested}    log to console    ${Text_status}
    ${Claims}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Claims}
    ${Text_status}=    run keyword if   ${Claims}    get text     ${ML-PH-Claims}
    run keyword if    ${Claims}    log to console    ${Text_status}
    ${Class of business}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Class of business}
    ${Text_status}=    run keyword if   ${Class of business}    get text     ${ML-PH-Class of business}
    run keyword if    ${Class of business}    log to console    ${Text_status}
    ${Clearance hold (VICTOR)}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Clearance hold (VICTOR)}
    ${Text_status}=    run keyword if   ${Clearance hold (VICTOR)}    get text     ${ML-PH-Clearance hold (VICTOR)}
    run keyword if    ${Clearance hold (VICTOR)}    log to console    ${Text_status}
    ${Employed Lawyers Liability}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Employed Lawyers Liability}
    ${Text_status}=    run keyword if   ${Employed Lawyers Liability}    get text     ${ML-PH-Employed Lawyers Liability}
    run keyword if    ${Employed Lawyers Liability}    log to console    ${Text_status}
    ${Employee Count}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Employee Count}
    ${Text_status}=    run keyword if   ${Employee Count}    get text     ${ML-PH-Employee Count}
    run keyword if    ${Employee Count}    log to console    ${Text_status}
    ${Everest API Failure}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Everest API Failure}
    ${Text_status}=    run keyword if   ${Everest API Failure}    get text     ${ML-PH-Everest API Failure}
    run keyword if    ${Everest API Failure}    log to console    ${Text_status}
    ${Everest OFAC Clearance}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Everest OFAC Clearance}
    ${Text_status}=    run keyword if   ${Everest OFAC Clearance}    get text     ${ML-PH-Everest OFAC Clearance}
    run keyword if    ${Everest OFAC Clearance}    log to console    ${Text_status}
    ${Everest Submission Clearance}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Everest Submission Clearance}
    ${Text_status}=    run keyword if   ${Everest Submission Clearance}    get text     ${ML-PH-Everest Submission Clearance}
    run keyword if    ${Everest Submission Clearance}    log to console    ${Text_status}
    ${Fiduciary}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Fiduciary}
    ${Text_status}=    run keyword if   ${Fiduciary}    get text     ${ML-PH-Fiduciary}
    run keyword if    ${Fiduciary}    log to console    ${Text_status}
    ${Financials}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Financials}
    ${Text_status}=    run keyword if   ${Financials}    get text     ${ML-PH-Financials}
    run keyword if    ${Financials}    log to console    ${Text_status}
    ${Include in expo process}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Include in expo process}
    ${Text_status}=    run keyword if   ${Include in expo process}    get text     ${ML-PH-Include in expo process}
    run keyword if    ${Include in expo process}    log to console    ${Text_status}
    ${Layoffs Exists}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Layoffs Exists}
    ${Text_status}=    run keyword if   ${Layoffs Exists}    get text     ${ML-PH-Layoffs Exists}
    run keyword if    ${Layoffs Exists}    log to console    ${Text_status}
    ${Limits}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Limits}
    ${Text_status}=    run keyword if   ${Limits}    get text     ${ML-PH-Limits}
    run keyword if    ${Limits}    log to console    ${Text_status}
    ${Max Assets}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Max Assets}
    ${Text_status}=    run keyword if   ${Max Assets}    get text     ${ML-PH-Max Assets}
    run keyword if    ${Max Assets}    log to console    ${Text_status}
    ${Minimum Premium}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Minimum Premium}
    ${Text_status}=    run keyword if   ${Minimum Premium}    get text     ${ML-PH-Minimum Premium}
    run keyword if    ${Minimum Premium}    log to console    ${Text_status}
    ${Non-Renewed}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Non-Renewed}
    ${Text_status}=    run keyword if   ${Non-Renewed}    get text     ${ML-PH-Non-Renewed}
    run keyword if    ${Non-Renewed}    log to console    ${Text_status}
    ${Organizational Type}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Organizational Type}
    ${Text_status}=    run keyword if   ${Organizational Type}    get text     ${ML-PH-Organizational Type}
    run keyword if    ${Organizational Type}    log to console    ${Text_status}
    ${Retail Agent License Error}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Retail Agent License Error}
    ${Text_status}=    run keyword if   ${Retail Agent License Error}    get text     ${ML-PH-Retail Agent License Error}
    run keyword if    ${Retail Agent License Error}    log to console    ${Text_status}
    ${Revenues}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Revenues}
    ${Text_status}=    run keyword if   ${Revenues}    get text     ${ML-PH-Revenues}
    run keyword if    ${Revenues}    log to console    ${Text_status}
    ${State}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-State}
    ${Text_status}=    run keyword if   ${State}    get text     ${ML-PH-State}
    run keyword if    ${State}    log to console    ${Text_status}
    ${Tax exempt status}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Tax exempt status}
    ${Text_status}=    run keyword if   ${Tax exempt status}    get text     ${ML-PH-Tax exempt status}
    run keyword if    ${Tax exempt status}    log to console    ${Text_status}
    ${Tax Lookup Failure New Business}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Tax Lookup Failure New Business}
    ${Text_status}=    run keyword if   ${Tax Lookup Failure New Business}    get text     ${ML-PH-Tax Lookup Failure New Business}
    run keyword if    ${Tax Lookup Failure New Business}    log to console    ${Text_status}
    ${Turnover}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Turnover}
    ${Text_status}=    run keyword if   ${Turnover}    get text     ${ML-PH-Turnover}
    run keyword if    ${Turnover}    log to console    ${Text_status}
    ${Volunteer Count}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Volunteer Count}
    ${Text_status}=    run keyword if   ${Volunteer Count}    get text     ${ML-PH-Volunteer Count}
    run keyword if    ${Volunteer Count}    log to console    ${Text_status}
    ${Year established}=    run keyword and return status    checkbox should be selected    ${ML-PHCB-Year established}
    ${Text_status}=    run keyword if   ${Year established}    get text     ${ML-PH-Year established}
    run keyword if    ${Year established}    log to console    ${Text_status}