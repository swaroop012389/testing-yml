*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../Resource/UMS.robot
Resource  ../Resource/Global-variable/v2.robot
Resource  ../Resource/Generic.robot
Resource  ../../Data Provider/DataProvider.robot

*** Variables ***
${ID_FileType} =  id=fileTypeCode
${workid2} =  id=lob-title
${UMS_Documents}=    //a[contains(text(),'DOCUMENTS')]
@{BinderletterGeneration}=   SAE   CONTEQUIPT   REALESTATE  BUILDERSRISK

*** Keywords ***
Upload Document
        [Arguments]    ${test_data}
        ${LOB_Name}=  get text  (//p[contains(text(),'Status')]/preceding-sibling::div/p)[1]
        IF  '${LOB_Name}' != 'Builders Risk'
            sleep  2s
            ${file}=    set variable    ${CURDIR}\\test.png
            click element  //button[text()='Documents']
            wait until element is enabled  //button[text()='Upload here']  5s
#            choose file   (//input)[1]   ${file}
            choose file   //input[@type='file']   ${file}
            sleep  2s
#            Click Element     //div[@role='combobox']
            Execute Javascript    window.scrollTo(0, 0)
            Click Element     //div/label[text()='Document type']/parent::div/child::div/div/div
            sleep  3s
            IF    '${LOB_Name}' in ['Non-profit Management Liability', 'Private Company Management Liability']
#                Scroll Element Into View   //li[normalize-space()='Representation & Warranty']
                Click Element    //li[normalize-space()='Representation & Warranty']
            ELSE
                Click Element    //li[normalize-space()='Application']
            END
            Execute Javascript    window.scrollTo(0, 0)
            sleep  3s
            Wait Until Element Is Visible   //button[text()='Upload Document']
            sleep  4s
            Click Element    //button[text()='Upload Document']
            Wait Until Element Is Visible   //button[text()='Upload here']  30s
            Click Element     //button[text()='Documents']
            Run Keyword If    '${LOB_Name}' not in ['Non-profit Management Liability', 'Private Company Management Liability']  Policy Exit   ${Work ID}  ${test_data}
        ELSE
             Policy Exit   ${Work ID}  ${test_data}
        END

Document verification
    Go to UMS
    wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
    mouse over  ${ID-UMS-UNDERWRITING}
    click element  link=Rating
    ${Policy_Header_Info}=    get text  //td[b[text()='POLICY:']]//following-sibling::td
    ${Policy_Status}=  Fetch From Right  ${Policy_Header_Info}  STATUS:
    Run Keyword If    "${Policy_Status}"==" In Force"  Log To Console    Policy Status Matches and Verified  ELSE  Fail
#    click element  //a[@href="javascript:slidePanel()"]
    ${ums_program}=  get text  (//table[@class="organizationInfo"]//td)[10]
    log to console  ---${ums_program}
    wait until element is visible    ${UMS_Documents}  100
    wait until element is enabled    ${UMS_Documents}  100
    mouse over  ${UMS_Documents}
    click element    ${UMS_Documents}
    wait until element is not visible   globalAjaxLoading  100
    Execute Javascript    window.scrollTo(0, 200)
    ${Binderletter-check} =  run keyword and return status  list should not contain value  ${BinderletterGeneration}  ${ums_program}
    run keyword if    ${Binderletter-check}   Binder letter documentation
    wait until element is visible    //tr[td[text()='Policy Package']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Policy Package']]//td[7]     timeout=300
    ${Policy Package_Status}=    get text    //tr[td[text()='Policy Package']]//td[7]
    wait until element is visible    //tr[td[text()='Policy Package']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Policy Package']]//td[7]     timeout=300
    run keyword if  '${Policy Package_Status}' != 'Failed'  log to console    Policy Package Generated - "${Policy Package_Status}"   ELSE  log to console  Policy package not generated
    wait until element is not visible   globalAjaxLoading  350
    wait until element is visible    //tr[td[text()='Billing Notice']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Billing Notice']]//td[7]     timeout=300
    ${Billing Notice_Status}=    get text    //tr[td[text()='Billing Notice']]//td[7]
    wait until element is visible    //tr[td[text()='Billing Notice']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Billing Notice']]//td[7]     timeout=300
    run keyword if  '${Billing Notice_Status}' != 'Failed'  log to console   Billing Notice Generated - "${Billing Notice_Status}"   ELSE  log to console  Billing Notice not Generated
    wait until element is not visible   globalAjaxLoading  350
    wait until element is visible    //tr[td[text()='Payment Instructions']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Payment Instructions']]//td[7]     timeout=300
    ${Payment Instructions_Status}=    get text    //tr[td[text()='Payment Instructions']]//td[7]
    wait until element is visible    //tr[td[text()='Payment Instructions']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Payment Instructions']]//td[7]     timeout=300
    run keyword if  '${Payment Instructions_Status}' != 'Failed'  log to console    Payment Instructions Generated - "${Payment Instructions_Status}"   ELSE  log to console  "Payment Instructions not Generated"
    wait until element is not visible   globalAjaxLoading  350
    wait until element is visible    //tr[td[text()='Final Ratesheet']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Final Ratesheet']]//td[7]     timeout=400
    sleep  20s
    ${Final Ratesheet_Status}=    get text    //tr[td[text()='Final Ratesheet']]//td[7]
    wait until element is visible    //tr[td[text()='Final Ratesheet']]//td[7]     timeout=400
    wait until element is enabled    //tr[td[text()='Final Ratesheet']]//td[7]     timeout=400
    run keyword if  '${Final Ratesheet_Status}' != 'Failed'  log to console    Final Ratesheet Generated - "${Final Ratesheet_Status}"     ELSE  log to console  Final Ratesheet not Generated
    wait until element is not visible   globalAjaxLoading  350

Binder letter documentation
    wait until element is not visible   globalAjaxLoading  350
    wait until element is visible    //tr[td[text()='Binder Letter']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Binder Letter']]//td[7]     timeout=300
    ${Binder letter_Status}=    get text    //tr[td[text()='Binder Letter']]//td[7]
    wait until element is visible    //tr[td[text()='Binder Letter']]//td[7]     timeout=300
    wait until element is enabled    //tr[td[text()='Binder Letter']]//td[7]     timeout=300
    run keyword if  '${Binder letter_Status}' != 'Failed'  log to console    Binder letter Generated - "${Binder letter_Status}"   ELSE    log to console  Binder letter not Generated
    wait until element is not visible   globalAjaxLoading  350
    sleep  25s

Policy Exit
        [Arguments]   ${Work ID}  ${test_data}
        Wait Until Page Contains Element    //td[text()='Policy Number']/following-sibling::td  30s
        Scroll Element Into View     //td[text()='Policy Number']/following-sibling::td
        Wait Until Page Contains Element    //td[text()='Policy Issued']
        ${policy-number} =  Get text  //td[text()='Policy Number']/following-sibling::td
        Write Log  Policy issued. Work id: ${Work ID} and ${policy-number}
        ${ext-policy-number} =   Replace string  ${policy-number}  Policy Number:${SPACE}  ${EMPTY}
        set test variable  ${policy-no}  ${ext-policy-number}
        set to dictionary    ${test_data}    PolicyNumber=${ext-policy-number}

Upload Document for Testing as Broker
        [Arguments]  ${file}=c:\\Users\\Public\\VDI_Post_Install.txt    &{test_data}
        wait until element is enabled  //span[@class="has-files"]  10
        ${title} =  Get text  id=lob-title
        ${id} =  Get Regexp matches  ${title}  \\d
        ${work-id} =  Evaluate  "".join($id)
        click element  //span[@class="has-files"]
        wait until element is enabled  //*[@id="wia_upload_file"]  10
        choose file  //*[@id="wia_upload_file"]  ${file}
        Check and select from list by label  ${ID_FileType}  Application
        click element  //*[text()="Upload"]
        sleep  10
        wait until element is not visible  ${ID_wait-One-moment-please}  5
        wait until element is not visible  ${ID_Pleasewait}   5
        click button  //input[@name="saveAndExitButton"]
        Click element  link:Clear All
        wait until element is enabled  //*[contains(text(),'Search Options')]
        wait until element is not visible  ${ID_wait-One-moment-please}  5
        wait until element is not visible  ${ID_Pleasewait}   5
        Click element  //*[contains(text(),'Search Options')]
        input text  id=workItemId  ${work-id}
        Click button  id=searchBtn
        ${policy-number} =  Get text  //*[@id="${work-id}"]/*[@class='worklistdata-policy_number']
        Write Log  Policy issued. Work id: ${work-id} and ${policy-number}
        ${ext-policy-number} =   Replace string  ${policy-number}  Policy Number:${SPACE}  ${EMPTY}
        set test variable  ${policy-no}  ${ext-policy-number}

Broker K&R Upload Document
        [Arguments]    ${test_data}
        wait until element is not visible  ${ID_wait-One-moment-please}  50
        wait until element is not visible  ${ID_Pleasewait}   50
        ${file}=    set variable    c:\\Users\\Public\\VDI_Post_Install.txt
        wait until element is enabled  //span[@class="has-files"]  50
        ${title} =  Get text  id=lob-title
        ${id} =  Get Regexp matches  ${title}  \\d
        ${work-id} =  Evaluate  "".join($id)
        click element  //span[@class="has-files"]
        wait until element is enabled  //*[@id="wia_upload_file"]  50
        choose file  //*[@id="wia_upload_file"]  ${file}
        wait until element is not visible  ${ID_wait-One-moment-please}  50
        wait until element is not visible  ${ID_Pleasewait}   50
        Scroll Element Into View  ${ID_FileType}
        Check and select from list by label  ${ID_FileType}  Application
        click element  //*[text()="Upload"]
        wait until element is not visible  ${ID_wait-One-moment-please}  150
        wait until element is not visible  ${ID_Pleasewait}   150
        sleep  10s
        continue Click RE

Logout as Broker 
        Click Element    //span[text()='B']
        Wait Until Element Is Visible    //p[text()='Log Out']
        sleep  0.5s
        Click Element    //p[text()='Log Out']

Logout as an Underwriter
        Click Element    //span[text()='U']
        Wait Until Element Is Visible    //p[text()='Log Out']
        Click Element    //p[text()='Log Out']

Login as an Underwriter
        &{config_data}=  Read config data  config.txt
        ${email}=  Set variable  ${CONFIG_DATA['V2']['email']}
        Wait Until Element Is Visible   ${Email_Input_Field}  5s
        Input Text    ${Email_Input_Field}  ${email}
        Click Element   ${Login_Button}

Open Proposal From My Work
        Wait Until Element Is Visible   //div[text()='My Work']
        Click Element    //div[text()='My Work']
        Wait Until Element Is Visible     //p[text()='Create Filter']
        Sleep    5s
        ${Clear_All}=  Run Keyword And Return Status    Page Should Contain Element    //p[text()='Clear All']
        Run Keyword If   ${Clear_All}    Click Element    //p[text()='Clear All']
        Click Element    //p[text()='Create Filter']
        Input Text    //input[@id='Work Item Id_input']  ${Work ID}
        Click Element    //button[text()='Search']
        Wait Until Element Is Visible    //div[@data-id='${Work ID}']   300s
        Wait Until Page Contains Element    //div[@data-id='${Work ID}']   30s
        Set Focus To Element    //div[@data-id='${Work ID}']
        Click Element  //div[@data-id='${Work ID}']
#        Continue Click RE

Click on Work Id created as Broker
        [Arguments]   &{test_data}
        ${Accept}=    run keyword and return status  element should be visible    ${Accept_Button}
        run keyword if   ${Accept}    click element  ${Accept_Button}
        Click element  (//span[@class='ng-binding ng-scope'])[7]

Logout as Underwriter
        [Arguments]    &{test_data}
        wait until element is not visible  ${ID_wait-One-moment-please}  5
        wait until element is not visible  ${ID_Pleasewait}   5
        ${title} =  Get text  id=lob-title
        ${id} =  Get Regexp matches  ${title}  \\d
        ${work-id} =  Evaluate  "".join($id)
        Log To Console    Work id is  ${work-id}
        ${workid2}  Replace Variables  ${work-id}
        Log To Console   Work id 2 is ${workid2}
        wait until element is not visible  ${ID_wait-One-moment-please}  5
        wait until element is not visible  ${ID_Pleasewait}   5
        Click element  //a[@id='menu-entry-current-user']
        Click Element    //a[@id='menu-entry-logout']
        Log To Console    Logout as a Underwriter  //a[@id='menu-entry-logout']
        Close Browser
        Login To V2 With Broker Email
        Open Work ID created as Broker    ${workid2}   &{test_data}

Click on Work Id created as Underwriter
        [Arguments]    &{test_data}
        ${Accept}=    run keyword and return status  element should be visible    ${Accept_Button}
        run keyword if   ${Accept}    click element  ${Accept_Button}
        Click element  (//span[@class='ng-binding ng-scope'])[4]

Click on Quote Option as Broker
        [Arguments]    &{test_data}
        Click element  //a[contains(text(),'Generate Quote')]

Open Policy From mywork
        [Arguments]    &{test_data}
        Mouse Over    //div[@class='card workitem worklist-item MROF card-refer']
        Click Element    //div[@class='card workitem worklist-item MROF card-refer']
        #set selenium implicit wait  3
        Mouse Over   //span[@id='eventWorkItemAction_Open']
        Click Element   //span[@class='work_list_action action-button btn btn-default ng-scope']

Open Work ID created as Broker
        [Arguments]   ${workid2}     &{test_data}
        ${Accept}=    run keyword and return status  element should be visible    ${Accept_Button}
        run keyword if   ${Accept}    click element  ${Accept_Button}
        click element   //a[@id='my-work']
        wait until element is enabled  //*[contains(text(),'Search Options')]
        Click element  //*[contains(text(),'Search Options')]
        input text  id=workItemId  ${workid2}
        Click button  id=searchBtn

Logout as Broker Normal Way
         [Arguments]    &{test_data}
         wait until element is not visible  ${ID_wait-One-moment-please}  5
         wait until element is not visible  ${ID_Pleasewait}   5
         Click element  //a[@id='menu-entry-current-user']
         Click Element    //a[@id='menu-entry-logout']
         Close Browser

Open Work ID as Broker after search
        [Arguments]    &{test_data}
        Mouse Over    (//span[@class='ng-binding'])[40]
        Click element   (//span[@class='ng-binding'])[40]
        set selenium implicit wait  3
        Mouse Over    (//div[@id='eventWorkItemAction_Open'])
        Click Element   (//div[@id='eventWorkItemAction_Open'])

Logout as Underwriter Normal scenario
        [Arguments]    &{test_data}
        wait until element is not visible  ${ID_wait-One-moment-please}  5
        wait until element is not visible  ${ID_Pleasewait}   5
        Click element  //a[@id='menu-entry-current-user']
        Click Element    //a[@id='menu-entry-logout']
        Close Browser

Click On Open link From My Work
        Wait Until Element Is Visible    //a[@id='CARD-view']
        Scroll Element Into View    //a[@id='CARD-view']
        Click Element    //a[@id='CARD-view']
        Wait Until Page Contains Element    //div[@id='${workid2}']
        Double Click Element   //div[@id='${workid2}']
        sleep  3s
#        Wait Until Element Is Visible    //span[@id='eventWorkItemAction_Open']
#        Click Element    //span[@id='eventWorkItemAction_Open']

