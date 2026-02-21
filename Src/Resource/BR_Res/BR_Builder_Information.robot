*** Settings ***
Library    SeleniumLibrary
Library    ../Global-variable/login.py
Resource    ../Generic.robot


*** Variables ***
# Text fields
${BR_BI_Builder_Name}=    //input[@name='Insured_Name']
${BR_BI_Builder_Address}=    //input[@name='BuildersInfoGoogleAddress_Explanation']
${BR_BI_Builder_PriorExpDetails}=    //textarea[@name='BuilderPriorExpDetails']
#${BR_BI_Builder_InfoLossDescription}=    BuilderInfoLossDescription
#${BR_BI_Builder_InfoCounty}=    id=BuilderInfo-administrative_area_level_2
## Radio button
#${Name_Builder2YrsExperience}=    Builder2YrsExperience
#${Name_HasBuilderRiskLossInLast3yrs}=    HasBuilderRiskLossInLast3yrs
#${BuilderInfo_Radio_Button}=    buildersInfoAddressEntryBy
#${Builder_Address}=  id=buildersInfoGoogleAddress
#Three years details
${BR_BI_YearOne_BuilderRiskPremium}=   //input[@name='tableInputs[0].Builder_Risk_Premium']
${BR_BI_YearOne_TotalLossValue}=  //input[@name='tableInputs[0].Total_Loss_Value']
${BR_BI_YearOne_DescriptionofLosses}=    //input[@name='tableInputs[0].Description_Of_Losses']
${BR_BI_YearTwo_BuilderRiskPremium}=  //input[@name='tableInputs[1].Builder_Risk_Premium']
${BR_BI_YearTwo_TotalLossValue}=  //input[@name='tableInputs[1].Total_Loss_Value']
${BR_BI_YearTwo_DescriptionofLosses}=    //input[@name='tableInputs[1].Description_Of_Losses']
${BR_BI_YearThree_BuilderRiskPremium}=  //input[@name='tableInputs[2].Builder_Risk_Premium']
${BR_BI_YearThree_TotalLossValue}=  //input[@name='tableInputs[2].Total_Loss_Value']
${BR_BI_YearThree_DescriptionofLosses}=    //input[@name='tableInputs[2].Description_Of_Losses']
${BR_BI_Add}=   //button[text()='Add'] 

*** Keywords ***
BR Builder Information
    [Arguments]    ${test_data}
    wait until element is visible    ${BR_BI_Builder_Name}   10s
    #Wait Until Element Is Enabled    ${BR_BI_Builder_Name}   10s
    Input text    ${BR_BI_Builder_Name}    ${test_data['Builder Name']}
    Input text    ${BR_BI_Builder_Address}  ${test_data['Applicant Address']}
    Sleep   1.5s
    Press Keys    ${BR_BI_Builder_Address}   ARROW_DOWN
    Sleep   1.5s
    Press Keys    ${BR_BI_Builder_Address}   RETURN
    click element  //input[@name='BuilderinBusinessatLeast2YearsYN' and @value='${test_data['Does the builder have two years experience?']}']
    Accept Clearance Popup
    Run Keyword If    '${test_data['Does the builder have two years experience?']}'=='NO'  input text   ${BR_BI_Builder_PriorExpDetails}    ${test_data['If no provide details of prior experience']}
    click element   //input[@name='HasBuilderHadAnyLossesinPast3YearsYN' and @value='${test_data['Has the builder had any builders risk losses in the last three years?']}']
    Run Keyword If     '${test_data['Has the builder had any builders risk losses in the last three years?']}'=='YES'
    ...    run Keyword    Three Years Details  ${test_data}
    log to console    NAVIGATED TO BUILDER INFORMATION PAGE
    Click Continue Button
    wait until element is not visible   globalAjaxLoading  50

Three Years Details
    [Arguments]    ${test_data}
    Wait Until Element Is Visible    ${BR_BI_YearOne_BuilderRiskPremium}  5s
    input text    ${BR_BI_YearOne_BuilderRiskPremium}    ${test_data['Year one Builder Risk Premium']}
    Wait Until Element Is Visible    ${BR_BI_YearOne_TotalLossValue}  5s
    input text    ${BR_BI_YearOne_TotalLossValue}    ${test_data['Year one Total Loss Value']}
    Wait Until Element Is Visible    ${BR_BI_YearOne_DescriptionofLosses}  10s
    input text    ${BR_BI_YearOne_DescriptionofLosses}    ${test_data['Year one Description of Losses']}
    IF   '${test_data['Year two Builder Risk Premium']}' != 'nan'
         click element  ${BR_BI_Add}
         Wait Until Element Is Visible    ${BR_BI_YearTwo_BuilderRiskPremium}  5s
         input text    ${BR_BI_YearTwo_BuilderRiskPremium}    ${test_data['Year two Builder Risk Premium']}
         Wait Until Element Is Visible    ${BR_BI_YearTwo_TotalLossValue}  5s
         input text    ${BR_BI_YearTwo_TotalLossValue}    ${test_data['Year two Total Loss Value']}
         Wait Until Element Is Visible    ${BR_BI_YearTwo_DescriptionofLosses}  5s
         input text    ${BR_BI_YearTwo_DescriptionofLosses}    ${test_data['Year two Description of Losses']}
    END
    IF   '${test_data['Year three Builder Risk Premium']}' != 'nan'
         click element  ${BR_BI_Add}
         Wait Until Element Is Visible    ${BR_BI_YearThree_BuilderRiskPremium}  5s
         input text    ${BR_BI_YearThree_BuilderRiskPremium}    ${test_data['Year three Builder Risk Premium']}
         Wait Until Element Is Visible    ${BR_BI_YearThree_TotalLossValue}   5s
         input text    ${BR_BI_YearThree_TotalLossValue}    ${test_data['Year three Total Loss Value']}
         Wait Until Element Is Visible    ${BR_BI_YearThree_DescriptionofLosses}  5s
         input text    ${BR_BI_YearThree_DescriptionofLosses}    ${test_data['Year three Description of Losses']}
    END     