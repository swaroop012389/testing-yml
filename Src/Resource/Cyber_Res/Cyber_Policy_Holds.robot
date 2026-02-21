*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot


*** Variables ***
${UMS-Policy_Holds-Link}=                  link=Policy Holds
${ID-UMS-New-Business}=                    //img[@id='imgtdNew_Business']
${ID-UMS-CheckBox-CFC-Hold}=               //input[@id='PolicyFlags_3__Value']
${ID-UMS-CheckBox-Technology-Hold}=        //input[@id='PolicyFlags_10__Value']
${ID-UMS-CheckBox-CyberEvent-Hold}=        //input[@id='PolicyFlags_5__Value']
${ID-UMS-CheckBox-IneligibleClass-Hold}=   //input[@id='PolicyFlags_6__Value']
${ID-UMS-CheckBox-LegalAct-Hold}=          //input[@id='PolicyFlags_7__Value']
${ID-UMS-CheckBox-RegulatoryAct-Hold}=     //input[@id='PolicyFlags_8__Value']



*** Keywords ***
Navigate To Policy Holds Page
    wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
    mouse over  ${ID-UMS-UNDERWRITING}
    click element  ${UMS-Policy_Holds-Link}
    wait until element is not visible  globalAjaxLoading    10
    click element    ${ID-UMS-New-Business}

Verify, CFC Policy Hold is triggered or Not
    ${CFC_Hold_CheckBox_Status}=    run keyword and return status    checkbox should be selected    ${ID-UMS-CheckBox-CFC-Hold}
    run keyword if  ${CFC_Hold_CheckBox_Status}  log to console  CFC Hold is Triggered    ELSE
    ...    run keywords    log to console    CFC Hold is Not Triggered    AND    FAIL

Fail, If CFC Policy Hold is triggered
    ${CFC_Hold_CheckBox_Status}=    run keyword and return status    checkbox should be selected    ${ID-UMS-CheckBox-CFC-Hold}
    run keyword if  ${CFC_Hold_CheckBox_Status}  Fail

Verify, Technology Policy Hold is triggered or Not
     ${Technology_Hold_CheckBox_Status}=    run keyword and return status    checkbox should be selected    ${ID-UMS-CheckBox-Technology-Hold}
     run keyword if  ${Technology_Hold_CheckBox_Status}  log to console  Technology Organization Hold is Triggered    ELSE
     ...    run keywords    log to console    Technology Organization Hold is Not Triggered    AND    FAIL

Verify, Cyber Event Hold Is Triggered Or Not
     [Arguments]    &{test_data}
     ${Cyber_Event_Hold_CheckBox_Status}=    run keyword and return status    checkbox should be selected    ${ID-UMS-CheckBox-CyberEvent-Hold}
     run keyword if    ${Cyber_Event_Hold_CheckBox_Status}    log to console    Cyber Event Hold is Triggered    ELSE
     ...    run keyword    log to console    Cyber Event Hold is Not Triggered
     ${Stat1}=    set variable if  "${Cyber_Event_Hold_CheckBox_Status}"=="True"  YES
     ...    "${Cyber_Event_Hold_CheckBox_Status}"=="False"  NO
     run keyword if    "${test_data['Has your client experienced a cyber event in the past three years that has resulted in a direct financial loss of more than $10,000?']}"=="${Stat1}"
     ...    run keyword    log to console    Selected ${Stat1} For Disclosure Question 1 So, it Is Expected It Should ${Stat1} Trigger Cyber Event Hold

Verify, Ineligible Class Hold Is Triggered Or Not
     [Arguments]    &{test_data}
     ${Ineligible_Class_Hold_CheckBox_Status}=    run keyword and return status    checkbox should be selected    ${ID-UMS-CheckBox-IneligibleClass-Hold}
     run keyword if    ${Ineligible_Class_Hold_CheckBox_Status}    log to console    Ineligible Class Hold is Triggered    ELSE
     ...    run keyword    log to console    Ineligible Class Hold is Not Triggered
     ${Stat1}=    set variable if  "${Ineligible_Class_Hold_CheckBox_Status}"=="True"  YES
     ...    "${Ineligible_Class_Hold_CheckBox_Status}"=="False"  NO
     run keyword if    "${test_data['Has your client been involved in the direct supply of goods or services to the cannabis industry, nor are they involved directly in the use or supply of cryptocurrency?']}"=="${Stat1}"
     ...    run keyword    log to console    Selected ${Stat1} For Disclosure Question 4 So, it Is Expected It Should ${Stat1} Trigger Ineligible Class Hold

Verify, Legal Action Hold Is Triggered Or Not
     [Arguments]    &{test_data}
     ${Legal_Action_Hold_CheckBox_Status}=    run keyword and return status    checkbox should be selected    ${ID-UMS-CheckBox-LegalAct-Hold}
     run keyword if    ${Legal_Action_Hold_CheckBox_Status}    log to console    Legal Action Hold is Triggered    ELSE
     ...    run keyword    log to console    Legal Action Hold is Not Triggered
     ${Stat1}=    set variable if  "${Legal_Action_Hold_CheckBox_Status}"=="True"  YES
     ...    "${Legal_Action_Hold_CheckBox_Status}"=="False"  NO
     run keyword if    "${test_data['Has your client had any legal action brought or threatened against them in the last five years as a direct result of a cyber event?']}"=="${Stat1}"
     ...    run keyword    log to console    Selected ${Stat1} For Disclosure Question 2 So, it Is Expected It Should ${Stat1} Trigger Legal Action Hold

Verify, Regulatory Action Hold Is Triggered Or Not
     [Arguments]    &{test_data}
     ${Regulatory_Action_Hold_CheckBox_Status}=    run keyword and return status    checkbox should be selected    ${ID-UMS-CheckBox-RegulatoryAct-Hold}
     run keyword if    ${Regulatory_Action_Hold_CheckBox_Status}    log to console    Regulatory Action Hold is Triggered    ELSE
     ...    run keyword    log to console    Regulatory Action Hold is Not Triggered
     ${Stat1}=    set variable if  "${Regulatory_Action_Hold_CheckBox_Status}"=="True"  YES
     ...    "${Regulatory_Action_Hold_CheckBox_Status}"=="False"  NO
     run keyword if    "${test_data['Has your client had a regulatory action initiated against them in the last five years as a direct result of a cyber event?']}"=="${Stat1}"
     ...    run keyword    log to console    Selected ${Stat1} For Disclosure Question 3 So, it Is Expected It Should ${Stat1} Trigger Regulatory Action Hold
