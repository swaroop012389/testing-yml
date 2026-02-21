*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  String
Library  Collections
Library  DateTime
Library  ../../../Resource/Global-variable/login.py
Resource  ../../../Resource/Alternus_Res/Alt_Generic.robot
Resource  ../../../Resource/Global-variable/v2.robot
Resource  ../../../Resource/UMS.robot
Resource  ../../../Resource/TMS_RES/UMS_PAGE.robot
Resource  ../../../Resource/TMS_RES/PolicySearch.robot
Resource  ../../../../Data Provider/DataProvider.robot

*** Keywords ***
Review Non-Renewal Status_ManualClose
      [Arguments]    &{test_data}
      Login to UMS Edge
      Policy Search with Renewal Flag   ${test_data}
      TMS_SAE Pick Expiry Date
      Set Application Date to Current Date at Start
      change Application Date
      Set UMS date X Number of Days Prior Exp Date  135 days
      UMS Configure Background Process  ${test_data}
      T-log Triggered  ${test_data}
      Set Application Date to Current Date
      #TMS Dashboard   ${test_data}
      #Select policy   ${test_data}
      #Edit Task   ${test_data}
      #UMS_Journal
      ##Update Task in UMS Task Management  ${test_data}
      #Journal Verification    ${test_data}
      Review Non renewal Status Manual Close  ${test_data}
      UMS T-log Closed  ${test_data}