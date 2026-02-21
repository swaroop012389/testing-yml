*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot
Resource  ../../Resource/Alternus_Res/Journal.robot
Library  Collections
Library  String

*** Variables ***
${ID-UW-Rating} =  //a[contains(Text_Priv(),'Rating')]
${UMS-Modifiers}=  //a[contains(@href, '/Nexus/RatingModifiers/ViewModifiers/')]
${UMS-Quoteletter-bubble}=  //a[contains(@href, '/Nexus/RatingQuoteLetter/ViewSendQuoteLetter/')]
###Directors and Officers Liability Coverage (Private-DNO)
${Text_Priv-DNO-Nature-of-Operations}=  //input[@id="Rows_0__Table_Corteges_0__2__Value"]
${Private-DNO-Nature-of-Operations}=  //input[@id='Rows_0__Table_Corteges_0__3__Value']
${Text_Priv-DNO-Number of Years in Business}=  //input[@id="Rows_0__Table_Corteges_1__2__Value"]
${Private-DNO-Number of Years in Business}=  //input[@id='Rows_0__Table_Corteges_1__3__Value']
${Text_Priv-DNO-Number of Subsidiaries}=  //input[@id="Rows_0__Table_Corteges_2__2__Value"]
${Private-DNO-Number of Subsidiaries}=  //input[@id='Rows_0__Table_Corteges_2__3__Value']
${Text_Priv-DNO-Merger Divestiture Activity}=  //input[@id="Rows_0__Table_Corteges_3__2__Value"]
${Private-DNO-Merger Divestiture Activity}=  //input[@id='Rows_0__Table_Corteges_3__3__Value']
${Text_Priv-DNO-Securities Offering Activity}=  //input[@id="Rows_0__Table_Corteges_4__2__Value"]
${Private-DNO-Securities Offering Activity}=  //input[@id='Rows_0__Table_Corteges_4__3__Value']
${Text_Priv-DNO-Management Ownership}=  //input[@id="Rows_0__Table_Corteges_5__2__Value"]
${Private-DNO-Management Ownership}=  //input[@id='Rows_0__Table_Corteges_5__3__Value']
${Text_Priv-DNO-Litigation History}=  //input[@id="Rows_0__Table_Corteges_6__2__Value"]
${Private-DNO-Litigation History}=  //input[@id='Rows_0__Table_Corteges_6__3__Value']
${Text_Priv-DNO-Significant Transaction}=  //input[@id="Rows_0__Table_Corteges_7__2__Value"]
${Private-DNO-Significant Transaction}=  //input[@id='Rows_0__Table_Corteges_7__3__Value']
${Text_Priv-DNO-Management Stability}=  //input[@id="Rows_0__Table_Corteges_8__2__Value"]
${Private-DNO-Management Stability}=  //input[@id='Rows_0__Table_Corteges_8__3__Value']
${Text_Priv-DNO-Quality of Balance Sheet}=  //input[@id="Rows_0__Table_Corteges_9__2__Value"]
${Private-DNO-Quality of Balance Sheet}=  //input[@id='Rows_0__Table_Corteges_9__3__Value']
${Text_Priv-DNO-Quality of Income Statement}=  //input[@id="Rows_0__Table_Corteges_10__2__Value"]
${Private-DNO-Quality of Income Statement}=  //input[@id='Rows_0__Table_Corteges_10__3__Value']
${Text_Priv-DNO-Statement of Cash Flows}=  //input[@id="Rows_0__Table_Corteges_11__2__Value"]
${Private-DNO-Statement of Cash Flows}=  //input[@id='Rows_0__Table_Corteges_11__3__Value']
###Optional Coverage Enhancements
${Text_Priv-DNO-Defend Selection Factor}=  //input[@id="Rows_0__Table_Corteges_12__2__Value"]
${Private-DNO-Defend Selection Factor}=  //input[@id='Rows_0__Table_Corteges_12__3__Value']
${Text_Priv-DNO-Endorsement Factor}=  //input[@id="Rows_0__Table_Corteges_13__2__Value"]
${Private-DNO-Endorsement Factor}=  //input[@id='Rows_0__Table_Corteges_13__3__Value']
###Scheduled
#${Text_Priv-DNO-Quality of Management}=  //input[@id="Rows_0__Table_Corteges_19__2__Value"]
#${Private-DNO-Quality of Management}=  //input[@id='Rows_0__Table_Corteges_19__3__Value']
${Text_Priv-DNO-Quality of Management}=  //input[@id="Rows_0__Table_Corteges_18__2__Value"]
${Private-DNO-Quality of Management}=  //input[@id='Rows_0__Table_Corteges_18__3__Value']
#${Text_Priv-DNO-Affected by Recession}=  //input[@id="Rows_0__Table_Corteges_18__2__Value"]
#${Private-DNO-Affected by Recession}=  //input[@id='Rows_0__Table_Corteges_18__3__Value']
${Text_Priv-DNO-Affected by Recession}=  //input[@id="Rows_0__Table_Corteges_17__2__Value"]
${Private-DNO-Affected by Recession}=  //input[@id='Rows_0__Table_Corteges_17__3__Value']
#${Text_Priv-DNO-Overall Financial Liquidity}=  //input[@id="Rows_0__Table_Corteges_17__2__Value"]
#${Private-DNO-Overall Financial Liquidity}=  //input[@id='Rows_0__Table_Corteges_17__3__Value']
${Text_Priv-DNO-Overall Financial Liquidity}=  //input[@id="Rows_0__Table_Corteges_16__2__Value"]
${Private-DNO-Overall Financial Liquidity}=  //input[@id='Rows_0__Table_Corteges_16__3__Value']
#${Text_Priv-DNO-Loss Experience}=  //input[@id="Rows_0__Table_Corteges_16__2__Value"]
#${Private-DNO-Loss Experience}=  //input[@id='Rows_0__Table_Corteges_16__3__Value']
${Text_Priv-DNO-Loss Experience}=  //input[@id="Rows_0__Table_Corteges_15__2__Value"]
${Private-DNO-Loss Experience}=  //input[@id='Rows_0__Table_Corteges_15__3__Value']
#${Text_Priv-DNO-Strength of Corporate Governance}=  //input[@id="Rows_0__Table_Corteges_15__2__Value"]
#${Private-DNO-Strength of Corporate Governance}=  //input[@id='Rows_0__Table_Corteges_15__3__Value']
${Text_Priv-DNO-Strength of Corporate Governance}=  //input[@id="Rows_0__Table_Corteges_14__2__Value"]
${Private-DNO-Strength of Corporate Governance}=  //input[@id='Rows_0__Table_Corteges_14__3__Value']
###Employment Practices Liability Coverage (Private-EPL)
#Non-scheduled
${Text_Priv-EPL-Hazard County Locations}=  //input[@id='Rows_1__Table_Corteges_0__2__Value']
${Private-EPL-Hazard County Locations}=  //input[@id='Rows_1__Table_Corteges_0__3__Value']
${Text_Priv-EPL-Number of Years in Business}=   //input[@id='Rows_1__Table_Corteges_2__2__Value']
${Private-EPL-Number of Years in Business}=  //input[@id='Rows_1__Table_Corteges_2__3__Value']
${Text_Priv-EPL-Closing Activity}=   //input[@id='Rows_1__Table_Corteges_4__2__Value']
${Private-EPL-Closing Activity}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text_Priv-EPL-Employee Turnover}=   //input[@id='Rows_1__Table_Corteges_6__2__Value']
${Private-EPL-Employee Turnover}=  //input[@id='Rows_1__Table_Corteges_6__3__Value']
${Text_Priv-EPL-Significant Transaction}=    //input[@id='Rows_1__Table_Corteges_8__2__Value']
${Private-EPL-Significant Transaction}=  //input[@id='Rows_1__Table_Corteges_8__3__Value']
${Text_Priv-EPL-Human Resources}=     //input[@id='Rows_1__Table_Corteges_10__2__Value']
${Private-EPL-Human Resources}=  //input[@id='Rows_1__Table_Corteges_10__3__Value']
#${Text_Priv-EPL-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_0__8__Value']
#${Private-EPL-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_0__9__Value']
${Text_Priv-EPL-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${Private-EPL-Nature of Operations}=  //input[@id='Rows_1__Table_Corteges_1__3__Value']
${Text_Priv-EPL-Divestiture Activity}=    //input[@id='Rows_1__Table_Corteges_3__2__Value']
${Private-EPL-Divestiture Activity}=  //input[@id='Rows_1__Table_Corteges_3__3__Value']
${Text_Priv-EPL-Annual Compensation}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${Private-EPL-Annual Compensation}=  //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text_Priv-EPL-Litigation History}=   //input[@id='Rows_1__Table_Corteges_7__2__Value']
${Private-EPL-Litigation History}=  //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text_Priv-EPL-Management Stability}=    //input[@id='Rows_1__Table_Corteges_9__2__Value']
${Private-EPL-Management Stability}=  //input[@id='Rows_1__Table_Corteges_9__3__Value']
#Optional Coverage Enhancements
${Text_Priv-EPL-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${Private-EPL-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
${Text_Priv-EPL-Third Party Exposure Factor}=   //input[@id='Rows_1__Table_Corteges_13__2__Value']
${Private-EPL-Third Party Exposure Factor}=  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text_Priv-EPL-Coverage Deleted Factor}=   //input[@id='Rows_1__Table_Corteges_12__2__Value']
${Private-EPL-Coverage Deleted Factor}=   //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text_Priv-EPL-Endorsement Factor}=     //input[@id='Rows_1__Table_Corteges_14__2__Value']
${Private-EPL-Endorsement Factor}=    //input[@id='Rows_1__Table_Corteges_14__3__Value']
#Scheduled
${Text_Priv-EPL-Loss Experience}=  //input[@id='Rows_1__Table_Corteges_9__2__Value']
${Private-EPL-Loss Experience}=   //input[@id='Rows_1__Table_Corteges_9__3__Value']
${Text_Priv-EPL-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_10__2__Value']
${Private-EPL-Affected by Recession}=   //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text_Priv-EPL-Corporate Governance}=      //input[@id='Rows_1__Table_Corteges_8__8__Value']
${Private-EPL-Corporate Governance}=   //input[@id='Rows_1__Table_Corteges_8__9__Value']
${Text_Priv-EPL-Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_9__8__Value']
${Private-EPL-Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_9__9__Value']
${Text_Priv-EPL-Quality of Management}=    //input[@id='Rows_1__Table_Corteges_10__8__Value']
${Private-EPL-Quality of Management}=  //input[@id='Rows_1__Table_Corteges_10__9__Value']
###Fiduciary Liability Coverage (Private-FDU)
###FDU-For-index(1)
#Non-scheduled
${Text_Priv-FDU-Nature-of-Operations}=   //input[@id='Rows_1__Table_Corteges_0__2__Value']
${Private-FDU-Nature-of-Operations}=   //input[@id='Rows_1__Table_Corteges_0__3__Value']
${Text_Priv-FDU-Number of Years in Business}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${Private-FDU-Number of Years in Business}=   //input[@id='Rows_1__Table_Corteges_1__3__Value']
${Text_Priv-FDU-Plan Termination}=  //input[@id='Rows_1__Table_Corteges_2__2__Value']
${Private-FDU-Plan Termination}=   //input[@id='Rows_1__Table_Corteges_2__3__Value']
${Text_Priv-FDU-Plan Type}=  //input[@id='Rows_1__Table_Corteges_3__2__Value']
${Private-FDU-Plan Type}=   //input[@id='Rows_1__Table_Corteges_3__3__Value']
${Text_Priv-FDU-Employee SOP}=  //input[@id='Rows_1__Table_Corteges_4__2__Value']
${Private-FDU-Employee SOP}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text_Priv-FDU-Defined Benefit Plans}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${Private-FDU-Defined Benefit Plans}=  //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text_Priv-FDU-Plan Participants}=  //input[@id='Rows_1__Table_Corteges_6__2__Value']
${Private-FDU-Plan Participants}=    //input[@id='Rows_1__Table_Corteges_6__3__Value']
${Text_Priv-FDU-Litigation History}=  //input[@id='Rows_1__Table_Corteges_7__2__Value']
${Private-FDU-Litigation History}=      //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text_Priv-FDU-Significant Transaction}=  //input[@id='Rows_1__Table_Corteges_8__2__Value']
${Private-FDU-Significant Transaction}=   //input[@id='Rows_1__Table_Corteges_8__3__Value']
${Text_Priv-FDU-Diversity of Plan Investments}=  //input[@id='Rows_1__Table_Corteges_9__2__Value']
${Private-FDU-Diversity of Plan Investments}=  //input[@id='Rows_1__Table_Corteges_9__3__Value']
#Optional Coverage Enhancements
${Text_Priv-FDU-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_10__2__Value']
${Private-FDU-Defend Selection Factor}=  //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text_Priv-FDU-Endorsement Factor}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${Private-FDU-Endorsement Factor}=   //input[@id='Rows_1__Table_Corteges_11__3__Value']
#Scheduled
${Text_Priv-FDU-Corporate Governance}=  //input[@id='Rows_1__Table_Corteges_13__2__Value']
${Private-FDU-Corporate Governance}=   //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text_Priv-FDU-Loss Experience}=  //input[@id='Rows_1__Table_Corteges_14__2__Value']
${Private-FDU-Loss Experience}=  //input[@id='Rows_1__Table_Corteges_14__3__Value']
${Text_Priv-FDU-Overall Financial Liquidity}=  //input[@id='Rows_1__Table_Corteges_15__2__Value']
${Private-FDU-Overall Financial Liquidity}=    //input[@id='Rows_1__Table_Corteges_15__3__Value']
${Text_Priv-FDU-Affected by Recession}=  //input[@id='Rows_1__Table_Corteges_16__2__Value']
${Private-FDU-Affected by Recession}=  //input[@id='Rows_1__Table_Corteges_16__3__Value']
${Text_Priv-FDU-Quality of Management}=  //input[@id='Rows_1__Table_Corteges_17__2__Value']
${Private-FDU-Quality of Management}=  //input[@id='Rows_1__Table_Corteges_17__3__Value']
#Employed Lawyers Liability Coverage (Private-ELL)
#For index(1)
#Non-scheduled
${Text_Priv-ELL-Area of Practice}   //input[@id='Rows_2__Table_Corteges_0__2__Value']
${Private-ELL-Area of Practice}   //input[@id='Rows_2__Table_Corteges_0__3__Value']
${Text_Priv-ELL-Litigation History}  //input[@id='Rows_2__Table_Corteges_1__2__Value']
${Private-ELL-Litigation History}   //input[@id='Rows_2__Table_Corteges_1__3__Value']
${Text_Priv-ELL-Public Debt Exposure}  //input[@id='Rows_2__Table_Corteges_2__2__Value']
${Private-ELL-Public Debt Exposure}   //input[@id='Rows_2__Table_Corteges_2__3__Value']
${Text_Priv-ELL-Divestiture Activity}  //input[@id='Rows_2__Table_Corteges_3__2__Value']
${Private-ELL-Divestiture Activity}   //input[@id='Rows_2__Table_Corteges_3__3__Value']
${Text_Priv-ELL-External Legal Resources}  //input[@id='Rows_2__Table_Corteges_4__2__Value']
${Private-ELL-External Legal Resources}  //input[@id='Rows_2__Table_Corteges_4__3__Value']
${Text_Priv-ELL-Employed Lawyers}  //input[@id='Rows_2__Table_Corteges_5__2__Value']
${Private-ELL-Employed Lawyers}    //input[@id='Rows_2__Table_Corteges_5__3__Value']
${Text_Priv-ELL-Legal Services Performed}  //input[@id='Rows_2__Table_Corteges_6__2__Value']
${Private-ELL-Legal Services Performed}      //input[@id='Rows_2__Table_Corteges_6__3__Value']
#Optional Coverage Enhancements
${Text_Priv-ELL-Defend Selection Factor}  //input[@id='Rows_2__Table_Corteges_7__2__Value']
${Private-ELL-Defend Selection Factor}   //input[@id='Rows_2__Table_Corteges_7__3__Value']
${Text_Priv-ELL-Endorsement Factor}  //input[@id='Rows_2__Table_Corteges_8__2__Value']
${Private-ELL-Endorsement Factor}  //input[@id='Rows_2__Table_Corteges_8__3__Value']
${Text_Priv-ELL-Coverage Factor}  //input[@id='Rows_2__Table_Corteges_9__2__Value']
${Private-ELL-Coverage Factor}  //input[@id='Rows_2__Table_Corteges_9__3__Value']
#Scheduled
${Text_Priv-ELL-Corporate Governance}  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${Private-ELL-Corporate Governance}   //input[@id='Rows_1__Table_Corteges_11__3__Value']
${Text_Priv-ELL-Loss Experience}  //input[@id='Rows_1__Table_Corteges_12__2__Value']
${Private-ELL-Loss Experience}   //input[@id='Rows_1__Table_Corteges_12__3__Value']
${Text_Priv-ELL-Overall Financial Liquidity}  //input[@id='Rows_1__Table_Corteges_13__2__Value']
${Private-ELL-Overall Financial Liquidity}  //input[@id='Rows_1__Table_Corteges_13__3__Value']
${Text_Priv-ELL-Affected by Recession}  //input[@id='Rows_1__Table_Corteges_14__2__Value']
${Private-ELL-Affected by Recession}    //input[@id='Rows_1__Table_Corteges_14__3__Value']
${Text_Priv-ELL-Quality of Management}  //input[@id='Rows_1__Table_Corteges_15__2__Value']
${Private-ELL-Quality of Management}  //input[@id='Rows_1__Table_Corteges_15__3__Value']
${Modifier_Error_Msg}=  //div[contains(text(), 'modifier')]
${Modifier_Apply}=  //input[@value="Apply"]
### Kidnap and Ransom/Extortion Coverage  (ML-PRIVATE)
${Text_Priv-KNR-Riskiness of Countries}=  //input[@id="Rows_1__Table_Corteges_0__2__Value"]
${Private-KNR-Riskiness of Countries}=  //input[@id="Rows_1__Table_Corteges_0__3__Value"]
${Text_Priv-KNR-Frequency of Travel}=  //input[@id="Rows_1__Table_Corteges_1__2__Value"]
${Private-KNR-Frequency of Travel}=  //input[@id="Rows_1__Table_Corteges_1__3__Value"]
${Text_Priv-KNR-Security Measures}=  //input[@id="Rows_1__Table_Corteges_2__2__Value"]
${Private-KNR-Security Measures}=  //input[@id="Rows_1__Table_Corteges_2__3__Value"]
${Text_Priv-KNR-Industry Group}=  //input[@id="Rows_1__Table_Corteges_3__2__Value"]
${Private-KNR-Industry Group}=  //input[@id="Rows_1__Table_Corteges_3__3__Value"]
${Text_Priv-KNR-Travel Advisory Policy}=  //input[@id="Rows_1__Table_Corteges_4__2__Value"]
${Private-KNR-Travel Advisory Policy}=  //input[@id="Rows_1__Table_Corteges_4__3__Value"]
${Text_Priv-KNR-Product Exposure}=  //input[@id="Rows_1__Table_Corteges_5__2__Value"]
${Private-KNR-Product Exposure}=  //input[@id="Rows_1__Table_Corteges_5__3__Value"]
${Text_Priv-KNR-Endorsement Factor}=  //input[@id="Rows_1__Table_Corteges_6__2__Value"]
${Private-KNR-Endorsement Factor}=  //input[@id="Rows_1__Table_Corteges_6__3__Value"]
#Crime Employee Theft Coverage (Private-CRI)
#Non-scheduled
${Text_Priv-CRI-Nature-of-Operations}=   //input[@id='Rows_1__Table_Corteges_0__2__Value']
${Private-CRI-Nature-of-Operations}=   //input[@id='Rows_1__Table_Corteges_0__3__Value']
${Text_Priv-CRI-Profile Of Workplace}=  //input[@id='Rows_1__Table_Corteges_1__2__Value']
${Private-CRI-Profile Of Workplace}=   //input[@id='Rows_1__Table_Corteges_1__3__Value']
${Text_Priv-CRI-Organizational Complex}=  //input[@id='Rows_1__Table_Corteges_2__2__Value']
${Private-CRI-Organizational Complex}=   //input[@id='Rows_1__Table_Corteges_2__3__Value']
${Text_Priv-CRI-Foreign Locn Exposure}=  //input[@id='Rows_1__Table_Corteges_3__2__Value']
${Private-CRI-Foreign Locn Exposure}=  //input[@id='Rows_1__Table_Corteges_3__3__Value']
${Text_Priv-CRI-High Value Proc Material}=  //input[@id='Rows_1__Table_Corteges_4__2__Value']
${Private-CRI-High Value Proc Material}=  //input[@id='Rows_1__Table_Corteges_4__3__Value']
${Text_Priv-CRI-Audit Functions}=  //input[@id='Rows_1__Table_Corteges_5__2__Value']
${Private-CRI-Audit Functions}=    //input[@id='Rows_1__Table_Corteges_5__3__Value']
${Text_Priv-CRI-Internal Controls}=  //input[@id='Rows_1__Table_Corteges_6__2__Value']
${Private-CRI-Internal Controls}=      //input[@id='Rows_1__Table_Corteges_6__3__Value']
${Text_Priv-CRI-Pre Emp Screening}=  //input[@id='Rows_1__Table_Corteges_7__2__Value']
${Private-CRI-Pre Emp Screening}=  //input[@id='Rows_1__Table_Corteges_7__3__Value']
${Text_Priv-CRI-Inventory Management}=  //input[@id='Rows_1__Table_Corteges_8__2__Value']
${Private-CRI-Inventory Management}=   //input[@id='Rows_1__Table_Corteges_8__3__Value']
${Text_Priv-CRI-Vendor Manage Guidelines}=   //input[@id='Rows_1__Table_Corteges_9__2__Value']
${Private-CRI-Vendor Manage Guidelines}=   //input[@id='Rows_1__Table_Corteges_9__3__Value']
${Text_Priv-CRI-Number of Years in Business}=  //input[@id='Rows_1__Table_Corteges_10__2__Value']
${Private-CRI-Number of Years in Business}=   //input[@id='Rows_1__Table_Corteges_10__3__Value']
${Text_Priv-CRI-Merger Divestiture Activity}=  //input[@id='Rows_1__Table_Corteges_11__2__Value']
${Private-CRI-Merger Divestiture Activity}=  //input[@id='Rows_1__Table_Corteges_11__3__Value']
#Optional Coverage Enhancements
${Text_Priv-CRI-Endorsement Factor}=  //input[@id='Rows_1__Table_Corteges_12__2__Value']
${Private-CRI-Endorsement Factor}=   //input[@id='Rows_1__Table_Corteges_12__3__Value']

*** Keywords ***
Default_Value_Validation_DNO_Private_Modifiers
    [Arguments]   &{data}
    log to console  *************************************************************
    log to console  "DEFAULT VALUES VERIFICATION - DNO"
    log to console  *************************************************************
    ${TextP-DNO-Nature-of-Operations}=  get value  ${Text_Priv-DNO-Nature-of-Operations}
    ${TextP-DNO-Number of Years in Business}=  get value  ${Text_Priv-DNO-Number of Years in Business}
    ${TextP-DNO-Number of Subsidiaries}=  get value  ${Text_Priv-DNO-Number of Subsidiaries}
    ${TextP-DNO-Merger Divestiture Activity}=  get value  ${Text_Priv-DNO-Merger Divestiture Activity}
    ${TextP-DNO-Securities Offering Activity}=  get value  ${Text_Priv-DNO-Securities Offering Activity}
    ${TextP-DNO-Management Ownership}=  get value  ${Text_Priv-DNO-Management Ownership}
    ${TextP-DNO-Litigation History}=  get value  ${Text_Priv-DNO-Litigation History}
    ${TextP-DNO-Significant Transaction}=  get value  ${Text_Priv-DNO-Significant Transaction}
    ${TextP-DNO-Management Stability}=  get value  ${Text_Priv-DNO-Management Stability}
    ${TextP-DNO-Quality of Balance Sheet}=  get value  ${Text_Priv-DNO-Quality of Balance Sheet}
    ${TextP-DNO-Quality of Income Statement}=  get value  ${Text_Priv-DNO-Quality of Income Statement}
    ${TextP-DNO-Statement of Cash Flows}=  get value  ${Text_Priv-DNO-Statement of Cash Flows}
    ${TextP-DNO-Defend Selection Factor}=  get value  ${Text_Priv-DNO-Defend Selection Factor}
    ${TextP-DNO-Endorsement Factor}=  get value  ${Text_Priv-DNO-Endorsement Factor}
    ${Priv_DEF_DNO_NOP}=  get value  ${Private-DNO-Nature-of-Operations}
    ${Priv_DEF_DNO_NYB}=  get value  ${Private-DNO-Number of Years in Business}
    ${Priv_DEF_DNO_NOS}=  get value  ${Private-DNO-Number of Subsidiaries}
    ${Priv_DEF_DNO_MDA}=  get value  ${Private-DNO-Merger Divestiture Activity}
    ${Priv_DEF_DNO_SOA}=  get value  ${Private-DNO-Securities Offering Activity}
    ${Priv_DEF_DNO_MO}=  get value  ${Private-DNO-Management Ownership}
    ${Priv_DEF_DNO_LH}=  get value  ${Private-DNO-Litigation History}
    ${Priv_DEF_DNO_ST}=  get value  ${Private-DNO-Significant Transaction}
    ${Priv_DEF_DNO_MSTAB}=  get value  ${Private-DNO-Management Stability}
    ${Priv_DEF_DNO_QBS}=  get value  ${Private-DNO-Quality of Balance Sheet}
    ${Priv_DEF_DNO_QIS}=  get value  ${Private-DNO-Quality of Income Statement}
    ${Priv_DEF_DNO_SCF}=  get value  ${Private-DNO-Statement of Cash Flows}
    ${Priv_DEF_DNO_DSF}=  get value  ${Private-DNO-Defend Selection Factor}
    ${Priv_DEF_DNO_EF}=  get value  ${Private-DNO-Endorsement Factor}
    run keyword if   '${Priv_DEF_DNO_NOP}' == '${data['DNO-NATUREOFOPERATIONS']}'  log to console    ${TextP-DNO-Nature-of-Operations}:"${Priv_DEF_DNO_NOP}"  ELSE  run keywords  log to console  ${TextP-DNO-Nature-of-Operations}:${Priv_DEF_DNO_NOP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Nature-of-Operations}  ${data['DNO-NATUREOFOPERATIONS']}
    run keyword if   '${Priv_DEF_DNO_NYB}' == '${data['DNO-NUMBEROFYEARSINBUSINESS']}'  log to console    ${TextP-DNO-Number of Years in Business}:"${Priv_DEF_DNO_NYB}"  ELSE  run keywords  log to console  ${TextP-DNO-Number of Years in Business}:${Priv_DEF_DNO_NYB} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Number of Years in Business}  ${data['DNO-NUMBEROFYEARSINBUSINESS']}
    run keyword if   '${Priv_DEF_DNO_NOS}' == '${data['DNO-NUMBEROFSUBSIDIARIES']}'  log to console    ${TextP-DNO-Number of Subsidiaries}:"${Priv_DEF_DNO_NOS}"  ELSE  run keywords  log to console  ${TextP-DNO-Number of Subsidiaries}:${Priv_DEF_DNO_NOS} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Number of Subsidiaries}    ${data['DNO-NUMBEROFSUBSIDIARIES']}
    run keyword if   '${Priv_DEF_DNO_MDA}' == '${data['DNO-MERGERACQUISITIONDIVESTITURE']}'  log to console    ${TextP-DNO-Merger Divestiture Activity}:"${Priv_DEF_DNO_MDA}"  ELSE  run keywords  log to console  ${TextP-DNO-Merger Divestiture Activity}:${Priv_DEF_DNO_MDA} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Merger Divestiture Activity}  ${data['DNO-MERGERACQUISITIONDIVESTITURE']}
    run keyword if   '${Priv_DEF_DNO_SOA}' == '${data['DNO-SECURITIESOFFERINGACTIVITY']}'  log to console    ${TextP-DNO-Securities Offering Activity}:"${Priv_DEF_DNO_SOA}"  ELSE  run keywords  log to console  ${TextP-DNO-Securities Offering Activity}:${Priv_DEF_DNO_SOA} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Securities Offering Activity}  ${data['DNO-SECURITIESOFFERINGACTIVITY']}
    run keyword if   '${Priv_DEF_DNO_MO}' == '${data['DNO-MANAGEMENT OWNERSHIP']}'  log to console    ${TextP-DNO-Management Ownership}:"${Priv_DEF_DNO_MO}"  ELSE  run keywords  log to console  ${TextP-DNO-Management Ownership}:${Priv_DEF_DNO_MO} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Management Ownership}   ${data['DNO-MANAGEMENT OWNERSHIP']}
    run keyword if   '${Priv_DEF_DNO_LH}' == '${data['DNO-LITIGATIONHISTORY']}'  log to console    ${TextP-DNO-Litigation History}:"${Priv_DEF_DNO_LH}"  ELSE  run keywords  log to console  ${TextP-DNO-Litigation History}:${Priv_DEF_DNO_LH} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Litigation History}  ${data['DNO-LITIGATIONHISTORY']}
    run keyword if   '${Priv_DEF_DNO_ST}' == '${data['DNO-SIGNIFICANTTRANSACTIONEVENT']}'  log to console    ${TextP-DNO-Significant Transaction}:"${Priv_DEF_DNO_ST}"  ELSE  run keywords  log to console  ${TextP-DNO-Significant Transaction}:${Priv_DEF_DNO_ST} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Significant Transaction}  ${data['DNO-SIGNIFICANTTRANSACTIONEVENT']}
    run keyword if   '${Priv_DEF_DNO_MSTAB}' == '${data['DNO-MANAGEMENTSTABILITY']}'  log to console    ${TextP-DNO-Management Stability}:"${Priv_DEF_DNO_MSTAB}"  ELSE  run keywords  log to console  ${TextP-DNO-Management Stability}:${Priv_DEF_DNO_MSTAB} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Management Stability}  ${data['DNO-MANAGEMENTSTABILITY']}
    run keyword if   '${Priv_DEF_DNO_QBS}' == '${data['DNO-QUALITY OF BALANCE SHEET']}'  log to console    ${TextP-DNO-Quality of Balance Sheet}:"${Priv_DEF_DNO_QBS}"  ELSE  run keywords  log to console  ${TextP-DNO-Quality of Balance Sheet}:${Priv_DEF_DNO_QBS} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Quality of Balance Sheet}   ${data['DNO-QUALITY OF BALANCE SHEET']}
    run keyword if   '${Priv_DEF_DNO_QIS}' == '${data['DNO-QUALITY OF INCOME STATEMENT']}'  log to console    ${TextP-DNO-Quality of Income Statement}:"${Priv_DEF_DNO_QIS}"  ELSE  run keywords  log to console  ${TextP-DNO-Quality of Income Statement}:${Priv_DEF_DNO_QIS} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Quality of Income Statement}   ${data['DNO-QUALITY OF INCOME STATEMENT']}
    run keyword if   '${Priv_DEF_DNO_SCF}' == '${data['DNO-QUALITYOFSTATEMENTOFCASHFLOWS']}'  log to console    ${TextP-DNO-Statement of Cash Flows}:"${Priv_DEF_DNO_SCF}"  ELSE  run keywords  log to console  ${TextP-DNO-Statement of Cash Flows}:${Priv_DEF_DNO_SCF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Statement of Cash Flows}   ${data['DNO-QUALITYOFSTATEMENTOFCASHFLOWS']}
    run keyword if   '${Priv_DEF_DNO_DSF}' == '${data['DNO-DUTYTO DEFEND']}'  log to console    ${TextP-DNO-Defend Selection Factor}:"${Priv_DEF_DNO_DSF}"  ELSE  run keywords  log to console  ${TextP-DNO-Defend Selection Factor}:${Priv_DEF_DNO_DSF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Defend Selection Factor}  ${data['DNO-DUTYTO DEFEND']}
    run keyword if   '${Priv_DEF_DNO_EF}' == '${data['DNO-ENDORSEMENTFACTOR']}'  log to console    ${TextP-DNO-Endorsement Factor}:"${Priv_DEF_DNO_EF}"  ELSE  run keywords  log to console  ${TextP-DNO-Endorsement Factor}:${Priv_DEF_DNO_EF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-DNO-Endorsement Factor}   ${data['DNO-ENDORSEMENTFACTOR']}
    log to console  *************************************************************
    log to console  ${\n}

Validate Error Message DNO PM
     ${PM_Error_msg}=  run keyword and return status    element should be visible  ${Modifier_Error_Msg}
     ${Eror_msg_display}=  run keyword if   '${PM_Error_msg}' == 'True'   get text  ${Modifier_Error_Msg}
     run keyword if   '${PM_Error_msg}' == 'True'   log to console  "NEGATIVE TESTING SUCCESS – RECEIVED ERROR AS EXPECTED"
     run keyword if     ${PM_Error_msg}  log to console  "${Eror_msg_display}"  ELSE  log to Console  "VALID VALUE ACCEPTED"

Enter Value to DNO-NOP
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Nature-of-Operations}  ${data['DNO-NATUREOFOPERATIONS']}
    log to console    ${data['DNO-NATUREOFOPERATIONS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_NOP
    [Arguments]  ${file_path}
    log to console  "DNO-Nature of Operations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-NYB
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Number of Years in Business}  ${data['DNO-NUMBEROFYEARSINBUSINESS']}
    log to console    ${data['DNO-NUMBEROFYEARSINBUSINESS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_NYB
    [Arguments]  ${file_path}
    log to console   "DNO-NUMBEROFYEARSINBUSINESS"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-NYB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-NYB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-NYB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-NOS
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Number of Subsidiaries}    ${data['DNO-NUMBEROFSUBSIDIARIES']}
    log to console    ${data['DNO-NUMBEROFSUBSIDIARIES']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_NOS
    [Arguments]  ${file_path}
    log to console    "DNO-NUMBEROFSUBSIDIARIES"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-NOS  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-NOS  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-NOS  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-MAD
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Merger Divestiture Activity}  ${data['DNO-MERGERACQUISITIONDIVESTITURE']}
    log to console  ${data['DNO-MERGERACQUISITIONDIVESTITURE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_MAD
    [Arguments]  ${file_path}
    log to console  "DNO-Merger Divestiture Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-SOA
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Securities Offering Activity}  ${data['DNO-SECURITIESOFFERINGACTIVITY']}
    log to console    ${data['DNO-SECURITIESOFFERINGACTIVITY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_SOA
    [Arguments]  ${file_path}
    log to console   "DNO-Securities Offering Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-MO
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Management Ownership}   ${data['DNO-MANAGEMENT OWNERSHIP']}
    log to console   ${data['DNO-MANAGEMENT OWNERSHIP']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_MO
    [Arguments]  ${file_path}
    log to console  "DNO-Management Ownership"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-MO  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-MO  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-MO  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-LH
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Litigation History}  ${data['DNO-LITIGATIONHISTORY']}
    log to console  ${data['DNO-LITIGATIONHISTORY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_LH
    [Arguments]  ${file_path}
    log to console  "DNO-Litigation History"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-STE
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Significant Transaction}  ${data['DNO-SIGNIFICANTTRANSACTIONEVENT']}
    log to console   ${data['DNO-SIGNIFICANTTRANSACTIONEVENT']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_STE
    [Arguments]  ${file_path}
    log to console  "DNO-Significant Transaction"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-MSTAB
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Management Stability}  ${data['DNO-MANAGEMENTSTABILITY']}
    log to console   ${data['DNO-MANAGEMENTSTABILITY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_MSTAB
    [Arguments]  ${file_path}
    log to console  "DNO-Management Stability"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-QBS
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Quality of Balance Sheet}   ${data['DNO-QUALITY OF BALANCE SHEET']}
    log to console   ${data['DNO-QUALITY OF BALANCE SHEET']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_QBS
    [Arguments]  ${file_path}
    log to console  "DNO-QUALITY OF BALANCE SHEET"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-QIS
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Quality of Income Statement}   ${data['DNO-QUALITY OF INCOME STATEMENT']}
    log to console     ${data['DNO-QUALITY OF INCOME STATEMENT']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_QIS
    [Arguments]  ${file_path}
    log to console  "DNO-QUALITY OF INCOME STATEMENT"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-QCF
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Statement of Cash Flows}   ${data['DNO-QUALITYOFSTATEMENTOFCASHFLOWS']}
    log to console   ${data['DNO-QUALITYOFSTATEMENTOFCASHFLOWS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_QCF
    [Arguments]  ${file_path}
    log to console  "DNO-Statement of Cash Flows"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-DDEF
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Defend Selection Factor}  ${data['DNO-DUTYTO DEFEND']}
    log to console  ${data['DNO-DUTYTO DEFEND']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_DDEF
    [Arguments]  ${file_path}
    log to console  "DNO-Duty to Defend Selection Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-DDEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-DDEF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-EFACT
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Endorsement Factor}   ${data['DNO-ENDORSEMENTFACTOR']}
    log to console   ${data['DNO-ENDORSEMENTFACTOR']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_DNO_EFACT
    [Arguments]  ${file_path}
    log to console  "DNO-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to DNO-QOM
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Quality of Management}    ${data['DNO-QUALITYOFMANAGEMENT']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

Enter Value to DNO-ABR
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Affected by Recession}   ${data['DNO-AFFECTEDBYRECESSION']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

Enter Value to DNO-OFL
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Overall Financial Liquidity}   ${data['DNO-OVERALLFINANCIALLIQUIDITY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

Enter Value to DNO-LEXP
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Loss Experience}  ${data['DNO-LOSSEXPERIENCE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

Enter Value to DNO-SCGOV
    [Arguments]   &{data}
    Check and enter input  ${Private-DNO-Strength of Corporate Governance}  ${data['DNO-STRENGTHOFCORPORATEGOVERNANCE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

Default_Value_Validation_EPL_Private_Modifiers
    [Arguments]   &{data}
    log to console  *************************************************************
    log to console  "DEFAULT VALUES VERIFICATION - EPL"
    log to console  *************************************************************
    ${TextP-EPL-Hazard County Locations}=  get value  ${Text_Priv-EPL-Hazard County Locations}               
    ${Priv_DEF_EPL_HCL}=  get value  ${Private-EPL-Hazard County Locations}                                   
    ${TextP-EPL-Number of Years in Business}=  get value  ${Text_Priv-EPL-Number of Years in Business}        
    ${Priv_DEF_EPL_NYB}=  get value  ${Private-EPL-Number of Years in Business}                               
    ${TextP-EPL-Closing Activity}=  get value  ${Text_Priv-EPL-Closing Activity}                              
    ${Priv_DEF_EPL_CA}=  get value  ${Private-EPL-Closing Activity}                                           
    ${TextP-EPL-Employee Turnover}=  get value  ${Text_Priv-EPL-Employee Turnover}                            
    ${Priv_DEF_EPL_ET}=  get value  ${Private-EPL-Employee Turnover}                                          
    ${TextP-EPL-Significant Transaction}=  get value  ${Text_Priv-EPL-Significant Transaction}
    ${Priv_DEF_EPL_ST}=  get value  ${Private-EPL-Significant Transaction}                                    
    ${TextP-EPL-Human Resources}=  get value  ${Text_Priv-EPL-Human Resources}                                
    ${Priv_DEF_EPL_HR}=  get value  ${Private-EPL-Human Resources}                                            
    ${TextP-EPL-Nature-of-Operations}=  get value  ${Text_Priv-EPL-Nature of Operations}                      
    ${Priv_DEF_EPL_NOP}=  get value  ${Private-EPL-Nature of Operations}                                      
    ${TextP-EPL-Merger Divestiture Activity}=  get value  ${Text_Priv-EPL-Divestiture Activity}               
    ${Priv_DEF_EPL_MDA}=  get value  ${Private-EPL-Divestiture Activity}
    ${TextP-EPL-Annual Compensation}=  get value  ${Text_Priv-EPL-Annual Compensation}                        
    ${Priv_DEF_EPL_AC}=  get value  ${Private-EPL-Annual Compensation}                                        
    ${TextP-EPL-Litigation History}=  get value  ${Text_Priv-EPL-Litigation History}                          
    ${Priv_DEF_EPL_LH}=  get value  ${Private-EPL-Litigation History}                                         
    ${TextP-EPL-Management Stability}=  get value  ${Text_Priv-EPL-Management Stability}                      
    ${Priv_DEF_EPL_MSTAB}=  get value  ${Private-EPL-Management Stability}
    ${TextP-EPL-Defend Selection Factor}=  get value  ${Text_Priv-EPL-Defend Selection Factor}                
    ${Priv_DEF_EPL_DDEF}=  get value  ${Private-EPL-Defend Selection Factor}
    ${TextP-EPL-Third Party Exposure Factor}=  get value  ${Text_Priv-EPL-Third Party Exposure Factor}        
    ${Priv_DEF_EPL_TPEF}=  get value  ${Private-EPL-Third Party Exposure Factor}                              
    ${TextP-EPL-Coverage Deleted Factor}=  get value  ${Text_Priv-EPL-Coverage Deleted Factor}                
    ${Priv_DEF_EPL_TPDF}=  get value  ${Private-EPL-Coverage Deleted Factor}
    ${TextP-EPL-Endorsement Factor}=  get value  ${Text_Priv-EPL-Endorsement Factor}                          
    ${Priv_DEF_EPL_EFACT}=  get value  ${Private-EPL-Endorsement Factor}
    run keyword if   '${Priv_DEF_EPL_HCL}' == '${data['EPL-HAZARDCOUNTYLOCATIONS']}'  log to console    ${TextP-EPL-Hazard County Locations}:"${Priv_DEF_EPL_HCL}"  ELSE  run keywords  log to console  ${TextP-EPL-Hazard County Locations}:${Priv_DEF_EPL_HCL} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Hazard County Locations}  ${data['EPL-HAZARDCOUNTYLOCATIONS']}
    run keyword if   '${Priv_DEF_EPL_NYB}' == '${data['EPL-NUMBEROFYEARSINBUSINESS']}'  log to console    ${TextP-EPL-Number of Years in Business}:"${Priv_DEF_EPL_NYB}"  ELSE  run keywords  log to console  ${TextP-EPL-Number of Years in Business}:${Priv_DEF_EPL_NYB} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Number of Years in Business}  ${data['EPL-NUMBEROFYEARSINBUSINESS']}
    run keyword if   '${Priv_DEF_EPL_CA}' == '${data['EPL-LAYOFFACTIVITY']}'  log to console    ${TextP-EPL-Closing Activity}:"${Priv_DEF_EPL_CA}"  ELSE  run keywords  log to console  ${TextP-EPL-Closing Activity}:${Priv_DEF_EPL_CA} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Closing Activity}  ${data['EPL-LAYOFFACTIVITY']}
    run keyword if   '${Priv_DEF_EPL_ET}' == '${data['EPL-EMPLOYEETURNOVER']}'  log to console    ${TextP-EPL-Employee Turnover}:"${Priv_DEF_EPL_ET}"  ELSE  run keywords  log to console  ${TextP-EPL-Employee Turnover}:${Priv_DEF_EPL_ET} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Employee Turnover}  ${data['EPL-EMPLOYEETURNOVER']}
    run keyword if   '${Priv_DEF_EPL_ST}' == '${data['EPL-SIGNIFICANTTRANSACTIONEVENT']}'  log to console    ${TextP-EPL-Significant Transaction}:"${Priv_DEF_EPL_ST}"  ELSE  run keywords  log to console  ${TextP-EPL-Significant Transaction}:${Priv_DEF_EPL_ST} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Significant Transaction}  ${data['EPL-SIGNIFICANTTRANSACTIONEVENT']}
    run keyword if   '${Priv_DEF_EPL_LH}' == '${data['EPL-LITIGATIONHISTORY']}'  log to console    ${TextP-EPL-Litigation History}:"${Priv_DEF_EPL_LH}"  ELSE  run keywords  log to console  ${TextP-EPL-Litigation History}:${Priv_DEF_EPL_LH} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Litigation History}  ${data['EPL-LITIGATIONHISTORY']}
    run keyword if   '${Priv_DEF_EPL_HR}' == '${data['EPL-HUMANRESOURCES']}'  log to console    ${TextP-EPL-Human Resources}:"${Priv_DEF_EPL_HR}"  ELSE  run keywords  log to console  ${TextP-EPL-Human Resources}:${Priv_DEF_EPL_HR} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Human Resources}  ${data['EPL-HUMANRESOURCES']}
    run keyword if   '${Priv_DEF_EPL_NOP}' == '${data['EPL-NATUREOFOPERATIONS']}'  log to console    ${TextP-EPL-Nature-of-Operations}:"${Priv_DEF_EPL_NOP}"  ELSE  run keywords  log to console  ${TextP-EPL-Nature-of-Operations}:${Priv_DEF_EPL_NOP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Nature of Operations}  ${data['EPL-NATUREOFOPERATIONS']}
    run keyword if   '${Priv_DEF_EPL_MDA}' == '${data['EPL-MERGERACQUISITIONDIVESTITURE']}'  log to console    ${TextP-EPL-Merger Divestiture Activity}:"${Priv_DEF_EPL_MDA}"  ELSE  run keywords  log to console  ${TextP-EPL-Merger Divestiture Activity}:${Priv_DEF_EPL_MDA} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Divestiture Activity}  ${data['EPL-MERGERACQUISITIONDIVESTITURE']}
    run keyword if   '${Priv_DEF_EPL_AC}' == '${data['EPL-ANNUALCOMPENSTION']}'  log to console    ${TextP-EPL-Annual Compensation}:"${Priv_DEF_EPL_AC}"  ELSE  run keywords  log to console  ${TextP-EPL-Annual Compensation}:${Priv_DEF_EPL_AC} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Annual Compensation}  ${data['EPL-ANNUALCOMPENSTION']}
    run keyword if   '${Priv_DEF_EPL_MSTAB}' == '${data['EPL-MANAGEMENTSTABILITY']}'  log to console    ${TextP-EPL-Management Stability}:"${Priv_DEF_EPL_MSTAB}"  ELSE  run keywords  log to console  ${TextP-EPL-Management Stability}:${Priv_DEF_EPL_MSTAB} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Management Stability}  ${data['EPL-MANAGEMENTSTABILITY']}
    run keyword if   '${Priv_DEF_EPL_DDEF}' == '${data['EPL-DUTYTODEFEND']}'  log to console    ${TextP-EPL-Defend Selection Factor}:"${Priv_DEF_EPL_DDEF}"  ELSE  run keywords  log to console  ${TextP-EPL-Defend Selection Factor}:${Priv_DEF_EPL_DDEF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Defend Selection Factor}  ${data['EPL-DUTYTODEFEND']}
    run keyword if   '${Priv_DEF_EPL_TPEF}' == '${data['EPL-THIRDPARTYEXPOSUREFACTOR']}'  log to console    ${TextP-EPL-Third Party Exposure Factor}:"${Priv_DEF_EPL_TPEF}"  ELSE  run keywords  log to console  ${TextP-EPL-Third Party Exposure Factor}:${Priv_DEF_EPL_TPEF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Third Party Exposure Factor}  ${data['EPL-THIRDPARTYEXPOSUREFACTOR']}
    run keyword if   '${Priv_DEF_EPL_TPDF}' == '${data['EPL-THIRDPARTYDELETEDFACTOR']}'  log to console    ${TextP-EPL-Coverage Deleted Factor}:"${Priv_DEF_EPL_TPDF}"  ELSE  run keywords  log to console  ${TextP-EPL-Coverage Deleted Factor}:${Priv_DEF_EPL_TPDF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Coverage Deleted Factor}  ${data['EPL-THIRDPARTYDELETEDFACTOR']}
    run keyword if   '${Priv_DEF_EPL_EFACT}' == '${data['EPL-ENDORSEMENTFACTOR']}'  log to console    ${TextP-EPL-Endorsement Factor}:"${Priv_DEF_EPL_EFACT}"  ELSE  run keywords  log to console  ${TextP-EPL-Endorsement Factor}:${Priv_DEF_EPL_EFACT} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-EPL-Endorsement Factor}  ${data['EPL-ENDORSEMENTFACTOR']}

Enter Value to EPL-HCL
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Hazard County Locations}  ${data['EPL-HAZARDCOUNTYLOCATIONS']}
    log to console    ${data['EPL-HAZARDCOUNTYLOCATIONS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_HCL
    [Arguments]  ${file_path}
    log to console  "EPL-Hazard County Locations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_EPL_HCL
    [Arguments]  ${file_path}
    log to console  "EPL-Hazard County Locations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
     &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-NYB
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Number of Years in Business}  ${data['EPL-NUMBEROFYEARSINBUSINESS']}
    log to console    ${data['EPL-NUMBEROFYEARSINBUSINESS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_NYB
    [Arguments]  ${file_path}
    log to console  "EPL-Number of Years in Business"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-NYB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-NYB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-NYB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-CA
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Closing Activity}  ${data['EPL-LAYOFFACTIVITY']}
    log to console    ${data['EPL-LAYOFFACTIVITY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_CA
    [Arguments]  ${file_path}
    log to console  "EPL-Past or Contemplated Layoff or Closing Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-ETO
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Employee Turnover}  ${data['EPL-EMPLOYEETURNOVER']}
    log to console    ${data['EPL-EMPLOYEETURNOVER']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_ETO
    [Arguments]  ${file_path}
    log to console  "EPL-Employee Turnover"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-STE
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Significant Transaction}  ${data['EPL-SIGNIFICANTTRANSACTIONEVENT']}
    log to console    ${data['EPL-SIGNIFICANTTRANSACTIONEVENT']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_STE
    [Arguments]  ${file_path}
    log to console  "EPL-Private-EPL-Significant Transaction Event"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-HR
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Human Resources}  ${data['EPL-HUMANRESOURCES']}
    log to console    ${data['EPL-HUMANRESOURCES']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_HR
    [Arguments]  ${file_path}
    log to console  "EPL-Human Resources"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_EPL_HR
    [Arguments]  ${file_path}
    log to console  "EPL-Human Resources"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-NOP
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Nature of Operations}  ${data['EPL-NATUREOFOPERATIONS']}
    log to console    ${data['EPL-NATUREOFOPERATIONS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_NOP
    [Arguments]  ${file_path}
    log to console  "EPL-Nature of Operations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-MDA
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Divestiture Activity}  ${data['EPL-MERGERACQUISITIONDIVESTITURE']}
    log to console    ${data['EPL-MERGERACQUISITIONDIVESTITURE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_MDA
    [Arguments]  ${file_path}
    log to console  "EPL-Merger, Acquisition, or Divestiture Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-AC
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Annual Compensation}  ${data['EPL-ANNUALCOMPENSTION']}
    log to console    ${data['EPL-ANNUALCOMPENSTION']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_AC
    [Arguments]  ${file_path}
    log to console  "EPL-Annual Compensation"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-AC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-AC  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-AC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-AC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-LH
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Litigation History}  ${data['EPL-LITIGATIONHISTORY']}
    log to console    ${data['EPL-LITIGATIONHISTORY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_LH
    [Arguments]  ${file_path}
    log to console  "EPL-Litigation History"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-MSTAB
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Management Stability}  ${data['EPL-MANAGEMENTSTABILITY']}
    log to console    ${data['EPL-MANAGEMENTSTABILITY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_MSTAB
    [Arguments]  ${file_path}
    log to console  "EPL-Management Stability"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-DDEF
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Defend Selection Factor}  ${data['EPL-DUTYTODEFEND']}
    log to console    ${data['EPL-DUTYTODEFEND']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_DDEF
    [Arguments]  ${file_path}
    log to console  "EPL-Duty to Defend Selection Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-DDEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-DDEF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-TPEF
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Third Party Exposure Factor}  ${data['EPL-THIRDPARTYEXPOSUREFACTOR']}
    log to console    ${data['EPL-THIRDPARTYEXPOSUREFACTOR']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_TPEF
    [Arguments]  ${file_path}
    log to console  "EPL-Third Party Exposure Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-TPDF
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Coverage Deleted Factor}  ${data['EPL-THIRDPARTYDELETEDFACTOR']}
    log to console    ${data['EPL-THIRDPARTYDELETEDFACTOR']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_TPDF
    [Arguments]  ${file_path}
    log to console  "EPL-Third Party Liability Coverage Deleted Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-TPDF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-TPDF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-TPDF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to EPL-EFACT
    [Arguments]   &{data}
    Check and enter input  ${Private-EPL-Endorsement Factor}  ${data['EPL-ENDORSEMENTFACTOR']}
    log to console    ${data['EPL-ENDORSEMENTFACTOR']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_EPL_EFACT
    [Arguments]  ${file_path}
    log to console  "EPL-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Default_Value_Validation_ELL_Private_Modifiers
    [Arguments]   &{data}
    log to console  *************************************************************
    log to console  "DEFAULT VALUES VERIFICATION - ELL"
    log to console  *************************************************************
    ${TextP-ELL-Area of Practice}=  get value  ${Text_Priv-ELL-Area of Practice}
    ${TextP-ELL-Litigation History}=  get value  ${Text_Priv-ELL-Litigation History}
    ${TextP-ELL-Public Debt Exposure}=  get value  ${Text_Priv-ELL-Public Debt Exposure}
    ${TextP-ELL-Divestiture Activity}=  get value  ${Text_Priv-ELL-Divestiture Activity}
    ${TextP-ELL-External Legal Resources}=  get value  ${Text_Priv-ELL-External Legal Resources}
    ${TextP-ELL-Employed Lawyers}=  get value  ${Text_Priv-ELL-Employed Lawyers}
    ${TextP-ELL-Legal Services Performed}=  get value  ${Text_Priv-ELL-Legal Services Performed}
    ${TextP-ELL-Defend Selection Factor}=  get value  ${Text_Priv-ELL-Defend Selection Factor}
    ${TextP-ELL-Endorsement Factor}=  get value  ${Text_Priv-ELL-Endorsement Factor}
    ${Priv_DEF_ELL_AOP}=  get value  ${Private-ELL-Area of Practice}
    ${Priv_DEF_ELL_LH}=  get value  ${Private-ELL-Litigation History}
    ${Priv_DEF_ELL_PDE}=  get value  ${Private-ELL-Public Debt Exposure}
    ${Priv_DEF_ELL_MDA}=  get value  ${Private-ELL-Divestiture Activity}
    ${Priv_DEF_ELL_ELR}=  get value  ${Private-ELL-External Legal Resources}
    ${Priv_DEF_ELL_EEL}=  get value  ${Private-ELL-Employed Lawyers}
    ${Priv_DEF_ELL_LSP}=  get value  ${Private-ELL-Legal Services Performed}
    ${Priv_DEF_ELL_DDEF}=  get value  ${Private-ELL-Defend Selection Factor}
    ${Priv_DEF_ELL_EFACT}=  get value  ${Private-ELL-Endorsement Factor}
    run keyword if   '${Priv_DEF_ELL_AOP}' == '${data['ELL-AREAOFPRACTICE']}'  log to console    ${TextP-ELL-Area of Practice}:"${Priv_DEF_ELL_AOP}"  ELSE  run keywords  log to console  ${TextP-ELL-Area of Practice}:${Priv_DEF_ELL_AOP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-Area of Practice}  ${data['ELL-AREAOFPRACTICE']}
    run keyword if   '${Priv_DEF_ELL_LH}' == '${data['ELL-LITIGATIONHISTORY']}'  log to console    ${TextP-ELL-Litigation History}:"${Priv_DEF_ELL_LH}"  ELSE  run keywords  log to console  ${TextP-ELL-Litigation History}:${Priv_DEF_ELL_LH} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-Litigation History}  ${data['ELL-LITIGATIONHISTORY']}
    run keyword if   '${Priv_DEF_ELL_PDE}' == '${data['ELL-PUBLICDEBT']}'  log to console    ${TextP-ELL-Public Debt Exposure}:"${Priv_DEF_ELL_PDE}"  ELSE  run keywords  log to console  ${TextP-ELL-Public Debt Exposure}:${Priv_DEF_ELL_PDE} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-Public Debt Exposure}  ${data['ELL-PUBLICDEBT']}
    run keyword if   '${Priv_DEF_ELL_MDA}' == '${data['ELL-MERGERACQUISITIONDIVESTITURE']}'  log to console    ${TextP-ELL-Divestiture Activity}:"${Priv_DEF_ELL_MDA}"  ELSE  run keywords  log to console  ${TextP-ELL-Divestiture Activity}:${Priv_DEF_ELL_MDA} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-Divestiture Activity}  ${data['ELL-MERGERACQUISITIONDIVESTITURE']}
    run keyword if   '${Priv_DEF_ELL_ELR}' == '${data['ELL-EXTERNALLEGALRESOURCES']}'  log to console    ${TextP-ELL-External Legal Resources}:"${Priv_DEF_ELL_ELR}"  ELSE  run keywords  log to console  ${TextP-ELL-External Legal Resources}:${Priv_DEF_ELL_ELR} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-External Legal Resources}  ${data['ELL-EXTERNALLEGALRESOURCES']}
    run keyword if   '${Priv_DEF_ELL_EEL}' == '${data['ELL-EXPERIENCEEMPLOYEDLAWYERS']}'  log to console    ${TextP-ELL-Employed Lawyers}:"${Priv_DEF_ELL_EEL}"  ELSE  run keywords  log to console  ${TextP-ELL-Employed Lawyers}:${Priv_DEF_ELL_EEL} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-Employed Lawyers}  ${data['ELL-EXPERIENCEEMPLOYEDLAWYERS']}
    run keyword if   '${Priv_DEF_ELL_LSP}' == '${data['ELL-OTHERLEGALSERVICES']}'  log to console    ${TextP-ELL-Legal Services Performed}:"${Priv_DEF_ELL_LSP}"  ELSE  run keywords  log to console  ${TextP-ELL-Legal Services Performed}:${Priv_DEF_ELL_LSP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-Legal Services Performed}  ${data['ELL-OTHERLEGALSERVICES']}
    run keyword if   '${Priv_DEF_ELL_DDEF}' == '${data['ELL-DUTYTO DEFEND']}'  log to console    ${TextP-ELL-Defend Selection Factor}:"${Priv_DEF_ELL_DDEF}"  ELSE  run keywords  log to console  ${TextP-ELL-Defend Selection Factor}:${Priv_DEF_ELL_DDEF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-Defend Selection Factor}  ${data['ELL-DUTYTO DEFEND']}
    run keyword if   '${Priv_DEF_ELL_EFACT}' == '${data['ELL-ENDORSEMENTFACTOR']}'  log to console    ${TextP-ELL-Endorsement Factor}:"${Priv_DEF_ELL_EFACT}"  ELSE  run keywords  log to console  ${TextP-ELL-Endorsement Factor}:${Priv_DEF_ELL_EFACT} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-ELL-Endorsement Factor}  ${data['ELL-ENDORSEMENTFACTOR']}
    log to console  *************************************************************
    log to console  ${\n}

Enter Value to ELL-AOP
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-Area of Practice}  ${data['ELL-AREAOFPRACTICE']}
    log to console    ${data['ELL-AREAOFPRACTICE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_AOP
    [Arguments]  ${file_path}
    log to console  "ELL-Area of Practice"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-AOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-AOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-AOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-AOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to ELL-LH
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-Litigation History}  ${data['ELL-LITIGATIONHISTORY']}
    log to console    ${data['ELL-LITIGATIONHISTORY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_LH
    [Arguments]  ${file_path}
    log to console  "ELL-Litigation History"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to ELL-PDE
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-Public Debt Exposure}  ${data['ELL-PUBLICDEBT']}
    log to console    ${data['ELL-PUBLICDEBT']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_PDE
    [Arguments]  ${file_path}
    log to console  "ELL-Public Debt Exposure"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-PDE  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-PDE  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-PDE  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to ELL-MDA
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-Divestiture Activity}  ${data['ELL-MERGERACQUISITIONDIVESTITURE']}
    log to console    ${data['ELL-MERGERACQUISITIONDIVESTITURE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_MDA
    [Arguments]  ${file_path}
    log to console  "ELL-Merger, Acquisition, or Divestiture Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to ELL-ELR
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-External Legal Resources}  ${data['ELL-EXTERNALLEGALRESOURCES']}
    log to console    ${data['ELL-EXTERNALLEGALRESOURCES']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_ELR
    [Arguments]  ${file_path}
    log to console  "ELL-External Legal Resources"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-ELR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-ELR  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-ELR  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-ELR  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to ELL-EEL
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-Employed Lawyers}  ${data['ELL-EXPERIENCEEMPLOYEDLAWYERS']}
    log to console    ${data['ELL-EXPERIENCEEMPLOYEDLAWYERS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_EEL
    [Arguments]  ${file_path}
    log to console  "ELL-Experience of Employed Lawyers"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-EEL  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-EEL  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-EEL  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-EEL  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to ELL-LSP
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-Legal Services Performed}  ${data['ELL-OTHERLEGALSERVICES']}
    log to console    ${data['ELL-OTHERLEGALSERVICES']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_LSP
    [Arguments]  ${file_path}
    log to console  "ELL-Other Legal Services Performed"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to ELL-DDEF
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-Defend Selection Factor}  ${data['ELL-DUTYTO DEFEND']}
    log to console    ${data['ELL-DUTYTO DEFEND']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_DDEF
    [Arguments]  ${file_path}
    log to console  "ELL-Duty to Defend Selection Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-DDEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-DDEF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to ELL-EFACT
    [Arguments]   &{data}
    Check and enter input  ${Private-ELL-Endorsement Factor}  ${data['ELL-ENDORSEMENTFACTOR']}
    log to console    ${data['ELL-ENDORSEMENTFACTOR']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_ELL_EFACT
    [Arguments]  ${file_path}
    log to console  "ELL-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Default_Value_Validation_KNR_Private_Modifiers
    [Arguments]   &{data}
    log to console  *************************************************************
    log to console  "DEFAULT VALUES VERIFICATION - KNR"
    log to console  *************************************************************
    ${TextP-KNR-Riskiness of Countries}=  get value  ${Text_Priv-KNR-Riskiness of Countries}
    ${TextP-KNR-Frequency of Travel}=  get value  ${Text_Priv-KNR-Frequency of Travel}
    ${TextP-KNR-Security Measures}=  get value  ${Text_Priv-KNR-Security Measures}
    ${TextP-KNR-Industry Group}=  get value  ${Text_Priv-KNR-Industry Group}
    ${TextP-KNR-Travel Advisory Policy}=  get value  ${Text_Priv-KNR-Travel Advisory Policy}
    ${TextP-KNR-Product Exposure}=  get value  ${Text_Priv-KNR-Product Exposure}
    ${TextP-KNR-Endorsement Factor}=  get value  ${Text_Priv-KNR-Endorsement Factor}
    ${Priv_DEF_KNR_ROC}=  get value  ${Private-KNR-Riskiness of Countries}
    ${Priv_DEF_KNR_FOT}=  get value  ${Private-KNR-Frequency of Travel}
    ${Priv_DEF_KNR_SM}=  get value  ${Private-KNR-Security Measures}
    ${Priv_DEF_KNR_IG}=  get value  ${Private-KNR-Industry Group}
    ${Priv_DEF_KNR_TAP}=  get value  ${Private-KNR-Travel Advisory Policy}
    ${Priv_DEF_KNR_PEX}=  get value  ${Private-KNR-Product Exposure}
    ${Priv_DEF_KNR_EFACT}=  get value  ${Private-KNR-Endorsement Factor}
    run keyword if   '${Priv_DEF_KNR_ROC}' == '${data['KNR-RISKINESSOFCOUNTRIES']}'  log to console    ${TextP-KNR-Riskiness of Countries}:"${Priv_DEF_KNR_ROC}"  ELSE  run keywords  log to console  ${TextP-KNR-Riskiness of Countries}:${Priv_DEF_KNR_ROC} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-KNR-Riskiness of Countries}  ${data['KNR-RISKINESSOFCOUNTRIES']}
    run keyword if   '${Priv_DEF_KNR_FOT}' == '${data['KNR-FREQUENCYOFTRAVEL']}'  log to console    ${TextP-KNR-Frequency of Travel}:"${Priv_DEF_KNR_FOT}"  ELSE  run keywords  log to console  ${TextP-KNR-Frequency of Travel}:${Priv_DEF_KNR_FOT} - "ERROR-INVALID DEFAULT VALUE"  AND   Check and enter input  ${Private-KNR-Frequency of Travel}  ${data['KNR-FREQUENCYOFTRAVEL']}
    run keyword if   '${Priv_DEF_KNR_SM}' == '${data['KNR-SECURITIESMEASURES']}'  log to console    ${TextP-KNR-Security Measures}:"${Priv_DEF_KNR_SM}"  ELSE  run keywords  log to console  ${TextP-KNR-Security Measures}:${Priv_DEF_KNR_SM} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-KNR-Security Measures}  ${data['KNR-SECURITIESMEASURES']}
    run keyword if   '${Priv_DEF_KNR_IG}' == '${data['KNR-INDUSTRYGROUP']}'  log to console    ${TextP-KNR-Industry Group}:"${Priv_DEF_KNR_IG}"  ELSE  run keywords  log to console  ${TextP-KNR-Industry Group}:${Priv_DEF_KNR_IG} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-KNR-Industry Group}  ${data['KNR-INDUSTRYGROUP']}
    run keyword if   '${Priv_DEF_KNR_TAP}' == '${data['KNR-TRAVELADVISORYPOLICY']}'  log to console    ${TextP-KNR-Travel Advisory Policy}:"${Priv_DEF_KNR_TAP}"  ELSE  run keywords  log to console  ${TextP-KNR-Travel Advisory Policy}:${Priv_DEF_KNR_TAP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-KNR-Travel Advisory Policy}  ${data['KNR-TRAVELADVISORYPOLICY']}
    run keyword if   '${Priv_DEF_KNR_PEX}' == '${data['KNR-PRODUCTEXPOSURE']}'  log to console    ${TextP-KNR-Product Exposure}:"${Priv_DEF_KNR_PEX}"  ELSE  run keywords  log to console  ${TextP-KNR-Product Exposure}:${Priv_DEF_KNR_PEX} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-KNR-Product Exposure}  ${data['KNR-PRODUCTEXPOSURE']}
    run keyword if   '${Priv_DEF_KNR_EFACT}' == '${data['KNR-ENDORSEMENTFACTOR']}'  log to console    ${TextP-KNR-Endorsement Factor}:"${Priv_DEF_KNR_EFACT}"  ELSE  run keywords  log to console  ${TextP-KNR-Endorsement Factor}:${Priv_DEF_KNR_EFACT} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-KNR-Endorsement Factor}  ${data['KNR-ENDORSEMENTFACTOR']}
    log to console  ${\n}

Enter Value to KNR-ROC
    [Arguments]   &{data}
    Check and enter input  ${Private-KNR-Riskiness of Countries}  ${data['KNR-RISKINESSOFCOUNTRIES']}
    log to console    ${data['KNR-RISKINESSOFCOUNTRIES']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_KNR_ROC
    [Arguments]  ${file_path}
    log to console  "KNR-Riskiness of Countries"
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_KNR_ROC
    [Arguments]  ${file_path}
    log to console  "KNR-Riskiness of Countries"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to KNR-FOT
    [Arguments]   &{data}
    Check and enter input  ${Private-KNR-Frequency of Travel}  ${data['KNR-FREQUENCYOFTRAVEL']}
    log to console    ${data['KNR-FREQUENCYOFTRAVEL']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_KNR_FOT
    [Arguments]  ${file_path}
    log to console  "KNR-Frequency of Travel"
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_KNR_FOT
    [Arguments]  ${file_path}
    log to console  "KNR-Frequency of Travel"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}


Enter Value to KNR-SM
    [Arguments]   &{data}
    Check and enter input  ${Private-KNR-Security Measures}  ${data['KNR-SECURITIESMEASURES']}
    log to console    ${data['KNR-SECURITIESMEASURES']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_KNR_SM
    [Arguments]  ${file_path}
    log to console  "KNR-Security Measures"
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_KNR_SM
    [Arguments]  ${file_path}
    log to console  "KNR-Security Measures"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to KNR-IG
    [Arguments]   &{data}
    Check and enter input  ${Private-KNR-Industry Group}  ${data['KNR-INDUSTRYGROUP']}
    log to console    ${data['KNR-INDUSTRYGROUP']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_KNR_IG
    [Arguments]  ${file_path}
    log to console  "KNR-Industry Group"
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_KNR_IG
    [Arguments]  ${file_path}
    log to console  "KNR-Industry Group"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to KNR-TAP
    [Arguments]   &{data}
    Check and enter input  ${Private-KNR-Travel Advisory Policy}  ${data['KNR-TRAVELADVISORYPOLICY']}
    log to console    ${data['KNR-TRAVELADVISORYPOLICY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_KNR_TAP
    [Arguments]  ${file_path}
    log to console  "KNR-Travel Advisory Policy"
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_KNR_TAP
    [Arguments]  ${file_path}
    log to console  "KNR-Travel Advisory Policy"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to KNR-PEXP
    [Arguments]   &{data}
    Check and enter input  ${Private-KNR-Product Exposure}  ${data['KNR-PRODUCTEXPOSURE']}
    log to console    ${data['KNR-PRODUCTEXPOSURE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_KNR_PEXP
    [Arguments]  ${file_path}
    log to console  "KNR-Product Exposure"
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_KNR_PEXP
    [Arguments]  ${file_path}
    log to console  "KNR-Product Exposure"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to KNR-EFACT
    [Arguments]   &{data}
    Check and enter input  ${Private-KNR-Endorsement Factor}  ${data['KNR-ENDORSEMENTFACTOR']}
    log to console    ${data['KNR-ENDORSEMENTFACTOR']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_KNR_EFACT
    [Arguments]  ${file_path}
    log to console  "KNR-Endorsement Factor"
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_NRS_KNR_EFACT
    [Arguments]  ${file_path}
    log to console  "KNR-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

###FDU
Default_Value_Validation_FDU_Private_Modifiers
    [Arguments]   &{data}
    log to console  *************************************************************
    log to console  "DEFAULT VALUES VERIFICATION - FDU"
    log to console  *************************************************************
    ${TextP-FDU-Nature-of-Operations}=  get value  ${Text_Priv-FDU-Nature-of-Operations}
    ${TextP-FDU-Number of Years in Business}=  get value  ${Text_Priv-FDU-Number of Years in Business}
    ${TextP-FDU-Plan Termination MFA}=  get value  ${Text_Priv-FDU-Plan Termination}
    ${TextP-FDU-Plan Type}=  get value  ${Text_Priv-FDU-Plan Type}
    ${TextP-FDU-Employee SOP}=  get value  ${Text_Priv-FDU-Employee SOP}
    ${TextP-FDU-Funding Status DBP}=  get value  ${Text_Priv-FDU-Defined Benefit Plans}
    ${TextP-FDU-Plan Participants}=  get value  ${Text_Priv-FDU-Plan Participants}
    ${TextP-FDU-Litigation History}=  get value  ${Text_Priv-FDU-Litigation History}
    ${TextP-FDU-Significant Transaction}=  get value  ${Text_Priv-FDU-Significant Transaction}
    ${TextP-FDU-Quality And Div PI}=  get value  ${Text_Priv-FDU-Diversity of Plan Investments}
    ${TextP-FDU-Duty Defend}=  get value  ${Text_Priv-FDU-Defend Selection Factor}
    ${TextP-FDU-Endorsement Factor}=  get value  ${Text_Priv-FDU-Endorsement Factor}
    ${Priv_DEF_FDU_NOP}=  get value  ${Private-FDU-Nature-of-Operations}
    ${Priv_DEF_FDU_NYB}=  get value  ${Private-FDU-Number of Years in Business}
    ${Priv_DEF_FDU_PTMFA}=  get value  ${Private-FDU-Plan Termination}
    ${Priv_DEF_FDU_PT}=  get value  ${Private-FDU-Plan Type}
    ${Priv_DEF_FDU_ESOP}=  get value  ${Private-FDU-Employee SOP}
    ${Priv_DEF_FDU_FSDBP}=  get value  ${Private-FDU-Defined Benefit Plans}
    ${Priv_DEF_FDU_PP}=  get value  ${Private-FDU-Plan Participants}
    ${Priv_DEF_FDU_LH}=  get value  ${Private-FDU-Litigation History}
    ${Priv_DEF_FDU_ST}=  get value  ${Private-FDU-Significant Transaction}
    ${Priv_DEF_FDU_QDPI}=  get value  ${Private-FDU-Diversity of Plan Investments}
    ${Priv_DEF_FDU_DDF}=  get value  ${Private-FDU-Defend Selection Factor}
    ${Priv_DEF_FDU_EF}=  get value  ${Private-FDU-Endorsement Factor}
    ${Priv_DEF_FDU_NOP}=  get value  ${Private-FDU-Nature-of-Operations}
    run keyword if   '${Priv_DEF_FDU_NOP}' == '${data['FDU-NATUREOFOPERATIONS']}'  log to console    ${TextP-FDU-Nature-of-Operations}:"${Priv_DEF_FDU_NOP}"  ELSE  run keywords  log to console  ${TextP-FDU-Nature-of-Operations}:${Priv_DEF_FDU_NOP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Nature-of-Operations}  ${data['FDU-NATUREOFOPERATIONS']}
    run keyword if   '${Priv_DEF_FDU_NYB}' == '${data['FDU-NUMBEROFYEARSINBUSINESS']}'  log to console    ${TextP-FDU-Number of Years in Business}:"${Priv_DEF_FDU_NYB}"  ELSE  run keywords  log to console  ${TextP-FDU-Number of Years in Business}:${Priv_DEF_FDU_NYB} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Number of Years in Business}  ${data['FDU-NUMBEROFYEARSINBUSINESS']}
    run keyword if   '${Priv_DEF_FDU_PTMFA}' == '${data['FDU-PLANTERMINATION']}'  log to console    ${TextP-FDU-Plan Termination MFA}:"${Priv_DEF_FDU_PTMFA}"  ELSE  run keywords  log to console  ${TextP-FDU-Plan Termination MFA}:${Priv_DEF_FDU_PTMFA} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Plan Termination}  ${data['FDU-PLANTERMINATION']}
    run keyword if   '${Priv_DEF_FDU_PT}' == '${data['FDU-PLANTYPE']}'  log to console    ${TextP-FDU-Plan Type}:"${Priv_DEF_FDU_PT}"  ELSE  run keywords  log to console  ${TextP-FDU-Plan Type}:${Priv_DEF_FDU_PT} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Plan Type}  ${data['FDU-PLANTYPE']}
    run keyword if   '${Priv_DEF_FDU_ESOP}' == '${data['FDU-EMPLOYEESTOCKOWNERSHIPPLAN']}'  log to console    ${TextP-FDU-Employee SOP}:"${Priv_DEF_FDU_ESOP}"  ELSE  run keywords  log to console  ${TextP-FDU-Employee SOP}:${Priv_DEF_FDU_ESOP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Employee SOP}  ${data['FDU-EMPLOYEESTOCKOWNERSHIPPLAN']}
    run keyword if   '${Priv_DEF_FDU_FSDBP}' == '${data['FDU-FUNDINGSTATUSBENEFITPLANS']}'  log to console    ${TextP-FDU-Funding Status DBP}:"${Priv_DEF_FDU_FSDBP}"  ELSE  run keywords  log to console  ${TextP-FDU-Funding Status DBP}:${Priv_DEF_FDU_FSDBP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Defined Benefit Plans}  ${data['FDU-FUNDINGSTATUSBENEFITPLANS']}
    run keyword if   '${Priv_DEF_FDU_PP}' == '${data['FDU-PLANPARTICIPANTS']}'  log to console    ${TextP-FDU-Plan Participants}:"${Priv_DEF_FDU_PP}"  ELSE  run keywords  log to console  ${TextP-FDU-Plan Participants}:${Priv_DEF_FDU_PP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Plan Participants}  ${data['FDU-PLANPARTICIPANTS']}
    run keyword if   '${Priv_DEF_FDU_LH}' == '${data['FDU-LITIGATIONHISTORY']}'  log to console    ${TextP-FDU-Litigation History}:"${Priv_DEF_FDU_LH}"  ELSE  run keywords  log to console  ${TextP-FDU-Litigation History}:${Priv_DEF_FDU_LH} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Litigation History}  ${data['FDU-LITIGATIONHISTORY']}
    run keyword if   '${Priv_DEF_FDU_ST}' == '${data['FDU-SIGNIFICANTTRANSACTIONEVENT']}'  log to console    ${TextP-FDU-Significant Transaction}:"${Priv_DEF_FDU_ST}"  ELSE  run keywords  log to console  ${TextP-FDU-Significant Transaction}:${Priv_DEF_FDU_ST} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Significant Transaction}  ${data['FDU-SIGNIFICANTTRANSACTIONEVENT']}
    run keyword if   '${Priv_DEF_FDU_QDPI}' == '${data['FDU-QUALITYANDDIVERSITY']}'  log to console    ${TextP-FDU-Quality And Div PI}:"${Priv_DEF_FDU_QDPI}"  ELSE  run keywords  log to console  ${TextP-FDU-Quality And Div PI}:${Priv_DEF_FDU_QDPI} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Diversity of Plan Investments}  ${data['FDU-QUALITYANDDIVERSITY']}
    run keyword if   '${Priv_DEF_FDU_DDF}' == '${data['FDU-DUTYTO DEFEND']}'  log to console    ${TextP-FDU-Duty Defend}:"${Priv_DEF_FDU_DDF}"  ELSE  run keywords  log to console  ${TextP-FDU-Duty Defend}:${Priv_DEF_FDU_DDF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Defend Selection Factor}  ${data['FDU-DUTYTO DEFEND']}
    run keyword if   '${Priv_DEF_FDU_EF}' == '${data['FDU-ENDORSEMENTFACTOR']}'  log to console    ${TextP-FDU-Endorsement Factor}:"${Priv_DEF_FDU_EF}"  ELSE  run keywords  log to console  ${TextP-FDU-Endorsement Factor}:${Priv_DEF_FDU_EF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-FDU-Endorsement Factor}  ${data['FDU-ENDORSEMENTFACTOR']}

Enter Value to FDU-NOP
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Nature-of-Operations}  ${data['FDU-NATUREOFOPERATIONS']}
    log to console    ${data['FDU-NATUREOFOPERATIONS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_NOP
    [Arguments]  ${file_path}
    log to console  "FDU-Nature of Operations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-NYB
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Number of Years in Business}  ${data['FDU-NUMBEROFYEARSINBUSINESS']}
    log to console    ${data['FDU-NUMBEROFYEARSINBUSINESS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_NYB
    [Arguments]  ${file_path}
    log to console   "FDU-NUMBEROFYEARSINBUSINESS"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-NYB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-NYB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-NYB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-PTMFA
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Plan Termination}  ${data['FDU-PLANTERMINATION']}
    log to console    ${data['FDU-PLANTERMINATION']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_PTMFA
    [Arguments]  ${file_path}
    log to console  "FDU-PLANTERMINATION"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-PT
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Plan Type}  ${data['FDU-PLANTYPE']}
    log to console    ${data['FDU-PLANTYPE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_PT
    [Arguments]  ${file_path}
    log to console  "FDU-PLANTYPE"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-PT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-PT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-PT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-PT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-ESOP
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Employee SOP}  ${data['FDU-EMPLOYEESTOCKOWNERSHIPPLAN']}
    log to console    ${data['FDU-EMPLOYEESTOCKOWNERSHIPPLAN']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_ESOP
    [Arguments]  ${file_path}
    log to console  "FDU-EMPLOYEESTOCKOWNERSHIPPLAN"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-FSDBP
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Defined Benefit Plans}  ${data['FDU-FUNDINGSTATUSBENEFITPLANS']}
    log to console    ${data['FDU-FUNDINGSTATUSBENEFITPLANS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_FSDBP
    [Arguments]  ${file_path}
    log to console  "FDU-FUNDINGSTATUSBENEFITPLANS"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-PP
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Plan Participants}  ${data['FDU-PLANPARTICIPANTS']}
    log to console    ${data['FDU-PLANPARTICIPANTS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_PP
    [Arguments]  ${file_path}
    log to console  "FDU-PLANPARTICIPANTS"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-PP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-PP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-PP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-PP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-LH
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Litigation History}  ${data['FDU-LITIGATIONHISTORY']}
    log to console    ${data['FDU-LITIGATIONHISTORY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_LH
    [Arguments]  ${file_path}
    log to console  "FDU-LITIGATIONHISTORY"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-ST
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Significant Transaction}  ${data['FDU-SIGNIFICANTTRANSACTIONEVENT']}
    log to console    ${data['FDU-SIGNIFICANTTRANSACTIONEVENT']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_ST
    [Arguments]  ${file_path}
    log to console  "FDU-SIGNIFICANTTRANSACTIONEVENT"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-QDPI
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Diversity of Plan Investments}  ${data['FDU-QUALITYANDDIVERSITY']}
    log to console    ${data['FDU-QUALITYANDDIVERSITY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_QDPI
    [Arguments]  ${file_path}
    log to console  "FDU-QUALITYANDDIVERSITY"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-DDF
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Defend Selection Factor}  ${data['FDU-DUTYTO DEFEND']}
    log to console    ${data['FDU-DUTYTO DEFEND']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_DDF
    [Arguments]  ${file_path}
    log to console  "FDU-DUTYTO DEFEND"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-DDF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-DDF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-DDF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-DDF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to FDU-EF
    [Arguments]   &{data}
    Check and enter input  ${Private-FDU-Endorsement Factor}  ${data['FDU-ENDORSEMENTFACTOR']}
    log to console    ${data['FDU-ENDORSEMENTFACTOR']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_FDU_EF
    [Arguments]  ${file_path}
    log to console  "FDU-ENDORSEMENTFACTOR"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

###CRIME
Default_Value_Validation_CRI_Private_Modifiers
    [Arguments]   &{data}
    log to console  *************************************************************
    log to console  "DEFAULT VALUES VERIFICATION - CRIME"
    log to console  *************************************************************
    ${TextP-CRI-Nature-of-Operations}=  get value  ${Text_Priv-CRI-Nature-of-Operations}
    ${TextP-CRI-Profile Of Workplace}=  get value  ${Text_Priv-CRI-Profile Of Workplace}
    ${TextP-CRI-Organizational Complex}=  get value  ${Text_Priv-CRI-Organizational Complex}
    ${TextP-CRI-Foreign Locn Exposure}=  get value  ${Text_Priv-CRI-Foreign Locn Exposure}
    ${TextP-CRI-High Value Proc Material}=  get value  ${Text_Priv-CRI-High Value Proc Material}
    ${TextP-CRI-Audit Functions}=  get value  ${Text_Priv-CRI-Audit Functions}
    ${TextP-CRI-Internal Controls}=  get value  ${Text_Priv-CRI-Internal Controls}
    ${TextP-CRI-Pre Emp Screening}=  get value  ${Text_Priv-CRI-Pre Emp Screening}
    ${TextP-CRI-Inventory Management}=  get value  ${Text_Priv-CRI-Inventory Management}
    ${TextP-CRI-Vendor Manage Guidelines}=  get value  ${Text_Priv-CRI-Vendor Manage Guidelines}
    ${TextP-CRI-Number of Years in Business}=  get value  ${Text_Priv-CRI-Number of Years in Business}
    ${TextP-CRI-Merger Divestiture Activity}=  get value  ${Text_Priv-CRI-Merger Divestiture Activity}
    ${TextP-CRI-Endorsement Factor}=  get value  ${Text_Priv-CRI-Endorsement Factor}
    ${Priv_DEF_CRI_NOP}=  get value  ${Private-CRI-Nature-of-Operations}
    ${Priv_DEF_CRI_POW}=  get value  ${Private-CRI-Profile Of Workplace}
    ${Priv_DEF_CRI_OC}=  get value  ${Private-CRI-Organizational Complex}
    ${Priv_DEF_CRI_FLE}=  get value  ${Private-CRI-Foreign Locn Exposure}
    ${Priv_DEF_CRI_HVPM}=  get value  ${Private-CRI-High Value Proc Material}
    ${Priv_DEF_CRI_AF}=  get value  ${Private-CRI-Audit Functions}
    ${Priv_DEF_CRI_IC}=  get value  ${Private-CRI-Internal Controls}
    ${Priv_DEF_CRI_PES}=  get value  ${Private-CRI-Pre Emp Screening}
    ${Priv_DEF_CRI_IM}=  get value  ${Private-CRI-Inventory Management}
    ${Priv_DEF_CRI_VMG}=  get value  ${Private-CRI-Vendor Manage Guidelines}
    ${Priv_DEF_CRI_NYB}=  get value  ${Private-CRI-Number of Years in Business}
    ${Priv_DEF_CRI_MAD}=  get value  ${Private-CRI-Merger Divestiture Activity}
    ${Priv_DEF_CRI_EF}=  get value  ${Private-CRI-Endorsement Factor}
    run keyword if  '${Priv_DEF_CRI_NOP}' == '0'  Check and enter input    ${Private-CRI-Nature-of-Operations}    ${data['CRI-NATUREOFOPERATIONS']}
    run keyword if   '${Priv_DEF_CRI_NOP}' == '${data['CRI-NATUREOFOPERATIONS']}'  log to console    ${TextP-CRI-Nature-of-Operations}:"${Priv_DEF_CRI_NOP}"  ELSE  run keywords  log to console  ${TextP-CRI-Nature-of-Operations}:${Priv_DEF_CRI_NOP} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Nature-of-Operations}  ${data['CRI-NATUREOFOPERATIONS']}
    run keyword if   '${Priv_DEF_CRI_POW}' == '${data['CRI-PROFILEOFWORKPLACE']}'  log to console    ${TextP-CRI-Profile Of Workplace}:"${Priv_DEF_CRI_POW}"  ELSE  run keywords  log to console  ${TextP-CRI-Profile Of Workplace}:${Priv_DEF_CRI_POW} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Profile Of Workplace}  ${data['CRI-PROFILEOFWORKPLACE']}
    run keyword if   '${Priv_DEF_CRI_OC}' == '${data['CRI-ORGANIZATIONALCOMPLEXITY']}'  log to console    ${TextP-CRI-Organizational Complex}:"${Priv_DEF_CRI_OC}"  ELSE  run keywords  log to console  ${TextP-CRI-Organizational Complex}:${Priv_DEF_CRI_OC} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Organizational Complex}  ${data['CRI-ORGANIZATIONALCOMPLEXITY']}
    run keyword if   '${Priv_DEF_CRI_FLE}' == '${data['CRI-FOREIGNLOCNEXPOSURE']}'  log to console    ${TextP-CRI-Foreign Locn Exposure}:"${Priv_DEF_CRI_FLE}"  ELSE  run keywords  log to console  ${TextP-CRI-Foreign Locn Exposure}:${Priv_DEF_CRI_FLE} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Foreign Locn Exposure}  ${data['CRI-FOREIGNLOCNEXPOSURE']}
    run keyword if   '${Priv_DEF_CRI_HVPM}' == '${data['CRI-HIGHVALUEPROCESSINGATERIALS']}'  log to console    ${TextP-CRI-High Value Proc Material}:"${Priv_DEF_CRI_HVPM}"  ELSE  run keywords  log to console  ${TextP-CRI-High Value Proc Material}:${Priv_DEF_CRI_HVPM} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-High Value Proc Material}  ${data['CRI-HIGHVALUEPROCESSINGATERIALS']}
    run keyword if   '${Priv_DEF_CRI_AF}' == '${data['CRI-AUDITFUNCTIONS']}'  log to console    ${TextP-CRI-Audit Functions}:"${Priv_DEF_CRI_AF}"  ELSE  run keywords  log to console  ${TextP-CRI-Audit Functions}:${Priv_DEF_CRI_AF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Audit Functions}  ${data['CRI-AUDITFUNCTIONS']}
    run keyword if   '${Priv_DEF_CRI_IC}' == '${data['CRI-INTERNALCONTROLS']}'  log to console    ${TextP-CRI-Internal Controls}:"${Priv_DEF_CRI_IC}"  ELSE  run keywords  log to console  ${TextP-CRI-Internal Controls}:${Priv_DEF_CRI_IC} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Internal Controls}  ${data['CRI-INTERNALCONTROLS']}
    run keyword if   '${Priv_DEF_CRI_PES}' == '${data['CRI-PREEMPLOYSCREENING']}'  log to console    ${TextP-CRI-Pre Emp Screening}:"${Priv_DEF_CRI_PES}"  ELSE  run keywords  log to console  ${TextP-CRI-Pre Emp Screening}:${Priv_DEF_CRI_PES} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Pre Emp Screening}  ${data['CRI-PREEMPLOYSCREENING']}
    run keyword if   '${Priv_DEF_CRI_IM}' == '${data['CRI-INVENTORYMANAGEMENT']}'  log to console    ${TextP-CRI-Inventory Management}:"${Priv_DEF_CRI_IM}"  ELSE  run keywords  log to console  ${TextP-CRI-Inventory Management}:${Priv_DEF_CRI_IM} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Inventory Management}  ${data['CRI-INVENTORYMANAGEMENT']}
    run keyword if   '${Priv_DEF_CRI_VMG}' == '${data['CRI-VENDORMANAGEMENTGUIDELINES']}'  log to console    ${TextP-CRI-Vendor Manage Guidelines}:"${Priv_DEF_CRI_VMG}"  ELSE  run keywords  log to console  ${TextP-CRI-Vendor Manage Guidelines}:${Priv_DEF_CRI_VMG} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Vendor Manage Guidelines}  ${data['CRI-VENDORMANAGEMENTGUIDELINES']}
    run keyword if   '${Priv_DEF_CRI_NYB}' == '${data['CRI-NUMBEROFYEARSINBUSINESS']}'  log to console    ${TextP-CRI-Number of Years in Business}:"${Priv_DEF_CRI_NYB}"  ELSE  run keywords  log to console  ${TextP-CRI-Number of Years in Business}:${Priv_DEF_CRI_NYB} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Number of Years in Business}  ${data['CRI-NUMBEROFYEARSINBUSINESS']}
    run keyword if   '${Priv_DEF_CRI_MAD}' == '${data['CRI-MERGERACQUISITIONDIVESTITURE']}'  log to console    ${TextP-CRI-Merger Divestiture Activity}:"${Priv_DEF_CRI_MAD}"  ELSE  run keywords  log to console  ${TextP-CRI-Merger Divestiture Activity}:${Priv_DEF_CRI_MAD} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Merger Divestiture Activity}  ${data['CRI-MERGERACQUISITIONDIVESTITURE']}
    run keyword if   '${Priv_DEF_CRI_EF}' == '${data['CRI-ENDORSEMENTFACTOR']}'  log to console    ${TextP-CRI-Endorsement Factor}:"${Priv_DEF_CRI_EF}"  ELSE  run keywords  log to console  ${TextP-CRI-Endorsement Factor}:${Priv_DEF_CRI_EF} - "ERROR-INVALID DEFAULT VALUE"  AND  Check and enter input  ${Private-CRI-Endorsement Factor}  ${data['CRI-ENDORSEMENTFACTOR']}


Enter Value to CRI-NOP
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Nature-of-Operations}  ${data['CRI-NATUREOFOPERATIONS']}
    log to console    ${data['CRI-NATUREOFOPERATIONS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_NOP
    [Arguments]  ${file_path}
    log to console  "CRIME-Nature of Operations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-POW
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Profile Of Workplace}  ${data['CRI-PROFILEOFWORKPLACE']}
    log to console    ${data['CRI-PROFILEOFWORKPLACE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_POW
    [Arguments]  ${file_path}
    log to console  "CRIME-Profile Of Workplace"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-POW  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-POW  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-POW  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-POW  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-OC
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Organizational Complex}  ${data['CRI-ORGANIZATIONALCOMPLEXITY']}
    log to console    ${data['CRI-ORGANIZATIONALCOMPLEXITY']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_OC
    [Arguments]  ${file_path}
    log to console  "CRIME-Organizational Complexity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-OC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-OC  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-OC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-OC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-FLE
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Foreign Locn Exposure}  ${data['CRI-FOREIGNLOCNEXPOSURE']}
    log to console    ${data['CRI-FOREIGNLOCNEXPOSURE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_FLE
    [Arguments]  ${file_path}
    log to console  "CRIME-Foreign Location Exposure"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-HVPM
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-High Value Proc Material}  ${data['CRI-HIGHVALUEPROCESSINGATERIALS']}
    log to console    ${data['CRI-HIGHVALUEPROCESSINGATERIALS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_HVPM
    [Arguments]  ${file_path}
    log to console  "CRIME-High Value Proc Material"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-HVPM  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-HVPM  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-HVPM  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-HVPM  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-AF
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Audit Functions}  ${data['CRI-AUDITFUNCTIONS']}
    log to console    ${data['CRI-AUDITFUNCTIONS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_AF
    [Arguments]  ${file_path}
    log to console  "CRIME-Audit Functions"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-AF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-AF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-AF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-AF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-IC
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Internal Controls}  ${data['CRI-INTERNALCONTROLS']}
    log to console    ${data['CRI-INTERNALCONTROLS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_IC
    [Arguments]  ${file_path}
    log to console  "CRIME-Internal Controls"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-IC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-IC  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-IC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-IC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-PES
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Pre Emp Screening}  ${data['CRI-PREEMPLOYSCREENING']}
    log to console    ${data['CRI-PREEMPLOYSCREENING']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_PES
    [Arguments]  ${file_path}
    log to console  "CRIME-Pre Employement Screening"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-PES  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-PES  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-PES  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-PES  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-IM
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Inventory Management}  ${data['CRI-INVENTORYMANAGEMENT']}
    log to console    ${data['CRI-INVENTORYMANAGEMENT']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_IM
    [Arguments]  ${file_path}
    log to console  "CRIME-Inventory Management"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-IM  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-IM  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-IM  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-IM  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-VMG
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Vendor Manage Guidelines}  ${data['CRI-VENDORMANAGEMENTGUIDELINES']}
    log to console    ${data['CRI-VENDORMANAGEMENTGUIDELINES']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_VMG
    [Arguments]  ${file_path}
    log to console  "CRIME-Vendor Management Guidelines"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-VMG  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-VMG  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-VMG  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-VMG  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-NYB
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Number of Years in Business}  ${data['CRI-NUMBEROFYEARSINBUSINESS']}
    log to console    ${data['CRI-NUMBEROFYEARSINBUSINESS']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_NYB
    [Arguments]  ${file_path}
    log to console  "CRIME-Number of Years in Business"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-NYB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-NYB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-NYB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-NYB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-MAD
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Merger Divestiture Activity}  ${data['CRI-MERGERACQUISITIONDIVESTITURE']}
    log to console    ${data['CRI-MERGERACQUISITIONDIVESTITURE']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_MAD
    [Arguments]  ${file_path}
    log to console  "CRIME-Merger Divestiture Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

Enter Value to CRI-EF
    [Arguments]   &{data}
    Check and enter input  ${Private-CRI-Endorsement Factor}  ${data['CRI-ENDORSEMENTFACTOR']}
    log to console    ${data['CRI-ENDORSEMENTFACTOR']}
    click element   ${Modifier_Apply}
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-COV-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-COV-ApplyChanges}

PM_CRI_EF
    [Arguments]  ${file_path}
    log to console  "CRIME-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value6
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value7
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

#Range-states(PA)-DNO-EPL-ELL
PM_RS_DNO_NOP
    [Arguments]  ${file_path}
    log to console  "DNO-Nature of Operations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-NOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_NYB
    [Arguments]  ${file_path}
    log to console   "DNO-NUMBEROFYEARSINBUSINESS"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-NYB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-NYB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-NYB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-NYB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_NOS
    [Arguments]  ${file_path}
    log to console    "DNO-NUMBEROFSUBSIDIARIES"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-NOS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-NOS  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-NOS  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-NOS  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_MAD
    [Arguments]  ${file_path}
    log to console  "DNO-Merger Divestiture Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-MAD  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_SOA
    [Arguments]  ${file_path}
    log to console   "DNO-Securities Offering Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-SOA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_MO
    [Arguments]  ${file_path}
    log to console  "DNO-Management Ownership"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-MO  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-MO  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-MO  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-MO  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_LH
    [Arguments]  ${file_path}
    log to console  "DNO-Litigation History"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-LH  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_STE
    [Arguments]  ${file_path}
    log to console  "DNO-Significant Transaction"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-STE  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_MSTAB
    [Arguments]  ${file_path}
    log to console  "DNO-Management Stability"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-MSTAB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_QBS
    [Arguments]  ${file_path}
    log to console  "DNO-QUALITY OF BALANCE SHEET"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-QBS  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_QIS
    [Arguments]  ${file_path}
    log to console  "DNO-QUALITY OF INCOME STATEMENT"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-QIS  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_QCF
    [Arguments]  ${file_path}
    log to console  "DNO-Statement of Cash Flows"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-QCF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_DDEF
    [Arguments]  ${file_path}
    log to console  "DNO-Duty to Defend Selection Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-DDEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-DDEF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_DNO_EFACT
    [Arguments]  ${file_path}
    log to console  "DNO-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to DNO-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

##Range-States(EPL)
PM_RS_EPL_HCL
    [Arguments]  ${file_path}
    log to console  "EPL-Hazard County Locations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-HCL  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_NYB
    [Arguments]  ${file_path}
    log to console  "EPL-Number of Years in Business"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-NYB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-NYB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-NYB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-NYB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_CA
    [Arguments]  ${file_path}
    log to console  "EPL-Past or Contemplated Layoff or Closing Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-CA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_ETO
    [Arguments]  ${file_path}
    log to console  "EPL-Employee Turnover"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-ETO  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_STE
    [Arguments]  ${file_path}
    log to console  "EPL-Private-EPL-Significant Transaction Event"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-STE  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_HR
    [Arguments]  ${file_path}
    log to console  "EPL-Human Resources"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-HR  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_NOP
    [Arguments]  ${file_path}
    log to console  "EPL-Nature of Operations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-NOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_MDA
    [Arguments]  ${file_path}
    log to console  "EPL-Merger, Acquisition, or Divestiture Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-MDA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_AC
    [Arguments]  ${file_path}
    log to console  "EPL-Annual Compensation"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-AC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-AC  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-AC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-AC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_LH
    [Arguments]  ${file_path}
    log to console  "EPL-Litigation History"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-LH  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_MSTAB
    [Arguments]  ${file_path}
    log to console  "EPL-Management Stability"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-MSTAB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_DDEF
    [Arguments]  ${file_path}
    log to console  "EPL-Duty to Defend Selection Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-DDEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-DDEF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_TPEF
    [Arguments]  ${file_path}
    log to console  "EPL-Third Party Exposure Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-TPEF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_TPDF
    [Arguments]  ${file_path}
    log to console  "EPL-Third Party Liability Coverage Deleted Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-TPDF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-TPDF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-TPDF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-TPDF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_EPL_EFACT
    [Arguments]  ${file_path}
    log to console  "EPL-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to EPL-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

#RS_ELL
PM_RS_ELL_AOP
    [Arguments]  ${file_path}
    log to console  "ELL-Area of Practice"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-AOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-AOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-AOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-AOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_ELL_LH
    [Arguments]  ${file_path}
    log to console  "ELL-Litigation History"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-LH  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_ELL_PDE
    [Arguments]  ${file_path}
    log to console  "ELL-Public Debt Exposure"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-PDE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-PDE  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-PDE  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-PDE  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_ELL_MDA
    [Arguments]  ${file_path}
    log to console  "ELL-Merger, Acquisition, or Divestiture Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-MDA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_ELL_ELR
    [Arguments]  ${file_path}
    log to console  "ELL-External Legal Resources"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-ELR  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-ELR  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-ELR  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-ELR  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_ELL_EEL
    [Arguments]  ${file_path}
    log to console  "ELL-Experience of Employed Lawyers"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-EEL  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-EEL  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-EEL  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-EEL  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_ELL_LSP
    [Arguments]  ${file_path}
    log to console  "ELL-Other Legal Services Performed"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-LSP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_ELL_DDEF
    [Arguments]  ${file_path}
    log to console  "ELL-Duty to Defend Selection Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-DDEF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-DDEF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-DDEF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_ELL_EFACT
    [Arguments]  ${file_path}
    log to console  "ELL-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to ELL-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

#RS_KNR

PM_RS_KNR_ROC
    [Arguments]  ${file_path}
    log to console  "KNR-Riskiness of Countries"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-ROC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_KNR_FOT
    [Arguments]  ${file_path}
    log to console  "KNR-Frequency of Travel"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-FOT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_KNR_SM
    [Arguments]  ${file_path}
    log to console  "KNR-Security Measures"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-SM  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_KNR_IG
    [Arguments]  ${file_path}
    log to console  "KNR-Industry Group"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-IG  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_KNR_TAP
    [Arguments]  ${file_path}
    log to console  "KNR-Travel Advisory Policy"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-TAP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_KNR_PEXP
    [Arguments]  ${file_path}
    log to console  "KNR-Product Exposure"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-PEXP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_KNR_EFACT
    [Arguments]  ${file_path}
    log to console  "KNR-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to KNR-EFACT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

### Range State DNO_CRIME
PM_RS_CRIME_NOP
    [Arguments]  ${file_path}
    log to console  "CRIME-Nature of Operations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-NOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_POW
    [Arguments]  ${file_path}
    log to console  "CRIME-Profile Of Workplace"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-POW  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-POW  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-POW  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-POW  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_OC
    [Arguments]  ${file_path}
    log to console  "CRIME-Organizational Complexity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-OC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-OC  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-OC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-OC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_FLE
    [Arguments]  ${file_path}
    log to console  "CRIME-Foreign Location Exposure"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-FLE  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_HVPM
    [Arguments]  ${file_path}
    log to console  "CRIME-High Value Proc Material"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-HVPM  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-HVPM  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-HVPM  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-HVPM  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_AF
    [Arguments]  ${file_path}
    log to console  "CRIME-Audit Functions"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-AF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-AF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-AF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-AF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_IC
    [Arguments]  ${file_path}
    log to console  "CRIME-Internal Controls"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-IC  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-IC  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-IC  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-IC  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_PES
    [Arguments]  ${file_path}
    log to console  "CRIME-Pre Employement Screening"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-PES  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-PES  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-PES  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-PES  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_IM
    [Arguments]  ${file_path}
    log to console  "CRIME-Inventory Management"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-IM  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-IM  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-IM  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-IM  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_VMG
    [Arguments]  ${file_path}
    log to console  "CRIME-Vendor Management Guidelines"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-VMG  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-VMG  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-VMG  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-VMG  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_NYB
    [Arguments]  ${file_path}
    log to console  "CRIME-Number of Years in Business"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-NYB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-NYB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-NYB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-NYB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_MAD
    [Arguments]  ${file_path}
    log to console  "CRIME-Merger Divestiture Activity"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-MAD  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_CRIME_EF
    [Arguments]  ${file_path}
    log to console  "CRIME-Endorsement Factor"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to CRI-EF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

#Range-states(PA)-DNO-FDU
PM_RS_FDU_NOP
    [Arguments]  ${file_path}
    log to console  "FDU-Nature of Operations"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-NOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_NYB
    [Arguments]  ${file_path}
    log to console   "FDU-NUMBEROFYEARSINBUSINESS"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-NYB  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-NYB  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-NYB  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-NYB  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_PTMFA
    [Arguments]  ${file_path}
    log to console  "FDU-PLANTERMINATION"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-PTMFA  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_PT
    [Arguments]  ${file_path}
    log to console  "FDU-PLANTYPE"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-PT  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-PT  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-PT  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-PT  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_ESOP
    [Arguments]  ${file_path}
    log to console  "FDU-EMPLOYEESTOCKOWNERSHIPPLAN"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-ESOP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_FSDBP
    [Arguments]  ${file_path}
    log to console  "FDU-FUNDINGSTATUSBENEFITPLANS"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-FSDBP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_PP
    [Arguments]  ${file_path}
    log to console  "FDU-PLANPARTICIPANTS"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-PP  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-PP  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-PP  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-PP  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_LH
    [Arguments]  ${file_path}
    log to console  "FDU-LITIGATIONHISTORY"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-LH  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_ST
    [Arguments]  ${file_path}
    log to console  "FDU-SIGNIFICANTTRANSACTIONEVENT"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-ST  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_QDPI
    [Arguments]  ${file_path}
    log to console  "FDU-QUALITYANDDIVERSITY"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-QDPI  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_DDF
    [Arguments]  ${file_path}
    log to console  "FDU-DUTYTO DEFEND"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-DDF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-DDF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-DDF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-DDF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}

PM_RS_FDU_EF
    [Arguments]  ${file_path}
    log to console  "FDU-ENDORSEMENTFACTOR"
    log to console  "VALID VALUE CHECKING"
    &{data}=  Read Column Data file  ${file_path}  Value2
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    &{data}=  Read Column Data file  ${file_path}  Value3
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    log to console  "INVALID VALUE CHECKING (NEGATIVE TESTING)"
    &{data}=  Read Column Data file  ${file_path}  Value4
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    Log to console  "RESTORE DEFAULT VALUE"
    &{data}=  Read Column Data file  ${file_path}  Value5
    Enter Value to FDU-EF  &{data}
    Validate Error Message DNO PM
    log to console  ${\n}