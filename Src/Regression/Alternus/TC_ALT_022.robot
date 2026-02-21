*** Settings ***
Documentation    Suite description
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../Resource/Alternus_Res/PolicySearch.robot
Resource  ../../Resource/Alternus_Res/Coverages.robot
Resource  ../../Resource/Alternus_Res/DataEntry.robot
Resource  ../../Resource/Alternus_Res/LayeredDataEntry.robot
Resource  ../../Resource/Alternus_Res/MasterPremium.robot
Resource  ../../Resource/Alternus_Res/Assignments.robot
Resource  ../../Resource/Alternus_Res/Underwriting.robot
Resource  ../../Resource/Alternus_Res/QuoteLetterParagraphs.robot
Resource  ../../Resource/Alternus_Res/QuoteLetter.robot
Resource  ../../Resource/Alternus_Res/Bind-Issue.robot
Resource  ../../Resource/Alternus_Res/BinderLetter.robot
Resource  ../../Resource/Alternus_Res/BillingNotice.robot
Resource  ../../Resource/Alternus_Res/Issue-Reissue.robot
Resource  ../../Resource/Alternus_Res/Policy-info.robot
Resource  ../../Resource/Alternus_Res/PolicyPackage.robot
Resource  ../../Resource/Alternus_Res/ClientSearch.robot
Resource  ../../Resource/Alternus_Res/Client_Detail.robot
Resource  ../../Resource/Alternus_Res/Endorsements.robot
Resource  ../../Resource/Alternus_Res/Servicing.robot
Resource  ../../Resource/Alternus_Res/BindEndorsement.robot
Resource  ../../Resource/Alternus_Res/EndorsementsToAttach.robot
Resource  ../../Resource/Alternus_Res/EndorsementLetter.robot
Resource  ../../../Data Provider/DataProvider.robot
Library  Collections
Library  String
Library  DateTime

*** Keywords ***
Endorsement with New/Renewal Issuance
    [Arguments]    &{test_data}
    Login to UMS
    PolicySearch     ${test_data}
    Servicing
    Mid-Term Endorsement    ${test_data}
    Endorsement Coverages
    Endorsement DataEntry
    Endorsement LayeredDataEntry    ${test_data}
    Endorsement Master Premium
    Bind Endorsement   ${test_data}
    EndorsementsToAttach
    Journal    ${test_data}
    Add Endorsements
    Single Endorsements    ${test_data}    ${test_data['Endorsement1']}
    Bind
    Payments
    Endorsement Letter
    BillingNotice   ${test_data}
    Get Policy Number