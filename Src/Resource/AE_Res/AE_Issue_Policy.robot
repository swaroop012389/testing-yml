*** Settings ***
Library  SeleniumLibrary
Library  DateTime


*** Variables ***
${AE_IP_Issue_policy}=  //button[text()='Issue Policy']
${ID_wait_One_moment_please}=  //*[@id="lb_please_wait"]/div/div/div/p
${ID_Pleasewait}=  //*[@id="pleaseWait"]/div/div
${AE_IP_Effective_date}=  //input[@name='PolicyEffectiveDate']


*** Keywords ***
AE Issue Policy
     Wait Until Element Is Visible   ${AE_IP_Effective_date}    timeout=30s
     ${Eff_Date}=  Get Current Date    result_format=%m/%d/%Y
     Press Keys    ${AE_IP_Effective_date}  ${Eff_Date}
     Press Keys    NONE  TAB
     Wait Until Element Is Enabled    ${AE_IP_Issue_policy}
     click element    ${AE_IP_Issue_policy}
     Wait Until Page Contains Element    //p[text()='Client Information']  200s

