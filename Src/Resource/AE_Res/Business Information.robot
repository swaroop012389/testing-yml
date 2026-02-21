*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${AE_BI_DevelopmentParticulars}=  //textarea[@name='DevelopmentParticulars']
${AE_BI_ActualConstructionParticulars}=  //textarea[@name='ActualConstructionParticulars']
${AE_BI_RealEstateDevelopmentParticulars}=  //textarea[@name='RealEstateDevelopmentParticulars']
${AE_BI_ManufactureParticulars}=  //textarea[@name='ManufactureParticulars']
${AE_BI_FirmControlledOpenedParticulars}=  //textarea[@name='FirmControlledOpenedParticulars']
${AE_BI_FirmCotrolOtherEntityParticulars}=  //textarea[@name='FirmCotrolOtherEntityParticulars']
${AE_BI_FirmAcquisitionParticulars}=  //textarea[@name='FirmAcquisitionParticulars']
${AE_BI_Date_Firm_Name_Changed1}=  //input[@name='tableInputs[0].FirmNameChange_Date']
${AE_BI_Name_of_Firm_Change,Merge1}=  //input[@name='tableInputs[0].FirmNameChange_Name']
${AE_BI_Date_Firm_Name_Changed2}=  //input[@name='tableInputs[1].FirmNameChange_Date']
${AE_BI_Name_of_Firm_Change,Merge2}=  //input[@name='tableInputs[1].FirmNameChange_Name']
${AE_BI_Date_Firm_Name_Changed3}=  //input[@name='tableInputs[2].FirmNameChange_Date']
${AE_BI_Name_of_Firm_Change,Merge3}=  //input[@name='tableInputs[2].FirmNameChange_Name']
${AE_BI_Date_Firm_Name_Changed4}=  //input[@name='tableInputs[3].FirmNameChange_Date']
${AE_BI_Name_of_Firm_Change,Merge4}=  //input[@name='tableInputs[3].FirmNameChange_Name']
${AE_BI_Date_Firm_Name_Changed5}=  //input[@name='tableInputs[4].FirmNameChange_Date']
${AE_BI_Name_of_Firm_Change,Merge5}=  //input[@name='tableInputs[4].FirmNameChange_Name']
${AE_BI_FirmBankruptcyParticulars}=  //textarea[@name='FirmBankruptcyParticulars']
${AE_BI_FirmPolicyCancelledParticulars}=  //textarea[@name='FirmPolicyCancelledParticulars']


*** Keywords ***
AE Business Information
        [Arguments]    &{test_data}
        Sleep    10s
        click element  //input[@name='DevelopmentYN' and @value='${test_data["Development, sale, or leasing of computer hardware and software to others?"]}']
        run keyword if    '${test_data['Development, sale, or leasing of computer hardware and software to others?']}' == 'YES'    Input text    ${AE_BI_DevelopmentParticulars}  ${test_data['Please provide full particulars for Development, sale']}
        click element   //input[@name='ActualConstructionYN' and @value='${test_data["Actual construction, installation, fabrication or erection that is over 20% of the services?"]}']
        run keyword if    '${test_data['Actual construction, installation, fabrication or erection that is over 20% of the services?']}' == 'YES'    Input text    ${AE_BI_ActualConstructionParticulars}  ${test_data['Please provide full particulars for Actual construction']}
        click element  //input[@name='RealEstateDevelopmentPYN' and @value='${test_data["Real estate development?"]}']
        run keyword if    '${test_data['Real estate development?']}' == 'YES'    Input text    ${AE_BI_RealEstateDevelopmentParticulars}  ${test_data['RealestateDevExpl Please provide full particulars']}
        click element   //input[@name='ManufactureYN' and @value='${test_data["Manufacture, sale, lease, or distribution of any product, process, or patented production process?"]}']
        run keyword if    '${test_data['Manufacture, sale, lease, or distribution of any product, process, or patented production process?']}' == 'YES'    Input text    ${AE_BI_ManufactureParticulars}  ${test_data['ManufSaleLeaseDistrubutionExpl Please provide full particulars']}
        click element    //input[@name='FirmControlledOpenedYN' and @value='${test_data["Is the firm controlled/owned by or associated with any other entity?"]}']
        run keyword if    '${test_data['Is the firm controlled/owned by or associated with any other entity?']}' == 'YES'    Input text    ${AE_BI_FirmControlledOpenedParticulars}  ${test_data['FirmControlledAssociatedExpl Please provide full particulars']}
        click element   //input[@name='FirmCotrolOtherEntityYN' and @value='${test_data["Does the firm control any other entity?"]}']
        run keyword if    '${test_data['Does the firm control any other entity?']}' == 'YES'    Input text    ${AE_BI_FirmCotrolOtherEntityParticulars}  ${test_data['FirmControlOtherEntityExpl Please provide full particulars']}
        click element    //input[@name='FirmAcquisitionYN' and @value='${test_data["Has the firm ever been party to any acquisition, consolidation, merger, change in name or change in business organization?"]}']
        IF    '${test_data['Has the firm ever been party to any acquisition, consolidation, merger, change in name or change in business organization?']}' == 'YES'
        Input text    ${AE_BI_FirmAcquisitionParticulars}  ${test_data['FirmPartyToAcquisitionExpl Please provide full particulars']}
        sleep  3s
        Press Keys    ${AE_BI_Date_Firm_Name_Changed1}    ${test_data["Date Firm Name Changed"]}
        sleep  1s
        Input text    ${AE_BI_Name_of_Firm_Change,Merge1}    ${test_data["Name of Firm Change, Merger/Acquisition, or Consolidation"]}
        ELSE
        Scroll Element Into View      //input[@name='FirmBankruptcyYN' and @value='${test_data["Has the firm or any subsidiary or predecessor firm ever filed for or been in receivership or bankruptcy?"]}']
        click element   //input[@name='FirmBankruptcyYN' and @value='${test_data["Has the firm or any subsidiary or predecessor firm ever filed for or been in receivership or bankruptcy?"]}']
        run keyword if    '${test_data['Has the firm or any subsidiary or predecessor firm ever filed for or been in receivership or bankruptcy?']}' == 'YES'    Input text    ${AE_BI_FirmBankruptcyParticulars}  ${test_data['FiledBankruptcyExpl Please provide full particulars']}
        click element   //input[@name='FirmPolicyCancelledYN' and @value='${test_data["Has the firm or any member of the firm ever had a professional liability policy cancelled or non-renewed by any insurance company, for any reason other than premium nonpayment?"]}']
        run keyword if    '${test_data['Has the firm or any member of the firm ever had a professional liability policy cancelled or non-renewed by any insurance company, for any reason other than premium nonpayment?']}' == 'YES'    Input text    ${AE_BI_FirmPolicyCancelledParticulars}  ${test_data['FirmPolicyCancelledExpl Please provide full particulars']}
        END
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
       # wait until element is not visible  ${ID_Pleasewait}   30