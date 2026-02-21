*** Settings ***
Library    SeleniumLibrary
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/UMS.robot
Library  ../../Resource/Global-variable/login.py
Resource    ../../Resource/K&R_Res/ClientSearch.robot
Resource    ../../Resource/K&R_Res/Client_Detail.robot
Resource    ../../Resource/K&R_Res/Issue-Reissue.robot
Resource    ../../Resource/Raven_Res/Raven Coverages.robot
Resource    ../../Resource/K&R_Res/PolicyPackage.robot
Resource    ../../Resource/Raven_Res/Upload_SOV_file.robot
Resource    ../../Resource/Raven_Res/Raven limitdeductable-Quote.robot

*** Keywords ***
AOP+Windstorm+Severe Convective storm+TRIA policy generation
    [Arguments]  &{test_data}
    Set Selenium Implicit Wait    10s
    Login To UMS Edge
    UMS ClientSearch  ${test_data}
    UMS ClientDetail   ${test_data}
    New Coverages for Raven   ${test_data}
    Raven Limitdeductibles to Quote    ${test_data}
    Bind
    Bind Quote Options to Bind  ${test_data}
    Upload_SOV_file   ${test_data}
    Issue Reissue
    PolicyPackage   ${test_data}

AOP+EQ+Flood+OtherEQ + Special Hazard Flood policy generation
    [Arguments]  &{test_data}
    Set Selenium Implicit Wait    10s
    Login To UMS Edge
    UMS ClientSearch  ${test_data}
    UMS ClientDetail   ${test_data}
    New Coverages for Raven   ${test_data}
    Raven Limitdeductibles to Quote     ${test_data}
    Bind
    Bind Quote Options to Bind  ${test_data}
    Upload_SOV_file   ${test_data}
    Issue Reissue
    PolicyPackage   ${test_data}

Cancellation by Flat
    [Arguments]  &{test_data}
    Set Selenium Implicit Wait    10s
    Login To UMS Edge
    UMS ClientSearch  ${test_data}
    UMS ClientDetail   ${test_data}
    New Coverages for Raven   ${test_data}
    Raven Limitdeductibles to Quote    ${test_data}
    Bind
    Bind Quote Options to Bind  ${test_data}
    Upload_SOV_file   ${test_data}
    Issue Reissue
    PolicyPackage   ${test_data}
    Policy Cancellation
    Complete Cancellation  ${test_data}
    Reinstatement