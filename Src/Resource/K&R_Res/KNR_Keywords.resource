*** Settings ***
Library    SeleniumLibrary
Library  ../../Resource/Global-variable/login.py
Resource  ../../Resource/Global-variable/v2.robot
Resource  ../../Resource/UMS.robot
Resource    ../../Resource/K&R_Res/ClientSearch.robot
Resource    ../../Resource/K&R_Res/Client_Detail.robot
Resource    ../../Resource/K&R_Res/BinderLetter.robot
Resource    ../../Resource/K&R_Res/Issue-Reissue.robot
Resource    ../../Resource/K&R_Res/PolicyPackage.robot
Resource    ../../Resource/K&R_Res/Bind-Issue.robot
Resource    ../../Resource/K&R_Res/Coverages.robot
Resource    ../../Resource/K&R_Res/BindEndorsement.robot

*** Keywords ***
Basic Policy Creation
    [Arguments]  &{test_data}
    Login To UMS Edge
    UMS ClientSearch   ${test_data}
    UMS ClientDetail   ${test_data}
    New Coverages for K&R   ${test_data}
    Bind for K&R
    Endorsement Options for K&R
    ChosenQuoteOptions for K&R
    Policy Info for K&R    ${test_data}
    Payments for K&R
    Binder Letter Generation for K&R   ${test_data}
    Issue Reissue
    PolicyPackage   ${test_data}

Creation Policy with Endrosement
    [Arguments]  &{test_data}
    Login To UMS Edge
    UMS ClientSearch   ${test_data}
    UMS ClientDetail   ${test_data}
    New Coverages for K&R   ${test_data}
    Bind for K&R
    Endorsement Options for K&R
    ChosenQuoteOptions for K&R
    Policy Info for K&R     ${test_data}
    Payments for K&R
    Binder Letter Generation for K&R    ${test_data}
    Issue Reissue
    PolicyPackage    ${test_data}
#Mid term Endorsement
#    Openeing New Tab UMS
    #PolicySearch   ${test_data}
    KNR Servicing
    MT Endorsement for K&R    ${test_data}
    Adding endrosment for K&R   ${testdata}
    Bind Endorsement    ${testdata}

Policy Creation with Cancellation and Reinstatement
    [Arguments]  &{test_data}
    Login To UMS Edge
    UMS ClientSearch   ${test_data}
    UMS ClientDetail   ${test_data}
    New Coverages for K&R   ${test_data}
    Bind for K&R
    Endorsement Options for K&R
    ChosenQuoteOptions for K&R
    Policy Info for K&R     ${test_data}
    Payments for K&R
    Binder Letter Generation for K&R    ${test_data}
    Issue Reissue
    PolicyPackage    ${test_data}
    KNR Servicing
    Policy Cancellation
    Complete Cancellation for K&R   ${test_data}
    Reinstatement
