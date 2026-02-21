*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource  ../../Resource/UMS.robot


*** Variables ***
${BROWSER}=  chrome
${ID-PS-Search-PolicyNumber}=  id=PolicyNumber
${PS-ClientSearch}=    //a[contains(@href, '/Nexus/ClientSearch')]
${PS-ViewCoverages}=    //a[contains(@href, '/Nexus/RatingCoverages/ViewCoverages/')]
${ID-PS-TotalBillingRangeId}=    id=TotalBillingRangeId
${ID-PS-StatusFilter}=  id=StatusId
${ID-PS-Program}=    id=ProgramId
${ID_PS_Division}=  id=DivisionId
${Underwriting}=   //a[contains(text(),'UNDERWRITING')]
${ID-UW-Renewal_Flags}=  //a[contains(text(),'Renewal')]
${ID-Select_Radio_Button}=  SelectedRadio
${ID-Click_Save_Button}=  //input[@id='btnSubmit']
${ID-Click_ChangeReason_Save_Button}=  //span[contains(text(),'Save')]
${ID-Change_Reason_text}=  //textarea[@id='Reason']
${ID-PS-PolicyStageId}=    id=PolicyStageId
${ID-PS-Division}=    id=DivisionId
${ID-PS-RateTerritory}=    id=RateTerritoryId
${ID-PS-PolicyTerm}=   id=PolicyTermLengthsId
${ID-PS-View-Policy}=  link=View policy
${ID-PS-ApplyFilter}=  //input[@value='Apply Filter']
${ApplyFilter_button}=  //button[@id='applyButton']
${ID-PS-FirmTypeId}=    id=FirmTypeId
${ID-NoofRecords}=    //div[@class='resultsCount']
${PS-Rating-Index}=     //a[contains(@href, '/Nexus/Rating/Index/')]
${PS-ViewCoverages}=    //a[contains(@href, '/Nexus/RatingCoverages/ViewCoverages/')]
${ID-RenewalFlag}=  //select[@id='RenewalFlag']
${ID-PS-Renewal_Flag}=  //select[@id='RenewalFlag']
${ID-PS-Policy-Stage}=  id=PolicyStageId
${ID-PS-Endorsement-Type}=  id=EndorsementType
${ID-Account_Executive}=  //input[@id='ManagerOrAccountExecutive']
${PS-Next-Policy}=  (//a[contains(@href, '/Nexus/RatingCoverages/ViewCoverages/')])[2]
${Additional-Filter-Options}=   //html/body/table/tbody/tr[2]/td/div/div/div[4]/div[2]/div/div[2]/div[1]
${Dropdown}=    //html/body/table/tbody/tr[2]/td/div/div/div[4]/div[2]/div/div[2]/div[1]/span[2]
${Account_Exc_Input_Field}=  id=ManagerOrAccountExecutive
${UMS_TaskManagement}=  //a[contains(text(),'TASK MANAGEMENT')]
${UMS_TaskManagement_ApplyFilter}=  //span[contains(text(),'Apply Filter')]
${UMS_TaskManagement_Close1}=  (//a[contains(text(),'Close')])[1]
${UMS_TaskManagement_CloseBox}=  //input[@type='submit']
${UMS_TaskManagement_Close_Reason}=  //textarea[@id='JournalDetails']
@{RealEstate_Acc_Executives} =  Lee Christy     Myers Eric    Mclean Melissa
@{SAE_Acc_Executives} =  Infante Julia    Petersen Christopher    Legrant Annette
@{MGMT_NFP_Acc_Executives} =  Grant Tynisa   Smith Jessica   Amadeo Mario
@{Cyber_Acc_Executives} =  Gurto Nathon     Gurto Nathon    Gurto Nathon
@{BuildersRisk_Acc_Executives} =  Berry Donna     Berry Donna    Berry Donna
#UW Assignments
${ID-UWA-Tools} =  link=TOOLS
${Underwriter Assignment_Page}=     //a[contains(text(),'Underwriter Assignment')]
${UW_Page}=     //a[contains(text(),'UW Assignment')]
${ID-UWA-Insured State_ID}=    id=InsuredState
${Broker_State_ID}=    id=BrokerState
${ID-UWA-Billing From}=     id=BillingAmountFromId
${ID-UWA-Billing To}=   id=BillingAmountToId
${ID-UWA-Policy Mode}=  id=PolicyMode
${ID-UWA-ZipCodeFrom}=  id=ZipFrom
${ID-UWA-Zip CodeTo}=  id=ZipTo
${Name-Retailname}=  //input[@id="optName"]
${ID-UWA-Retailid}=   //input[@id="optId"]
${Name-RetailAny}=  //input[@id="optAny"]
${ID-UWA-RetailAgent_ID}=    id=RetailAgentId
${ID-UWA-RetailAgent_Name}=   id=RetailAgentName
${ID-UWA-Add_New_Rule}=   //*[@id="Uwa"]/div[1]/a
${Class-UWA-Account_Exec}=  (//span[@class='k-icon k-i-arrow-s k-button-icon'])[1]
${Class-UWA-Division}=  (//span[@class='k-icon k-i-arrow-s k-button-icon'])[2]
${Class-UWA-Policy_Mode}=  (//span[@class='k-icon k-i-arrow-s k-button-icon'])[3]
${Class-UWA-Insured_State}=  (//span[@class='k-icon k-i-arrow-s k-button-icon'])[4]
${Class-UWA-Billing_From}=  (//span[@class='k-icon k-i-arrow-s k-button-icon'])[5]
${Class-UWA-Billing_To}=  (//span[@class='k-icon k-i-arrow-s k-button-icon'])[6]
${Class-UWA-Renewal_Flag}=  (//span[@class='k-icon k-i-arrow-s k-button-icon'])[7]
${Class-UWA-Broker_State}=  (//span[@class='k-icon k-i-arrow-s k-button-icon'])[8]
${Class-UWA-Check_Rule}=   //span[@class='k-icon k-i-check k-button-icon']
${Id-UWA-Sequence_Number}=      id=SequenceNumber
${Id-UWA-Retail Agent}=     id=BrokerId
${Class-UWA-Effective_Date_NR}=      (//input[@class='appSearchCriteria k-input-inner'])[2]
${Class-UWA-Expiration_Date_NR}=      (//input[@class='appSearchCriteria k-input-inner'])[3]
${Class-UWA-EditRule}=     (//span[@class='k-icon k-i-edit k-button-icon'])[1]
${Id-UWA-Division}=    id=Division
${Class-UWA-Reset_Filter}=    (//span[@class='k-button-text'])[2]

*** Keywords ***
Get Real Estate Account Executive Names
    [Arguments]    ${test_data}
    ${RE_ACC1}=  Get From List  ${RealEstate_Acc_Executives}  0
    ${RE_ACC2}=  Get From List  ${RealEstate_Acc_Executives}  1
    ${RE_ACC3}=  Get From List  ${RealEstate_Acc_Executives}  2
    Set To Dictionary    ${test_data}  Acc_Exc1=${RE_ACC1}  Acc_Exc2=${RE_ACC2}   Acc_Exc3=${RE_ACC3}

Get SAE Account Executive Names
    [Arguments]    ${test_data}
    ${SAE_ACC1}=  Get From List  ${SAE_Acc_Executives}  0
    ${SAE_ACC2}=  Get From List  ${SAE_Acc_Executives}  1
    ${SAE_ACC3}=  Get From List  ${SAE_Acc_Executives}  2
    Set To Dictionary    ${test_data}  Acc_Exc1=${SAE_ACC1}  Acc_Exc2=${SAE_ACC2}   Acc_Exc3=${SAE_ACC3}

Get MGMT Non Profit Account Executive Names
    [Arguments]    ${test_data}
    ${MGMT_ACC1}=  Get From List  ${MGMT_NFP_Acc_Executives}  0
    ${MGMT_ACC2}=  Get From List  ${MGMT_NFP_Acc_Executives}  1
    ${MGMT_ACC3}=  Get From List  ${MGMT_NFP_Acc_Executives}  2
    Set To Dictionary    ${test_data}  Acc_Exc1=${MGMT_ACC1}  Acc_Exc2=${MGMT_ACC2}   Acc_Exc3=${MGMT_ACC3}

Get Cyber Account Executive Names
    [Arguments]    ${test_data}
    ${CY_ACC1}=  Get From List  ${Cyber_Acc_Executives}  0
    ${CY_ACC2}=  Get From List  ${Cyber_Acc_Executives}  1
    ${CY_ACC3}=  Get From List  ${Cyber_Acc_Executives}  2
    Set To Dictionary    ${test_data}  Acc_Exc1=${CY_ACC1}  Acc_Exc2=${CY_ACC2}   Acc_Exc3=${CY_ACC3}

Get Builders Risk Account Executive Names
    [Arguments]    ${test_data}
    ${BR_ACC1}=  Get From List  ${BuildersRisk_Acc_Executives}  0
    ${BR_ACC2}=  Get From List  ${BuildersRisk_Acc_Executives}  1
    ${BR_ACC3}=  Get From List  ${BuildersRisk_Acc_Executives}  2
    Set To Dictionary    ${test_data}  Acc_Exc1=${BR_ACC1}  Acc_Exc2=${BR_ACC2}   Acc_Exc3=${BR_ACC3}

Get Account executive Names
    [Arguments]    ${test_data}
    Run Keyword If    '${test_data['Program']}'=='REALESTATE'   Get Real Estate Account Executive Names  ${test_data}
    Run Keyword If    '${test_data['Program']}'=='SAE'    Get SAE Account Executive Names  ${test_data}
    Run Keyword If    '${test_data['Program']}'=='BUILDERSRISK'    Get Builders Risk Account Executive Names  ${test_data}
    Run Keyword If    '${test_data['Program']}'=='MGMT-LIAB'    Get MGMT Non Profit Account Executive Names  ${test_data}
    Run Keyword If    '${test_data['Program']}'=='CYBER PVT ENT'    Get Cyber Account Executive Names  ${test_data}

UW Assignments Login Page
    [Arguments]    ${test_data}
    click element  ${ID-UWA-Tools}
    Log To Console    Navigated to Tools Tab in UMS
    wait until element is not visible   globalAjaxLoading  40
    Mouse Over    ${Underwriter Assignment_Page}
    wait until element is not visible   globalAjaxLoading  40
    click element  ${UW_Page}
    Log To Console    Navigated to UW Assignment Page in UMS

Enter Account Executive Name
   [Arguments]    ${test_data}
   Input Text  ${Account_Exc_Input_Field}  ${test_data['Acc_Exc2']}

Check Policy Availibility
    [Arguments]    ${test_data}
    ${Policy_Availibility1}=  Run Keyword And Return Status    Page Should Contain Element  ${PS-Rating-Index}
    Run keyword if  ${Policy_Availibility1}  SELECT POLICY FROM BELOW FILTER
    ...  ELSE  Run Keywords    Check And Enter Input  ${Account_Exc_Input_Field}  ${test_data['Acc_Exc2']}  AND  click button  ${ApplyFilter_button}  AND  sleep  5s
    ...  AND  Execute Javascript    window.scrollTo(0,50)  AND  Check Policy Availibility2  ${test_data}

Check Policy Availibility2
    [Arguments]    ${test_data}
    sleep  5s
    ${Policy_Availibility2}=  Run Keyword And Return Status    Page Should Contain Element  ${PS-Rating-Index}
    Run Keyword If    ${Policy_Availibility2}  SELECT POLICY FROM BELOW FILTER
    ...  ELSE  Run Keywords    Check And Enter Input  ${Account_Exc_Input_Field}  ${test_data['Acc_Exc3']}  AND  click button  ${ApplyFilter_button}
    ...  AND  Execute Javascript    window.scrollTo(0,50)  AND  Check Policy Availibility3  ${test_data}

Check Policy Availibility3
    [Arguments]    ${test_data}
    sleep  5s
    ${Policy_Availibility3}=  Run Keyword And Return Status    Page Should Contain Element  ${PS-Rating-Index}
    Run Keyword If    ${Policy_Availibility3}  SELECT POLICY FROM BELOW FILTER
    ...  ELSE  Run Keywords    Clear Element Text  ${Account_Exc_Input_Field}  AND  click button  ${ApplyFilter_button}
    ...  AND  Execute Javascript    window.scrollTo(0,50)  AND  Check Policy Availibility4  ${test_data}

Check Policy Availibility4
    [Arguments]    ${test_data}
    Wait Until Element Is Visible    ${PS-Rating-Index}  120s
    ${Policy_Availibility4}=  Run Keyword And Return Status    Page Should Contain Element  ${PS-Rating-Index}
    Run Keyword If    ${Policy_Availibility4}  Run Keywords  Execute Javascript    window.scrollTo(0,50)  AND  SELECT POLICY FROM BELOW FILTER
    ...  ELSE  Run Keyword    Log To Console    No Policy available in the system for Status:${test_data['Status']} and Renewal Flag: ${test_data['Renewal Flag']}

Policy Search with Renewal Flag
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-PS-Program}    ${test_data['Program']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-PS-StatusFilter}    ${test_data['Status']}
    Press Keys    ${Dropdown}   Return
    Run Keyword If    '${test_data['Program']}'=='MGMT-LIAB'  Check and select from list by label  ${ID_PS_Division}    ${test_data['Division']}
    Wait Until Element Is Visible  ${ID-PS-Renewal_Flag}  6s
    Check and select from list by label  ${ID-PS-Renewal_Flag}    ${test_data['Renewal Flag']}
    Check And Select From List By Label    //select[@id='PolicyTermLengthsId']  Annual
    Wait Until Element Is Visible   ${Account_Exc_Input_Field}  10s
    Wait Until Page Contains Element  ${Account_Exc_Input_Field}  15s
    Input Text  ${Account_Exc_Input_Field}  ${test_data['Acc_Exc1']}
    wait until element is not visible   globalAjaxLoading  40
    click button  ${ApplyFilter_button}
    sleep  10s
    Log To Console    Required Policy status: ${test_data['Status']} and Renewal Flag:${test_data['Renewal Flag']}
    Execute Javascript    window.scrollTo(0,50)
    Check Policy Availibility  ${test_data}
    Verify If Task Is Triggered In UMS Task Management
    #SELECT POLICY FROM BELOW FILTER


Verify If Task Is Triggered In UMS Task Management
    Wait Until Element Is Visible  ${UMS_TaskManagement}  10s
    Click Element    ${UMS_TaskManagement}
    Wait Until Element Is Visible  ${UMS_TaskManagement_ApplyFilter}  10s
    sleep  0.5s
    FOR  ${element}  IN  1  2
        ${Task_Presence}=  Run Keyword And Return Status    Page Should Contain Element  ${UMS_TaskManagement_Close1}
        Run Keyword If  ${Task_Presence}  Close Triggered Task In UMS Task Management
    END

Close Triggered Task In UMS Task Management
    Click Element    ${UMS_TaskManagement_Close1}
    Wait Until Element Is Visible    ${UMS_TaskManagement_Close_Reason}  5s
    Input Text    ${UMS_TaskManagement_Close_Reason}  Closing this task
    Click Element    ${UMS_TaskManagement_CloseBox}
    Handle Alert    action=accept
    Handle Alert    action=accept
    Sleep    1s

PolicySearch
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-PS-Program}    ${test_data['Program']}
    wait until element is not visible   globalAjaxLoading  80
    Check and select from list by label  ${ID-PS-StatusFilter}    ${test_data['Status']}
    wait until element is not visible   globalAjaxLoading  80
    log to console  ${test_data['PolicyNumber']}
    Check and enter input  ${ID-PS-Search-PolicyNumber}   ${test_data['PolicyNumber']}
    wait until element is not visible   globalAjaxLoading  40
    click button  ${ApplyFilter_button}
    SELECT POLICY FROM BELOW FILTER

SELECT POLICY FROM BELOW FILTER
    wait until element is not visible   globalAjaxLoading  800
    Wait Until Element Is Visible    ${PS-Rating-Index}  50s
    set focus to element  ${PS-Rating-Index}
    mouse up  ${PS-Rating-Index}
    Sleep    3s
    click element  ${PS-Rating-Index}
    wait until element is not visible   globalAjaxLoading  100
    ${title}=    get window titles
    Switch Window    title=${title}[1]
    wait until element is not visible   globalAjaxLoading  100

View Policy
    wait until element is not visible   globalAjaxLoading  40
    ${no-of-rows}=  get element count  //div[div[contains(text(),'Number of found records')]]//table//tbody//tr
    ${Row1}=  convert to integer    ${no-of-rows}
    run keyword if   '${Row1}' > '2'  click element  ${PS-ViewCoverages}  ELSE  Fail  Policy not found

Search with UW Assignments Page
    [Arguments]    ${test_data}
    Log To Console    Navigated to UW Search Screen
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-PS-Program}    ${test_data['Program']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Billing From}    ${test_data['Billing From']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Billing To}    ${test_data['Billing To']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${Id-UWA-Division}    ${test_data['Division']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Insured State_ID}    ${test_data['Insured State']}
    wait until element is not visible   globalAjaxLoading  40
    #Click Element    ${Broker_State_ID}
    Check and select from list by label  ${Broker_State_ID}    ${test_data['Broker State']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Policy Mode}}    ${test_data['Policy Mode']}
    wait until element is not visible   globalAjaxLoading  40
    run keyword if  '${test_data['Retail Agent details']}' == 'Any'  click element  ${Name-RetailAny}
    run keyword if  '${test_data['Retail Agent details']}' == 'Name'  run keywords   click element  ${Name-Retailname}  AND  Check and enter input  ${ID-UWA-RetailAgent_Name}  ${test_data['Retail Agent ']}
    run keyword if  '${test_data['Retail Agent details']}' == 'Id'  run keywords   click element  ${ID-UWA-Retailid}  AND  Check and enter input  ${ID-UWA-RetailAgent_ID}  ${test_data['Retail Agent ']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input  ${ID-UWA-ZipCodeFrom}    ${test_data['Zip Code From']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input  ${ID-UWA-Zip CodeTo}    ${test_data['Zip Code To']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input   ${Account_Exc_Input_Field}  ${test_data['Account Exec']}
    Scroll Element Into View    ${ApplyFilter_button}
    execute javascript  window.scrollTo(0,200)
    click button  ${ApplyFilter_button}
    wait until element is not visible   globalAjaxLoading  200
    sleep  2s
    ${Items}=  get text  (//span[@class='k-pager-info k-label'])
    ${Get items}=  Fetch From Right    ${Items}    of${SPACE}
    ${Total items}=  Fetch From left    ${Get items}    items
    log to console  Total items- ${Total items}

Add New Rule in UW Assignments
    [Arguments]    ${test_data}
    Set Selenium Speed    0.10s
    Wait Until Element Is Visible   ${ID-UWA-Add_New_Rule}   300
    IF    '${test_data['New_Rule_Add']}'!= 'nan'
        Click Element    ${ID-UWA-Add_New_Rule}
    END
    Wait Until Element Is Visible         ${Class-UWA-Account_Exec}    350
    Execute Javascript    window.scrollTo(0,50)
    Mouse Over      ${Class-UWA-Account_Exec}
    Click Element   ${Class-UWA-Account_Exec}
    set selenium implicit wait  1
    Click Element      //li/span[contains(text(),"${test_data['Account_executive_1']}")]
    Log To Console    The Account Executive is selected
    Wait Until Element Is Visible   ${ID-UWA-Add_New_Rule}   350
    Wait Until Element Is Visible         ${Class-UWA-Division}    350
    Mouse Over      ${Class-UWA-Division}
    Click Element   ${Class-UWA-Division}
    set selenium implicit wait  1
    Click Element      (//li/span[contains(text(),"${test_data['Division_1']}")])[1]
    Log To Console    The Division is selected
    Wait Until Element Is Visible   ${ID-UWA-Add_New_Rule}   350
    Wait Until Element Is Visible         ${Class-UWA-Policy_Mode}   350
    Mouse Over      ${Class-UWA-Policy_Mode}
    Click Element   ${Class-UWA-Policy_Mode}
    set selenium implicit wait  1
    Click Element      (//li/span[contains(text(),"${test_data['Policy_Mode_1']}")])[2]
    Log To Console    The Policy Mode is selected
    Wait Until Element Is Visible   ${ID-UWA-Add_New_Rule}   350
    Wait Until Element Is Visible         ${Class-UWA-Insured_State}   350
    Mouse Over      ${Class-UWA-Insured_State}
    Click Element   ${Class-UWA-Insured_State}
    set selenium implicit wait  2
    run keyword if   '${test_data['Insured_State_others']}'=='YES'  Click Element      (//li/span[contains(text(),"${test_data['Insured_State_1']}")])[2]      ELSE    Click Element      (//li/span[contains(text(),"${test_data['Insured_State_1']}")])[3]
    Log To Console    The Insured State is selected
    Mouse Over      ${Class-UWA-Renewal_Flag}
    Click Element  ${Class-UWA-Renewal_Flag}
    Click Element      (//li/span[contains(text(),"${test_data['Renewal_Flag_1']}")])[4]
    Log To Console    The Renewal Flag is selected
    Mouse Over      ${Class-UWA-Broker_State}
    Click Element  ${Class-UWA-Broker_State}
    run keyword if  '${test_data['Broker_State_Others']}'=='YES'    Click Element      (//li/span[contains(text(),"${test_data['Broker_State_1']}")])[3]   ELSE    Click Element    (//li/span[contains(text(),"${test_data['Broker_State_1']}")])[5]
    Log To Console    The Broker State is selected
    Input Text    ${Id-UWA-Sequence_Number}    ${test_data['Sequence_Number']}
    Log To Console    The Sequence Number is added
    wait until element is not visible   globalAjaxLoading  350
    Check and enter input    ${Id-UWA-Retail Agent}    ${test_data['Retail_Agent_1']}
    wait until element is not visible   globalAjaxLoading  350
    Click Element    ${Class-UWA-Effective_Date_NR}
    Input Text    ${Class-UWA-Effective_Date_NR}    ${test_data['Effective_Date_1']}
    Log To Console    The Effective date is selected
    wait until element is not visible   globalAjaxLoading  350
    Click Element    ${Class-UWA-Expiration_Date_NR}
    Check and enter input    ${Class-UWA-Expiration_Date_NR}   ${test_data['Expiration_Date_1']}
    Log To Console    The Expiration date is selected
    wait until element is not visible   globalAjaxLoading  350
    set selenium implicit wait  2
    Click Element    ${Class-UWA-Check_Rule}
    sleep  2s
    #${Alert}=    Run Keyword And Return Status    Alert should be present   Error: Web Service Call Failed with error:"The Sequence number alreday exists"
    Handle Alert  accept
    ${message} =	Handle Alert

Edit UW Rules
   [Arguments]    ${test_data}
   Wait Until Element Is Visible   ${Class-UWA-EditRule}   100
   Click Element    ${Class-UWA-EditRule}

Search with UW Assignments Page results
    [Arguments]    ${test_data}
    Set Selenium Speed    0.10s
    wait until element is not visible   globalAjaxLoading  40
    Click Element    ${Class-UWA-Reset_Filter}
    Check and select from list by label  ${ID-PS-Program}    ${test_data['Program_1']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Billing From}    ${test_data['Billing From_1']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Billing To}    ${test_data['Billing To_1']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${Id-UWA-Division}    ${test_data['Division_1']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Insured State_ID}    ${test_data['Insured State_1']}
    wait until element is not visible   globalAjaxLoading  40
    Click Element    ${Broker_State_ID}
    Check and select from list by label  ${Broker_State_ID}    ${test_data['Broker State_1']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Policy Mode}}    ${test_data['Policy Mode_1']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input  ${ID-UWA-RetailAgent_ID}    ${test_data['Retail Agent_1']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input  ${ID-UWA-ZipCodeFrom}    ${test_data['Zip Code From_1']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input  ${ID-UWA-Zip CodeTo}    ${test_data['Zip Code To_1']}
    wait until element is not visible   globalAjaxLoading  40
    Scroll Element Into View    ${ApplyFilter_button}
    execute javascript  window.scrollTo(0,200)
    click button  ${ApplyFilter_button}
    wait until element is not visible   globalAjaxLoading  40

Reset Filter
    Click Element    ${Class-UWA-Reset_Filter}
    Check and select from list by label  ${ID-PS-Program}    ${test_data['Program_1']}
    Log To Console    The Program is selected
    Check and select from list by label  ${Id-UWA-Division}    ${test_data['Division_2']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Insured State_ID}    ${test_data['Insured State_2']}
    wait until element is not visible   globalAjaxLoading  40
    Click Element    ${Broker_State_ID}
    Check and select from list by label  ${Broker_State_ID}    ${test_data['Broker State_2']}
    wait until element is not visible   globalAjaxLoading  40
    Check and select from list by label  ${ID-UWA-Policy Mode}}    ${test_data['Policy Mode_2']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input  ${ID-UWA-RetailAgent_ID}    ${test_data['Retail Agent_2']}
    wait until element is not visible   globalAjaxLoading  40
    Click Element       ${ID-UWA-Billing From}
    select from list by Value  ${ID-UWA-Billing From}    ${test_data['Billing From_2']}
    wait until element is not visible   globalAjaxLoading  40
    Click Element   ${ID-UWA-Billing To}
    select from list by Value  ${ID-UWA-Billing To}    ${test_data['Billing To_2']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input  ${ID-UWA-ZipCodeFrom}    ${test_data['Zip Code From_2']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input  ${ID-UWA-Zip CodeTo}    ${test_data['Zip Code To_2']}
    wait until element is not visible   globalAjaxLoading  40
    Check and enter input   ${Account_Exc_Input_Field}  ${test_data['Account Exec_2']}
    Scroll Element Into View    ${ApplyFilter_button}
    execute javascript  window.scrollTo(0,200)
    click button  ${ApplyFilter_button}

Policy Search with Renewal Flag for MGMT PVT
    [Arguments]    ${test_data}
    wait until element is not visible   globalAjaxLoading  100
    Check and select from list by label  ${ID-PS-Program}    ${test_data['Program']}
    wait until element is not visible   globalAjaxLoading  200
    Check and select from list by label  ${ID_PS_Division}    ${test_data['Division']}
    wait until element is not visible   globalAjaxLoading  200
    Check and select from list by label  ${ID-PS-StatusFilter}    ${test_data['Status']}
    Press Keys    ${Dropdown}   Return
    #Run Keyword If    '${test_data['Program']}'=='MGMT-LIAB'  Check and select from list by label  ${ID_PS_Division}    ${test_data['Division']}
    Wait Until Element Is Visible  ${ID-PS-Renewal_Flag}  3s
    Check and select from list by label  ${ID-PS-Renewal_Flag}    ${test_data['Renewal Flag']}
    Wait Until Element Is Visible   ${Account_Exc_Input_Field}  3s
    Input Text  ${Account_Exc_Input_Field}  ${test_data['Acc_Exc1']}
    wait until element is not visible   globalAjaxLoading  200
    click button  ${ApplyFilter_button}
    sleep  7s
    Log To Console    Required Policy status: ${test_data['Status']} and Renewal Flag:${test_data['Renewal Flag']}
    Execute Javascript    window.scrollTo(0,50)
    Check Policy Availibility  ${test_data}
    Verify If Task Is Triggered In UMS Task Management
    #SELECT POLICY FROM BELOW FILTER
