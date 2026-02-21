*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${MLP_DO_Nameparentcompany}=  //input[@name="ParentCompanyName"]
${MLP_DO_shareholdersrepresentation}=   shareholdersrepresentation
${MLP_DO_Director_officer}=  (//em[text()='Select One'])[1]
${MLP_DO_Shareholder1}=  //input[@name="tableInputs[0].ShareholderName"]
${MLP_DO_Shareholder2}=  //input[@name="tableInputs[1].ShareholderName"]
${MLP_DO_Shareholder3}=  //input[@name="tableInputs[2].ShareholderName"]
${MLP_DO_Shareholder4}=  //input[@name="tableInputs[3].ShareholderName"]
${MLP_DO_Shareholder5}=  //input[@name="tableInputs[4].ShareholderName"]
${MLP_DO_Owned1}=  //input[@name="tableInputs[0].ShareholderPercent"]
${MLP_DO_Owned2}=  //input[@name="tableInputs[1].ShareholderPercent"]
${MLP_DO_Owned3}=  //input[@name="tableInputs[2].ShareholderPercent"]
${MLP_DO_Owned4}=  //input[@name="tableInputs[3].ShareholderPercent"]
${MLP_DO_Owned5}=  //input[@name="tableInputs[4].ShareholderPercent"]
${MLP_DO_Director1}=  (//input[@role='combobox'])[1]
${MLP_DO_Director2}=  (//input[@role='combobox'])[2]
${MLP_DO_Director3}=  (//input[@role='combobox'])[3]
${MLP_DO_Director4}=  (//input[@role='combobox'])[4]
${MLP_DO_Director5}=  (//input[@role='combobox'])[5]
${MLP_DO_Addbutton}=  //button[text()='Add']


*** Keywords ***

Director and Officers Liability
    [Arguments]  &{test_data}
    wait until page contains   Is insured 100% owned by parent company?     30s
    click element   //input[@name='InsuredByParentCompany' and @value='${test_data['Is insured 100% owned by parent company?']}']
    Sleep    3s
    Run Keyword If    '${test_data['Is insured 100% owned by parent company?']}' == 'NO'  Board Representation  &{test_data}   ELSE  Input text    ${MLP_DO_Nameparentcompany}   ${test_data['Name of Parent Company']}
    Click element    //input[@name='BoardofDirectorsChange' and @value='${test_data['unplanned changes to board or directors or key']}']
    Continue Click RE
    sleep  3s

Board Representation
    [Arguments]  &{test_data}
    sleep  1s
    Execute JavaScript    document.body.style.zoom = "70%"
    click element    //input[@name='BoardRepresentationYN' and @value='${test_data['Do all shareholders have board representation?']}']
    Input text   ${MLP_DO_Shareholder1}    ${test_data['Shareholder-1']}
    Input text   ${MLP_DO_Owned1}   ${test_data['%Owned-1']}
    Execute Javascript    window.scrollTo(50, 0)
    run keyword if  '${test_data['Director or Officer-1']}' != 'nan'  Select Value from Dropdown  ${MLP_DO_Director1}   ${test_data['Director or Officer-1']}
    Sleep    1s
    Input text   ${MLP_DO_Shareholder2}    ${test_data['Shareholder-2']}
    Sleep    1s
    Input text   ${MLP_DO_Owned2}   ${test_data['%Owned-2']}
    Scroll Element Into View    ${MLP_DO_Director2}
    #Execute Javascript  window.scrollTo(0, 250)
    Execute Javascript    window.scrollTo(50, 0)
    run keyword if  '${test_data['Director or Officer-2']}' != 'nan'  Select Value from Dropdown  ${MLP_DO_Director2}   ${test_data['Director or Officer-2']}
    IF   '${test_data['Shareholder-3']}' != 'nan'
           Sleep    1s
           click element  ${MLP_DO_Addbutton}
           Sleep    1s
           Input text   ${MLP_DO_Shareholder3}    ${test_data['Shareholder-3']}
           Sleep    1s
           Input text   ${MLP_DO_Owned3}   ${test_data['%Owned-3']}
           Sleep    1s
           Select Value from Dropdown   ${MLP_DO_Director3}   ${test_data['Director or Officer-3']}
    END
    IF   '${test_data['Shareholder-4']}' != 'nan'
           click element  ${MLP_DO_Addbutton}
           Sleep    1s
           Input text   ${MLP_DO_Shareholder4}    ${test_data['Shareholder-4']}
           Sleep    1s
           Input text   ${MLP_DO_Owned4}   ${test_data['%Owned-4']}
           Sleep    1s
           Select Value from Dropdown   ${MLP_DO_Director4}   ${test_data['Director or Officer-4']}
    END
    IF   '${test_data['Shareholder-5']}' != 'nan'
           click element  ${MLP_DO_Addbutton}
           Sleep    1s
           Input text   ${MLP_DO_Shareholder5}    ${test_data['Shareholder-5']}
           Sleep    1s
           Input text   ${MLP_DO_Owned5}   ${test_data['%Owned-5']}
           Sleep    1s
           Select Value from Dropdown   ${MLP_DO_Director5}   ${test_data['Director or Officer-5']}
    END

   #${max_shareholder}=    Set Variable  5
   #       FOR    ${index}    IN RANGE   0  ${max_shareholder}
   #            ${value}=  evaluate  ${index}+1
   #            run keyword If   '${test_data['Shareholder-${value}']}' != 'nan'  Input text  //input[@name='tableInputs[${index}].ShareholderName']      ${test_data['Shareholder-${value}']}
   #            run keyword If  '${test_data['%Owned-${value}']}' != 'nan'  Input text  //input[@name='tableInputs[${index}].ShareholderPercent']    ${test_data['%Owned-${value}']}
   #            run keyword If  '${test_data['Director or Officer-${value}']}' != 'nan'  select value from dropdown   ${MLP_DO_Director_officer}   ${test_data['Director or Officer-${value}']}
   #            IF  '${index}' > '2'
   #                ${add_row}=  evaluate  ${max_shareholder}-2
   #                run keyword if  '${index}' >= '${add_row}'   click element  ${ML_AI_Addbutton}
   #            END
   #       END







   






