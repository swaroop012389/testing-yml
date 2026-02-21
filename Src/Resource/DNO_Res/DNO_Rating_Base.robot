*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot
Library  Collections
Library  String

*** Variables ***
${ID-RB-Total-Assets}=  //input[@id="Rows_0__Table_Corteges_0__3__Value"]
${ID-RB-Total-Revenue}=  //input[@id="Rows_0__Table_Corteges_1__3__Value"]
${ID-RB-Net-Assets}=  //input[@id="Rows_0__Table_Corteges_2__3__Value"]
${ID-RB-US(Non-Union)Full-Time-Employees(Class2)}=  //input[@id="Rows_1__Table_Corteges_10__3__Value"]
${ID-RB-US(Non-Union)Full-Time-Employees(Class1)}=  //input[@id="Rows_1__Table_Corteges_15__3__Value"]
${ID-RB-Fud-TotalPlan-Assets}=  //input[@id="Rows_1__Table_Corteges_0__3__Value"]
${ID-RB-ELL-Lawyers}=  //input[@id="Rows_2__Table_Corteges_0__3__Value"]
${ID-RB-CrimeAnnual-Revenue}=  //input[@id="Rows_1__Table_Corteges_0__3__Value"]
${ID-RB-Crime-No-Of-Locations}=  //input[@id="Rows_1__Table_Corteges_1__3__Value"]
${ID-RB-KNR-Employee-Count}=  //input[@id="Rows_1__Table_Corteges_0__3__Value"]

*** Keywords ***
DNO_Private_Rating Base
    [Arguments]  ${test_data}
    wait until element is not visible   globalAjaxLoading  80
    check and enter input  ${ID-RB-Total-Assets}  ${test_data['Total-Assets']}
    wait until element is not visible   globalAjaxLoading  80
    check and enter input  ${ID-RB-Total-Revenue}  ${test_data['Total-Revenue']}
    wait until element is not visible   globalAjaxLoading  80
    check and enter input  ${ID-RB-Net-Assets}  ${test_data['Net-Assets']}
    wait until element is not visible   globalAjaxLoading  80
    check and enter input  ${ID-RB-US(Non-Union)Full-Time-Employees(Class2)}  ${test_data['US(Non-Union) Full Time Employees (Class2)']}
    wait until element is not visible   globalAjaxLoading  80
    check and enter input  ${ID-RB-US(Non-Union)Full-Time-Employees(Class1)}  ${test_data['US(Non-Union)Full-Time-Employees(Class1)']}
    wait until element is not visible   globalAjaxLoading  80
    run keyword if  '${test_data['COV_NFP-FDU']}' == 'YES'  check and enter input  ${ID-RB-Fud-TotalPlan-Assets}  ${test_data['Fud-Total Plan Assets']}
    wait until element is not visible   globalAjaxLoading  80
    run keyword if  '${test_data['COV_NFP-ELL']}' == 'YES'  check and enter input  ${ID-RB-ELL-Lawyers}  ${test_data['ELL-Lawyers']}
    wait until element is not visible   globalAjaxLoading  80
    run keyword if  '${test_data['COV_NFP-CRIME']}' == 'YES'  check and enter input  ${ID-RB-CrimeAnnual-Revenue}  ${test_data['CrimeAnnual-Revenue']}
    wait until element is not visible   globalAjaxLoading  80
    run keyword if  '${test_data['COV_NFP-CRIME']}' == 'YES'  check and enter input  ${ID-RB-Crime-No-Of-Locations}  ${test_data['Crime-No-Of-Locations']}
    wait until element is not visible   globalAjaxLoading  80
    run keyword if  '${test_data['COV_NFP-KNR']}' == 'YES'  check and enter input  ${ID-RB-KNR-Employee-Count}  ${test_data['KNR-Employee-Count']}
    wait until element is not visible   globalAjaxLoading  80
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  80
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

NFP_DNO_Rating_Base
    [Arguments]  &{test_data}
    run keyword if    '${test_data['State']}' != 'Florida'  check and enter input  ${ID-RB-Crime-No-Of-Locations}  ${test_data['Crime-No-Of-Locations']}
    run keyword if    '${test_data['State']}' != 'Florida'  check and enter input  ${ID-RB-ELL-Lawyers}  ${test_data['KNR-Employee-Count']}  ELSE  check and enter input  ${ID-RB-KNR-Employee-Count}  ${test_data['KNR-Employee-Count']}
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  80
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

NFP_DNO_Limit
    click element    ${ID-COV-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  80