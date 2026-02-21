*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/Generic.robot

*** Variables ***
${CY_BCI_Billing_preferences}=        //input[@name='billingPreferences']
${CY_BCI_Billing_pref_Surplus}=       //input[@name='billingPreferencesSurplus']
${Client_Contact_Info_Radio_Button}=  accountingcontact
${Client_Contact_First_Name}=         //input[@data-label='Contact First Name|ContactFirstName']
${Client_Contact_Last_Name}=          //input[@data-label='Contact Last Name|ContactLastName']
${Client_Contact_Email_Address}=      //input[@data-label='Contact Email Address|ContactEmail']
${ID-primary-contact}=                accntgnPrmryCntct
${CY_SL_Broker_Name}=                 //input[@name='SurplusLinesBrokerName']
${CY_SL_BrokerAgency_Name}=           //input[@name='SurplusLinesBrokerAgencyName']
${CY_SL_Liscence_Number}=             //input[@name='SurplusLinesLicenseNumber']
${CY_SL_Expiration_Date}=             //input[@name='SurplusLinesExpirationDate']
${CY_SL_State_Of_Filling}=            (//div[@role='combobox'])[1]
${CY_SL_AddressLine1}=                //input[@name='SurplusLinesAddLine1']
${CY_SL_City}=                        //input[@name='SurplusLinesCity']
${CY_SL_State}=                     //input[@name='SurplusLinesState']
${CY_SL_Zip_Code}=                    //input[@name='SurplusLinesZipCode']


*** Keywords ***
Cyber Billing and Contact Information
    [Arguments]    &{test_data}
    Wait Until Page Contains Element     ${CY_BCI_Billing_preferences}   5s
    Execute Javascript    window.scrollTo(0, 0)
    Select Value From Dropdown    ${CY_BCI_Billing_preferences}  ${test_data['Billing Preference']}
#    Select Value From Dropdown    ${CY_BCI_Billing_pref_Surplus}  ${test_data['Billing Preference']}
#    Wait Until Element Is Visible   ${CY_BCI_Billing_preferences}
#    Click Element    ${CY_BCI_Billing_preferences}
#    Wait Until Element Is Visible    //li[normalize-space()='${test_data['Billing Preference']}']
#    Click Element    //li[normalize-space()='${test_data['Billing Preference']}']
    continue Click RE

Surplus Lines Liscence Information
    [Arguments]    &{test_data}
    Wait Until Page Contains Element     ${CY_BCI_Billing_pref_Surplus}  5s
    Execute Javascript    window.scrollTo(0, 0)
    Select Value From Dropdown    ${CY_BCI_Billing_pref_Surplus}  ${test_data['Billing Preference']}
    Continue Click RE
    Wait Until Element Is Visible   ${CY_SL_Broker_Name}
    Input Text   ${CY_SL_Broker_Name}    ${test_data['FirstName']}
    Input Text   ${CY_SL_BrokerAgency_Name}    ${test_data['Firm Name']}
    Input Text   ${CY_SL_Liscence_Number}    BHN23789
   Input Text   ${CY_SL_Expiration_Date}    02022027
    press keys    NONE    TAB
#    Click Element       ${CY_SL_State_Of_Filling}
#    Sleep    1s
#    Scroll Element Into View    //li[normalize-space()='${test_data['State']}']
#    Click Element    //li[normalize-space()='${test_data['State']}']
    Input Text    ${CY_SL_AddressLine1}    ${test_data['AddressLine']}
    Input Text    ${CY_SL_City}    ${test_data['City']}
    Click Element       ${CY_SL_State}
    Sleep    1s
    Select Value From Dropdown     ${CY_SL_State}  ${test_data['State']}
#    Scroll Element Into View    //li[normalize-space()='${test_data['State']}']
#    Click Element    //li[normalize-space()='${test_data['State']}']
    Enter Zip Code  ${CY_SL_Zip_Code}    ${test_data['ZipCode']}
    continue Click RE