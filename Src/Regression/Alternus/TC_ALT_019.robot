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
Resource  ../../../Data Provider/DataProvider.robot
Library  Collections
Library  String
Library  DateTime

*** Keywords ***
Reinsurance without TRIA Primary
    [Arguments]    &{test_data}
    Login to UMS
    PolicySearch    ${test_data}
    Layered Data Entry   ${test_data}
    Layer Validation_LD    ${test_data}    First    2    0
    Layer Validation_LD    ${test_data}    Second    3    1
    Master_Premium    ${test_data}
    Quote Letter Paragraphs
    QLP QuoteLetter    ${test_data}
    Add Endorsements
    Endorsements    ${test_data}
    UnderWriting Rating
    QuoteLetter
    UnderWriting Rating
    Payor-Fronting Carrier    ${test_data}
    Reinsurance MP
    Bind
    ChosenQuoteOptions
    Policy Info
    Payments
    BinderLetter Amend
    BillingNotice   ${test_data}
    Issue Reissue
    PolicyInfo Reissue    ${test_data}
    PolicyPackage