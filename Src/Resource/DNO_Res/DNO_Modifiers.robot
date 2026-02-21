*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot
Resource  ../../Resource/Alternus_Res/Journal.robot
Resource  ../../Resource/DNO_Res/DNO_Rating_Base.robot
Resource  ../../Resource/Alternus_Res/Bind-Issue.robot
Resource  ../../Resource/Alternus_Res/QuoteLetter.robot
Resource  ../../Resource/Alternus_Res/BinderLetter.robot
Resource  ../../Resource/Alternus_Res/PolicyPackage.robot
Resource  ../../Resource/Alternus_Res/Issue-Reissue.robot
Resource  ../../Resource/Alternus_Res/Policy-info.robot
Library  Collections
Library  String

*** Variables ***
${ID-UW-Rating} =  //a[contains(text(),'Rating')]
${UMS-Modifiers}=  //a[contains(@href, '/Nexus/RatingModifiers/ViewModifiers/')]
${UMS-Quoteletter-bubble}=  //a[contains(@href, '/Nexus/RatingQuoteLetter/ViewSendQuoteLetter/')]
###Directors and Officers Liability Coverage (NFP-DNO)
${Text-DNO-Nature-of-Operations}=  //input[@id="Rows_0__Table_Corteges_0__2__Value"]
${NFP-DNO-Nature-of-Operations}=  //input[@id='Rows_0__Table_Corteges_0__3__Value']
${Text-DNO-Number of Years in Business}=  //input[@id="Rows_0__Table_Corteges_1__2__Value"]
${NFP-DNO-Number of Years in Business}=  //input[@id='Rows_0__Table_Corteges_1__3__Value']
${Text-DNO-Number of Subsidiaries}=  //input[@id="Rows_0__Table_Corteges_2__2__Value"]
${NFP-DNO-Number of Subsidiaries}=  //input[@id='Rows_0__Table_Corteges_2__3__Value']
${Text-DNO-Merger Divestiture Activity}=  //input[@id="Rows_0__Table_Corteges_3__2__Value"]
${NFP-DNO-Merger Divestiture Activity}=  //input[@id='Rows_0__Table_Corteges_3__3__Value']
${Text-DNO-Securities Offering Activity}=  //input[@id="Rows_0__Table_Corteges_4__2__Value"]
${NFP-DNO-Securities Offering Activity}=  //input[@id='Rows_0__Table_Corteges_4__3__Value']
${Text-DNO-Litigation History}=  //input[@id="Rows_0__Table_Corteges_5__2__Value"]
${NFP-DNO-Litigation History}=  //input[@id='Rows_0__Table_Corteges_5__3__Value']
${Text-DNO-Significant Transaction}=  //input[@id="Rows_0__Table_Corteges_6__2__Value"]
${NFP-DNO-Significant Transaction}=  //input[@id='Rows_0__Table_Corteges_6__3__Value']
${Text-DNO-Management Stability}=  //input[@id="Rows_0__Table_Corteges_7__2__Value"]
${NFP-DNO-Management Stability}=  //input[@id='Rows_0__Table_Corteges_7__3__Value']
${Text-DNO-Statement of Financial Position}=  //input[@id="Rows_0__Table_Corteges_8__2__Value"]
${NFP-DNO-Statement of Financial Position}=  //input[@id='Rows_0__Table_Corteges_8__3__Value']
${Text-DNO-Statement of Activities}=  //input[@id="Rows_0__Table_Corteges_9__2__Value"]
${NFP-DNO-Statement of Activities}=  //input[@id='Rows_0__Table_Corteges_9__3__Value']
${Text-DNO-Statement of Cash Flows}=  //input[@id="Rows_0__Table_Corteges_10__2__Value"]
${NFP-DNO-Statement of Cash Flows}=  //input[@id='Rows_0__Table_Corteges_10__3__Value']
###Optional Coverage Enhancements
${Text-DNO-Defend Selection Factor}=  //input[@id="Rows_0__Table_Corteges_11__2__Value"]
${NFP-DNO-Defend Selection Factor}=  //input[@id='Rows_0__Table_Corteges_11__3__Value']
${Text-DNO-Endorsement Factor}=  //input[@id="Rows_0__Table_Corteges_12__2__Value"]
${NFP-DNO-Endorsement Factor}=  //input[@id='Rows_0__Table_Corteges_12__3__Value']
###Scheduled
${Text-DNO-Quality of Management}=  //input[@id="Rows_0__Table_Corteges_17__2__Value"]
${NFP-DNO-Quality of Management}=  //input[@id='Rows_0__Table_Corteges_17__3__Value']
${Text_NY-DNO-Quality of Management}=  //input[@id="Rows_0__Table_Corteges_16__2__Value"]
${NY-DNO-Quality of Management}=  //input[@id="Rows_0__Table_Corteges_16__3__Value"]
${Text-DNO-Affected by Recession}=  //input[@id="Rows_0__Table_Corteges_16__2__Value"]
${NFP-DNO-Affected by Recession}=  //input[@id='Rows_0__Table_Corteges_16__3__Value']
${Text_NY-DNO-Affected by Recession}=  //input[@id="Rows_0__Table_Corteges_15__2__Value"]
${NY-DNO-Affected by Recession}=  //input[@id="Rows_0__Table_Corteges_15__3__Value"]
${Text-DNO-Overall Financial Liquidity}=  //input[@id="Rows_0__Table_Corteges_15__2__Value"]
${NFP-DNO-Overall Financial Liquidity}=  //input[@id='Rows_0__Table_Corteges_15__3__Value']
${Text_NY-DNO-Overall Financial Liquidity}=  //input[@id="Rows_0__Table_Corteges_14__2__Value"]
${NY-DNO-Overall Financial Liquidity}=  //input[@id="Rows_0__Table_Corteges_14__3__Value"]
${Text-DNO-Loss Experience}=  //input[@id="Rows_0__Table_Corteges_14__2__Value"]
${NFP-DNO-Loss Experience}=  //input[@id='Rows_0__Table_Corteges_14__3__Value']
${Text_NY-DNO-Loss Experience}=  //input[@id="Rows_0__Table_Corteges_13__2__Value"]
${NY-DNO-Loss Experience}=   //input[@id="Rows_0__Table_Corteges_13__3__Value"]
${Text-DNO-Strength of Corporate Governance}=  //input[@id="Rows_0__Table_Corteges_13__2__Value"]
${NFP-DNO-Strength of Corporate Governance}=  //input[@id='Rows_0__Table_Corteges_13__3__Value']
${Text_NY-DNO-Strength of Corporate Governance}=  //input[@id="Rows_0__Table_Corteges_12__2__Value"]
${NY-DNO-Strength of Corporate Governance}=  //input[@id='Rows_0__Table_Corteges_12__3__Value']
${NFP-DNO-Adjusted Base Premium}=  (//input[@id='AdjustedBasePremium'])[last()]
###Fiduciary Liability Coverage (NFP-FDU)
###FDU-For-index(1)
#Non-scheduled
${Text-FDU-Nature-of-Operations-1}=   //input[@id='Rows_1__Table_Corteges_0__2__Value']
${NFP-FDU-Nature-of-Operations-1}=   //input[@id='Rows_1__Table_Corteges_0__3__Value']
${Text-FDU-Number of Years in Business-1}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${NFP-FDU-Number of Years in Business-1}=   //input[@id='Rows_1__Table_Corteges_1__3__Value']
${Text-FDU-Plan Termination-1}=  //input[@id='Rows_1__Table_Corteges_2__2__Value']
${NFP-FDU-Plan Termination-1}=   //input[@id='Rows_1__Table_Corteges_2__3__Value']
${Text-FDU-Plan Type-1}=  //input[@id='Rows_1__Table_Corteges_3__2__Value']
${NFP-FDU-Plan Type-1}=   //input[@id='Rows_1__Table_Corteges_3__3__Value']
${Text-FDU-Defined Benefit Plans-1}=  //input[@id='Rows_1__Table_Corteges_4__2__Value']
${NFP-FDU-Defined Benefit Plans-1}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text-FDU-Plan Participants-1}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${NFP-FDU-Plan Participants-1}=    //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text-FDU-Litigation History-1}=  //input[@id='Rows_1__Table_Corteges_6__2__Value']
${NFP-FDU-Litigation History-1}=      //input[@id='Rows_1__Table_Corteges_6__3__Value']
${Text-FDU-Significant Transaction-1}=  //input[@id='Rows_1__Table_Corteges_7__2__Value']
${NFP-FDU-Significant Transaction-1}=   //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text-FDU-Diversity of Plan Investments-1}=  //input[@id='Rows_1__Table_Corteges_8__2__Value']
${NFP-FDU-Diversity of Plan Investments-1}=  //input[@id='Rows_1__Table_Corteges_8__3__Value']
#Optional Coverage Enhancements
${Text-FDU-Defend Selection Factor-1}=  //input[@id='Rows_1__Table_Corteges_9__2__Value']
${NFP-FDU-Defend Selection Factor-1}=  //input[@id='Rows_1__Table_Corteges_9__3__Value']
${Text-FDU-Endorsement Factor-1}=  //input[@id='Rows_1__Table_Corteges_10__2__Value']
${NFP-FDU-Endorsement Factor-1}=   //input[@id='Rows_1__Table_Corteges_10__3__Value']
#Scheduled
${Text-FDU-Corporate Governance-1}=  //input[@id='Rows_1__Table_Corteges_10__2__Value']
${NFP-FDU-Corporate Governance-1}=   //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text-FDU-Loss Experience-1}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${NFP-FDU-Loss Experience-1}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
${Text-FDU-Overall Financial Liquidity-1}=  //input[@id='Rows_1__Table_Corteges_12__2__Value']
${NFP-FDU-Overall Financial Liquidity-1}=    //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text-FDU-Affected by Recession-1}=  //input[@id='Rows_1__Table_Corteges_13__2__Value']
${NFP-FDU-Affected by Recession-1}=  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text-FDU-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_14__2__Value']
${NFP-FDU-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_14__3__Value']
###FDU-For-index(2)
${Text-FDU-Nature-of-Operations-2}=   //input[@id='Rows_2__Table_Corteges_0__2__Value']
${NFP-FDU-Nature-of-Operations-2}=   //input[@id='Rows_2__Table_Corteges_0__3__Value']
${Text-FDU-Number of Years in Business-2}=  //input[@id='Rows_2__Table_Corteges_1__2__Value']
${NFP-FDU-Number of Years in Business-2}=   //input[@id='Rows_2__Table_Corteges_1__3__Value']
${Text-FDU-Plan Termination-2}=  //input[@id='Rows_2__Table_Corteges_2__2__Value']
${NFP-FDU-Plan Termination-2}=   //input[@id='Rows_2__Table_Corteges_2__3__Value']
${Text-FDU-Plan Type-2}=  //input[@id='Rows_2__Table_Corteges_3__2__Value']
${NFP-FDU-Plan Type-2}=   //input[@id='Rows_2__Table_Corteges_3__3__Value']
${Text-FDU-Defined Benefit Plans-2}=  //input[@id='Rows_2__Table_Corteges_4__2__Value']
${NFP-FDU-Defined Benefit Plans-2}=  //input[@id='Rows_2__Table_Corteges_4__3__Value']
${Text-FDU-Plan Participants-2}=  //input[@id='Rows_2__Table_Corteges_5__2__Value']
${NFP-FDU-Plan Participants-2}=    //input[@id='Rows_2__Table_Corteges_5__3__Value']
${Text-FDU-Litigation History-2}=  //input[@id='Rows_2__Table_Corteges_6__2__Value']
${NFP-FDU-Litigation History-2}=      //input[@id='Rows_2__Table_Corteges_6__3__Value']
${Text-FDU-Significant Transaction-2}=  //input[@id='Rows_2__Table_Corteges_7__2__Value']
${NFP-FDU-Significant Transaction-2}=   //input[@id='Rows_2__Table_Corteges_7__3__Value']
${Text-FDU-Diversity of Plan Investments-2}=  //input[@id='Rows_2__Table_Corteges_8__2__Value']
${NFP-FDU-Diversity of Plan Investments-2}=  //input[@id='Rows_2__Table_Corteges_8__3__Value']
#Optional Coverage Enhancements
${Text-FDU-Defend Selection Factor-2}=  //input[@id='Rows_2__Table_Corteges_9__2__Value']
${NFP-FDU-Defend Selection Factor-2}=  //input[@id='Rows_2__Table_Corteges_9__3__Value']
${Text-FDU-Endorsement Factor-2}=  //input[@id='Rows_2__Table_Corteges_10__2__Value']
${NFP-FDU-Endorsement Factor-2}=   //input[@id='Rows_2__Table_Corteges_10__3__Value']
#Scheduled
${Text-FDU-Corporate Governance-2}=  //input[@id='Rows_2__Table_Corteges_12__2__Value']
${NFP-FDU-Corporate Governance-2}=   //input[@id='Rows_2__Table_Corteges_12__3__Value']
${Text-FDU-Loss Experience-2}=  //input[@id='Rows_2__Table_Corteges_13__2__Value']
${NFP-FDU-Loss Experience-2}=  //input[@id='Rows_2__Table_Corteges_13__3__Value']
${Text-FDU-Overall Financial Liquidity-2}=  //input[@id='Rows_2__Table_Corteges_14__2__Value']
${NFP-FDU-Overall Financial Liquidity-2}=    //input[@id='Rows_2__Table_Corteges_14__3__Value']
${Text-FDU-Affected by Recession-2}=  //input[@id='Rows_2__Table_Corteges_15__2__Value']
${NFP-FDU-Affected by Recession-2}=  //input[@id='Rows_2__Table_Corteges_15__3__Value']
${Text-FDU-Quality of Management-2}=  //input[@id='Rows_2__Table_Corteges_16__2__Value']
${NFP-FDU-Quality of Management-2}=  //input[@id='Rows_2__Table_Corteges_16__3__Value']
###Employment Practices Liability Coverage (NEWYORK-NFP-FDU)
#Non-scheduled
${Text-FDU-NY-Corporate Governance-1}=  //input[@id='Rows_1__Table_Corteges_10__2__Value']
${NFP-FDU-NY-Corporate Governance-1}=   //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text-FDU-NY-Loss Experience-1}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${NFP-FDU-NY-Loss Experience-1}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
${Text-FDU-NY-Overall Financial Liquidity-1}=  //input[@id='Rows_1__Table_Corteges_12__2__Value']
${NFP-FDU-NY-Overall Financial Liquidity-1}=    //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text-FDU-NY-Affected by Recession-1}=  //input[@id='Rows_1__Table_Corteges_13__2__Value']
${NFP-FDU-NY-Affected by Recession-1}=  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text-FDU-NY-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_14__2__Value']
${NFP-FDU-NY-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_14__3__Value']
###FDU-OHIO-State
##Employee stock ownership plan
${Text-OH-FDU-Employee Stock-1}=  //input[@id='Rows_1__Table_Corteges_4__2__Value']
${NFP-OH-FDU-Employee Stock-1}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text-OH-FDU-Defined Benefit Plans-1}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${NFP-OH-FDU-Defined Benefit Plans-1}=  //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text-OH-FDU-Plan Participants-1}=  //input[@id='Rows_1__Table_Corteges_6__2__Value']
${NFP-OH-FDU-Plan Participants-1}=  //input[@id='Rows_1__Table_Corteges_6__3__Value']
${Text-OH-FDU-Litigation History-1}=  //input[@id='Rows_1__Table_Corteges_7__2__Value']
${NFP-OH-FDU-Litigation History-1}=  //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text-OH-FDU-Significant Transaction-1}=  //input[@id='Rows_1__Table_Corteges_8__2__Value']
${NFP-OH-FDU-Significant Transaction-1}=  //input[@id='Rows_1__Table_Corteges_8__3__Value']
${Text-OH-FDU-Diversity of Plan Investments-1}=  //input[@id='Rows_1__Table_Corteges_9__2__Value']
${NFP-OH-FDU-Diversity of Plan Investments-1}=  //input[@id='Rows_1__Table_Corteges_9__3__Value']
#Optional Coverage Enhancements
${Text-OH-FDU-Defend Selection Factor-1}=  //input[@id='Rows_1__Table_Corteges_10__2__Value']
${NFP-OH-FDU-Defend Selection Factor-1}=  //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text-OH-FDU-Endorsement Factor-1}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${NFP-OH-FDU-Endorsement Factor-1}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
#Scheduled
${Text-OH-FDU-Corporate Governance-1}=  //input[@id='Rows_1__Table_Corteges_12__2__Value']
${NFP-OH-FDU-Corporate Governance-1}=   //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text-OH-FDU-Loss Experience-1}=  //input[@id='Rows_1__Table_Corteges_13__2__Value']
${NFP-OH-FDU-Loss Experience-1}=  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text-OH-FDU-Overall Financial Liquidity-1}=  //input[@id='Rows_1__Table_Corteges_14__2__Value']
${NFP-OH-FDU-Overall Financial Liquidity-1}=    //input[@id='Rows_1__Table_Corteges_14__3__Value']
${Text-OH-FDU-Affected by Recession-1}=  //input[@id='Rows_1__Table_Corteges_15__2__Value']
${NFP-OH-FDU-Affected by Recession-1}=  //input[@id='Rows_1__Table_Corteges_15__3__Value']
${Text-OH-FDU-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_16__2__Value']
${NFP-OH-FDU-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_16__3__Value']
###Employment Practices Liability Coverage (NFP-EPL)
#Non-scheduled
${Text-EPL-Hazard County Locations}=  //input[@id='Rows_1__Table_Corteges_0__2__Value']
${NFP-EPL-Hazard County Locations}=  //input[@id='Rows_1__Table_Corteges_0__3__Value']
${Text-EPL-Number of Years in Business}=   //input[@id='Rows_1__Table_Corteges_2__2__Value']
${NFP-EPL-Number of Years in Business}=  //input[@id='Rows_1__Table_Corteges_2__3__Value']
${Text-EPL-Closing Activity}=   //input[@id='Rows_1__Table_Corteges_4__2__Value']
${NFP-EPL-Closing Activity}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text-EPL-Employee Turnover}=   //input[@id='Rows_1__Table_Corteges_6__2__Value']
${NFP-EPL-Employee Turnover}=  //input[@id='Rows_1__Table_Corteges_6__3__Value']
${Text-EPL-Significant Transaction}=    //input[@id='Rows_1__Table_Corteges_8__2__Value']
${NFP-EPL-Significant Transaction}=  //input[@id='Rows_1__Table_Corteges_8__3__Value']
${Text-EPL-Human Resources}=     //input[@id='Rows_1__Table_Corteges_10__2__Value']
${NFP-EPL-Human Resources}=  //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text-EPL-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${NFP-EPL-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_1__3__Value']
${Text-EPL-Divestiture Activity}=    //input[@id='Rows_1__Table_Corteges_3__2__Value']
${NFP-EPL-Divestiture Activity}=  //input[@id='Rows_1__Table_Corteges_3__3__Value']
${Text-EPL-Annual Compensation}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${NFP-EPL-Annual Compensation}=  //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text-EPL-Litigation History}=   //input[@id='Rows_1__Table_Corteges_7__2__Value']
${NFP-EPL-Litigation History}=  //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text-EPL-Management Stability}=    //input[@id='Rows_1__Table_Corteges_9__2__Value']
${NFP-EPL-Management Stability}=  //input[@id='Rows_1__Table_Corteges_9__3__Value']
#Optional Coverage Enhancements
${Text-EPL-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${NFP-EPL-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
${Text-EPL-Third Party Exposure Factor}=   //input[@id='Rows_1__Table_Corteges_13__2__Value']
${NFP-EPL-Third Party Exposure Factor}=  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text-EPL-Coverage Deleted Factor}=   //input[@id='Rows_1__Table_Corteges_12__2__Value']
${NFP-EPL-Coverage Deleted Factor}=   //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text-EPL-Endorsement Factor}=     //input[@id='Rows_1__Table_Corteges_14__2__Value']
${NFP-EPL-Endorsement Factor}=    //input[@id='Rows_1__Table_Corteges_14__3__Value']
#Scheduled
${Text-EPL-Loss Experience}=  //input[@id='Rows_1__Table_Corteges_16__2__Value']
${NFP-EPL-Loss Experience}=   //input[@id='Rows_1__Table_Corteges_16__3__Value']
${Text-EPL-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_18__2__Value']
${NFP-EPL-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_18__3__Value']
${Text-EPL-Corporate Governance}=      //input[@id='Rows_1__Table_Corteges_15__2__Value']
${NFP-EPL-Corporate Governance}=   //input[@id='Rows_1__Table_Corteges_15__3__Value']
${Text-EPL-Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_17__2__Value']
${NFP-EPL-Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_17__3__Value']
${Text-EPL-Quality of Management}=    //input[@id='Rows_1__Table_Corteges_19__2__Value']
${NFP-EPL-Quality of Management}=  //input[@id='Rows_1__Table_Corteges_19__3__Value']
##Employment Practices Liability Coverage (NFP-EPL)_VA
#Non-scheduled_VA
${Text_VA-EPL-Hazard County Locations}=  //input[@id='Rows_1__Table_Corteges_0__2__Value']
${NFP_VA-EPL-Hazard County Locations}=  //input[@id='Rows_1__Table_Corteges_0__3__Value']
${Text_VA-EPL-Number of Years in Business}=   //input[@id='Rows_1__Table_Corteges_2__2__Value']
${NFP_VA-EPL-Number of Years in Business}=  //input[@id='Rows_1__Table_Corteges_2__3__Value']
${Text_VA-EPL-Closing Activity}=   //input[@id='Rows_1__Table_Corteges_4__2__Value']
${NFP_VA-EPL-Closing Activity}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text_VA-EPL-Employee Turnover}=   //input[@id='Rows_1__Table_Corteges_6__2__Value']
${NFP_VA-EPL-Employee Turnover}=  //input[@id='Rows_1__Table_Corteges_6__3__Value']
${Text_VA-EPL-Significant Transaction}=    //input[@id='Rows_1__Table_Corteges_8__2__Value']
${NFP_VA-EPL-Significant Transaction}=  //input[@id='Rows_1__Table_Corteges_8__3__Value']
${Text_VA-EPL-Human Resources}=     //input[@id='Rows_1__Table_Corteges_10__2__Value']
${NFP_VA-EPL-Human Resources}=  //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text_VA-EPL-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${NFP_VA-EPL-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_1__3__Value']
${Text_VA-EPL-Divestiture Activity}=    //input[@id='Rows_1__Table_Corteges_3__2__Value']
${NFP_VA-EPL-Divestiture Activity}=  //input[@id='Rows_1__Table_Corteges_3__3__Value']
${Text_VA-EPL-Annual Compensation}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${NFP_VA-EPL-Annual Compensation}=  //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text_VA-EPL-Litigation History}=   //input[@id='Rows_1__Table_Corteges_7__2__Value']
${NFP_VA-EPL-Litigation History}=  //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text_VA-EPL-Management Stability}=    //input[@id='Rows_1__Table_Corteges_9__2__Value']
${NFP_VA-EPL-Management Stability}=  //input[@id='Rows_1__Table_Corteges_9__3__Value']
#Optional Coverage Enhancements_VA
${Text_VA-EPL-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${NFP_VA-EPL-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
${Text_VA-EPL-Third Party Exposure Factor}=   //input[@id='Rows_1__Table_Corteges_13__2__Value']
${NFP_VA-EPL-Third Party Exposure Factor}=  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text_VA-EPL-Coverage Deleted Factor}=   //input[@id='Rows_1__Table_Corteges_12__2__Value']
${NFP_VA-EPL-Coverage Deleted Factor}=   //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text_VA-EPL-Endorsement Factor}=     //input[@id='Rows_1__Table_Corteges_14__2__Value']
${NFP_VA-EPL-Endorsement Factor}=    //input[@id='Rows_1__Table_Corteges_14__3__Value']
#Scheduled_VA
${Text_VA-EPL-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_17__2__Value']
${NFP_VA-EPL-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_17__3__Value']
${Text_VA-EPL-Corporate Governance}=      //input[@id='Rows_1__Table_Corteges_15__2__Value']
${NFP_VA-EPL-Corporate Governance}=   //input[@id='Rows_1__Table_Corteges_15__3__Value']
${Text_VA-EPL-Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_16__2__Value']
${NFP_VA-EPL-Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_16__3__Value']
${Text_VA-EPL-Quality of Management}=    //input[@id='Rows_1__Table_Corteges_18__2__Value']
${NFP_VA-EPL-Quality of Management}=  //input[@id='Rows_1__Table_Corteges_18__3__Value']
###Employment Practices Liability Coverage (NEWYORK-NFP-EPL)
#Non-scheduled
${NFP-EPL-NY-Hazard County Locations}=  //input[@id='Rows_1__Table_Corteges_0__3__Value']
${NFP-EPL-NY-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_1__3__Value']
${NFP-EPL-NY-Number of Years in Business}=  //input[@id='Rows_1__Table_Corteges_2__3__Value']
${NFP-EPL-NY-Divestiture Activity}=  //input[@id='Rows_1__Table_Corteges_3__3__Value']
${NFP-EPL-NY-Closing Activity}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${NFP-EPL-NY-Annual Compensation}=  //input[@id='Rows_1__Table_Corteges_5__3__Value']
${NFP-EPL-NY-Employee Turnover}=  //input[@id='Rows_1__Table_Corteges_6__3__Value']
${NFP-EPL-NY-Litigation History}=  //input[@id='Rows_1__Table_Corteges_7__3__Value']
${NFP-EPL-NY-Significant Transaction}=  //input[@id='Rows_1__Table_Corteges_8__3__Value']
${NFP-EPL-NY-Management Stability}=  //input[@id='Rows_1__Table_Corteges_9__3__Value']
${NFP-EPL-NY-Human Resources}=  //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text-EPL-NY-Hazard County Locations}=  //input[@id='Rows_1__Table_Corteges_0__2__Value']
${Text-EPL-NY-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${Text-EPL-NY-Number of Years in Business}=   //input[@id='Rows_1__Table_Corteges_2__2__Value']
${Text-EPL-NY-Divestiture Activity}=    //input[@id='Rows_1__Table_Corteges_3__2__Value']
${Text-EPL-NY-Closing Activity}=   //input[@id='Rows_1__Table_Corteges_4__2__Value']
${Text-EPL-NY-Annual Compensation}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${Text-EPL-NY-Employee Turnover}=   //input[@id='Rows_1__Table_Corteges_6__2__Value']
${Text-EPL-NY-Litigation History}=   //input[@id='Rows_1__Table_Corteges_7__2__Value']
${Text-EPL-NY-Significant Transaction}=    //input[@id='Rows_1__Table_Corteges_8__2__Value']
${Text-EPL-NY-Management Stability}=    //input[@id='Rows_1__Table_Corteges_9__2__Value']
${Text-EPL-NY-Human Resources}=     //input[@id='Rows_1__Table_Corteges_10__2__Value']
${Text-EPL-NY-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${NFP-EPL-NY-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
${Text-EPL-NY-Third Party Exposure Factor}=   //input[@id='Rows_1__Table_Corteges_13__2__Value']
${NFP-EPL-NY-Third Party Exposure Factor}=  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text-EPL-NY-Coverage Deleted Factor}=   //input[@id='Rows_1__Table_Corteges_12__2__Value']
${NFP-EPL-NY-Coverage Deleted Factor}=   //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text-EPL-NY-Loss Experience}=  //input[@id='Rows_1__Table_Corteges_15__2__Value']
${NFP-EPL-NY-Loss Experience}=   //input[@id='Rows_1__Table_Corteges_15__3__Value']
${Text-EPL-NY-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_17__2__Value']
${NFP-EPL-NY-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_17__3__Value']
${Text-EPL-NY-Corporate Governance}=      //input[@id='Rows_1__Table_Corteges_14__2__Value']
${NFP-EPL-NY-Corporate Governance}=   //input[@id='Rows_1__Table_Corteges_14__3__Value']
${Text-EPL-NY-Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_16__2__Value']
${NFP-EPL-NY-Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_16__3__Value']
${Text-EPL-NY-Quality of Management}=    //input[@id='Rows_1__Table_Corteges_18__2__Value']
${NFP-EPL-NY-Quality of Management}=  //input[@id='Rows_1__Table_Corteges_18__3__Value']
#Virginia_EPL
#${Text-EPL-NY-Corporate Governance}=  //input[@id='Rows_1__Table_Corteges_16__2__Value']
#${NFP-EPL-NY-Corporate Governance}=   //input[@id='Rows_1__Table_Corteges_16__3__Value']
#Employed Lawyers Liability Coverage (NFP-ELL)
#For index(1)
#Non-scheduled
${Text-ELL-Area of Practice-1}=   //input[@id='Rows_1__Table_Corteges_0__2__Value']
${NFP-ELL-Area of Practice-1}=   //input[@id='Rows_1__Table_Corteges_0__3__Value']
${Text-ELL-Litigation History-1}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${NFP-ELL-Litigation History-1}=   //input[@id='Rows_1__Table_Corteges_1__3__Value']
${Text-ELL-Public Debt Exposure-1}=  //input[@id='Rows_1__Table_Corteges_2__2__Value']
${NFP-ELL-Public Debt Exposure-1}=   //input[@id='Rows_1__Table_Corteges_2__3__Value']
${Text-ELL-Divestiture Activity-1}=  //input[@id='Rows_1__Table_Corteges_3__2__Value']
${NFP-ELL-Divestiture Activity-1}=   //input[@id='Rows_1__Table_Corteges_3__3__Value']
${Text-ELL-External Legal Resources-1}=  //input[@id='Rows_1__Table_Corteges_4__2__Value']
${NFP-ELL-External Legal Resources-1}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text-ELL-Employed Lawyers-1}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${NFP-ELL-Employed Lawyers-1}=    //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text-ELL-Legal Services Performed-1}=  //input[@id='Rows_1__Table_Corteges_6__2__Value']
${NFP-ELL-Legal Services Performed-1}=      //input[@id='Rows_1__Table_Corteges_6__3__Value']
#Optional Coverage Enhancements
${Text-ELL-Defend Selection Factor-1}=  //input[@id='Rows_1__Table_Corteges_7__2__Value']
${NFP-ELL-Defend Selection Factor-1}=   //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text-ELL-Endorsement Factor-1}=  //input[@id='Rows_1__Table_Corteges_8__2__Value']
${NFP-ELL-Endorsement Factor-1}=  //input[@id='Rows_1__Table_Corteges_8__3__Value']
${Text-ELL-Coverage Factor-1}=  //input[@id='Rows_1__Table_Corteges_9__2__Value']
${NFP-ELL-Coverage Factor-1}=  //input[@id='Rows_1__Table_Corteges_9__3__Value']
#Scheduled
${Text-ELL-Corporate Governance-1}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${NFP-ELL-Corporate Governance-1}=   //input[@id='Rows_1__Table_Corteges_11__3__Value']
${Text-ELL-Loss Experience-1}=  //input[@id='Rows_1__Table_Corteges_12__2__Value']
${NFP-ELL-Loss Experience-1}=   //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text-ELL-Overall Financial Liquidity-1}=  //input[@id='Rows_1__Table_Corteges_13__2__Value']
${NFP-ELL-Overall Financial Liquidity-1}=  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text-ELL-Affected by Recession-1}=  //input[@id='Rows_1__Table_Corteges_14__2__Value']
${NFP-ELL-Affected by Recession-1}=    //input[@id='Rows_1__Table_Corteges_14__3__Value']
${Text-ELL-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_15__2__Value']
${NFP-ELL-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_15__3__Value']
#Employed Lawyers Liability Coverage (NFP-ELL)
###ELL-For-index(2)
#Non-scheduled
${Text-ELL-Area of Practice-2}=   //input[@id='Rows_2__Table_Corteges_0__2__Value']
${NFP-ELL-Area of Practice-2}=   //input[@id='Rows_2__Table_Corteges_0__3__Value']
${Text-ELL-Litigation History-2}=  //input[@id='Rows_2__Table_Corteges_1__2__Value']
${NFP-ELL-Litigation History-2}=   //input[@id='Rows_2__Table_Corteges_1__3__Value']
${Text-ELL-Public Debt Exposure-2}=  //input[@id='Rows_2__Table_Corteges_2__2__Value']
${NFP-ELL-Public Debt Exposure-2}=   //input[@id='Rows_2__Table_Corteges_2__3__Value']
${Text-ELL-Divestiture Activity-2}=  //input[@id='Rows_2__Table_Corteges_3__2__Value']
${NFP-ELL-Divestiture Activity-2}=   //input[@id='Rows_2__Table_Corteges_3__3__Value']
${Text-ELL-External Legal Resources-2}=  //input[@id='Rows_2__Table_Corteges_4__2__Value']
${NFP-ELL-External Legal Resources-2}=  //input[@id='Rows_2__Table_Corteges_4__3__Value']
${Text-ELL-Employed Lawyers-2}=  //input[@id='Rows_2__Table_Corteges_5__2__Value']
${NFP-ELL-Employed Lawyers-2}=    //input[@id='Rows_2__Table_Corteges_5__3__Value']
${Text-ELL-Legal Services Performed-2}=  //input[@id='Rows_2__Table_Corteges_6__2__Value']
${NFP-ELL-Legal Services Performed-2}=      //input[@id='Rows_2__Table_Corteges_6__3__Value']
#Optional Coverage Enhancements
${Text-ELL-Defend Selection Factor-2}=  //input[@id='Rows_2__Table_Corteges_7__2__Value']
${NFP-ELL-Defend Selection Factor-2}=   //input[@id='Rows_2__Table_Corteges_7__3__Value']
${Text-ELL-Endorsement Factor-2}=  //input[@id='Rows_2__Table_Corteges_8__2__Value']
${NFP-ELL-Endorsement Factor-2}=  //input[@id='Rows_2__Table_Corteges_8__3__Value']
${Text-ELL-Coverage Factor-2}=  //input[@id='Rows_2__Table_Corteges_9__2__Value']
${NFP-ELL-Coverage Factor-2}=  //input[@id='Rows_2__Table_Corteges_9__3__Value']
#Scheduled
${Text-ELL-Corporate Governance-2}=  //input[@id='Rows_2__Table_Corteges_10__2__Value']
${NFP-ELL-Corporate Governance-2}=   //input[@id='Rows_2__Table_Corteges_10__3__Value']
${Text-ELL-Loss Experience-2}=  //input[@id='Rows_2__Table_Corteges_11__2__Value']
${NFP-ELL-Loss Experience-2}=   //input[@id='Rows_2__Table_Corteges_11__3__Value']
${Text-ELL-Overall Financial Liquidity-2}=  //input[@id='Rows_2__Table_Corteges_12__2__Value']
${NFP-ELL-Overall Financial Liquidity-2}=  //input[@id='Rows_2__Table_Corteges_12__3__Value']
${Text-ELL-Affected by Recession-2}=  //input[@id='Rows_2__Table_Corteges_13__2__Value']
${NFP-ELL-Affected by Recession-2}=    //input[@id='Rows_2__Table_Corteges_13__3__Value']
${Text-ELL-Quality of Management-2}=  //input[@id='Rows_2__Table_Corteges_14__2__Value']
${NFP-ELL-Quality of Management-2}=  //input[@id='Rows_2__Table_Corteges_14__3__Value']
#Employed Lawyers Liability Coverage (NFP-ELL)
###ELL-For-index(3)
#Non-scheduled
${Text-ELL-Area of Practice-3}=   //input[@id='Rows_3__Table_Corteges_0__2__Value']
${NFP-ELL-Area of Practice-3}=   //input[@id='Rows_3__Table_Corteges_0__3__Value']
${Text-ELL-Litigation History-3}=  //input[@id='Rows_3__Table_Corteges_1__2__Value']
${NFP-ELL-Litigation History-3}=   //input[@id='Rows_3__Table_Corteges_1__3__Value']
${Text-ELL-Public Debt Exposure-3}=  //input[@id='Rows_3__Table_Corteges_2__2__Value']
${NFP-ELL-Public Debt Exposure-3}=   //input[@id='Rows_3__Table_Corteges_2__3__Value']
${Text-ELL-Divestiture Activity-3}=  //input[@id='Rows_3__Table_Corteges_3__2__Value']
${NFP-ELL-Divestiture Activity-3}=   //input[@id='Rows_3__Table_Corteges_3__3__Value']
${Text-ELL-External Legal Resources-3}=  //input[@id='Rows_3__Table_Corteges_4__2__Value']
${NFP-ELL-External Legal Resources-3}=  //input[@id='Rows_3__Table_Corteges_4__3__Value']
${Text-ELL-Employed Lawyers-3}=  //input[@id='Rows_3__Table_Corteges_5__2__Value']
${NFP-ELL-Employed Lawyers-3}=    //input[@id='Rows_3__Table_Corteges_5__3__Value']
${Text-ELL-Legal Services Performed-3}=  //input[@id='Rows_3__Table_Corteges_6__2__Value']
${NFP-ELL-Legal Services Performed-3}=      //input[@id='Rows_3__Table_Corteges_6__3__Value']
#Optional Coverage Enhancements
${Text-ELL-Defend Selection Factor-3}=  //input[@id='Rows_3__Table_Corteges_7__2__Value']
${NFP-ELL-Defend Selection Factor-3}=   //input[@id='Rows_3__Table_Corteges_7__3__Value']
${Text-ELL-Endorsement Factor-3}=  //input[@id='Rows_3__Table_Corteges_8__2__Value']
${NFP-ELL-Endorsement Factor-3}=  //input[@id='Rows_3__Table_Corteges_8__3__Value']
${Text-ELL-Coverage Factor-3}=  //input[@id='Rows_3__Table_Corteges_9__2__Value']
${NFP-ELL-Coverage Factor-3}=  //input[@id='Rows_3__Table_Corteges_9__3__Value']
#Scheduled
${Text-ELL-Corporate Governance-3}=  //input[@id='Rows_3__Table_Corteges_11__2__Value']
${NFP-ELL-Corporate Governance-3}=   //input[@id='Rows_3__Table_Corteges_11__3__Value']
${Text-ELL-Loss Experience-3}=  //input[@id='Rows_3__Table_Corteges_12__2__Value']
${NFP-ELL-Loss Experience-3}=   //input[@id='Rows_3__Table_Corteges_12__3__Value']
${Text-ELL-Overall Financial Liquidity-3}=  //input[@id='Rows_3__Table_Corteges_13__2__Value']
${NFP-ELL-Overall Financial Liquidity-3}=  //input[@id='Rows_3__Table_Corteges_13__3__Value']
${Text-ELL-Affected by Recession-3}=  //input[@id='Rows_3__Table_Corteges_14__2__Value']
${NFP-ELL-Affected by Recession-3}=    //input[@id='Rows_3__Table_Corteges_14__3__Value']
${Text-ELL-Quality of Management-3}=  //input[@id='Rows_3__Table_Corteges_15__2__Value']
${NFP-ELL-Quality of Management-3}=  //input[@id='Rows_3__Table_Corteges_15__3__Value']
##ELL-VA
${VA_Text-ELL-Corporate Governance-1}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${VA_NFP-ELL-Corporate Governance-1}=   //input[@id='Rows_1__Table_Corteges_11__3__Value']
${VA_Text-ELL-Overall Financial Liquidity-1}=  //input[@id='Rows_1__Table_Corteges_12__2__Value']
${VA_NFP-ELL-Overall Financial Liquidity-1}=  //input[@id='Rows_1__Table_Corteges_12__3__Value']
${VA_Text-ELL-Affected by Recession-1}=  //input[@id='Rows_1__Table_Corteges_13__2__Value']
${VA_NFP-ELL-Affected by Recession-1}=    //input[@id='Rows_1__Table_Corteges_13__3__Value']
${VA_Text-ELL-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_14__2__Value']
${VA_NFP-ELL-Quality of Management-1}=  //input[@id='Rows_1__Table_Corteges_14__3__Value']
${VA_NFP-ELL-Corporate Governance-2}=  //input[@id='Rows_2__Table_Corteges_10__3__Value']
${VA_Text-ELL-Corporate Governance-2}=  //input[@id='Rows_2__Table_Corteges_10__2__Value']
${VA_Text-ELL-Overall Financial Liquidity-2}=  //input[@id='Rows_2__Table_Corteges_11__2__Value']
${VA_NFP-ELL-Overall Financial Liquidity-2}=  //input[@id='Rows_2__Table_Corteges_11__3__Value']
${VA_Text-ELL-Affected by Recession-2}=  //input[@id='Rows_2__Table_Corteges_12__2__Value']
${VA_NFP-ELL-Affected by Recession-2}=    //input[@id='Rows_2__Table_Corteges_12__3__Value']
${VA_Text-ELL-Quality of Management-2}=  //input[@id='Rows_2__Table_Corteges_13__2__Value']
${VA_NFP-ELL-Quality of Management-2}=  //input[@id='Rows_2__Table_Corteges_13__3__Value']
${ELL_Cov_Checkbox}=  //input[@id='item552']
${ELL_Cov_Date}=  //a[@id='coverageDate552']
${ELL_Cov_PNP_Date}=  //input[@id='CoverageDate_PnpDate']
${ELL_Cov_Date_Save}=  (//span[contains(text(),'Save')])[2]
#CRIME - Employee Theft Coverage (NFP-CRIME)
${Text-CRIME-Nature-of-Operations}=   //input[@id='Rows_1__Table_Corteges_0__2__Value']
${NFP-CRIME-Nature-of-Operations}=   //input[@id='Rows_1__Table_Corteges_0__3__Value']
${Text-CRIME-Profile Of Workplace}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${NFP-CRIME-Profile Of Workplace}=   //input[@id='Rows_1__Table_Corteges_1__3__Value']
${Text-CRIME-Organizational Complex}=  //input[@id='Rows_1__Table_Corteges_2__2__Value']
${NFP-CRIME-Organizational Complex}=   //input[@id='Rows_1__Table_Corteges_2__3__Value']
${Text-CRIME-Foreign Locn Exposure}=  //input[@id='Rows_1__Table_Corteges_3__2__Value']
${NFP-CRIME-Foreign Locn Exposure}=  //input[@id='Rows_1__Table_Corteges_3__3__Value']
${Text-CRIME-High Value Proc Material}=  //input[@id='Rows_1__Table_Corteges_4__2__Value']
${NFP-CRIME-High Value Proc Material}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text-CRIME-Audit Functions}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${NFP-CRIME-Audit Functions}=    //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text-CRIME-Internal Controls}=  //input[@id='Rows_1__Table_Corteges_6__2__Value']
${NFP-CRIME-Internal Controls}=      //input[@id='Rows_1__Table_Corteges_6__3__Value']
${Text-CRIME-Pre Emp Screening}=  //input[@id='Rows_1__Table_Corteges_7__2__Value']
${NFP-CRIME-Pre Emp Screening}=  //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text-CRIME-Inventory Management}=  //input[@id='Rows_1__Table_Corteges_8__2__Value']
${NFP-CRIME-Inventory Management}=   //input[@id='Rows_1__Table_Corteges_8__3__Value']
${Text-CRIME-Vendor Manage Guidelines}=   //input[@id='Rows_1__Table_Corteges_9__2__Value']
${NFP-CRIME-Vendor Manage Guidelines}=   //input[@id='Rows_1__Table_Corteges_9__3__Value']
${Text-CRIME-Number of Years in Business}=  //input[@id='Rows_1__Table_Corteges_10__2__Value']
${NFP-CRIME-Number of Years in Business}=   //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text-CRIME-Merger Divestiture Activity}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${NFP-CRIME-Merger Divestiture Activity}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
#Optional Coverage Enhancements
${Text-CRIME-Endorsement Factor}=  //input[@id='Rows_1__Table_Corteges_12__2__Value']
${NFP-CRIME-Endorsement Factor}=   //input[@id='Rows_1__Table_Corteges_12__3__Value']
#Scheduled
${Text-CRIME-Strength of Corporate Governance}=  //input[@id='Rows_1__Table_Corteges_13__2__Value']
${NFP-CRIME-Strength of Corporate Governance}=   //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text-CRIME-Loss Experience}=  //input[@id='Rows_1__Table_Corteges_14__2__Value']
${NFP-CRIME-Loss Experience}=   //input[@id='Rows_1__Table_Corteges_14__3__Value']
${Text-CRIME-Overall Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_15__2__Value']
${NFP-CRIME-Overall Financial Liquidity}=   //input[@id='Rows_1__Table_Corteges_15__3__Value']
${Text-CRIME-Affected by Recession}=  //input[@id='Rows_1__Table_Corteges_16__2__Value']
${NFP-CRIME-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_16__3__Value']
${Text-CRIME-Quality of Management}=  //input[@id='Rows_1__Table_Corteges_17__2__Value']
${NFP-CRIME-Quality of Management}=   //input[@id='Rows_1__Table_Corteges_17__3__Value']
#Scheduled-Virginia
${Text-CRIME_VA-Overall Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_15__2__Value']
${NFP-CRIME_VA-Overall Financial Liquidity}=   //input[@id='Rows_1__Table_Corteges_15__3__Value']
${Text-CRIME_VA-Affected by Recession}=  //input[@id='Rows_1__Table_Corteges_16__2__Value']
${NFP-CRIME_VA-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_16__3__Value']
${Text-CRIME_VA-Quality of Management}=  //input[@id='Rows_1__Table_Corteges_17__2__Value']
${NFP-CRIME_VA-Quality of Management}=   //input[@id='Rows_1__Table_Corteges_17__3__Value']

##Kidnap and Ransom/Extortion Coverage (NFP-KNR)
${Text-KNR-Riskiness of Countries}=  //input[@id="Rows_2__Table_Corteges_0__2__Value"]
${NFP-KNR-Riskiness of Countries}=  //input[@id="Rows_2__Table_Corteges_0__3__Value"]
${Text-KNR-Frequency of Travel}=  //input[@id="Rows_2__Table_Corteges_1__2__Value"]
${NFP-KNR-Frequency of Travel}=  //input[@id="Rows_2__Table_Corteges_1__3__Value"]
${Text-KNR-Security Measures}=  //input[@id="Rows_2__Table_Corteges_2__2__Value"]
${NFP-KNR-Security Measures}=  //input[@id="Rows_2__Table_Corteges_2__3__Value"]
${Text-KNR-Industry Group}=  //input[@id="Rows_2__Table_Corteges_3__2__Value"]
${NFP-KNR-Industry Group}=  //input[@id="Rows_2__Table_Corteges_3__3__Value"]
${Text-KNR-Travel Advisory Policy}=  //input[@id="Rows_2__Table_Corteges_4__2__Value"]
${NFP-KNR-Travel Advisory Policy}=  //input[@id="Rows_2__Table_Corteges_4__3__Value"]
${Text-KNR-Product Exposure}=  //input[@id="Rows_2__Table_Corteges_5__2__Value"]
${NFP-KNR-Product Exposure}=  //input[@id="Rows_2__Table_Corteges_5__3__Value"]
#Optional Coverage Enhancements
${Text-KNR-Endorsement Factor}=  //input[@id="Rows_2__Table_Corteges_6__2__Value"]
${NFP-KNR-Endorsement Factor}=  //input[@id="Rows_2__Table_Corteges_6__3__Value"]
#Scheduled
${Text-KNR-Strength of Corporate Governance}=  //input[@id='Rows_2__Table_Corteges_7__2__Value']
${NFP-KNR-Strength of Corporate Governance}=   //input[@id='Rows_2__Table_Corteges_7__3__Value']
${Text-KNR-Loss Experience}=  //input[@id='Rows_2__Table_Corteges_8__2__Value']
${NFP-KNR-Loss Experience}=   //input[@id='Rows_2__Table_Corteges_8__3__Value']
${Text-KNR-Overall Financial Liquidity}=  //input[@id='Rows_2__Table_Corteges_9__2__Value']
${NFP-KNR-Overall Financial Liquidity}=   //input[@id='Rows_2__Table_Corteges_9__3__Value']
${Text-KNR-Affected by Recession}=  //input[@id='Rows_2__Table_Corteges_10__2__Value']
${NFP-KNR-Affected by Recession}=   //input[@id='Rows_2__Table_Corteges_10__3__Value']
${Text-KNR-Quality of Management}=  //input[@id='Rows_2__Table_Corteges_11__2__Value']
${NFP-KNR-Quality of Management}=   //input[@id='Rows_2__Table_Corteges_11__3__Value']
#Scheduled-KNR-VIRGINIA
${Text-KNR_VA-Overall Financial Liquidity}=  //input[@id='Rows_2__Table_Corteges_9__2__Value']
${NFP-KNR_VA-Overall Financial Liquidity}=   //input[@id='Rows_2__Table_Corteges_9__3__Value']
${Text-KNR_VA-Affected by Recession}=  //input[@id='Rows_2__Table_Corteges_10__2__Value']
${NFP-KNR_VA-Affected by Recession}=   //input[@id='Rows_2__Table_Corteges_10__3__Value']
${Text-KNR_VA-Quality of Management}=  //input[@id='Rows_2__Table_Corteges_11__2__Value']
${NFP-KNR_VA-Quality of Management}=   //input[@id='Rows_2__Table_Corteges_11__3__Value']

${Coverages_Bubble}=  //a[contains(@href, "/Nexus/RatingCoverages/ViewCoverages/")]
${Name_NFP-CRIME}=  (//input[@name='ParentCoverageIDs'])[5]
${Name_NFP-KNR}=  (//input[@name='ParentCoverageIDs'])[6]
###Layers
${UMS-Layers}=  //a[contains(@href, '/Nexus/RatingRatableLayers/ViewLayers/')]
${DNO-BasePremium}=  //input[@id='Rows_0__BasePremium']
${EPL-BasePremium}=  //input[@id='Rows_1__BasePremium']
@{Scheduled_States}=  Virginia  New York
@{Scheduled_Not_there_States}=  Hawaii
@{EPL_States}=  Virginia
${Bundle_Checkbox}=  //input[@name="SelectedBundleNo"]

*** Keywords ***
Release Holds
        Go to UMS
        wait until element is enabled    ${ID-UMS-UNDERWRITING}  10
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Policy Holds
        wait until element is not visible   globalAjaxLoading  10
        click element  id=idReleaseAll
        wait until element is not visible   globalAjaxLoading  10
        wait until element is visible  ${ID-UMS-UNDERWRITING}  30
        mouse over  ${ID-UMS-UNDERWRITING}
        click element  link=Rating
        wait until element is not visible   globalAjaxLoading  100

DNO Modifiers
        [Arguments]  &{test_data}
        Release Holds
        Wait Until Element Is Visible    //a[contains(text(),'Coverages')]  5s
        Click Element    //a[contains(text(),'Coverages')]
        Run Keyword If    '${test_data['Are you Interested in ELL coverage?']}' == 'YES'  Select ELL Coverage  &{test_data}
        ...  ELSE  click element  ${UMS-Modifiers}
        #Run Keyword If    '${test_data['Would you like KNR coverage?']}' == 'YES'  Select KNR Coverage
        run keyword if    '${test_data['D&O']}' == 'YES'  NFP-DNO  &{test_data}
        run keyword if    '${test_data['EPL']}' == 'YES'  NFP-EPL  &{test_data}
        run keyword if    '${test_data['Fiduciary']}' == 'YES'  NFP-FDU  &{test_data}
        run keyword if    '${test_data['Are you Interested in ELL coverage?']}' == 'YES'  NFP-ELL  &{test_data}
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  80
        ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
        run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  80
        ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
        run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
        Select Quote Options and Create Bundle  &{test_data}
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  80
        ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
        run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
        #click element  ${UMS-Quoteletter-bubble}
        wait until element is not visible   globalAjaxLoading  100
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  80
        ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
        run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
        wait until element is not visible   globalAjaxLoading  100
        select radio button  Action  Review
        click element  ${ID-UMS-Cancellation-Submit}
        Close UMS window

Review Quote Letter and submit
        Wait Until Element Is Visible  ${ID-UMS-Cancellation-Submit}
        Scroll Element Into View    ${ID-UMS-Cancellation-Submit}
        select radio button  Action  Review
        click element  ${ID-UMS-Cancellation-Submit}

Select ELL Coverage
        [Arguments]  &{test_data}
        Wait Until Element Is Visible    ${ELL_Cov_Checkbox}  5s
        Select Checkbox    ${ELL_Cov_Checkbox}
        Wait Until Element Is Visible    ${ELL_Cov_Date}
        Click Element    ${ELL_Cov_Date}
        ${Todays_Date}=  Get Current Date    result_format=%m/%d/%Y
        Wait Until Element Is Visible    ${ELL_Cov_PNP_Date}
        Check And Enter Input    ${ELL_Cov_PNP_Date}  ${Todays_Date}
        Wait Until Element Is Visible    ${ELL_Cov_Date_Save}  3s
        Click Element    ${ELL_Cov_Date_Save}
        select checkbox   ${Name_NFP-KNR}
        sleep  2s
        click element    ${ID-COV-Apply&Continue}
        ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
        run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
        Reload Page
        sleep  1s
        click element    ${ID-COV-Apply&Continue}
        ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
        run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
        wait until element is not visible   globalAjaxLoading  100
        Scroll Element Into View  ${ID-COV-Apply&Continue}
        check and enter input  ${ID-RB-ELL-Lawyers}  ${test_data['How many lawyers does the organization have on staff?']}
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  80
        ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
        run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

NFP-DNO
       [Arguments]  &{test_data}
       log to console  "NFP-DNO"
       ${Premium_Value}=  run keyword if  '${test_data['State']}' == 'New York'  Modifiers Calculation_NewYork  &{test_data}
       run keyword if    '${test_data['State']}' == 'New York'  Set global variable   ${Premium}   ${Premium_Value}  ELSE   Set global variable   ${Premium}   0
       run keyword if    '${test_data['State']}' == 'New York'  NewYork_Journal  &{test_data}
       Set global variable  ${Rule_Value}  2500.00
       ${Text_DNOP}=  get Value  ${Text-DNO-Nature-of-Operations}
       ${DNO_Nature of Operations}=  get value    ${NFP-DNO-Nature-of-Operations}
       Value Comparison  ${DNO_Nature of Operations}  ${test_data['DNO-NATUREOFOPERATIONS']}  ${Text_DNOP}
       ${Text_NYB}=  get Value  ${Text-DNO-Number of Years in Business}
       ${DNO-Number of Years in Business}=  get value    ${NFP-DNO-Number of Years in Business}
       Value Comparison  ${DNO-Number of Years in Business}   ${test_data['DNO-NUMBEROFYEARSINBUSINESS']}  ${Text_NYB}
       ${Text_NOS}=  get Value  ${Text-DNO-Number of Subsidiaries}
       ${DNO-Number of Subsidiaries}=  get value    ${NFP-DNO-Number of Subsidiaries}
       Value Comparison   ${DNO-Number of Subsidiaries}   ${test_data['DNO-NUMBEROFSUBSIDIARIES']}  ${Text_NOS}
       ${Text_MDA}=  get Value  ${Text-DNO-Merger Divestiture Activity}
       ${DNO-Merger Divestiture Activity}=  get value    ${NFP-DNO-Merger Divestiture Activity}
       Value Comparison   ${DNO-Merger Divestiture Activity}   ${test_data['DNO-MERGERACQUISITIONDIVESTITURE']}  ${Text_MDA}
       ${Text_SECOA}=  get Value  ${Text-DNO-Securities Offering Activity}
       ${DNO-Securities Offering Activity}=  get value    ${NFP-DNO-Securities Offering Activity}
       Value Comparison   ${DNO-Securities Offering Activity}   ${test_data['DNO-SECURITIESOFFERINGACTIVITY']}  ${Text_SECOA}
       ${Text_LH}=  get Value  ${Text-DNO-Litigation History}
       ${DNO-Litigation History}=  get value    ${NFP-DNO-Litigation History}
       Value Comparison  ${DNO-Litigation History}   ${test_data['DNO-LITIGATIONHISTORY']}  ${Text_LH}
       ${Text_ST}=  get Value  ${Text-DNO-Significant Transaction}
       ${DNO-Significant Transaction}=  get value    ${NFP-DNO-Significant Transaction}
       Value Comparison   ${DNO-Significant Transaction}  ${test_data['DNO-SIGNIFICANTTRANSACTIONEVENT']}  ${Text_ST}
       ${Text_MS}=  get Value  ${Text-DNO-Management Stability}
       ${DNO-Management Stability}=  get value    ${NFP-DNO-Management Stability}
       Value Comparison  ${DNO-Management Stability}  ${test_data['DNO-MANAGEMENTSTABILITY']}  ${Text_MS}
       ${Text_SOFP}=  get Value  ${Text-DNO-Statement of Financial Position}
       ${DNO-Statement of Financial Position}=  get value    ${NFP-DNO-Statement of Financial Position}
       Value Comparison  ${DNO-Statement of Financial Position}  ${test_data['DNO-QUALITYOFSTATEMENTOFFINANCIAL']}  ${Text_SOFP}
       ${Text_SOA}=  get Value  ${Text-DNO-Statement of Activities}
       ${DNO-Statement of Activities}=  get value    ${NFP-DNO-Statement of Activities}
       Value Comparison  ${DNO-Statement of Activities}  ${test_data['DNO-QUALITYOFSTATEMENTOFACTIVITIES']}  ${Text_SOA}
       ${Text_SOCF}=  get Value  ${Text-DNO-Statement of Cash Flows}
       ${DNO-Statement of Cash Flows}=  get value    ${NFP-DNO-Statement of Cash Flows}
       Value Comparison  ${DNO-Statement of Cash Flows}  ${test_data['DNO-QUALITYOFSTATEMENTOFCASHFLOWS']}  ${Text_SOCF}
       ${Text_DESF}=  get value  ${Text-DNO-Defend Selection Factor}
       ${DNO-Defend Selection Factor}=  get value  ${NFP-DNO-Defend Selection Factor}
       Value Comparison     ${DNO-Defend Selection Factor}    ${test_data['DNO-DUTYTO DEFEND']}    ${Text_DESF}
       ${Text_ENDF}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-DNO-Endorsement Factor}
       ${DNO-Endorsement Factor}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-DNO-Endorsement Factor}
       run keyword if  '${test_data['State']}' != 'New York'  Value Comparison   ${DNO-Endorsement Factor}  ${test_data['DNO-ENDORSEMENTFACTOR']}  ${Text_ENDF}
       ${Scheduled-States-check} =  run keyword and return status  list should contain value  ${Scheduled_States}  ${test_data['State']}
       run keyword if    ${Scheduled-States-check}    DNO_Statecheck_Modifiers  &{test_data}  ELSE IF  '${test_data['State']}' != 'Hawaii'   DNO_Scheduled_Modifiers  &{test_data}

DNO_Scheduled_Modifiers
       [Arguments]  &{test_data}
       ${Text_QAM}=  get value  ${Text-DNO-Quality of Management}
       ${DNO-Quality of Management}=  get value  ${NFP-DNO-Quality of Management}
       Value Comparison  ${DNO-Quality of Management}  ${test_data['DNO-QUALITYOFMANAGEMENT']}   ${Text_QAM}
       ${Text_ABR}=  get value  ${Text-DNO-Affected by Recession}
       ${DNO-Affected by Recession}=  get value  ${NFP-DNO-Affected by Recession}
       Value Comparison  ${DNO-Affected by Recession}  ${test_data['DNO-AFFECTEDBYRECESSION']}   ${Text_ABR}
       ${Text_OFL}=  get value  ${Text-DNO-Overall Financial Liquidity}
       ${DNO-Overall Financial Liquidity}=  get value  ${NFP-DNO-Overall Financial Liquidity}
       Value Comparison  ${DNO-Overall Financial Liquidity}  ${test_data['DNO-OVERALLFINANCIALLIQUIDITY']}   ${Text_OFL}
       ${Text_LEX}=  get value  ${Text-DNO-Loss Experience}
       ${DNO-Loss Experience}=  get value  ${NFP-DNO-Loss Experience}
       Value Comparison  ${DNO-Loss Experience}  ${test_data['DNO-LOSSEXPERIENCE']}   ${Text_LEX}
       ${Text_SOCG}=   get value  ${Text-DNO-Strength of Corporate Governance}
       ${DNO-Corporate Governance}=  get value  ${NFP-DNO-Strength of Corporate Governance}
       Value Comparison  ${DNO-Corporate Governance}    ${test_data['DNO-STRENGTHOFCORPORATEGOVERNANCE']}  ${Text_SOCG}

DNO_Statecheck_Modifiers
       [Arguments]  &{test_data}
       ${Text_QAM}=  get value  ${Text_NY-DNO-Quality of Management}
       ${DNO-Quality of Management}=  get value  ${NY-DNO-Quality of Management}
       run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${DNO-Quality of Management}  ${test_data['NY_DNO_ABOVE_2500-DNO-QUALITYOFMANAGEMENT']}   ${Text_QAM}  ELSE  Value Comparison  ${DNO-Quality of Management}  ${test_data['DNO-QUALITYOFMANAGEMENT']}   ${Text_QAM}
       ${Text_ABR}=  get value  ${Text_NY-DNO-Affected by Recession}
       ${DNO-Affected by Recession}=  get value  ${NY-DNO-Affected by Recession}
       run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${DNO-Affected by Recession}  ${test_data['NY_DNO_ABOVE_2500-DNO-AFFECTEDBYRECESSION']}   ${Text_ABR}  ELSE  Value Comparison  ${DNO-Affected by Recession}  ${test_data['DNO-AFFECTEDBYRECESSION']}   ${Text_ABR}
       ${Text_OFL}=  get value  ${Text_NY-DNO-Overall Financial Liquidity}
       ${DNO-Overall Financial Liquidity}=  get value  ${NY-DNO-Overall Financial Liquidity}
       run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${DNO-Overall Financial Liquidity}  ${test_data['NY_DNO_ABOVE_2500-DNO-OVERALLFINANCIALLIQUIDITY']}   ${Text_OFL}  ELSE  Value Comparison  ${DNO-Overall Financial Liquidity}  ${test_data['DNO-OVERALLFINANCIALLIQUIDITY']}   ${Text_OFL}
       ${Text_LEX}=  run keyword if  '${test_data['State']}' == 'New York'  get value  ${Text_NY-DNO-Loss Experience}
       ${DNO-Loss Experience}=  run keyword if  '${test_data['State']}' == 'New York'  get value  ${NY-DNO-Loss Experience}
       run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${DNO-Loss Experience}  ${test_data['NY_DNO_ABOVE_2500-DNO-LOSSEXPERIENCE']}   ${Text_LEX}  
       ${Text_SOCG}=   run keyword if  '${test_data['State']}' == 'New York'  get value  ${Text_NY-DNO-Strength of Corporate Governance}  ELSE  get value  ${Text-DNO-Strength of Corporate Governance}
       ${DNO-Corporate Governance}=  run keyword if  '${test_data['State']}' == 'New York'  get value  ${NY-DNO-Strength of Corporate Governance}  ELSE  get value  ${NFP-DNO-Strength of Corporate Governance}
       run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${DNO-Corporate Governance}    ${test_data['NY_DNO_ABOVE_2500-DNO-STRENGTHOFCORPORATEGOVERNANCE']}  ${Text_SOCG}  ELSE  Value Comparison  ${DNO-Corporate Governance}    ${test_data['DNO-STRENGTHOFCORPORATEGOVERNANCE']}  ${Text_SOCG}

NFP-EPL
    [Arguments]  &{test_data}
    Log to console  "NFP-EPL"
    ${EPL_States-check} =  run keyword and return status  list should contain value  ${EPL_States}  ${test_data['State']}
    run keyword if    ${EPL_States-check}    EPL_States  &{test_data}  ELSE IF  '${test_data['State']}' == 'Hawaii'  NFP_EPL_States_Hawaii  &{test_data}   ELSE  NFP-EPL_States  &{test_data}

NFP-EPL_States
    [Arguments]  &{test_data}
    ${Overall-BP}=  run keyword if  '${test_data['State']}' == 'New York'  set variable  ${Premium}
    ${EPL-Text_HCL}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Hazard County Locations}  ELSE  get value  ${Text-EPL-NY-Hazard County Locations}
    ${EPL-Hazard County Locations}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Hazard County Locations}  ELSE  get value  ${NFP-EPL-NY-Hazard County Locations}
    Value Comparison  ${EPL-Hazard County Locations}  ${test_data['EPL-HAZARDCOUNTYLOCATIONS']}  ${EPL-Text_HCL}
    ${EPL-Text_NYB}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Number of Years in Business}  ELSE  get value  ${Text-EPL-NY-Number of Years in Business}
    ${EPL-Number of Years in Business}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Number of Years in Business}  ELSE  get value  ${NFP-EPL-NY-Number of Years in Business}
    Value Comparison  ${EPL-Number of Years in Business}    ${test_data['EPL-NUMBEROFYEARSINBUSINESS']}  ${EPL-Text_NYB}
    ${EPL-Text_CA}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Closing Activity}  ELSE  get value  ${Text-EPL-NY-Closing Activity}
    ${EPL-Closing Activity}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Closing Activity}  ELSE  get value  ${NFP-EPL-NY-Closing Activity}
    Value Comparison  ${EPL-Closing Activity}    ${test_data['EPL-LAYOFFACTIVITY']}  ${EPL-Text_CA}
    ${EPL-Text_ET}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Employee Turnover}  ELSE  get value  ${Text-EPL-NY-Employee Turnover}
    ${EPL-Employee Turnover}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Employee Turnover}  ELSE  get value  ${NFP-EPL-NY-Employee Turnover}
    Value Comparison  ${EPL-Employee Turnover}    ${test_data['EPL-EMPLOYEETURNOVER']}  ${EPL-Text_ET}
    ${EPL-Text_STRANS}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Significant Transaction}  ELSE  get value  ${Text-EPL-NY-Significant Transaction}
    ${EPL-Significant Transaction}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Significant Transaction}  ELSE  get value  ${NFP-EPL-NY-Significant Transaction}
    Value Comparison  ${EPL-Significant Transaction}    ${test_data['EPL-SIGNIFICANTTRANSACTIONEVENT']}  ${EPL-Text_STRANS}
    ${EPL-Text_HRS}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Human Resources}  ELSE  get value  ${Text-EPL-NY-Human Resources}
    ${EPL-Human Resources}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Human Resources}  ELSE  get value  ${NFP-EPL-NY-Human Resources}
    Value Comparison  ${EPL-Human Resources}    ${test_data['EPL-HUMANRESOURCES']}  ${EPL-Text_HRS}
    ${EPL-Text_NOP}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Nature of Operations}  ELSE  get value  ${Text-EPL-NY-Nature of Operations}
    ${EPL-Nature of Operations}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Nature of Operations}  ELSE  get value  ${NFP-EPL-NY-Nature of Operations}
    Value Comparison  ${EPL-Nature of Operations}    ${test_data['EPL-NATUREOFOPERATIONS']}  ${EPL-Text_NOP}
    ${EPL-Text_DA}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Divestiture Activity}  ELSE  get value  ${Text-EPL-NY-Divestiture Activity}
    ${EPL-Divestiture Activity}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Divestiture Activity}  ELSE  get value  ${NFP-EPL-NY-Divestiture Activity}
    Value Comparison  ${EPL-Divestiture Activity}    ${test_data['EPL-MERGERACQUISITIONDIVESTITURE']}  ${EPL-Text_DA}
    ${EPL-Text_AC}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Annual Compensation}  ELSE  get value  ${Text-EPL-NY-Annual Compensation}
    ${EPL-Annual Compensation}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Annual Compensation}  ELSE  get value  ${NFP-EPL-NY-Annual Compensation}
    Value Comparison  ${EPL-Annual Compensation}    ${test_data['EPL-ANNUALCOMPENSTION']}  ${EPL-Text_AC}
    ${EPL-Text_LH}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Litigation History}  ELSE  get value  ${Text-EPL-NY-Litigation History}
    ${EPL-Litigation History}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Litigation History}  ELSE  get value  ${NFP-EPL-NY-Litigation History}
    Value Comparison  ${EPL-Litigation History}    ${test_data['EPL-LITIGATIONHISTORY']}  ${EPL-Text_LH}
    ${EPL-Text_MS}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Management Stability}  ELSE  get value  ${Text-EPL-NY-Management Stability}
    ${EPL-Management Stability}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Management Stability}  ELSE  get value  ${NFP-EPL-NY-Management Stability}
    Value Comparison  ${EPL-Management Stability}    ${test_data['EPL-MANAGEMENTSTABILITY']}  ${EPL-Text_MS}
    ${EPL-Text_DSF}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Defend Selection Factor}  ELSE  get value  ${Text-EPL-NY-Defend Selection Factor}
    ${EPL-Defend Selection Factor}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Defend Selection Factor}  ELSE  get value  ${NFP-EPL-NY-Defend Selection Factor}
    Value Comparison  ${EPL-Defend Selection Factor}    ${test_data['EPL-DUTYTODEFEND']}  ${EPL-Text_DSF}
    ${EPL-Text_TPEF}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Third Party Exposure Factor}  ELSE  get value  ${Text-EPL-NY-Third Party Exposure Factor}
    ${EPL-Third Party Exposure Factor}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Third Party Exposure Factor}  ELSE  get value  ${NFP-EPL-NY-Third Party Exposure Factor}
    Value Comparison  ${EPL-Third Party Exposure Factor}    ${test_data['EPL-THIRDPARTYEXPOSUREFACTOR']}  ${EPL-Text_TPEF}
    ${EPL-Text_CDF}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Coverage Deleted Factor}  ELSE  get value  ${Text-EPL-NY-Coverage Deleted Factor}
    ${EPL-Coverage Deleted Factor}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Coverage Deleted Factor}  ELSE  get value  ${NFP-EPL-NY-Coverage Deleted Factor}
    Value Comparison  ${EPL-Coverage Deleted Factor}    ${test_data['EPL-THIRDPARTYDELETEDFACTOR']}  ${EPL-Text_CDF}
    ${EPL-Text_EF}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Endorsement Factor}
    ${EPL-Endorsement Factor}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Endorsement Factor}
    run keyword if  '${test_data['State']}' != 'New York'  Value Comparison  ${EPL-Endorsement Factor}    ${test_data['EPL-ENDORSEMENTFACTOR']}  ${EPL-Text_EF}
    ${EPL-Text_LE}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Loss Experience}  ELSE  get value  ${Text-EPL-NY-Loss Experience}
    ${EPL-Loss Experience}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Loss Experience}  ELSE  get value  ${NFP-EPL-NY-Loss Experience}
    run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${EPL-Loss Experience}    ${test_data['NY_DNO_ABOVE_2500-EPL-LOSSEXPERIENCE']}  ${EPL-Text_LE}  ELSE  Value Comparison  ${EPL-Loss Experience}    ${test_data['EPL-LOSSEXPERIENCE']}  ${EPL-Text_LE}
    ${EPL-Text_AR}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Affected by Recession}  ELSE  get value  ${Text-EPL-NY-Affected by Recession}
    ${EPL-Affected by Recession}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Affected by Recession}  ELSE  get value  ${NFP-EPL-NY-Affected by Recession}
    run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${EPL-Affected by Recession}    ${test_data['NY_DNO_ABOVE_2500-EPL-AFFECTEDBYRECESSION']}  ${EPL-Text_AR}  ELSE  Value Comparison  ${EPL-Affected by Recession}    ${test_data['EPL-AFFECTEDBYRECESSION']}  ${EPL-Text_AR}
    ${EPL-Text_CGOV}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Corporate Governance}  ELSE  get value  ${Text-EPL-NY-Corporate Governance}
    ${EPL-Corporate Governance}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Corporate Governance}  ELSE  get value  ${NFP-EPL-NY-Corporate Governance}
    run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${EPL-Corporate Governance}    ${test_data['NY_DNO_ABOVE_2500-EPL-STRENGTHOFCORPORATEGOVERNANCE']}  ${EPL-Text_CGOV}  ELSE  Value Comparison  ${EPL-Corporate Governance}    ${test_data['EPL-STRENGTHOFCORPORATEGOVERNANCE']}  ${EPL-Text_CGOV}
    ${EPL-Text_FLIQ}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Financial Liquidity}  ELSE  get value  ${Text-EPL-NY-Financial Liquidity}
    ${EPL-Financial Liquidity}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Financial Liquidity}  ELSE  get value  ${NFP-EPL-NY-Financial Liquidity}
    run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${EPL-Financial Liquidity}    ${test_data['NY_DNO_ABOVE_2500-EPL-OVERALLFINANCIALLIQUIDITY']}  ${EPL-Text_FLIQ}  ELSE  Value Comparison  ${EPL-Financial Liquidity}    ${test_data['EPL-OVERALLFINANCIALLIQUIDITY']}  ${EPL-Text_FLIQ}
    ${EPL-Text_QOM}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-EPL-Quality of Management}  ELSE  get value  ${Text-EPL-NY-Quality of Management}
    ${EPL-Quality of Management}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-EPL-Quality of Management}  ELSE  get value  ${NFP-EPL-NY-Quality of Management}
    run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${EPL-Quality of Management}    ${test_data['NY_DNO_ABOVE_2500-EPL-QUALITYOFMANAGEMENT']}  ${EPL-Text_QOM}  ELSE  Value Comparison  ${EPL-Quality of Management}    ${test_data['EPL-QUALITYOFMANAGEMENT']}  ${EPL-Text_QOM}

EPL_States
    [Arguments]  &{test_data}
    ${EPL-Text_HCL}=  get value  ${Text_VA-EPL-Hazard County Locations}
    ${EPL-Hazard County Locations}=  get value  ${NFP_VA-EPL-Hazard County Locations}
    Value Comparison  ${EPL-Hazard County Locations}  ${test_data['EPL-HAZARDCOUNTYLOCATIONS']}  ${EPL-Text_HCL}
    ${EPL-Text_NYB}=  get value  ${Text_VA-EPL-Number of Years in Business}
    ${EPL-Number of Years in Business}=  get value  ${NFP_VA-EPL-Number of Years in Business}
    Value Comparison  ${EPL-Number of Years in Business}    ${test_data['EPL-NUMBEROFYEARSINBUSINESS']}  ${EPL-Text_NYB}
    ${EPL-Text_CA}=  get value  ${Text_VA-EPL-Closing Activity}
    ${EPL-Closing Activity}=  get value  ${NFP_VA-EPL-Closing Activity}
    Value Comparison  ${EPL-Closing Activity}    ${test_data['EPL-LAYOFFACTIVITY']}  ${EPL-Text_CA}
    ${EPL-Text_ET}=  get value  ${Text_VA-EPL-Employee Turnover}
    ${EPL-Employee Turnover}=  get value  ${NFP_VA-EPL-Employee Turnover}
    Value Comparison  ${EPL-Employee Turnover}    ${test_data['EPL-EMPLOYEETURNOVER']}  ${EPL-Text_ET}
    ${EPL-Text_STRANS}=  get value  ${Text_VA-EPL-Significant Transaction}
    ${EPL-Significant Transaction}=  get value  ${NFP_VA-EPL-Significant Transaction}
    Value Comparison  ${EPL-Significant Transaction}    ${test_data['EPL-SIGNIFICANTTRANSACTIONEVENT']}  ${EPL-Text_STRANS}
    ${EPL-Text_HRS}=  get value  ${Text_VA-EPL-Human Resources}
    ${EPL-Human Resources}=  get value  ${NFP_VA-EPL-Human Resources}
    Value Comparison  ${EPL-Human Resources}    ${test_data['EPL-HUMANRESOURCES']}  ${EPL-Text_HRS}
    ${EPL-Text_NOP}=  get value  ${Text_VA-EPL-Nature of Operations}
    ${EPL-Nature of Operations}=  get value  ${NFP_VA-EPL-Nature of Operations}
    Value Comparison  ${EPL-Nature of Operations}    ${test_data['EPL-NATUREOFOPERATIONS']}  ${EPL-Text_NOP}
    ${EPL-Text_DA}=  get value  ${Text_VA-EPL-Divestiture Activity}
    ${EPL-Divestiture Activity}=  get value  ${NFP_VA-EPL-Divestiture Activity}
    Value Comparison  ${EPL-Divestiture Activity}    ${test_data['EPL-MERGERACQUISITIONDIVESTITURE']}  ${EPL-Text_DA}
    ${EPL-Text_AC}=  get value  ${Text_VA-EPL-Annual Compensation}
    ${EPL-Annual Compensation}=  get value  ${NFP_VA-EPL-Annual Compensation}
    Value Comparison  ${EPL-Annual Compensation}    ${test_data['EPL-ANNUALCOMPENSTION']}  ${EPL-Text_AC}
    ${EPL-Text_LH}=  get value  ${Text_VA-EPL-Litigation History}
    ${EPL-Litigation History}=   get value  ${NFP_VA-EPL-Litigation History}
    Value Comparison  ${EPL-Litigation History}    ${test_data['EPL-LITIGATIONHISTORY']}  ${EPL-Text_LH}
    ${EPL-Text_MS}=  get value  ${Text_VA-EPL-Management Stability}
    ${EPL-Management Stability}=  get value  ${NFP_VA-EPL-Management Stability}
    Value Comparison  ${EPL-Management Stability}    ${test_data['EPL-MANAGEMENTSTABILITY']}  ${EPL-Text_MS}
    ${EPL-Text_DSF}=  get value  ${Text_VA-EPL-Defend Selection Factor}
    ${EPL-Defend Selection Factor}=  get value  ${NFP_VA-EPL-Defend Selection Factor}
    Value Comparison  ${EPL-Defend Selection Factor}    ${test_data['EPL-DUTYTODEFEND']}  ${EPL-Text_DSF}
    ${EPL-Text_TPEF}=  get value  ${Text_VA-EPL-Third Party Exposure Factor}
    ${EPL-Third Party Exposure Factor}=  get value  ${NFP_VA-EPL-Third Party Exposure Factor}
    Value Comparison  ${EPL-Third Party Exposure Factor}    ${test_data['EPL-THIRDPARTYEXPOSUREFACTOR']}  ${EPL-Text_TPEF}
    ${EPL-Text_CDF}=  get value  ${Text_VA-EPL-Coverage Deleted Factor}
    ${EPL-Coverage Deleted Factor}=  get value  ${NFP_VA-EPL-Coverage Deleted Factor} 
    Value Comparison  ${EPL-Coverage Deleted Factor}    ${test_data['EPL-THIRDPARTYDELETEDFACTOR']}  ${EPL-Text_CDF}
    ${EPL-Text_EF}=  get value  ${Text_VA-EPL-Endorsement Factor}
    ${EPL-Endorsement Factor}=  get value  ${NFP_VA-EPL-Endorsement Factor}
    Value Comparison  ${EPL-Endorsement Factor}    ${test_data['EPL-ENDORSEMENTFACTOR']}  ${EPL-Text_EF}
    ${EPL-Text_AR}=  get value  ${Text_VA-EPL-Affected by Recession}
    ${EPL-Affected by Recession}=  get value  ${NFP_VA-EPL-Affected by Recession}
    Value Comparison  ${EPL-Affected by Recession}    ${test_data['EPL-AFFECTEDBYRECESSION']}  ${EPL-Text_AR}
    ${EPL-Text_CGOV}=  get value  ${Text_VA-EPL-Corporate Governance}
    ${EPL-Corporate Governance}=  get value  ${NFP_VA-EPL-Corporate Governance}
    Value Comparison  ${EPL-Corporate Governance}    ${test_data['EPL-STRENGTHOFCORPORATEGOVERNANCE']}  ${EPL-Text_CGOV}
    ${EPL-Text_FLIQ}=  get value  ${Text_VA-EPL-Financial Liquidity}
    ${EPL-Financial Liquidity}=  get value  ${NFP_VA-EPL-Financial Liquidity}
    Value Comparison  ${EPL-Financial Liquidity}    ${test_data['EPL-OVERALLFINANCIALLIQUIDITY']}  ${EPL-Text_FLIQ}
    ${EPL-Text_QOM}=  get value  ${Text_VA-EPL-Quality of Management}
    ${EPL-Quality of Management}=  get value  ${NFP_VA-EPL-Quality of Management}
    Value Comparison  ${EPL-Quality of Management}    ${test_data['EPL-QUALITYOFMANAGEMENT']}  ${EPL-Text_QOM}

NFP-FDU
   [Arguments]  &{test_data}
   log to console  "NFP-FDU"
   ${index}=  set variable
   ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}2  ELSE  Set Variable  ${index}1
   ${FDU_Text_NOP}=  get value  ${Text-FDU-Nature-of-Operations-${index}}
   ${FDU-Nature of Operations}=  get value  ${NFP-FDU-Nature-of-Operations-${index}}
   Value Comparison  ${FDU-Nature of Operations}    ${test_data['FDU-NATUREOFOPERATIONS']}  ${FDU_Text_NOP}
   ${FDU_Text_NOYB}=  get value  ${Text-FDU-Number of Years in Business-${index}}
   ${FDU-Number of Years in Business}=  get value  ${NFP-FDU-Number of Years in Business-${index}}
   Value Comparison  ${FDU-Number of Years in Business}    ${test_data['FDU-NUMBEROFYEARSINBUSINESS']}  ${FDU_Text_NOYB}
   ${FDU_Text_PTERM}=  get value  ${Text-FDU-Plan Termination-${index}}
   ${FDU-Plan Termination}=  get value  ${NFP-FDU-Plan Termination-${index}}
   Value Comparison  ${FDU-Plan Termination}    ${test_data['FDU-PLANTERMINATION']}  ${FDU_Text_PTERM}
   ${FDU_Text_PT}=  get value  ${Text-FDU-Plan Type-${index}}
   ${FDU-Plan Type}=  get value  ${NFP-FDU-Plan Type-${index}}
   Value Comparison  ${FDU-Plan Type}    ${test_data['FDU-PLANTYPE']}  ${FDU_Text_PT}
   run keyword if  '${test_data['State']}' == 'Ohio'  run keyword  Fudiciary_OHIO  ${test_data}  ELSE  Fudiciary_Non_OHIO  ${test_data}

Fudiciary_OHIO
   [Arguments]  ${test_data}
   ${index}=  set variable
   ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}2  ELSE  Set Variable  ${index}1
   ${FDU_Text_ESOP}=  get value  ${Text-OH-FDU-Employee Stock-${index}}
   ${FDU-Employee Stock Ownership Plan}=  get value  ${NFP-OH-FDU-Employee Stock-${index}}
   Value Comparison  ${FDU-Employee Stock Ownership Plan}    ${test_data['FDU-EMPLOYEESTOCKOWNERSHIPPLAN']}  ${FDU_Text_ESOP}
   ${FDU_Text_DBP}=  get value  ${Text-OH-FDU-Defined Benefit Plans-${index}}
   ${FDU-Defined Benefit Plans}=  get value  ${NFP-OH-FDU-Defined Benefit Plans-${index}}
   Value Comparison  ${FDU-Defined Benefit Plans}    ${test_data['FDU-FUNDINGSTATUSBENEFITPLANS']}  ${FDU_Text_DBP}
   ${FDU_Text_PP}=  get value  ${Text-OH-FDU-Plan Participants-${index}}
   ${FDU-Plan Participants}=  get value  ${NFP-OH-FDU-Plan Participants-${index}}
   Value Comparison  ${FDU-Plan Participants}    ${test_data['FDU-PLANPARTICIPANTS']}  ${FDU_Text_PP}
   ${FDU_Text_LH}=  get value  ${Text-OH-FDU-Litigation History-${index}}
   ${FDU-Litigation History}=  get value  ${NFP-OH-FDU-Litigation History-${index}}
   Value Comparison  ${FDU-Litigation History}    ${test_data['FDU-LITIGATIONHISTORY']}  ${FDU_Text_LH}
   ${FDU_Text_ST}=  get value  ${Text-OH-FDU-Significant Transaction-${index}}
   ${FDU-Significant Transaction}=  get value  ${NFP-OH-FDU-Significant Transaction-${index}}
   Value Comparison  ${FDU-Significant Transaction}    ${test_data['FDU-SIGNIFICANTTRANSACTIONEVENT']}  ${FDU_Text_ST}
   ${FDU_Text_DPI}=  get value  ${Text-OH-FDU-Diversity of Plan Investments-${index}}
   ${FDU-Diversity of Plan Investments}=  get value  ${NFP-OH-FDU-Diversity of Plan Investments-${index}}
   Value Comparison  ${FDU-Diversity of Plan Investments}    ${test_data['FDU-QUALITYANDDIVERSITY']}  ${FDU_Text_DPI}
   ${FDU_Text_DSF}=  get value  ${Text-OH-FDU-Defend Selection Factor-${index}}
   ${FDU-Defend Selection Factor}=  get value  ${NFP-OH-FDU-Defend Selection Factor-${index}}
   Value Comparison  ${FDU-Defend Selection Factor}    ${test_data['FDU-DUTYTO DEFEND']}  ${FDU_Text_DSF}
   ${FDU_Text_EF}=  get value  ${Text-OH-FDU-Endorsement Factor-${index}}
   ${FDU-Endorsement Factor}=  get value  ${NFP-OH-FDU-Endorsement Factor-${index}}
   Value Comparison  ${FDU-Endorsement Factor}    ${test_data['FDU-ENDORSEMENTFACTOR']}  ${FDU_Text_EF}
   FDU_Scheduled_Modifiers_OHIO  ${test_data}

Fudiciary_Non_OHIO
   [Arguments]  ${test_data}
   ${index}=  set variable
   ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}2  ELSE  Set Variable  ${index}1
   ${FDU_Text_DBP}=  get value  ${Text-FDU-Defined Benefit Plans-${index}}
   ${FDU-Defined Benefit Plans}=  get value  ${NFP-FDU-Defined Benefit Plans-${index}}
   Value Comparison  ${FDU-Defined Benefit Plans}    ${test_data['FDU-FUNDINGSTATUSBENEFITPLANS']}  ${FDU_Text_DBP}
   ${FDU_Text_PP}=  get value  ${Text-FDU-Plan Participants-${index}}
   ${FDU-Plan Participants}=  get value  ${NFP-FDU-Plan Participants-${index}}
   Value Comparison  ${FDU-Plan Participants}    ${test_data['FDU-PLANPARTICIPANTS']}  ${FDU_Text_PP}
   ${FDU_Text_LH}=  get value  ${Text-FDU-Litigation History-${index}}
   ${FDU-Litigation History}=  get value  ${NFP-FDU-Litigation History-${index}}
   Value Comparison  ${FDU-Litigation History}    ${test_data['FDU-LITIGATIONHISTORY']}  ${FDU_Text_LH}
   ${FDU_Text_ST}=  get value  ${Text-FDU-Significant Transaction-${index}}
   ${FDU-Significant Transaction}=  get value  ${NFP-FDU-Significant Transaction-${index}}
   Value Comparison  ${FDU-Significant Transaction}    ${test_data['FDU-SIGNIFICANTTRANSACTIONEVENT']}  ${FDU_Text_ST}
   ${FDU_Text_DPI}=  get value  ${Text-FDU-Diversity of Plan Investments-${index}}
   ${FDU-Diversity of Plan Investments}=  get value  ${NFP-FDU-Diversity of Plan Investments-${index}}
   Value Comparison  ${FDU-Diversity of Plan Investments}    ${test_data['FDU-QUALITYANDDIVERSITY']}  ${FDU_Text_DPI}
   ${FDU_Text_DSF}=  get value  ${Text-FDU-Defend Selection Factor-${index}}
   ${FDU-Defend Selection Factor}=  get value  ${NFP-FDU-Defend Selection Factor-${index}}
   Value Comparison  ${FDU-Defend Selection Factor}    ${test_data['FDU-DUTYTO DEFEND']}  ${FDU_Text_DSF}
   ${FDU_Text_EF}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-FDU-Endorsement Factor-${index}}
   ${FDU-Endorsement Factor}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-FDU-Endorsement Factor-${index}}
   run keyword if  '${test_data['State']}' != 'New York'  Value Comparison  ${FDU-Endorsement Factor}    ${test_data['FDU-ENDORSEMENTFACTOR']}  ${FDU_Text_EF}
   ${Scheduled-States-check} =  run keyword and return status  list should contain value  ${Scheduled_States}  ${test_data['State']}
   run keyword if    ${Scheduled-States-check}    FDU_Statecheck_Modifiers  &{test_data}  ELSE IF  '${test_data['State']}' != 'Hawaii'   FDU_Scheduled_Modifiers  &{test_data}

FDU_Scheduled_Modifiers
   [Arguments]  &{test_data}
   ${index}=  set variable
   ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}2  ELSE  Set Variable  ${index}1
   ${FDU_Text_CG}=  get value  ${Text-FDU-Corporate Governance-${index}}
   ${FDU-Corporate Governance}=  get value  ${NFP-FDU-Corporate Governance-${index}}
   Value Comparison  ${FDU-Corporate Governance}    ${test_data['FDU-STRENGTHOFCORPORATEGOVERNANCE']}  ${FDU_Text_CG}
   ${FDU_Text_LE}=  get value  ${Text-FDU-Loss Experience-${index}}
   ${FDU-Loss Experience}=  get value  ${NFP-FDU-Loss Experience-${index}}
   Value Comparison  ${FDU-Loss Experience}    ${test_data['FDU-LOSSEXPERIENCE']}  ${FDU_Text_LE}
   ${FDU_Text_OFL}=  get value  ${Text-FDU-Overall Financial Liquidity-${index}}
   ${FDU-Overall Financial Liquidity}=  get value  ${NFP-FDU-Overall Financial Liquidity-${index}}
   Value Comparison  ${FDU-Overall Financial Liquidity}    ${test_data['FDU-OVERALLFINANCIALLIQUIDITY']}  ${FDU_Text_OFL}
   ${FDU_Text_AR}=  get value  ${Text-FDU-Affected by Recession-${index}}
   ${FDU-Affected by Recession}=  get value  ${NFP-FDU-Affected by Recession-${index}}
   Value Comparison  ${FDU-Affected by Recession}    ${test_data['FDU-AFFECTEDBYRECESSION']}  ${FDU_Text_AR}
   ${FDU_Text_QOM}=  get value  ${Text-FDU-Quality of Management-${index}}
   ${FDU-Quality of Management}=  get value  ${NFP-FDU-Quality of Management-${index}}
   Value Comparison  ${FDU-Quality of Management}    ${test_data['FDU-QUALITYOFMANAGEMENT']}  ${FDU_Text_QOM}

FDU_Statecheck_Modifiers
   [Arguments]  &{test_data}
   ${index}=  set variable
   ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}2  ELSE  Set Variable  ${index}1
   ${FDU_Text_CG}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${Text-FDU-Corporate Governance-${index}}  ELSE  get value  ${Text-FDU-NY-Corporate Governance-${index}}
   ${FDU-Corporate Governance}=  run keyword if  '${test_data['State']}' != 'New York'  get value  ${NFP-FDU-Corporate Governance-${index}}  ELSE  get value  ${NFP-FDU-NY-Corporate Governance-${index}}
   run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}   Value Comparison  ${FDU-Corporate Governance}    ${test_data['NY_DNO_ABOVE_2500-FDU-STRENGTHOFCORPORATEGOVERNANCE']}  ${FDU_Text_CG}  ELSE   Value Comparison  ${FDU-Corporate Governance}    ${test_data['FDU-STRENGTHOFCORPORATEGOVERNANCE']}  ${FDU_Text_CG}
   ${FDU_Text_LE}=  run keyword if  '${test_data['State']}' == 'New York'  get value  ${Text-FDU-NY-Loss Experience-${index}}
   ${FDU-Loss Experience}=  run keyword if  '${test_data['State']}' == 'New York'  get value  ${NFP-FDU-NY-Loss Experience-${index}}
   run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${FDU-Loss Experience}    ${test_data['NY_DNO_ABOVE_2500-FDU-LOSSEXPERIENCE']}  ${FDU_Text_LE}
   ${FDU_Text_OFL}=  get value  ${Text-FDU-NY-Overall Financial Liquidity-${index}}
   ${FDU-Overall Financial Liquidity}=  get value  ${NFP-FDU-NY-Overall Financial Liquidity-${index}}
   run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${FDU-Overall Financial Liquidity}    ${test_data['NY_DNO_ABOVE_2500-FDU-OVERALLFINANCIALLIQUIDITY']}  ${FDU_Text_OFL}  ELSE  Value Comparison  ${FDU-Overall Financial Liquidity}    ${test_data['FDU-OVERALLFINANCIALLIQUIDITY']}  ${FDU_Text_OFL}
   ${FDU_Text_AR}=    get value  ${Text-FDU-NY-Affected by Recession-${index}}
   ${FDU-Affected by Recession}=  get value  ${NFP-FDU-NY-Affected by Recession-${index}}
   run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${FDU-Affected by Recession}    ${test_data['NY_DNO_ABOVE_2500-FDU-AFFECTEDBYRECESSION']}  ${FDU_Text_AR}  ELSE  Value Comparison  ${FDU-Affected by Recession}    ${test_data['FDU-AFFECTEDBYRECESSION']}  ${FDU_Text_AR}
   ${FDU_Text_QOM}=   get value  ${Text-FDU-NY-Quality of Management-${index}}
   ${FDU-Quality of Management}=  get value  ${NFP-FDU-NY-Quality of Management-${index}}
   run keyword if  '${test_data['State']}' == 'New York' and ${Premium} >= ${Rule_Value}  Value Comparison  ${FDU-Quality of Management}    ${test_data['NY_DNO_ABOVE_2500-FDU-QUALITYOFMANAGEMENT']}  ${FDU_Text_QOM}  ELSE  Value Comparison  ${FDU-Quality of Management}    ${test_data['FDU-QUALITYOFMANAGEMENT']}  ${FDU_Text_QOM}

FDU_Scheduled_Modifiers_OHIO
   [Arguments]  ${test_data}
   ${index}=  set variable
   ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}2  ELSE  Set Variable  ${index}1
   ${FDU_Text_CG}=  get value  ${Text-OH-FDU-Corporate Governance-${index}}
   ${FDU-Corporate Governance}=  get value  ${NFP-OH-FDU-Corporate Governance-${index}}
   Value Comparison  ${FDU-Corporate Governance}    ${test_data['FDU-STRENGTHOFCORPORATEGOVERNANCE']}  ${FDU_Text_CG}
   ${FDU_Text_LE}=  get value  ${Text-OH-FDU-Loss Experience-${index}}
   ${FDU-Loss Experience}=  get value  ${NFP-OH-FDU-Loss Experience-${index}}
   Value Comparison  ${FDU-Loss Experience}    ${test_data['FDU-LOSSEXPERIENCE']}  ${FDU_Text_LE}
   ${FDU_Text_OFL}=  get value  ${Text-OH-FDU-Overall Financial Liquidity-${index}}
   ${FDU-Overall Financial Liquidity}=  get value  ${NFP-OH-FDU-Overall Financial Liquidity-${index}}
   Value Comparison  ${FDU-Overall Financial Liquidity}    ${test_data['FDU-OVERALLFINANCIALLIQUIDITY']}  ${FDU_Text_OFL}
   ${FDU_Text_AR}=  get value  ${Text-OH-FDU-Affected by Recession-${index}}
   ${FDU-Affected by Recession}=  get value  ${NFP-OH-FDU-Affected by Recession-${index}}
   Value Comparison  ${FDU-Affected by Recession}    ${test_data['FDU-AFFECTEDBYRECESSION']}  ${FDU_Text_AR}
   ${FDU_Text_QOM}=  get value  ${Text-OH-FDU-Quality of Management-${index}}
   ${FDU-Quality of Management}=  get value  ${NFP-OH-FDU-Quality of Management-${index}}
   Value Comparison  ${FDU-Quality of Management}    ${test_data['FDU-QUALITYOFMANAGEMENT']}  ${FDU_Text_QOM}

NFP-ELL
    [Arguments]  &{test_data}
    log to console  "NFP-ELL"
    ${index}=  set variable
    ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}3  ELSE  Set Variable  ${index}2
    ${ELL_Text_AOP}=  get value  ${Text-ELL-Area of Practice-${index}}
    ${ELL-Area of Practice}=  get value  ${NFP-ELL-Area of Practice-${index}}
    Value Comparison  ${ELL-Area of Practice}    ${test_data['ELL-AREAOFPRACTICE']}  ${ELL_Text_AOP}
    ${ELL_Text_LH}=  get value  ${Text-ELL-Litigation History-${index}}
    ${ELL-Litigation History}=  get value  ${NFP-ELL-Litigation History-${index}}
    Value Comparison  ${ELL-Litigation History}    ${test_data['ELL-LITIGATIONHISTORY']}  ${ELL_Text_LH}
    ${ELL_Text_PDE}=  get value  ${Text-ELL-Public Debt Exposure-${index}}
    ${ELL-Public Debt Exposure}=  get value  ${NFP-ELL-Public Debt Exposure-${index}}
    Value Comparison  ${ELL-Public Debt Exposure}    ${test_data['ELL-PUBLICDEBT']}  ${ELL_Text_PDE}
    ${ELL_Text_DA}=  get value  ${Text-ELL-Divestiture Activity-${index}}
    ${ELL-Divestiture Activity}=  get value  ${NFP-ELL-Divestiture Activity-${index}}
    Value Comparison  ${ELL-Divestiture Activity}    ${test_data['ELL-MERGERACQUISITIONDIVESTITURE']}  ${ELL_Text_DA}
    ${ELL_Text_ELR}=  get value  ${Text-ELL-External Legal Resources-${index}}
    ${ELL-External Legal Resources}=  get value  ${NFP-ELL-External Legal Resources-${index}}
    Value Comparison  ${ELL-External Legal Resources}    ${test_data['ELL-EXTERNALLEGALRESOURCES']}  ${ELL_Text_ELR}
    ${ELL_Text_EMPL}=  get value  ${Text-ELL-Employed Lawyers-${index}}
    ${ELL-Employed Lawyers}=  get value  ${NFP-ELL-Employed Lawyers-${index}}
    Value Comparison  ${ELL-Employed Lawyers}  ${test_data['ELL-EXPERIENCEEMPLOYEDLAWYERS']}  ${ELL_Text_EMPL}
    ${ELL_Text_LSP}=  get value  ${Text-ELL-Legal Services Performed-${index}}
    ${ELL-Legal Services Performed}=  get value  ${NFP-ELL-Legal Services Performed-${index}}
    Value Comparison  ${ELL-Legal Services Performed}  ${test_data['ELL-OTHERLEGALSERVICES']}  ${ELL_Text_LSP}
    ${ELL_Text_DSF}=  get value  ${Text-ELL-Defend Selection Factor-${index}}
    ${ELL-Defend Selection Factor}=  get value  ${NFP-ELL-Defend Selection Factor-${index}}
    Value Comparison  ${ELL-Defend Selection Factor}    ${test_data['ELL-DUTYTO DEFEND']}  ${ELL_Text_DSF}
    ${ELL_Text_EF}=  get value  ${Text-ELL-Endorsement Factor-${index}}
    ${ELL-Endorsement Factor}=  get value  ${NFP-ELL-Endorsement Factor-${index}}
    Value Comparison  ${ELL-Endorsement Factor}    ${test_data['ELL-ENDORSEMENTFACTOR']}  ${ELL_Text_EF}
    ${ELL_Text_CF}=  get value  ${Text-ELL-Coverage Factor-${index}}
    ${ELL-Coverage Factor}=  get value  ${NFP-ELL-Coverage Factor-${index}}
    Value Comparison  ${ELL-Coverage Factor}    ${test_data['ELL-SECURITIESCOVERAGE']}  ${ELL_Text_CF}
    ${Scheduled-States-check} =  run keyword and return status  list should contain value  ${Scheduled_States}  ${test_data['State']}
    run keyword if    ${Scheduled-States-check}  ELL_Statecheck_Modifiers  &{test_data}  ELSE IF  '${test_data['State']}' != 'Hawaii'  ELL_Scheduled_Modifiers  &{test_data}

ELL_Scheduled_Modifiers
    [Arguments]  &{test_data}
    ${index}=  set variable
    ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}3  ELSE  Set Variable  ${index}2
    ${ELL_Text_LEX}=  get value  ${Text-ELL-Loss Experience-${index}}
    ${ELL-Loss Experience}=  get value  ${NFP-ELL-Loss Experience-${index}}
    Value Comparison  ${ELL-Loss Experience}    ${test_data['ELL-LOSSEXPERIENCE']}  ${ELL_Text_LEX}
    ${ELL_Text_CG}=  get value  ${Text-ELL-Corporate Governance-${index}}
    ${ELL-Corporate Governance}=  get value  ${NFP-ELL-Corporate Governance-${index}}
    Value Comparison  ${ELL-Corporate Governance}    ${test_data['ELL-STRENGTHOFCORPORATEGOVERNANCE']}  ${ELL_Text_CG}
    ${ELL_Text_OFL}=  get value  ${Text-ELL-Overall Financial Liquidity-${index}}
    ${ELL-Overall Financial Liquidity}=  get value  ${NFP-ELL-Overall Financial Liquidity-${index}}
    Value Comparison  ${ELL-Overall Financial Liquidity}    ${test_data['ELL-OVERALLFINANCIALLIQUIDITY']}  ${ELL_Text_OFL}
    ${ELL_Text_AR}=  get value  ${Text-ELL-Affected by Recession-${index}}
    ${ELL-Affected by Recession}=  get value  ${NFP-ELL-Affected by Recession-${index}}
    Value Comparison  ${ELL-Affected by Recession}    ${test_data['ELL-AFFECTEDBYRECESSION']}  ${ELL_Text_AR}
    ${ELL_Text_QOM}=  get value  ${Text-ELL-Quality of Management-${index}}
    ${ELL-Quality of Management}=  get value  ${NFP-ELL-Quality of Management-${index}}
    Value Comparison  ${ELL-Quality of Management}    ${test_data['ELL-QUALITYOFMANAGEMENT']}  ${ELL_Text_QOM}

ELL_Statecheck_Modifiers
    [Arguments]  &{test_data}
    ${index}=  set variable
    ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}3  ELSE  Set Variable  ${index}2
    ${ELL_Text_CG}=  get value  ${VA_Text-ELL-Corporate Governance-${index}}
    ${ELL-Corporate Governance}=  get value  ${VA_NFP-ELL-Corporate Governance-${index}}
    Value Comparison  ${ELL-Corporate Governance}    ${test_data['ELL-STRENGTHOFCORPORATEGOVERNANCE']}  ${ELL_Text_CG}
    ${ELL_Text_OFL}=  get value  ${VA_Text-ELL-Overall Financial Liquidity-${index}}
    ${ELL-Overall Financial Liquidity}=  get value  ${VA_NFP-ELL-Overall Financial Liquidity-${index}}
    Value Comparison  ${ELL-Overall Financial Liquidity}    ${test_data['ELL-OVERALLFINANCIALLIQUIDITY']}  ${ELL_Text_OFL}
    ${ELL_Text_AR}=  get value  ${VA_Text-ELL-Affected by Recession-${index}}
    ${ELL-Affected by Recession}=  get value  ${VA_NFP-ELL-Affected by Recession-${index}}
    Value Comparison  ${ELL-Affected by Recession}    ${test_data['ELL-AFFECTEDBYRECESSION']}  ${ELL_Text_AR}
    ${ELL_Text_QOM}=  get value  ${VA_Text-ELL-Quality of Management-${index}}
    ${ELL-Quality of Management}=  get value  ${VA_NFP-ELL-Quality of Management-${index}}
    Value Comparison  ${ELL-Quality of Management}    ${test_data['ELL-QUALITYOFMANAGEMENT']}  ${ELL_Text_QOM}

Value Comparison
    [Arguments]  ${Application_Value}  ${Valid_Values}  ${Name}
    ${App-value}=  set variable   ${Application_Value}
    ${App_Name}=  set variable   ${Name}
    ${DNO_Var}=  Set variable  ${Valid_Values}
    ${STR_DNO}=  Split String    ${DNO_Var}  ,
    ${STR_Count}=  Get length   ${STR_DNO}
    @{Cov_list}=  convert to list    ${STR_DNO}
    ${match}=  Get Substring  ${STR_DNO}[0]  0  3
    run keyword if   '${match}' == 'min'   run keyword  Min-Max Comparison  ${App-value}  ${App_Name}  ${STR_DNO}  ELSE  Valid Comparison  ${App-value}  ${App_Name}  ${Cov_list}

Valid Comparison
    [Arguments]  ${Value}  ${Field-name}  ${list_Values}
    @{List_Var}=  Set variable  ${list_Values}
    FOR   ${ELEMENT}   IN  @{List_Var}
        Run Keyword If  '${ELEMENT}' == '${Value}'  Exit For Loop
    END
    ${for_loop variable}=  set variable  ${ELEMENT}
    run keyword if  '${for_loop variable}' == '${Value}'  log to console  ${Field-name}: ${Value} - "Input is valid"  ELSE  run keywords  log to console  ${Field-name}: ${Value} - "Input is Invalid"  AND  close browser

Min-Max Comparison
     [Arguments]  ${Value}  ${Field-name}  ${String_Value}
     ${STR_DNO}=  Set variable  ${String_Value}
     ${min_value}=  fetch from right    ${STR_DNO}[0]  =
     log    ${min_value}
     ${max_value}=  fetch from right    ${STR_DNO}[1]  =
     log    ${max_value}
     FOR  ${index}    IN RANGE    ${min_value}   ${max_value}+1
       Run Keyword If  '${index}' == '${Value}'  Exit For Loop
     END
     ${for_loop variable}=  set variable  ${index}
     run keyword if  '${for_loop variable}' == '${Value}'  log to console  ${Field-name}: ${Value} - "Input is valid"  ELSE  run keywords  log to console  ${Field-name}: ${Value} - "Input is Invalid  AND  close browser

Modifiers Calculation_NewYork
    [Arguments]  &{test_data}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${UMS-Layers}
    ${Base-Premium_Value}=  get value  ${DNO-BasePremium}
    ${Base-Premium}=  remove string    ${Base-Premium_Value}  ,
    log to console  Base Premium:${Base-Premium}
    wait until element is not visible   globalAjaxLoading  100
    click element  ${UMS-Modifiers}
    wait until element is not visible   globalAjaxLoading  100
    ${DNO_Nature of Operations}=  get value    ${NFP-DNO-Nature-of-Operations}
    ${Product_NOP}=  evaluate  ((100+(${DNO_Nature of Operations}))/100)
    ${DNO-Number of Years in Business}=  get value    ${NFP-DNO-Number of Years in Business}
    ${Product_NYB}=  evaluate  ((100+(${DNO-Number of Years in Business}))/100)
    ${DNO-Number of Subsidiaries}=  get value    ${NFP-DNO-Number of Subsidiaries}
    ${Product_NOS}=  evaluate  ((100+(${DNO-Number of Subsidiaries}))/100)
    ${DNO-Merger Divestiture Activity}=  get value    ${NFP-DNO-Merger Divestiture Activity}
    ${Product_MDA}=  evaluate  ((100+(${DNO-Merger Divestiture Activity}))/100)
    ${DNO-Securities Offering Activity}=  get value    ${NFP-DNO-Securities Offering Activity}
    ${Product_SECOA}=  evaluate  ((100+(${DNO-Securities Offering Activity}))/100)
    ${DNO-Litigation History}=  get value    ${NFP-DNO-Litigation History}
    ${Product_LH}=  evaluate  ((100+(${DNO-Litigation History}))/100)
    ${DNO-Significant Transaction}=  get value    ${NFP-DNO-Significant Transaction}
    ${Product_ST}=  evaluate  ((100+(${DNO-Significant Transaction}))/100)
    ${DNO-Management Stability}=  get value    ${NFP-DNO-Management Stability}
    ${Product_MS}=  evaluate  ((100+(${DNO-Management Stability}))/100)
    ${DNO-Statement of Financial Position}=  get value    ${NFP-DNO-Statement of Financial Position}
    ${Product_SOFP}=  evaluate  ((100+(${DNO-Statement of Financial Position}))/100)
    ${DNO-Statement of Activities}=  get value    ${NFP-DNO-Statement of Activities}
    ${Product_SOA}=  evaluate  ((100+(${DNO-Statement of Activities}))/100)
    ${DNO-Statement of Cash Flows}=  get value    ${NFP-DNO-Statement of Cash Flows}
    ${Product_SOCF}=  evaluate  ((100+(${DNO-Statement of Cash Flows}))/100)
    ${Overall-Product_Non-scheduled}=  evaluate  (${Product_NOP}*${Product_NYB}*${Product_NOS}*${Product_MDA}*${Product_SECOA}*${Product_LH}*${Product_ST}*${Product_MS}*${Product_SOFP}*${Product_SOA}*${Product_SOCF})
    ${Overall_DNO_BP}=  evaluate  ${Base-Premium}*${Overall-Product_Non-scheduled}
    wait until element is not visible   globalAjaxLoading  100
    ${EPL_BASEPREMIUM}=  run keyword if  '${test_data['EPL']}' == 'YES'  Modifiers Calculation_NewYork_EPL  ELSE  Set variable  0
    ${FDU_BASEPREMIUM}=  run keyword if  '${test_data['Fiduciary']}' == 'YES'  Modifiers Calculation_NewYork_FDU  &{test_data}  ELSE  Set variable  0
    ${Overall-DNO-EPL-FDU-BP}=  evaluate  ${Overall_DNO_BP} + ${EPL_BASEPREMIUM} + ${FDU_BASEPREMIUM}
    ${DNO-EPL-FDU-BP}=  Evaluate  "%.2f" % ${Overall-DNO-EPL-FDU-BP}
    log to console  Overall-BasePremium:${DNO-EPL-FDU-BP}
    RETURN  ${DNO-EPL-FDU-BP}

Modifiers Calculation_NewYork_FDU
    [Arguments]  &{test_data}
    click element  ${UMS-Layers}
    ${Base-Premium_Value}=  get value  ${EPL-BasePremium}
    ${Base-Premium}=  remove string    ${Base-Premium_Value}  ,
    click element  ${UMS-Modifiers}
    ${index}=  set variable
    ${index}=  Run Keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['Fiduciary']}' == 'YES'  Set Variable  ${index}2  ELSE  Set Variable  ${index}1
    ${FDU-Nature of Operations}=  get value  ${NFP-FDU-Nature-of-Operations-${index}}
    ${Product_NOP}=  evaluate  ((100+(${FDU-Nature of Operations}))/100)
    ${FDU-Number of Years in Business}=  get value  ${NFP-FDU-Number of Years in Business-${index}}
    ${Product_NYB}=  evaluate  ((100+(${FDU-Number of Years in Business}))/100)
    ${FDU-Plan Termination}=  get value  ${NFP-FDU-Plan Termination-${index}}
    ${Product_PTERM}=  evaluate  ((100+(${FDU-Plan Termination}))/100)
    ${FDU-Plan Type}=  get value  ${NFP-FDU-Plan Type-${index}}
    ${Product_PTYPE}=  evaluate  ((100+(${FDU-Plan Type}))/100)
    ${FDU-Defined Benefit Plans}=  get value  ${NFP-FDU-Defined Benefit Plans-${index}}
    ${Product_DBP}=  evaluate  ((100+(${FDU-Defined Benefit Plans}))/100)
    ${FDU-Plan Participants}=  get value  ${NFP-FDU-Plan Participants-${index}}
    ${Product_PP}=  evaluate  ((100+(${FDU-Plan Participants}))/100)
    ${FDU-Litigation History}=  get value  ${NFP-FDU-Litigation History-${index}}
    ${Product_LH}=  evaluate  ((100+(${FDU-Litigation History}))/100)
    ${FDU-Significant Transaction}=  get value  ${NFP-FDU-Significant Transaction-${index}}
    ${Product_ST}=  evaluate  ((100+(${FDU-Significant Transaction}))/100)
    ${FDU-Diversity of Plan Investments}=  get value  ${NFP-FDU-Diversity of Plan Investments-${index}}
    ${Product_DOPI}=  evaluate  ((100+(${FDU-Diversity of Plan Investments}))/100)
    ${Overall-Product_Non-scheduled}=  evaluate  (${Product_NOP}*${Product_NYB}*${Product_PTERM}*${Product_PTYPE}*${Product_DBP}*${Product_PP}*${Product_LH}*${Product_ST}*${Product_DOPI})
    ${Overall_FDU_BP}=  evaluate  ${Base-Premium}*${Overall-Product_Non-scheduled}
    RETURN  ${Overall_FDU_BP}

Modifiers Calculation_NewYork_EPL
    click element  ${UMS-Layers}
    ${Base-Premium_Value}=  get value  ${EPL-BasePremium}
    ${Base-Premium}=  remove string    ${Base-Premium_Value}  ,
    click element  ${UMS-Modifiers}
    ${EPL-Hazard County Locations}=  get value  ${NFP-EPL-NY-Hazard County Locations}
    ${Product_HCL}=  evaluate  ((100+(${EPL-Hazard County Locations}))/100)
    ${EPL-Nature of Operations}=  get value  ${NFP-EPL-NY-Nature of Operations}
    ${Product_NOP}=  evaluate  ((100+(${EPL-Nature of Operations}))/100)
    ${EPL-Number of Years in Business}=  get value  ${NFP-EPL-NY-Number of Years in Business}
    ${Product_NYB}=  evaluate  ((100+(${EPL-Number of Years in Business}))/100)
    ${EPL-Divestiture Activity}=  get value  ${NFP-EPL-NY-Divestiture Activity}
    ${Product_DA}=  evaluate  ((100+(${EPL-Divestiture Activity}))/100)
    ${EPL-Closing Activity}=  get value  ${NFP-EPL-NY-Closing Activity}
    ${Product_COA}=  evaluate  ((100+(${EPL-Closing Activity}))/100)
    ${EPL-Annual Compensation}=  get value  ${NFP-EPL-NY-Annual Compensation}
    ${Product_AC}=  evaluate  ((100+(${EPL-Annual Compensation}))/100)
    ${EPL-Employee Turnover}=  get value  ${NFP-EPL-NY-Employee Turnover}
    ${Product_ET}=  evaluate  ((100+(${EPL-Employee Turnover}))/100)
    ${EPL-Litigation History}=  get value  ${NFP-EPL-NY-Litigation History}
    ${Product_LH}=  evaluate  ((100+(${EPL-Litigation History}))/100)
    ${EPL-Significant Transaction}=  get value  ${NFP-EPL-NY-Significant Transaction}
    ${Product_ST}=  evaluate  ((100+(${EPL-Significant Transaction}))/100)
    ${EPL-Management Stability}=  get value  ${NFP-EPL-NY-Management Stability}
    ${Product_MS}=  evaluate  ((100+(${EPL-Management Stability}))/100)
    ${EPL-Human Resources}=  get value  ${NFP-EPL-NY-Human Resources}
    ${Product_HR}=  evaluate  ((100+(${EPL-Human Resources}))/100)
    ${Overall-Product_Non-scheduled}=  evaluate  (${Product_HCL}*${Product_NOP}*${Product_NYB}*${Product_DA}*${Product_COA}*${Product_AC}*${Product_ET}*${Product_LH}*${Product_ST}*${Product_MS}*${Product_HR})
    ${Overall_DNO_BP}=  evaluate  ${Base-Premium}*${Overall-Product_Non-scheduled}
    RETURN  ${Overall_DNO_BP}

NewYork_Journal
   [Arguments]  &{test_data}
   wait until element is not visible   globalAjaxLoading  100
   wait until element is visible    ${UMS-JOURNAL}  100
   wait until element is enabled    ${UMS-JOURNAL}  100
   mouse over  ${UMS-JOURNAL}
   click element    ${UMS-JOURNAL}
   ${Journal_NY_DNO_Basic_Limits_Premium}=  run keyword if  '${test_data['EPL']}' == 'NO' and '${test_data['Fiduciary']}' == 'NO'  get text  //div[@title="NY Basic Limits Premium ((NFP-DNO Base Premium * NFP-DNO Non-Scheduled Modifiers) ) = ${Premium}"]
   ${Jounal_DNO_Premium}=  run keyword if  '${test_data['EPL']}' == 'NO' and '${test_data['Fiduciary']}' == 'NO'  Fetch From Right   ${Journal_NY_DNO_Basic_Limits_Premium}  =${space}
   ${Journal_NY_EPL_Basic_Limits_Premium}=  run keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['D&O']}' == 'YES'  get text  //div[@title="NY Basic Limits Premium ((NFP-DNO Base Premium * NFP-DNO Non-Scheduled Modifiers) + (NFP-EPL Base Premium * NFP-EPL Non-Scheduled Modifiers) ) = ${Premium}"]
   ${Jounal_DNO_EPL_Premium}=  run keyword if  '${test_data['EPL']}' == 'YES' and '${test_data['D&O']}' == 'YES'  Fetch From Right   ${Journal_NY_EPL_Basic_Limits_Premium}  =${space}
   ${Journal_NY_FDU_Basic_Limits_Premium}=  run keyword if  '${test_data['Fiduciary']}' == 'YES' and '${test_data['D&O']}' == 'YES'  get text  //div[@title="NY Basic Limits Premium ((NFP-DNO Base Premium * NFP-DNO Non-Scheduled Modifiers) + (NFP-FDU Base Premium * NFP-FDU Non-Scheduled Modifiers) ) = ${Premium}"]
   ${Jounal_DNO_FDU_Premium}=  run keyword if  '${test_data['Fiduciary']}' == 'YES' and '${test_data['D&O']}' == 'YES'  Fetch From Right   ${Journal_NY_FDU_Basic_Limits_Premium}  =${space}
   FOR    ${value}    IN    ${Jounal_DNO_Premium}  ${Jounal_DNO_EPL_Premium}  ${Jounal_DNO_FDU_Premium}
        Run Keyword If  '${Premium}' == '${value}'  Exit For Loop
    END
   ${for_loop variable}=  set variable  ${value}
   run keyword if  '${for_loop variable}' == '${Premium}'  log to console  ${for_loop variable} - "Calculated premium value is same as Application value"  ELSE  log to console  ${for_loop variable} - "Calculated premium value does not match with the Application value"
   wait until element is visible  ${ID-UMS-UNDERWRITING}  30
   mouse over  ${ID-UMS-UNDERWRITING}
   click element  link=Rating
   wait until element is not visible   globalAjaxLoading  100

#NFP_EPL For Hawaii
NFP_EPL_States_Hawaii
    [Arguments]  &{test_data}
    ${EPL-Text_HCL}=  get value  ${Text_VA-EPL-Hazard County Locations}
    ${EPL-Hazard County Locations}=  get value  ${NFP_VA-EPL-Hazard County Locations}
    Value Comparison  ${EPL-Hazard County Locations}  ${test_data['EPL-HAZARDCOUNTYLOCATIONS']}  ${EPL-Text_HCL}
    ${EPL-Text_NYB}=  get value  ${Text_VA-EPL-Number of Years in Business}
    ${EPL-Number of Years in Business}=  get value  ${NFP_VA-EPL-Number of Years in Business}
    Value Comparison  ${EPL-Number of Years in Business}    ${test_data['EPL-NUMBEROFYEARSINBUSINESS']}  ${EPL-Text_NYB}
    ${EPL-Text_CA}=  get value  ${Text_VA-EPL-Closing Activity}
    ${EPL-Closing Activity}=  get value  ${NFP_VA-EPL-Closing Activity}
    Value Comparison  ${EPL-Closing Activity}    ${test_data['EPL-LAYOFFACTIVITY']}  ${EPL-Text_CA}
    ${EPL-Text_ET}=  get value  ${Text_VA-EPL-Employee Turnover}
    ${EPL-Employee Turnover}=  get value  ${NFP_VA-EPL-Employee Turnover}
    Value Comparison  ${EPL-Employee Turnover}    ${test_data['EPL-EMPLOYEETURNOVER']}  ${EPL-Text_ET}
    ${EPL-Text_STRANS}=  get value  ${Text_VA-EPL-Significant Transaction}
    ${EPL-Significant Transaction}=  get value  ${NFP_VA-EPL-Significant Transaction}
    Value Comparison  ${EPL-Significant Transaction}    ${test_data['EPL-SIGNIFICANTTRANSACTIONEVENT']}  ${EPL-Text_STRANS}
    ${EPL-Text_HRS}=  get value  ${Text_VA-EPL-Human Resources}
    ${EPL-Human Resources}=  get value  ${NFP_VA-EPL-Human Resources}
    Value Comparison  ${EPL-Human Resources}    ${test_data['EPL-HUMANRESOURCES']}  ${EPL-Text_HRS}
    ${EPL-Text_NOP}=  get value  ${Text_VA-EPL-Nature of Operations}
    ${EPL-Nature of Operations}=  get value  ${NFP_VA-EPL-Nature of Operations}
    Value Comparison  ${EPL-Nature of Operations}    ${test_data['EPL-NATUREOFOPERATIONS']}  ${EPL-Text_NOP}
    ${EPL-Text_DA}=  get value  ${Text_VA-EPL-Divestiture Activity}
    ${EPL-Divestiture Activity}=  get value  ${NFP_VA-EPL-Divestiture Activity}
    Value Comparison  ${EPL-Divestiture Activity}    ${test_data['EPL-MERGERACQUISITIONDIVESTITURE']}  ${EPL-Text_DA}
    ${EPL-Text_AC}=  get value  ${Text_VA-EPL-Annual Compensation}
    ${EPL-Annual Compensation}=  get value  ${NFP_VA-EPL-Annual Compensation}
    Value Comparison  ${EPL-Annual Compensation}    ${test_data['EPL-ANNUALCOMPENSTION']}  ${EPL-Text_AC}
    ${EPL-Text_LH}=  get value  ${Text_VA-EPL-Litigation History}
    ${EPL-Litigation History}=   get value  ${NFP_VA-EPL-Litigation History}
    Value Comparison  ${EPL-Litigation History}    ${test_data['EPL-LITIGATIONHISTORY']}  ${EPL-Text_LH}
    ${EPL-Text_MS}=  get value  ${Text_VA-EPL-Management Stability}
    ${EPL-Management Stability}=  get value  ${NFP_VA-EPL-Management Stability}
    Value Comparison  ${EPL-Management Stability}    ${test_data['EPL-MANAGEMENTSTABILITY']}  ${EPL-Text_MS}
    ${EPL-Text_DSF}=  get value  ${Text_VA-EPL-Defend Selection Factor}
    ${EPL-Defend Selection Factor}=  get value  ${NFP_VA-EPL-Defend Selection Factor}
    Value Comparison  ${EPL-Defend Selection Factor}    ${test_data['EPL-DUTYTODEFEND']}  ${EPL-Text_DSF}
    ${EPL-Text_TPEF}=  get value  ${Text_VA-EPL-Third Party Exposure Factor}
    ${EPL-Third Party Exposure Factor}=  get value  ${NFP_VA-EPL-Third Party Exposure Factor}
    Value Comparison  ${EPL-Third Party Exposure Factor}    ${test_data['EPL-THIRDPARTYEXPOSUREFACTOR']}  ${EPL-Text_TPEF}
    ${EPL-Text_CDF}=  get value  ${Text_VA-EPL-Coverage Deleted Factor}
    ${EPL-Coverage Deleted Factor}=  get value  ${NFP_VA-EPL-Coverage Deleted Factor}
    Value Comparison  ${EPL-Coverage Deleted Factor}    ${test_data['EPL-THIRDPARTYDELETEDFACTOR']}  ${EPL-Text_CDF}
    ${EPL-Text_EF}=  get value  ${Text_VA-EPL-Endorsement Factor}
    ${EPL-Endorsement Factor}=  get value  ${NFP_VA-EPL-Endorsement Factor}
    Value Comparison  ${EPL-Endorsement Factor}    ${test_data['EPL-ENDORSEMENTFACTOR']}  ${EPL-Text_EF}

#Crime and KNR

Modifiers_Crime_KNR
        [Arguments]  &{test_data}
        Release Holds
        click element  ${Coverages_Bubble}
        run keyword if    '${test_data['State']}' != 'Florida'  select checkbox  ${Name_NFP-CRIME}
        run keyword if    '${test_data['State']}' != 'Florida'  select checkbox  ${Name_NFP-KNR}  ELSE  select checkbox  ${Name_NFP-CRIME}
        wait until element is not visible   globalAjaxLoading  100
        click element    ${ID-COV-Apply&Continue}
        ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
        run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}
        wait until element is not visible   globalAjaxLoading  100
        NFP_DNO_Rating_Base  &{test_data}
        run keyword if    '${test_data['D&O']}' == 'YES'  NFP-DNO  &{test_data}
        run keyword if    '${test_data['State']}' != 'Florida'  NFP-Crime  &{test_data}
        NFP-KNR  &{test_data}
        wait until element is not visible   globalAjaxLoading  100
        click element    ${ID-COV-Apply&Continue}
        wait until element is not visible   globalAjaxLoading  100
        NFP_DNO_Limit
        NFP_DNO Quote Options
        Endorsement Options
        Quote Letter Generation
        Bind
        click element  ${Bundle_Checkbox}
        Endorsement Options
        ChosenQuoteOptions
        Policy Info
        Payments
        Binder Letter Generation
        Issue Reissue
        Policy Reissue
        PolicyPackage
        Fetch Policy Number In UMS  ${test_data}

NFP-Crime
    [Arguments]  &{test_data}
    Log to console  "NFP-Crime"
    ${Crime_Text_NOP}=  get value  ${Text-CRIME-Nature-of-Operations}
    ${Crime_NOP}=  get value  ${NFP-CRIME-Nature-of-Operations}
    Value Comparison  ${Crime_NOP}    ${test_data['CRIME-NATUREOFOPERATIONS']}  ${Crime_Text_NOP}
    ${Crime_Text_POW}=  get value  ${Text-CRIME-Profile Of Workplace}
    ${Crime_POW}=  get value  ${NFP-CRIME-Profile Of Workplace}
    Value Comparison  ${Crime_POW}    ${test_data['CRIME-PROFILEOFWORKPLACE']}  ${Crime_Text_POW}
    ${Crime_Text_ORGCOMP}=  get value  ${Text-CRIME-Organizational Complex}
    ${Crime_ORGCOMP}=  get value  ${NFP-CRIME-Organizational Complex}
    Value Comparison  ${Crime_ORGCOMP}    ${test_data['CRIME-ORGANIZATIONALCOMPLEXITY']}  ${Crime_Text_ORGCOMP}
    ${Crime_Text_FLE}=  get value  ${Text-CRIME-Foreign Locn Exposure}
    ${Crime_FLE}=  get value  ${NFP-CRIME-Foreign Locn Exposure}
    Value Comparison  ${Crime_FLE}    ${test_data['CRIME-FOREIGNLOCATIONEXPOSURE']}  ${Crime_Text_FLE}
    ${Crime_Text_HVPM}=  get value  ${Text-CRIME-High Value Proc Material}
    ${Crime_HVPM}=  get value  ${NFP-CRIME-High Value Proc Material}
    Value Comparison  ${Crime_HVPM}    ${test_data['CRIME-HIGHVALUEPROCESSINGMATERIALS']}  ${Crime_Text_HVPM}
    ${Crime_Text_AF}=  get value  ${Text-CRIME-Audit Functions}
    ${Crime_AF}=  get value  ${NFP-CRIME-Audit Functions}
    Value Comparison  ${Crime_AF}    ${test_data['CRIME-AUDITFUNCTIONS']}  ${Crime_Text_AF}
    ${Crime_Text_IC}=  get value  ${Text-CRIME-Internal Controls}
    ${Crime_IC}=  get value  ${NFP-CRIME-Internal Controls}
    Value Comparison  ${Crime_IC}    ${test_data['CRIME-INTERNALCONTROLS']}  ${Crime_Text_IC}
    ${Crime_Text_PES}=  get value  ${Text-CRIME-Pre Emp Screening}
    ${Crime_PES}=  get value  ${NFP-CRIME-Pre Emp Screening}
    Value Comparison  ${Crime_PES}    ${test_data['CRIME-PRE-EMPLOYMENTSCREENING']}  ${Crime_Text_PES}
    ${Crime_Text_IM}=  get value  ${Text-CRIME-Inventory Management}
    ${Crime_IM}=  get value  ${NFP-CRIME-Inventory Management}
    Value Comparison  ${Crime_IM}    ${test_data['CRIME-INVENTORYMANAGEMENT']}  ${Crime_Text_IM}
    ${Crime_Text_VMG}=  get value  ${Text-CRIME-Vendor Manage Guidelines}
    ${Crime_VMG}=  get value  ${NFP-CRIME-Vendor Manage Guidelines}
    Value Comparison  ${Crime_VMG}    ${test_data['CRIME-VENDORMANAGEMENTGUIDELINES']}  ${Crime_Text_VMG}
    ${Crime_Text_NYB}=  get value  ${Text-CRIME-Number of Years in Business}
    ${Crime_NYB}=  get value  ${NFP-CRIME-Number of Years in Business}
    Value Comparison  ${Crime_NYB}    ${test_data['CRIME-NUMBEROFYEARSINBUSINESS']}  ${Crime_Text_NYB}
    ${Crime_Text_MDA}=  get value  ${Text-CRIME-Merger Divestiture Activity}
    ${Crime_MDA}=  get value  ${NFP-CRIME-Merger Divestiture Activity}
    Value Comparison  ${Crime_MDA}    ${test_data['CRIME-MERGERACQUISITIONDIVESTITURE']}  ${Crime_Text_MDA}
    ${Crime_Text_EFACT}=  run keyword if  '${test_data['CRIME-ENDORSEMENTFACTOR']}' != 'nan'  get value  ${Text-CRIME-Endorsement Factor}
    ${Crime_EFACT}=  run keyword if  '${test_data['CRIME-ENDORSEMENTFACTOR']}' != 'nan'  get value  ${NFP-CRIME-Endorsement Factor}
    run keyword if  '${test_data['CRIME-ENDORSEMENTFACTOR']}' != 'nan'  Value Comparison  ${Crime_EFACT}    ${test_data['CRIME-ENDORSEMENTFACTOR']}  ${Crime_Text_EFACT}
     ${Crime_Text_SCG}=  run keyword if  '${test_data['CRIME-STRENGTHOFCORPORATEGOVERNANCE']}' != 'nan'  get value  ${Text-CRIME-Strength of Corporate Governance}
    ${Crime_SCG}=  run keyword if  '${test_data['CRIME-STRENGTHOFCORPORATEGOVERNANCE']}' != 'nan'  get value  ${NFP-CRIME-Strength of Corporate Governance}
    run keyword if  '${test_data['CRIME-STRENGTHOFCORPORATEGOVERNANCE']}' != 'nan'  Value Comparison  ${Crime_SCG}    ${test_data['CRIME-STRENGTHOFCORPORATEGOVERNANCE']}  ${Crime_Text_SCG}
    run keyword if  '${test_data['State']}' == 'Virginia'  Scheduled_Crime_Virginia  &{test_data}  ELSE  Scheduled_Crime  &{test_data}

Scheduled_Crime_Virginia
    [Arguments]  &{test_data}
    ${Crime_Text_OFL}=  run keyword if  '${test_data['CRIME-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  get value  ${Text-CRIME_VA-Overall Financial Liquidity}
    ${Crime_OFL}=  run keyword if  '${test_data['CRIME-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  get value  ${NFP-CRIME_VA-Overall Financial Liquidity}
    run keyword if  '${test_data['CRIME-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  Value Comparison  ${Crime_OFL}    ${test_data['CRIME-OVERALLFINANCIALLIQUIDITY']}  ${Crime_Text_OFL}
    ${Crime_Text_ABR}=  run keyword if  '${test_data['CRIME-AFFECTEDBYRECESSION']}' != 'nan'  get value  ${Text-CRIME_VA-Affected by Recession}
    ${Crime_ABR}=  run keyword if  '${test_data['CRIME-AFFECTEDBYRECESSION']}' != 'nan'  get value  ${NFP-CRIME_VA-Affected by Recession}
    run keyword if  '${test_data['CRIME-AFFECTEDBYRECESSION']}' != 'nan'  Value Comparison  ${Crime_ABR}    ${test_data['CRIME-AFFECTEDBYRECESSION']}  ${Crime_Text_ABR}
    ${Crime_Text_QOM}=  run keyword if  '${test_data['CRIME-QUALITYOFMANAGEMENT']}' != 'nan'  get value  ${Text-CRIME_VA-Quality of Management}
    ${Crime_QOM}=  run keyword if  '${test_data['CRIME-QUALITYOFMANAGEMENT']}' != 'nan'  get value  ${NFP-CRIME_VA-Quality of Management}
    run keyword if  '${test_data['CRIME-QUALITYOFMANAGEMENT']}' != 'nan'  Value Comparison  ${Crime_QOM}    ${test_data['CRIME-QUALITYOFMANAGEMENT']}  ${Crime_Text_QOM}

Scheduled_Crime
    [Arguments]  &{test_data}
    ${Crime_Text_LEXP}=  run keyword if  '${test_data['CRIME-LOSSEXPERIENCE']}' != 'nan'  get value  ${Text-CRIME-Loss Experience}
    ${Crime_LEXP}=  run keyword if  '${test_data['CRIME-LOSSEXPERIENCE']}' != 'nan'  get value  ${NFP-CRIME-Loss Experience}
    run keyword if  '${test_data['CRIME-LOSSEXPERIENCE']}' != 'nan'  Value Comparison  ${Crime_LEXP}    ${test_data['CRIME-LOSSEXPERIENCE']}  ${Crime_Text_LEXP}
    ${Crime_Text_OFL}=  run keyword if  '${test_data['CRIME-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  get value  ${Text-CRIME-Overall Financial Liquidity}
    ${Crime_OFL}=  run keyword if  '${test_data['CRIME-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  get value  ${NFP-CRIME-Overall Financial Liquidity}
    run keyword if  '${test_data['CRIME-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  Value Comparison  ${Crime_OFL}    ${test_data['CRIME-OVERALLFINANCIALLIQUIDITY']}  ${Crime_Text_OFL}
    ${Crime_Text_ABR}=  run keyword if  '${test_data['CRIME-AFFECTEDBYRECESSION']}' != 'nan'  get value  ${Text-CRIME-Affected by Recession}
    ${Crime_ABR}=  run keyword if  '${test_data['CRIME-AFFECTEDBYRECESSION']}' != 'nan'  get value  ${NFP-CRIME-Affected by Recession}
    run keyword if  '${test_data['CRIME-AFFECTEDBYRECESSION']}' != 'nan'  Value Comparison  ${Crime_ABR}    ${test_data['CRIME-AFFECTEDBYRECESSION']}  ${Crime_Text_ABR}
    ${Crime_Text_QOM}=  run keyword if  '${test_data['CRIME-QUALITYOFMANAGEMENT']}' != 'nan'  get value  ${Text-CRIME-Quality of Management}
    ${Crime_QOM}=  run keyword if  '${test_data['CRIME-QUALITYOFMANAGEMENT']}' != 'nan'  get value  ${NFP-CRIME-Quality of Management}
    run keyword if  '${test_data['CRIME-QUALITYOFMANAGEMENT']}' != 'nan'  Value Comparison  ${Crime_QOM}    ${test_data['CRIME-QUALITYOFMANAGEMENT']}  ${Crime_Text_QOM}

NFP-KNR
    [Arguments]  &{test_data}
    Log to console  "NFP-KNR"
    ${KNR_Text_ROC}=  get value  ${Text-KNR-Riskiness of Countries}
    ${KNR_ROC}=  get value  ${NFP-KNR-Riskiness of Countries}
    Value Comparison  ${KNR_ROC}    ${test_data['KNR-RISKINESSCOUNTRIESTRAVELED']}  ${KNR_Text_ROC}
    ${KNR_Text_FOT}=  get value  ${Text-KNR-Frequency of Travel}
    ${KNR_FOT}=  get value  ${NFP-KNR-Frequency of Travel}
    Value Comparison  ${KNR_FOT}    ${test_data['KNR-FREQUENCYTRAVEL']}  ${KNR_Text_FOT}
    ${KNR_Text_SM}=  get value  ${Text-KNR-Security Measures}
    ${KNR_SM}=  get value  ${NFP-KNR-Security Measures}
    Value Comparison  ${KNR_SM}    ${test_data['KNR-SECURITYMEASURESINFOREIGN']}  ${KNR_Text_SM}
    ${KNR_Text_IG}=  get value  ${Text-KNR-Industry Group}
    ${KNR_IG}=  get value  ${NFP-KNR-Industry Group}
    Value Comparison  ${KNR_IG}    ${test_data['KNR-INDUSTRYGROUP']}  ${KNR_Text_IG}
    ${KNR_Text_TAP}=  get value  ${Text-KNR-Travel Advisory Policy}
    ${KNR_TAP}=  get value  ${NFP-KNR-Travel Advisory Policy}
    Value Comparison  ${KNR_TAP}    ${test_data['KNR-TRAVELADVISORYPOLICY']}  ${KNR_Text_TAP}
    ${KNR_Text_PEXP}=  get value  ${Text-KNR-Product Exposure}
    ${KNR_PEXP}=  get value  ${NFP-KNR-Product Exposure}
    Value Comparison  ${KNR_PEXP}    ${test_data['KNR-PRODUCTEXPOSURE']}  ${KNR_Text_PEXP}
    ${KNR_Text_EFACT}=  run keyword if  '${test_data['KNR-ENDORSEMENTFACTOR']}' != 'nan'  get value  ${Text-KNR-Endorsement Factor}
    ${KNR_EFACT}=  run keyword if  '${test_data['KNR-ENDORSEMENTFACTOR']}' != 'nan'  get value  ${NFP-KNR-Endorsement Factor}
    run keyword if  '${test_data['KNR-ENDORSEMENTFACTOR']}' != 'nan'  Value Comparison  ${KNR_EFACT}    ${test_data['KNR-ENDORSEMENTFACTOR']}  ${KNR_Text_EFACT}
    ${KNR_Text_SCG}=  run keyword if  '${test_data['KNR-STRENGTHOFCORPORATEGOVERNANCE']}' != 'nan'  get value  ${Text-KNR-Strength of Corporate Governance}
    ${KNR_SCG}=  run keyword if  '${test_data['KNR-STRENGTHOFCORPORATEGOVERNANCE']}' != 'nan'  get value  ${NFP-KNR-Strength of Corporate Governance}
    run keyword if  '${test_data['KNR-STRENGTHOFCORPORATEGOVERNANCE']}' != 'nan'  Value Comparison  ${KNR_SCG}    ${test_data['KNR-STRENGTHOFCORPORATEGOVERNANCE']}  ${KNR_Text_SCG}
    run keyword if  '${test_data['State']}' == 'Virginia'  Scheduled_KNR_Virginia  &{test_data}  ELSE  Scheduled_KNR  &{test_data}

Scheduled_KNR_Virginia
    [Arguments]  &{test_data}
    ${KNR_Text_OFL}=  run keyword if  '${test_data['KNR-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  get value  ${Text-KNR_VA-Overall Financial Liquidity}
    ${KNR_OFL}=  run keyword if  '${test_data['KNR-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  get value  ${NFP-KNR_VA-Overall Financial Liquidity}
    run keyword if  '${test_data['KNR-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  Value Comparison  ${KNR_OFL}    ${test_data['KNR-OVERALLFINANCIALLIQUIDITY']}  ${KNR_Text_OFL}
    ${KNR_Text_ABR}=  run keyword if  '${test_data['KNR-AFFECTEDBYRECESSION']}' != 'nan'  get value  ${Text-KNR_VA-Affected by Recession}
    ${KNR_ABR}=  run keyword if  '${test_data['KNR-AFFECTEDBYRECESSION']}' != 'nan'  get value  ${NFP-KNR_VA-Affected by Recession}
    run keyword if  '${test_data['KNR-AFFECTEDBYRECESSION']}' != 'nan'  Value Comparison  ${KNR_ABR}    ${test_data['KNR-AFFECTEDBYRECESSION']}  ${KNR_Text_ABR}
    ${KNR_Text_QOM}=  run keyword if  '${test_data['KNR-QUALITYOFMANAGEMENT']}' != 'nan'  get value  ${Text-KNR_VA-Quality of Management}
    ${KNR_QOM}=  run keyword if  '${test_data['KNR-QUALITYOFMANAGEMENT']}' != 'nan'  get value  ${NFP-KNR_VA-Quality of Management}
    run keyword if  '${test_data['KNR-QUALITYOFMANAGEMENT']}' != 'nan'  Value Comparison  ${KNR_QOM}    ${test_data['KNR-QUALITYOFMANAGEMENT']}  ${KNR_Text_QOM}

Scheduled_KNR
    [Arguments]  &{test_data}
    ${KNR_Text_LEXP}=  run keyword if  '${test_data['KNR-LOSSEXPERIENCE']}' != 'nan'  get value  ${Text-KNR-Loss Experience}
    ${KNR_LEXP}=  run keyword if  '${test_data['KNR-LOSSEXPERIENCE']}' != 'nan'  get value  ${NFP-KNR-Loss Experience}
    run keyword if  '${test_data['KNR-LOSSEXPERIENCE']}' != 'nan'  Value Comparison  ${KNR_LEXP}    ${test_data['KNR-LOSSEXPERIENCE']}  ${KNR_Text_LEXP}
    ${KNR_Text_OFL}=  run keyword if  '${test_data['KNR-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  get value  ${Text-KNR-Overall Financial Liquidity}
    ${KNR_OFL}=  run keyword if  '${test_data['KNR-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  get value  ${NFP-KNR-Overall Financial Liquidity}
    run keyword if  '${test_data['KNR-OVERALLFINANCIALLIQUIDITY']}' != 'nan'  Value Comparison  ${KNR_OFL}    ${test_data['KNR-OVERALLFINANCIALLIQUIDITY']}  ${KNR_Text_OFL}
    ${KNR_Text_ABR}=  run keyword if  '${test_data['KNR-AFFECTEDBYRECESSION']}' != 'nan'  get value  ${Text-KNR-Affected by Recession}
    ${KNR_ABR}=  run keyword if  '${test_data['KNR-AFFECTEDBYRECESSION']}' != 'nan'  get value  ${NFP-KNR-Affected by Recession}
    run keyword if  '${test_data['KNR-AFFECTEDBYRECESSION']}' != 'nan'  Value Comparison  ${KNR_ABR}    ${test_data['KNR-AFFECTEDBYRECESSION']}  ${KNR_Text_ABR}
    ${KNR_Text_QOM}=  run keyword if  '${test_data['KNR-QUALITYOFMANAGEMENT']}' != 'nan'  get value  ${Text-KNR-Quality of Management}
    ${KNR_QOM}=  run keyword if  '${test_data['KNR-QUALITYOFMANAGEMENT']}' != 'nan'  get value  ${NFP-KNR-Quality of Management}
    run keyword if  '${test_data['KNR-QUALITYOFMANAGEMENT']}' != 'nan'  Value Comparison  ${KNR_QOM}    ${test_data['KNR-QUALITYOFMANAGEMENT']}  ${KNR_Text_QOM}