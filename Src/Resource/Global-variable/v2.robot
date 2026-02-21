*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${Launch}=                      //*[@id="btnLaunchSSO"]
${TargetID}=                    id=DropDownList1
${eMail-ID}=                    id=txtNameID
${homepage-ID}=                 id=home
${ID-broker-contact}=           id=broker
${ID-Brokerage-Number}=         //input[@role='combobox'][1]
${All_LOB_IA_Brok_Num_Search}=  //button[normalize-space()='Search']
${Accept_Button}=               //button[text()="Accept"]
${Link_Builders_Risk}=          //p[contains(text(), 'Builders Risk')]
${V2_Work_ID}=                  //p[contains(text(),'ID')]
${Builders_Risk}=   //p[contains(text(), 'Builders Risk')]
${V2_Broker_number}=            (//span[@class='read-only-text'])[1]
${V2R_V2_Button}=               //p[normalize-space()='V2R']
${Email_Input_Field}=           //input[@placeholder='Enter your email...']
${Login_Button}=                //button[normalize-space()='Log in']
${V2_Broker_Icon}=  //span[text()='B']
${V2_Log_Out_Button}=  //p[text()='Log Out']
${V2_Admin_Icon}=  //span[text()='A']
${V2_My_Work_Page}=  //div[text()='My Work']
${V2_Create_Filter_Button}=  //p[text()='Create Filter']
${V2_Create_Filter_Button}=  //p[text()='Create Filter']
${V2_Work_ID_IP_Field}=  //input[@id='Work Item Id_input']
${V2_Search_Button}=  //button[text()='Search']
#${Collegue_Login}=  //p/a[normalize-space()='Colleague login']
${Collegue_Login}=  //a[text()='Colleague login']
${V2R_QA_Link}=  //p[text()='V2 Re-Platform-Qa']
${V2R_UAT_Link}=  //p[text()='V2 Re-Platform-UAT']
${Prod_V2_Link}=  //a[@href="https://mmcglobal.okta.com/app/marshmclennancompaniesinc_victorusvsquared_1/exkdxnxa1iTKbw8vn1t7/sso/saml"]
${Non_Prod_V2_Link}=  //a[@href="http://usdf14v1202.mrshmc.com/VICTORUSIDPSAMLAppNonProd/"]
${Production URL}=  http://app.us.victorinsurance.com/VictorProdAppDashboard/


*** Keywords ***
Login to Victor page
    [Arguments]    ${test_data}
    Set Environment and Create Webdriver  ${test_data}
    &{config_data}=  Read config data  config.txt
    ${Targetenvironment}=  Set variable  ${CONFIG_DATA['V2']['target']}
    Set To Dictionary    ${test_data}  Target=${Targetenvironment}
    run keyword if  '${test_data['Target']}'=='PROD'  Wait Until Element Is Visible    ${Prod_V2_Link}  10s
    run keyword if  '${test_data['Target']}'=='PROD'  click element    ${Prod_V2_Link}
#    run keyword if  '${test_data['Target']}'!='US - PROD'  Wait Until Element Is Visible    ${Non_Prod_V2_Link}  10s
#    run keyword if  '${test_data['Target']}'!='US - PROD'  click element    ${Non_Prod_V2_Link}
    Wait Until Element Is Visible    ${V2R_V2_Button}  5s
    Click Element   ${V2R_V2_Button}
#     Execute Javascript    document.body.style.zoom="70%"
#    Wait Until Page Contains Element    //p[text()='VICTOR PLATFORMS']
#    Sleep    5s
#    Execute Javascript    window.scrollTo(0, 600)
#    Select Frame    //iframe[@id='valFrame']
#    Scroll Element Into View    ${Collegue_Login}
#    Click Element    ${Collegue_Login}
#    Unselect Frame
#    Wait Until Page Contains Element     //p[text()='VICTOR PLATFORMS']  20s
#    Execute Javascript    window.scrollTo(0, 200)
#    Select Frame    //iframe[@id='valFrame']
#    Wait Until Page Contains Element  //p[text()='V2 Re-Platform-${Targetenvironment}']   20s
#    Click Element    //p[text()='V2 Re-Platform-${Targetenvironment}']
#    Unselect Frame
    Sleep    1s
    ${title}=  Get Window Titles
    Switch Window    ${title}[1]
#    Switch Window    url=https://model.v2.us.victorinsurance.com/vsquared/saml/SSO
#    Reload Page
    sleep  2s
    Wait Until Element Is Visible   ${Email_Input_Field}  5s
    Input Text    ${Email_Input_Field}  ${test_data['email']}
    Click Element   ${Login_Button}
#    Run Keyword If    '${URl}'!='${Production URL}'  Launch V2 Portal  ${test_data}

Set Environment and Create Webdriver
    [Arguments]    ${test_data}
    &{config_data}=  Read config data  config.txt
    ${QA_URL}=  Set variable  ${config_data['V2']['qa_url']}
    ${UAT_URL}=  Set variable  ${config_data['V2']['uat_url']}
    ${One_VAL}=  Set Variable  ${config_data['V2']['one_val_url']}
    ${Targetenvironment}=  Set variable  ${CONFIG_DATA['V2']['target']}
    Set To Dictionary    ${test_data}  Target=${Targetenvironment}
    Set Test Variable    ${Target_Env}  ${test_data['Target']}
    ${email}=  Set Variable  ${config_data['V2']['email']}
    Set To Dictionary    ${test_data}  email=${email}
    ${Agent_email}=  Set Variable  ${config_data['V2']['agent_email']}
    Set To Dictionary    ${test_data}  Agent_email=${Agent_email}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    run keyword if  '${CONFIG_DATA['V2']['headless']}'=='Yes'  Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
#    Call Method    ${options}    add_argument  --remote-debugging-port 9222
#    Call Method    ${options}    add_argument    --disable-dev-shm-usage
#    Call Method    ${options}    add_argument    --disable-notifications
#    Call Method    ${options}    add_argument    "--window-size=1920,1080"
    Create WebDriver    Edge    options=${options}
#    Go To    ${One_VAL}
#     Open Browser    ${QA_URL}  edge
    Run Keyword If    "${test_data['Target']}" == "QA"   Go To   ${QA_URL}
#    Set Window Size    1920  1080
    Run Keyword If    "${test_data['Target']}" == "UAT"  Go To   ${UAT_URL}
#    ${chrome_options}=    Evaluate
#    ...    __import__('selenium.webdriver').webdriver.ChromeOptions()
#    Call Method    ${chrome_options}    add_argument    --headless new
#    Call Method    ${chrome_options}    add_argument    --no-sandbox
#    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
#    Call Method    ${chrome_options}    add_argument    --disable-gpu
#    Call Method    ${chrome_options}   add_argument    --window-size 1920 1080
#    Open Browser     ${QA_URL}    chrome    options=${chrome_options}
    maximize browser window

Launch V2 Portal
        [Arguments]    ${test_data}
        Run Keyword If  '${test_data['Target']}'!='US - PROD'    Switch Window    title=V Squared SSO
        select from list by label  ${TargetID}  ${test_data['Target']}
        input text  ${eMail-ID}  ${test_data['Email']}
        click element  ${Launch}
        sleep  1s

Login To V2 With Broker Email
    [Arguments]   ${test_data}
    Set Environment and Create Webdriver  ${test_data}
    run keyword if  '${test_data['Target']}'=='PROD'  Wait Until Element Is Visible    ${Prod_V2_Link}  10s
    run keyword if  '${test_data['Target']}'=='PROD'  click element    ${Prod_V2_Link}
#    run keyword if  '${test_data['Target']}'!='US - PROD'  Wait Until Element Is Visible    ${Non_Prod_V2_Link}  10s
#    run keyword if  '${test_data['Target']}'!='US - PROD'  click element    ${Non_Prod_V2_Link}
    Wait Until Element Is Visible    ${V2R_V2_Button}  5s
    Click Element   ${V2R_V2_Button}
    Sleep    1s
    ${title}=  Get Window Titles
    Switch Window    ${title}[1]
    Wait Until Element Is Visible   ${Email_Input_Field}  5s
    Input Text    ${Email_Input_Field}   ${test_data['Agent_email']}
    Click Element   ${Login_Button}
#    Run Keyword If    '${URl}'!='${Production URL}'  Launch V2 Portal  ${test_data}

Builders Risk Navigation
    wait until element is not visible   globalAjaxLoading  100
    wait until element is visible    ${Link_Builders_Risk}    30
    click element    ${Link_Builders_Risk}
    wait until element is not visible   globalAjaxLoading  100

Insurance Agency Information
    [Arguments]    &{test_data}
    Wait Until Element Is Visible   ${All_LOB_IA_Brok_Num_Search}  10s
    input text  ${ID-Brokerage-Number}  ${test_data['Broker-id']}
    click element  ${All_LOB_IA_Brok_Num_Search}
    continue Click RE

Verify UW Hold Message on Quote Options Page
    ${element-check}  Run Keyword and Return status  Wait Until Page Contains Element      //div[text()='The submission is in Underwriter Hold. Please go into UMS to approve or decline the submission.']  60s
    Run Keyword if  ${element-check}  UMS Release hold

Fetch V2 Work ID
    Wait Until Element Is Visible   ${V2_Work_ID}   10s
    ${Work-Id}=    Get Location
    ${Work ID}=    Get Substring    ${Work-Id}    -6
    log to console  ${Work ID}
    set global variable  ${Work ID}

Create dummy data
        [Arguments]  ${test_data}
        ${FirmName} =  DummyBrokername
        ${FirstName} =  DummyFirstName
        ${Lastname} =  DummylastName
        ${Email} =  dummyemail
        ${AddressLine} =  Dummy st Address
        Set to dictionary  ${test_data}  Firm Name=${FirmName}  FirstName=${FirstName}  Lastname=${Lastname}  Email=${Email}  Address-Line=${AddressLine}

Create Dummy Data BR
    [Arguments]    ${test_data}
    ${InsuredName}=  DummyBrokername
    ${FirstName}=  DummyFirstName
    ${LastName}=  DummyLastName
    ${E-mail}=  dummyemail
    ${Address}=  Dummy st Address
    ${BuilderName}=  DummyBrokername
    ${Address}=  Dummy st Address
    Set to dictionary  ${test_data}  Insured Name=${InsuredName}  First Name=${FirstName}  Last Name=${LastName}
    ...    E-mail=${E-mail}  Mailing Street Address=${Address}  Builder Name=${BuilderName}  Builder Address=${Address}
    ...    Property-Street Address=${Address}

CE Setup test data
    &{config_data}=  Read config data  config.txt
    ${master_file}=  Set variable  ${config_data['Path']['ce']}${/}CE_MasterSheet.xlsx
    &{file_info}=  Read master file  ${master_file}
    RETURN    &{file_info}

Create Dummy Data CE
    [Arguments]    ${test_data}
    ${ApplicantName}=  DummyBrokername
    ${FirstName}=  DummyFirstName
    ${LastName}=  DummyLastName
    ${E-mail}=  dummyemail
    ${Address}=  Dummy st Address
    ${Address}=  Dummy st Address
    Set to dictionary  ${test_data}  Applicant Name=${ApplicantName}  FirstName=${FirstName}  LastName=${LastName}
    ...    Email=${E-mail}  AddressLine=${Address}

Cyber Setup test data
    &{config_data}=  Read config data  config.txt
    Set global Variable  &{CONFIG_DATA}  &{config_data}
    ${master_file}=  Set variable  ${CONFIG_DATA['Path']['cyber']}${/}Cyber_MasterSheet.xlsx
    &{file_info}=  Read master file  ${master_file}
    Set global Variable  &{TC_INFO}  &{file_info}

Create dummy data Cyber
    [Arguments]  ${test_data}
    ${FirmName} =  DummyBrokername
    ${FirstName} =  DummyFirstName
    ${Lastname} =  DummylastName
    ${Email} =  dummyemail
    ${AddressLine} =  Dummy st Address
    Set to dictionary  ${test_data}  Firm Name=${FirmName}  FirstName=${FirstName}  Lastname=${Lastname}  Email=${Email}  AddressLine=${AddressLine}

IA Setup test data
    &{config_data}=  Read config data  config.txt
    ${master_file}=  Set variable  ${config_data['Path']['ia']}${/}IA_MasterSheet.xlsx
    &{file_info}=  Read master file  ${master_file}
    RETURN  &{file_info}

IA Create dummy data
    [Arguments]   ${test_data}
    ${FirmName} =  DummyBrokername
    ${FirstName} =  DummyFirstName
    ${Lastname} =  DummylastName
    ${Email} =  dummyemail
    ${AddressLine} =  Dummy st Address
    Set to dictionary  ${test_data}  Firm Name=${FirmName}  FirstName=${FirstName}  Lastname=${Lastname}  Email=${Email}  AddressLine=${AddressLine}


MGMT NFP Setup test data
    &{config_data}=  Read config data  config.txt
    ${master_file}=  Set variable  ${config_data['Path']['mgmt-liab']}${/}MGMT_Mastersheet.xlsx
    &{file_info}=  Read master file  ${master_file}
    RETURN    &{file_info}

Create Dummy Data MGMT NFP
    [Arguments]    ${test_data}
    ${FirmName}=  DummyBrokername
    ${FirstName}=  DummyFirstName
    ${Lastname}=  DummylastName
    ${Email}=  dummyemail
    ${AddressLine}=  Dummy st Address
    Set to dictionary  ${test_data}  Applicant Name=${FirmName}  First Name=${FirstName}  Lastname=${Lastname}  Main Contact E-mail Address=${Email}  Address Line1=${AddressLine}

ML Private Setup test data
    &{config_data}=  Read config data  config.txt
    ${master_file}=  Set variable  ${config_data['Path']['ml-private']}${/}Ml-private_Mastersheet.xlsx
    &{file_info}=  Read master file  ${master_file}
    RETURN   &{file_info}

Create Dummy Data ML Private
    [Arguments]    ${test_data}
    ${InsuredName}=  DummyBrokername
    ${FirstName}=  DummyFirstName
    ${LastName}=  DummyLastName
    ${E-mail}=  dummyemail
    ${Address}=  Dummy st Address
    ${BuilderName}=  DummyBrokername
    ${Address}=  Dummy st Address
    Set to dictionary  ${test_data}  Insured Name=${InsuredName}  First Name=${FirstName}  Last Name=${LastName}
    ...    E-mail=${E-mail}  Mailing Street Address=${Address}  Builder Name=${BuilderName}  Builder Address=${Address}
    ...    Property-Street Address=${Address}
    ${FirmName}=  DummyBrokername
    ${FirstName}=  DummyFirstName
    ${Lastname}=  DummylastName
    ${Email}=  dummyemail
    ${AddressLine}=  Dummy st Address
    Set to dictionary  ${test_data}  Applicant Name=${FirmName}  Contact Name=${FirstName}
    ...    Lastname=${Lastname}  Main Contact E-mail Address=${Email}  Address Line1=${AddressLine}

RE Setup test data
        &{config_data}=  Read config data  config.txt
        ${master_file}=  Set variable  ${config_data['Path']['re']}${/}REO_MasterSheet.xlsx
        &{file_info}=  Read master file  ${master_file}
        RETURN  &{file_info}

RE Create dummy data
        [Arguments]  ${test_data}
        ${FirmName}=  DummyBrokername
        ${FirstName}=  DummyFirstName
        ${Lastname}=  DummylastName
        ${Email}=  dummyemail
        ${AddressLine}=  Dummy st Address
        Set to dictionary  ${test_data}  Firm Name=${FirmName}  FirstName=${FirstName}  Lastname=${Lastname}  Email=${Email}  AddressLine=${AddressLine}

Raven Setup test data
       &{config_data}=  Read config data  config.txt
       ${master_file}=  Set variable  ${config_data['Path']['raven']}${/}Raven_MasterSheet.xlsx
       &{file_info}=  Read master file  ${master_file}
       RETURN  &{file_info}

KNR Setup test data
       &{config_data}=  Read config data  config.txt
       ${master_file}=  Set variable  ${config_data['Path']['kr']}${/}K&R_MasterSheet.xlsx
       &{file_info}=  Read master file  ${master_file}
       RETURN  &{file_info}


Create dummy data KNR
        [Arguments]  ${test_data}
        ${FirmName} =  DummyBrokername
        ${FirstName} =  DummyFirstName
        ${Lastname} =  DummylastName
        ${Email} =  dummyemail
        ${RandomNumber}=  DummyRandomNumber
        ${AddressLine} =  Dummy st Address
        Set to dictionary  ${test_data}  Firm Name=${FirmName}  FirstName=${FirstName}  Lastname=${Lastname}  Email=${Email}  Address-Line=${AddressLine}  RandomNumber=${RandomNumber}

UW Policy Hold Verification
        ${UW_Check}=  Run Keyword And Return Status    Page Should Contain Element    //p[@class='alert alert-message']
        Run Keyword If    ${UW_Check}  UMS Release Hold