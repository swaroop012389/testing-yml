*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  String
Library  Collections
Library  DateTime
Resource  ../../../Resource/Global-variable/v2.robot
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot
Resource  ../../../Resource/Alternus_RES/Servicing.robot
Resource  ../../..//Resource/TMS_RES/UMS_PAGE.robot


*** Keywords ***
Pending Endorsement
    [Arguments]    &{test_data}
    Login to UMS Edge
    Policy Search with Renewal Flag    ${test_data}
    Set Application Date to Current Date at Start
    Servicing
    MT Endorsement     ${test_data}
    Pick Expiry Date SAE
    change Application Date
    Administration
    Set UMS date X Number of Days Prior Exp Date  125 days
    UMS Configure Background Process  ${test_data}
    switch window   title=Coverages
    T-log Triggered    ${test_data}
    Underwriter Rating
    Select from Coverages
    Bind Quote
    T-log Closed    ${test_data}