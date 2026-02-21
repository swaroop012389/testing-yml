*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot


*** Variables ***


*** Keywords ***

Optional Coverages
    [Arguments]    ${test_data}
    Wait Until Page Contains    Optional Coverages    30s
    Execute Javascript  window.scrollTo(0,50)
    sleep  2s
    run keyword if  '${test_data['Green Builder coverage?']}' != 'nan'   click element    //input[@name='Do_you_want_purchase_Green_Builder' and @value='${test_data['Green Builder coverage?']}']
    run keyword if  '${test_data['Contract Change Order?']}' != 'nan'   click element    //input[@name='ContractChangeOrderYN' and @value='${test_data['Contract Change Order?']}']
    run keyword if  '${test_data['Contract Change Order?']}' == 'YES'  click element     //input[@name='Coverage_ContractChangeOrder' and @value='${test_data['Percentage']}']
    run keyword if  '${test_data['Flood coverage?']}' != 'nan'    click element     //input[@name='FloodCoverageIncludedYN' and @value='${test_data['Flood coverage?']}']
    #Execute Javascript  window.scrollTo(0,800)
    run keyword if  '${test_data['Earthquake coverage?']}' != 'nan'    click element     //input[@name='EarthquakeCoverageIncludedYN' and @value='${test_data['Earthquake coverage?']}']
    run keyword if  '${test_data['Delay in Completion coverage?']}' != 'nan'    click element     //input[@name='Coverage_BusinessIncomeandExtraExpenses' and @value='${test_data['Delay in Completion coverage?']}']
    run keyword if  '${test_data['Permission to Occupy coverage?']}' != 'nan'    click element    //input[@name='PermissionToOccupyCoverageIncludedYN' and @value='${test_data['Permission to Occupy coverage?']}']
    run keyword if  '${test_data['Equipment Breakdown coverage?']}' != 'nan'    click element     //input[@name='EquipmentBreakdownCoverageYN' and @value='${test_data['Equipment Breakdown coverage?']}']
    run keyword if  '${test_data['Do you want to reject terrorism coverage?']}' != 'nan'   click element      //input[@name='RejectTerrorismYN' and @value='${test_data['Do you want to reject terrorism coverage?']}']
    Click Continue Button



