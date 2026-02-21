*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resource/Alternus_Res/Alt_Generic.robot
Resource    ../Generic.robot


*** Variables ***
${Rating_Base-Next} =    //input[@value='Next']
${ID-TerritoryJudgementFactor}=  id=Rows_0__Table_Corteges_9__3__Value
${ID-TravelDaysMediumRisk}=  id=Rows_0__Table_Corteges_16__3__Value
${ID-TravelJudgementFactor}=  id=Rows_0__Table_Corteges_18__3__Value
${ID_CyberExtortionSublimit}=  id=Rows_0__Table_Corteges_21__3__Value
${ID_RansomPerInsuredEvent}=  id=Rows_0__Table_Corteges_22__3__Value
${ID_AnnualAggregate}=  id=Rows_0__Table_Corteges_23__3__Value
${ID_SecurityConsultantFees}=  id=Rows_0__Table_Corteges_24__3__Value
${ID_AdditionalExpenses}=  id=Rows_0__Table_Corteges_25__3__Value
${ID_InsuredPerson}=  id=Rows_0__Table_Corteges_26__3__Value
${ID_PAPerPerson}=  id=Rows_0__Table_Corteges_28__3__Value
${ID_PAPerEvent}=  id=Rows_0__Table_Corteges_29__3__Value
${ID_Death%}=  id=Rows_0__Table_Corteges_30__3__Value
${ID_LossofLimb}=  id=Rows_0__Table_Corteges_31__3__Value
${ID_LossofExtremity}=  id=Rows_0__Table_Corteges_33__3__Value
${ID_SecurityConsultant}=  id=Rows_0__Table_Corteges_35__3__Value
${ID_Territory}=  id=Rows_0__Table_Corteges_36__3__Value
# threats expense
${ID_PerInsuredEventLimit}=  id=Rows_1__Table_Corteges_0__3__Value
${ID_AnnualAggregate}=  id=Rows_1__Table_Corteges_1__3__Value
${ID_IndemnityPeriod}=  id=Rows_1__Table_Corteges_2__3__Value
${ID_EndorsementPremium}=  id=Rows_1__Table_Corteges_3__3__Value
# Travel Evacuation
${ID_TravelPerInsuredEventLimit}=  id=Rows_4__Table_Corteges_0__3__Value
${ID_TravelAnnualAggregate}=  id=Rows_4__Table_Corteges_1__3__Value
${ID_TravelPerInsuredPersonLimit}=  id=Rows_4__Table_Corteges_2__3__Value
${ID_TravelPersonalEffectsPersonalLimit}=  id=Rows_4__Table_Corteges_3__3__Value
${ID_TravelSecurityConsultantFees}=  id=Rows_4__Table_Corteges_4__3__Value
${ID_TravelExcludedCountries}=  id=Rows_4__Table_Corteges_5__3__Value
# Alternate Loss
${ID_AltPerInsuredEventLimit}=  id=Rows_7__Table_Corteges_0__3__Value
${ID_AltCyberEventSublimit}=  id=Rows_7__Table_Corteges_1__3__Value
${ID_ALtCyberAnnAggSublimit}=  id=Rows_7__Table_Corteges_2__3__Value
${ID_ALtIndemnityPeriod}=  id=Rows_7__Table_Corteges_3__3__Value
${ID_AltWaitingPeriod}=  id=Rows_7__Table_Corteges_4__3__Value
${ID_AltInvestigatingAccountants}=  id=Rows_7__Table_Corteges_5__3__Value
${ID_AltLOELimitOverride}=  id=Rows_7__Table_Corteges_6__3__Value
${ID_AltEndorsementPremium}=  id=Rows_7__Table_Corteges_7__3__Value
# Apply & Continue
${ID_ApplyContinueButton}=  //input[@value='Apply & Continue']

####ASRM K12 Risk####
###Territory Exposure###
${ID_Territory Judgement Factor_ASRM_K12}=    id=Rows_0__Table_Corteges_12__3__Value
${ID_Territory Exposure_ASRM_K12}=   id=Rows_0__Table_Corteges_13__3__Value
###Insured Person###
${ID_Insured Person_ASRM_K12}=   id=Rows_0__Table_Corteges_14__3__Value
###Prevention Fund###
${ID_Prevention Fund_ASRM_K12}=   id=Rows_0__Table_Corteges_15__3__Value
###Security Consultant###
${ID_Security Consultant_ASRM_K12}=    id=Rows_0__Table_Corteges_16__3__Value
###Territory###
${ID_Territory_ASRM_K12}=   id=Rows_0__Table_Corteges_17__3__Value
###Cyber Extortion Sublimit###
${ID_Ransom Per Insured Event_ASRM_K12}=   id=Rows_0__Table_Corteges_18__3__Value
${ID_Annual Aggregate_ASRM_K12}=   id=Rows_0__Table_Corteges_19__3__Value
${ID_Security Consultant Fees_ASRM_K12}=   id=Rows_0__Table_Corteges_20__3__Value
${ID_Additional Expenses Limit Override_ASRM_K12}=  id=Rows_0__Table_Corteges_21__3__Value
###Personal Accident###
${ID_PA Per Person_ASRM_K12}=   id=Rows_0__Table_Corteges_22__3__Value
${ID_PA Per Event_ASRM_K12}=   id=Rows_0__Table_Corteges_23__3__Value
${ID_Death %_ASRM_K12}=    id=Rows_0__Table_Corteges_24__3__Value
${ID_Loss of Limb/Sight %_ASRM_K12}=   id=Rows_0__Table_Corteges_25__3__Value
${ID_Permanent Disablement %_ASRM_K12}=   id=Rows_0__Table_Corteges_26__3__Value
${ID_Loss of Extremity %_ASRM_K12}=   id=Rows_0__Table_Corteges_27__3__Value
${ID_Total Ratables_ASRM_K12}=   id=TotalRatables
###Express Kidnap (ASRM) (1ExpressKidnapASRM)###
${ID_Per Insured Event Limit_1_ASRM_K12}=    id=Rows_1__Table_Corteges_0__3__Value
${ID_Endorsement Premium_1_ASRM_K12}=   id=Rows_1__Table_Corteges_1__3__Value
${ID_Personal Accident Per Person_1_ASRM_K12}=   id=Rows_1__Table_Corteges_2__3__Value
${ID_Personal Accident Per Event_1_ASRM_K12}=    id=Rows_1__Table_Corteges_3__3__Value
${ID_Total Ratables_1_ASRM_K12}=   id=TotalRatables
###Threat Expense (ASRM) (1ThreatExpenseASRM)###
${ID_Per Insured Event Limit_2_ASRM_K12}=   id=Rows_2__Table_Corteges_0__3__Value
${ID_Annual Aggregate_2_ASRM_K12}=   id=Rows_2__Table_Corteges_1__3__Value
${ID_Indemnity Period_2_ASRM_K12}=  id=Rows_2__Table_Corteges_2__3__Value
${ID_Excluded Countries_2_ASRM_K12}=   id=Rows_2__Table_Corteges_3__3__Value
${ID_Deductible_2_ASRM_K12}=   id=Rows_2__Table_Corteges_4__3__Value
${ID_Endorsement Premium_2_ASRM_K12}=   id=Rows_2__Table_Corteges_5__3__Value
${ID_Total Ratables_2_ASRM_K12}=   id=TotalRatables
###Disappearance Investigation and Expense Endorsement (ASRM) (1DissapEndorsementASRM)###
${ID_Per Insured Event Limit_3_ASRM_K12}=   id=Rows_3__Table_Corteges_0__3__Value
${ID_Indemnity Period_3_ASRM_K12}=  id=Rows_3__Table_Corteges_1__3__Value
${ID_Endorsement Premium_3_ASRM_K12}=   id=Rows_3__Table_Corteges_2__3__Value
${ID_Total Ratables_3_ASRM_K12}=   id=TotalRatables
###Expatriate Security Evacuation Endorsement (ASRM) (1ExpSecEvacEndorsementE305)###
${ID_Per Insured Event Limit_4_ASRM_K12}=   id=Rows_4__Table_Corteges_0__3__Value
${ID_Annual Aggregate_4_ASRM_K12}=   id=Rows_4__Table_Corteges_1__3__Value
${ID_Evacuation Cost/Person Limit_4_ASRM_K12}=   id=Rows_4__Table_Corteges_2__3__Value
${ID_Relocation Cost/Person Limit_4_ASRM_K12}=   id=Rows_4__Table_Corteges_3__3__Value
${ID_Personal Effects/Person Limit_4_ASRM_K12}=   id=Rows_4__Table_Corteges_4__3__Value
${ID_Security Consultant Fees_4_ASRM_K12}=   id=Rows_4__Table_Corteges_5__3__Value
${ID_Excluded Countries_4_ASRM_K12}=    id=Rows_4__Table_Corteges_6__3__Value
${ID_Alert Level_4_ASRM_K12}=    id=Rows_4__Table_Corteges_7__3__Value
${ID_Endorsement Premium_4_ASRM_K12}=   id=Rows_4__Table_Corteges_8__3__Value
${ID_Total Ratables_4_ASRM_K12}=   id=TotalRatables
###Travel Evacuation Endorsement (ASRM) form K&R E307 CW (01/09) (1TravEvacEndorsementE307)###
${ID_Per Insured Event Limit_5_ASRM_K12}=   id=Rows_5__Table_Corteges_0__3__Value
${ID_Annual Aggregate_5_ASRM_K12}=   id=Rows_5__Table_Corteges_1__3__Value
${ID_Per Insured Person Limit_5_ASRM_K12}=   id=Rows_5__Table_Corteges_2__3__Value
${ID_Personal Effects/Person Limit_5_ASRM_K12}=   id=Rows_5__Table_Corteges_3__3__Value
${ID_Security Consultant Fees_5_ASRM_K12}=   id=Rows_5__Table_Corteges_4__3__Value
${ID_Excluded Countries_5_ASRM_K12}=    id=Rows_5__Table_Corteges_5__3__Value
${ID_Alert Level_5_ASRM_K12}=    id=Rows_5__Table_Corteges_6__3__Value
${ID_Endorsement Premium_5_ASRM_K12}=   id=Rows_5__Table_Corteges_7__3__Value
${ID_Total Ratables_5_ASRM_K12}=   id=TotalRatables
###Standard Child Abduction Endorsement (ASRM), form K&R E308 CW (01/09) (1StandChildAbdEndorsementASRME308)###
${ID_Per Insured Event Limit_6_ASRM_K12}=   id=Rows_6__Table_Corteges_0__3__Value
${ID_Endorsement Premium_6_ASRM_K12}=   id=Rows_6__Table_Corteges_1__3__Value
${ID_Total Ratables_6_ASRM_K12}=   id=TotalRatables

####ASRM Risk####
###Territory Exposure###
${ID_Territory Judgement Factor_ASRM}=    id=Rows_0__Table_Corteges_15__3__Value
${ID_Territory Exposure_ASRM}=   id=Rows_0__Table_Corteges_16__3__Value
###Insured Person###
${ID_Insured Person_ASRM}=   id=Rows_0__Table_Corteges_17__3__Value
###Prevention Fund###
${ID_Prevention Fund_ASRM}=   id=Rows_0__Table_Corteges_18__3__Value
###Security Consultant###
${ID_Security Consultant_ASRM}=    id=Rows_0__Table_Corteges_19__3__Value
###Territory###
${ID_Territory_ASRM}=   id=Rows_0__Table_Corteges_20__3__Value
###Cyber Extortion Sublimit###
${ID_Ransom Per Insured Event_ASRM}=   id=Rows_0__Table_Corteges_21__3__Value
${ID_Annual Aggregate_ASRM}=   id=Rows_0__Table_Corteges_22__3__Value
${ID_Security Consultant Fees_ASRM}=   id=Rows_0__Table_Corteges_23__3__Value
${ID_Additional Expenses Limit Override_ASRM}=  id=Rows_0__Table_Corteges_24__3__Value
###Personal Accident###
${ID_PA Per Person_ASRM}=   id=Rows_0__Table_Corteges_25__3__Value
${ID_PA Per Event_ASRM}=   id=Rows_0__Table_Corteges_26__3__Value
${ID_Death %_ASRM}=    id=Rows_0__Table_Corteges_27__3__Value
${ID_Loss of Limb/Sight %_ASRM}=   id=Rows_0__Table_Corteges_28__3__Value
${ID_Permanent Disablement %_ASRM}=   id=Rows_0__Table_Corteges_29__3__Value
${ID_Loss of Extremity %_ASRM}=   id=Rows_0__Table_Corteges_30__3__Value
${ID_Total Ratables_ASRM}=   id=TotalRatables
###Express Kidnap (ASRM) (1ExpressKidnapASRM)###
${ID_Per Insured Event Limit_1_ASRM}=    id=Rows_1__Table_Corteges_0__3__Value
${ID_Endorsement Premium_1_ASRM}=   id=Rows_1__Table_Corteges_1__3__Value
${ID_Personal Accident Per Person_1_ASRM}=   id=Rows_1__Table_Corteges_2__3__Value
${ID_Personal Accident Per Event_1_ASRM}=    id=Rows_1__Table_Corteges_3__3__Value
${ID_Total Ratables_1_ASRM}=   id=TotalRatables
###Threat Expense (ASRM) (1ThreatExpenseASRM)###
${ID_Per Insured Event Limit_2_ASRM}=   id=Rows_2__Table_Corteges_0__3__Value
${ID_Annual Aggregate_2_ASRM}=   id=Rows_2__Table_Corteges_1__3__Value
${ID_Indemnity Period_2_ASRM}=  id=Rows_2__Table_Corteges_2__3__Value
${ID_Excluded Countries_2_ASRM}=   id=Rows_2__Table_Corteges_3__3__Value
${ID_Deductible_2_ASRM}=   id=Rows_2__Table_Corteges_4__3__Value
${ID_Animal Research (y/n)_2_ASRM}=    id=Rows_2__Table_Corteges_5__3__Value
${ID_Endorsement Premium_2_ASRM}=   id=Rows_2__Table_Corteges_6__3__Value
${ID_Total Ratables_2_ASRM}=   id=TotalRatables
###Disappearance Investigation and Expense Endorsement (ASRM) (1DissapEndorsementASRM)###
${ID_Per Insured Event Limit_3_ASRM}=   id=Rows_3__Table_Corteges_0__3__Value
${ID_Indemnity Period_3_ASRM}=  id=Rows_3__Table_Corteges_1__3__Value
${ID_Endorsement Premium_3_ASRM}=   id=Rows_3__Table_Corteges_2__3__Value
${ID_Total Ratables_3_ASRM}=   id=TotalRatables
###Expatriate Security Evacuation Endorsement (ASRM) (1ExpSecEvacEndorsementE305)###
${ID_Per Insured Event Limit_4_ASRM}=   id=Rows_4__Table_Corteges_0__3__Value
${ID_Annual Aggregate_4_ASRM}=   id=Rows_4__Table_Corteges_1__3__Value
${ID_Evacuation Cost/Person Limit_4_ASRM}=   id=Rows_4__Table_Corteges_2__3__Value
${ID_Relocation Cost/Person Limit_4_ASRM}=   id=Rows_4__Table_Corteges_3__3__Value
${ID_Personal Effects/Person Limit_4_ASRM}=   id=Rows_4__Table_Corteges_4__3__Value
${ID_Security Consultant Fees_4_ASRM}=   id=Rows_4__Table_Corteges_5__3__Value
${ID_Excluded Countries_4_ASRM}=    id=Rows_4__Table_Corteges_6__3__Value
${ID_Alert Level_4_ASRM}=    id=Rows_4__Table_Corteges_7__3__Value
${ID_Endorsement Premium_4_ASRM}=   id=Rows_4__Table_Corteges_8__3__Value
${ID_Total Ratables_4_ASRM}=   id=TotalRatables
###Travel Evacuation Endorsement (ASRM) form K&R E307 CW (01/09) (1TravEvacEndorsementE307)###
${ID_Per Insured Event Limit_5_ASRM}=   id=Rows_5__Table_Corteges_0__3__Value
${ID_Annual Aggregate_5_ASRM}=   id=Rows_5__Table_Corteges_1__3__Value
${ID_Per Insured Person Limit_5_ASRM}=   id=Rows_5__Table_Corteges_2__3__Value
${ID_Personal Effects/Person Limit_5_ASRM}=   id=Rows_5__Table_Corteges_3__3__Value
${ID_Security Consultant Fees_5_ASRM}=   id=Rows_5__Table_Corteges_4__3__Value
${ID_Excluded Countries_5_ASRM}=    id=Rows_5__Table_Corteges_5__3__Value
${ID_Alert Level_5_ASRM}=    id=Rows_5__Table_Corteges_6__3__Value
${ID_Endorsement Premium_5_ASRM}=    id=Rows_5__Table_Corteges_7__3__Value
${ID_Total Ratables_5_ASRM}=   id=TotalRatables
###Standard Child Abduction Endorsement (ASRM), form K&R E308 CW (01/09) (1StandChildAbdEndorsementASRME308)###
${ID_Per Insured Event Limit_6_ASRM}=   id=Rows_6__Table_Corteges_0__3__Value
${ID_Endorsement Premium_6_ASRM}=    id=Rows_6__Table_Corteges_1__3__Value
${ID_Total Ratables_6_ASRM}=   id=TotalRatables
###Private
${ID_ELL Lawyers}=  //input[@id='Rows_3__Table_Corteges_0__3__Value']
${ID_KNR_Employee count}=  //input[@id='Rows_5__Table_Corteges_0__3__Value']
${ID-RB-ERP}=  id=Rows_0__Table_Corteges_8__3__Value
${ID-RB-ERP2}=  id=Rows_0__Table_Corteges_9__3__Value
${ID-RB-ERP3}=  id=Rows_0__Table_Corteges_10__3__Value
${ID-RB-Runoff}=  id=Rows_0__Table_Corteges_11__3__Value
${ID-RB-Runoff3}=  id=Rows_0__Table_Corteges_12__3__Value
${ID-RB-Runoff6}=  id=Rows_0__Table_Corteges_13__3__Value

*** Keywords ***
Private Rating Base
    [Arguments]  &{test_data}
    wait until element is not visible   globalAjaxLoading  100
    Check and enter input    ${ID_ELL Lawyers}   ${test_data['How many lawyers does the organization have on staff?']}
    Wait Until Element Is Visible    ${ID_KNR_Employee count}   5s
    sleep  2s
    Check and enter input   ${ID_KNR_Employee count}  ${test_data['KNR-Employee-Count']}
    Rating Base

Rating Base
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID-UMS-Apply&Continue}
    wait until element is not visible   globalAjaxLoading  100
    ${Apply_changes}=  run keyword and return status    element should be visible   ${ID-UMS-ApplyChanges}
    run keyword if    ${Apply_changes}    click element    ${ID-UMS-ApplyChanges}
    wait until element is not visible   globalAjaxLoading  100

Entering For KNR
    [Arguments]  ${test_data}
    wait until element is visible  ${ID-TerritoryJudgementFactor}
    Check and enter input  ${ID-TerritoryJudgementFactor}  ${test_data['Territory Judgment Factor']}
    wait until element is visible   ${ID-TravelDaysMediumRisk}
    Check and enter input  ${ID-TravelDaysMediumRisk}  ${test_data['Travel days scale in Medium risk conditions']}
    wait until element is visible  ${ID-TravelJudgementFactor}
    Scroll Element Into View  ${ID-TravelJudgementFactor}
    Check and enter input  ${ID-TravelJudgementFactor}  ${test_data['Travel Judgement Factor']}
    wait until element is visible  ${ID_CyberExtortionSublimit}
    Scroll Element Into View  ${ID_CyberExtortionSublimit}
    Check and enter input  ${ID_CyberExtortionSublimit}  ${test_data['Cyber Extortion Sublimit']}
    wait until element is visible  ${ID_RansomPerInsuredEvent}
    Scroll Element Into View  ${ID_RansomPerInsuredEvent}
    Check and enter input  ${ID_RansomPerInsuredEvent}  ${test_data['Cyber Extortion Sublimit']}
    wait until element is visible  ${ID_SecurityConsultantFees}
    Scroll Element Into View  ${ID_SecurityConsultantFees}
    Check and enter input  ${ID_SecurityConsultantFees}  ${test_data['Security Consultant Fees']}
    wait until element is visible  ${ID_AdditionalExpenses}
    Scroll Element Into View  ${ID_AdditionalExpenses}
    Check and enter input  ${ID_AdditionalExpenses}  ${test_data['Additional Expenses Limit Override']}
    wait until element is visible  ${ID_InsuredPerson}
    Scroll Element Into View  ${ID_InsuredPerson}
    Check and enter input  ${ID_InsuredPerson}  ${test_data['Insured Person']}
    wait until element is visible  ${ID_PAPerPerson}
    Scroll Element Into View  ${ID_PAPerPerson}
    Check and enter input  ${ID_PAPerPerson}  ${test_data['PA Per Person']}
    wait until element is visible  ${ID_PAPerEvent}
    Scroll Element Into View  ${ID_PAPerEvent}
    Check and enter input  ${ID_PAPerEvent}  ${test_data['PA Per Event']}
    wait until element is visible  ${ID_Death%}
    Scroll Element Into View  ${ID_Death%}
    Check and enter input  ${ID_Death%}  ${test_data['Death %']}
    wait until element is visible  ${ID_LossofLimb}
    Scroll Element Into View  ${ID_LossofLimb}
    Check and enter input  ${ID_LossofLimb}  ${test_data['Loss of Limb/Sight %']}
    wait until element is visible  ${ID_LossofExtremity}
    Scroll Element Into View  ${ID_LossofExtremity}
    Check and enter input  ${ID_LossofExtremity}  ${test_data['Loss of Extremity %']}
    wait until element is visible  ${ID_SecurityConsultant}
    Scroll Element Into View  ${ID_SecurityConsultant}
    Check and enter input  ${ID_SecurityConsultant}  ${test_data['Security Consultant']}
    wait until element is visible  ${ID_Territory}
    Scroll Element Into View  ${ID_Territory}
    Check and enter input  ${ID_Territory}  ${test_data['Territory']}

Threat Expense
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_PerInsuredEventLimit}
    Scroll Element Into View  ${ID_PerInsuredEventLimit}
    Check and enter input  ${ID_PerInsuredEventLimit}  ${test_data['Per Insured Event Limit']}
    wait until element is visible  ${ID_AnnualAggregate}
    Scroll Element Into View  ${ID_AnnualAggregate}
    Check and enter input  ${ID_AnnualAggregate}  ${test_data['Annual Aggregate']}
    wait until element is visible  ${ID_IndemnityPeriod}
    Scroll Element Into View  ${ID_IndemnityPeriod}
    Check and enter input  ${ID_IndemnityPeriod}  ${test_data['Indemnity Period']}
    wait until element is visible  ${ID_EndorsementPremium}
    Scroll Element Into View  ${ID_EndorsementPremium}
    Check and enter input  ${ID_EndorsementPremium}  ${test_data['Endorsement Premium']}

Travel Evacuation Endorsement E306
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_TravelPerInsuredEventLimit}
    Scroll Element Into View  ${ID_TravelPerInsuredEventLimit}
    Check and enter input  ${ID_TravelPerInsuredEventLimit}  ${test_data['Travel_Per Insured Event Limit']}
    wait until element is visible  ${ID_TravelAnnualAggregate}
    Scroll Element Into View  ${ID_TravelAnnualAggregate}
    Check and enter input  ${ID_TravelAnnualAggregate}  ${test_data['Travel_Annual Aggregate']}
    wait until element is visible  ${ID_TravelPerInsuredPersonLimit}
    Scroll Element Into View  ${ID_TravelPerInsuredPersonLimit}
    Check and enter input  ${ID_TravelPerInsuredPersonLimit}  ${test_data['Travel_Per Insured Person Limit']}
    wait until element is visible  ${ID_TravelPersonalEffectsPersonalLimit}
    Scroll Element Into View  ${ID_TravelPersonalEffectsPersonalLimit}
    Check and enter input  ${ID_TravelPersonalEffectsPersonalLimit}  ${test_data['Travel_Personal Effects/Personal Limit']}
    wait until element is visible  ${ID_TravelSecurityConsultantFees}
    Scroll Element Into View  ${ID_TravelSecurityConsultantFees}
    Check and enter input  ${ID_TravelSecurityConsultantFees}  ${test_data['Travel_Security Consultant Fees']}
    wait until element is visible  ${ID_TravelExcludedCountries}
    Scroll Element Into View  ${ID_TravelExcludedCountries}
    Check and enter input  ${ID_TravelExcludedCountries}  ${test_data['Travel_Excluded Countries']}

Alternate Loss of Earnings Endorsement 314
    [Arguments]  ${test_data}
    #wait until element is visible  ${ID_AltPerInsuredEventLimit}
    #Scroll Element Into View  ${ID_AltPerInsuredEventLimit}
    #Check and enter input  ${ID_AltPerInsuredEventLimit}  ${test_data['Alt_Per Insured Event Limit']}
    #wait until element is visible  ${ID_AltCyberEventSublimit}
    #Scroll Element Into View  ${ID_AltCyberEventSublimit}
    #Check and enter input  ${ID_AltCyberEventSublimit}  ${test_data['Alt_Cyber Event Sublimit']}
    #wait until element is visible  ${ID_ALtCyberAnnAggSublimit}
    #Scroll Element Into View  ${ID_ALtCyberAnnAggSublimit}
    #Check and enter input  ${ID_ALtCyberAnnAggSublimit}  ${test_data['Alt_Cyber Ann Agg Sublimit']}
    #wait until element is visible  ${ID_ALtIndemnityPeriod}
    #Scroll Element Into View  ${ID_ALtIndemnityPeriod}
    #Check and enter input  ${ID_ALtIndemnityPeriod}  ${test_data['Alt_Indemnity Period']}
    #wait until element is visible  ${ID_AltWaitingPeriod}
    #Scroll Element Into View  ${ID_AltWaitingPeriod}
    #Check and enter input  ${ID_AltWaitingPeriod}  ${test_data['Alt_Waiting Period']}
    #wait until element is visible  ${ID_AltInvestigatingAccountants}
    #Scroll Element Into View  ${ID_AltInvestigatingAccountants}
    #Check and enter input  ${ID_AltInvestigatingAccountants}  ${test_data['Alt_Investigating Accountants']}
    #wait until element is visible  ${ID_AltLOELimitOverride}
    #Scroll Element Into View  ${ID_AltLOELimitOverride}
    #Check and enter input  ${ID_AltLOELimitOverride}  ${test_data['Alt_LOE Limit Override']}
    #sleep  2s
    #wait until element is visible  ${ID_AltEndorsementPremium}
    #Scroll Element Into View  ${ID_AltEndorsementPremium}
    #Check and enter input  ${ID_AltEndorsementPremium}  ${test_data['Alt_Endorsement Premium']}
    #wait until element is not visible   globalAjaxLoading  100
    click element    ${ID_ApplyContinueButton}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID_ApplyContinueButton}

Entering For KNR for ASRM Risk
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_Territory Judgement Factor_ASRM}
    Check and enter input  ${ID_Territory Judgement Factor_ASRM}  ${test_data['Territory Judgment Factor']}
    wait until element is visible  ${ID_Ransom Per Insured Event_ASRM}
    Scroll Element Into View  ${ID_Ransom Per Insured Event_ASRM}
    Check and enter input  ${ID_Ransom Per Insured Event_ASRM}  ${test_data['Ransom Per Insured Event']}
    wait until element is visible  ${ID_Annual Aggregate_ASRM}
    Scroll Element Into View  ${ID_Annual Aggregate_ASRM}
    Check and enter input  ${ID_Annual Aggregate_ASRM}  ${test_data['Annual Aggregate']}
    wait until element is visible  ${ID_Security Consultant Fees_ASRM}
    Scroll Element Into View  ${ID_Security Consultant Fees_ASRM}
    Check and enter input  ${ID_Security Consultant Fees_ASRM}  ${test_data['Security Consultant Fees']}
    wait until element is visible  ${ID_Additional Expenses Limit Override_ASRM}
    Scroll Element Into View  ${ID_Additional Expenses Limit Override_ASRM}
    Check and enter input  ${ID_Additional Expenses Limit Override_ASRM}  ${test_data['Additional Expenses Limit Override']}
    wait until element is visible  ${ID_Insured Person_ASRM}
    Scroll Element Into View  ${ID_Insured Person_ASRM}
    Check and enter input  ${ID_Insured Person_ASRM}  ${test_data['Insured Person']}
    wait until element is visible  ${ID_PA Per Person_ASRM}
    Scroll Element Into View  ${ID_PA Per Person_ASRM}
    Check and enter input  ${ID_PA Per Person_ASRM}  ${test_data['PA Per Person']}
    wait until element is visible  ${ID_PA Per Event_ASRM}
    Scroll Element Into View  ${ID_PA Per Event_ASRM}
    Check and enter input  ${ID_PA Per Event_ASRM}  ${test_data['PA Per Event']}
    wait until element is visible  ${ID_Death %_ASRM}
    Scroll Element Into View  ${ID_Death %_ASRM}
    Check and enter input  ${ID_Death %_ASRM}  ${test_data['Death %']}
    wait until element is visible  ${ID_Loss of Limb/Sight %_ASRM}
    Scroll Element Into View  ${ID_Loss of Limb/Sight %_ASRM}
    Check and enter input  ${ID_Loss of Limb/Sight %_ASRM}  ${test_data['Loss of Limb/Sight %']}
    wait until element is visible  ${ID_Loss of Extremity %_ASRM}
    Scroll Element Into View  ${ID_Loss of Extremity %_ASRM}
    Check and enter input  ${ID_Loss of Extremity %_ASRM}  ${test_data['Loss of Extremity %']}
    wait until element is visible  ${ID_Security Consultant_ASRM}
    Scroll Element Into View  ${ID_Security Consultant_ASRM}
    Check and enter input  ${ID_Security Consultant_ASRM}  ${test_data['Security Consultant']}
    wait until element is visible  ${ID_Territory_ASRM}
    Scroll Element Into View  ${ID_Territory_ASRM}
    Check and enter input  ${ID_Territory_ASRM}  ${test_data['Territory']}

Threat Expense for ASRM Risk
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_Per Insured Event Limit_2_ASRM}
    Scroll Element Into View  ${ID_Per Insured Event Limit_2_ASRM}
    Check and enter input  ${ID_Per Insured Event Limit_2_ASRM}  ${test_data['Per Insured Event Limit']}
    wait until element is visible  ${ID_Annual Aggregate_2_ASRM}
    Scroll Element Into View  ${ID_Annual Aggregate_2_ASRM}
    Check and enter input  ${ID_Annual Aggregate_2_ASRM}  ${test_data['Annual Aggregate']}
    wait until element is visible  ${ID_Indemnity Period_2_ASRM}
    Scroll Element Into View  ${ID_Indemnity Period_2_ASRM}
    Check and enter input  ${ID_Indemnity Period_2_ASRM}  ${test_data['Indemnity Period']}
    wait until element is visible  ${ID_Endorsement Premium_2_ASRM}
    Scroll Element Into View  ${ID_Endorsement Premium_2_ASRM}
    Check and enter input  ${ID_Endorsement Premium_2_ASRM}  ${test_data['Endorsement Premium']}

Travel Evacuation Endorsement E307 for ASRM Risk
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_Per Insured Event Limit_5_ASRM}
    Scroll Element Into View  ${ID_Per Insured Event Limit_5_ASRM}
    Check and enter input  ${ID_Per Insured Event Limit_5_ASRM}  ${test_data['Travel_Per Insured Event Limit']}
    wait until element is visible  ${ID_Annual Aggregate_5_ASRM}
    Scroll Element Into View  ${ID_Annual Aggregate_5_ASRM}
    Check and enter input  ${ID_Annual Aggregate_5_ASRM}  ${test_data['Travel_Annual Aggregate']}
    wait until element is visible  ${ID_Per Insured Person Limit_5_ASRM}
    Scroll Element Into View  ${ID_Per Insured Person Limit_5_ASRM}
    Check and enter input  ${ID_Per Insured Person Limit_5_ASRM}  ${test_data['Travel_Per Insured Person Limit']}
    wait until element is visible  ${ID_Personal Effects/Person Limit_5_ASRM}
    Scroll Element Into View  ${ID_Personal Effects/Person Limit_5_ASRM}
    Check and enter input  ${ID_Personal Effects/Person Limit_5_ASRM}  ${test_data['Travel_Personal Effects/Personal Limit']}
    wait until element is visible  ${ID_Security Consultant Fees_5_ASRM}
    Scroll Element Into View  ${ID_Security Consultant Fees_5_ASRM}
    Check and enter input  ${ID_Security Consultant Fees_5_ASRM}}  ${test_data['Travel_Security Consultant Fees']}
    wait until element is visible  ${ID_Excluded Countries_5_ASRM}
    Scroll Element Into View  ${ID_Excluded Countries_5_ASRM}
    Check and enter input  ${ID_Excluded Countries_5_ASRM}  ${test_data['Travel_Excluded Countries']


Alternate Loss of Earnings Endorsement 315 for ASRM Risk
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_Per Insured Event Limit_7_ASRM}
    Scroll Element Into View  ${ID_Per Insured Event Limit_7_ASRM}
    Check and enter input  ${ID_Per Insured Event Limit_7_ASRM}  ${test_data['Alt_Per Insured Event Limit']}
    wait until element is visible  ${ID_Cyber Event Sublimit_7_ASRM}
    Scroll Element Into View  ${ID_Cyber Event Sublimit_7_ASRM}
    Check and enter input  ${ID_Cyber Event Sublimit_7_ASRM}  ${test_data['Alt_Cyber Event Sublimit']}
    wait until element is visible  ${ID_Cyber Annual Agg Sublimit_7_ASRM}
    Scroll Element Into View  ${ID_Cyber Annual Agg Sublimit_7_ASRM}
    Check and enter input  ${ID_Cyber Annual Agg Sublimit_7_ASRM}  ${test_data['Alt_Cyber Ann Agg Sublimit']}
    wait until element is visible  ${ID_Indemnity Period_7_ASRM}
    Scroll Element Into View  ${ID_Indemnity Period_7_ASRM}
    Check and enter input  ${ID_Indemnity Period_7_ASRM}  ${test_data['Alt_Indemnity Period']}
    wait until element is visible  ${ID_Waiting Period_7_ASRM}
    Scroll Element Into View  ${ID_Waiting Period_7_ASRM}
    Check and enter input  ${ID_Waiting Period_7_ASRM}  ${test_data['Alt_Waiting Period']}
    wait until element is visible  ${ID_Investigating Accountants_7_ASRM}
    Scroll Element Into View  ${ID_Investigating Accountants_7_ASRM}
    Check and enter input  ${ID_Investigating Accountants_7_ASRM}  ${test_data['Alt_Investigating Accountants']}
    wait until element is visible  ${ID_LOE Limit Override_7_ASRM}
    Scroll Element Into View  ${ID_LOE Limit Override_7_ASRM}
    Check and enter input  ${ID_LOE Limit Override_7_ASRM}  ${test_data['Alt_LOE Limit Override']}
    sleep  2s
    wait until element is visible  ${ID_Endorsement Premium_7_ASRM}
    Scroll Element Into View  ${ID_Endorsement Premium_7_ASRM}
    Check and enter input  ${ID_Endorsement Premium_7_ASRM}  ${test_data['Alt_Endorsement Premium']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID_ApplyContinueButton}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID_ApplyContinueButton}


Entering For KNR for ASRM K12 Risk
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_Territory Judgement Factor_ASRM_K12}
    Check and enter input  ${ID_Territory Judgement Factor_ASRM_K12}  ${test_data['Territory Judgment Factor']}
    wait until element is visible  ${ID_Ransom Per Insured Event_ASRM_K12}
    Scroll Element Into View  ${ID_Ransom Per Insured Event_ASRM_K12}
    Check and enter input  ${ID_Ransom Per Insured Event_ASRM_K12}  ${test_data['Ransom Per Insured Event']}
    wait until element is visible  ${ID_Annual Aggregate_ASRM_K12}
    Scroll Element Into View  ${ID_Annual Aggregate_ASRM_K12}
    Check and enter input  ${ID_Annual Aggregate_ASRM_K12}  ${test_data['Annual Aggregate']}
    wait until element is visible  ${ID_Security Consultant Fees_ASRM_K12}
    Scroll Element Into View  ${ID_Security Consultant Fees_ASRM_K12}
    Check and enter input  ${ID_Security Consultant Fees_ASRM_K12}  ${test_data['Security Consultant Fees']}
    wait until element is visible  ${ID_Additional Expenses Limit Override_ASRM_K12}
    Scroll Element Into View  ${ID_Additional Expenses Limit Override_ASRM_K12}
    Check and enter input  ${ID_Additional Expenses Limit Override_ASRM_K12}  ${test_data['Additional Expenses Limit Override']}
    wait until element is visible  ${ID_Insured Person_ASRM_K12}
    Check and enter input  ${ID_Insured Person_ASRM_K12}  ${test_data['Insured Person']}
    wait until element is visible  ${ID_PA Per Person_ASRM_K12}
    Scroll Element Into View  ${ID_PA Per Person_ASRM_K12}
    Check and enter input  ${ID_PA Per Person_ASRM_K12}  ${test_data['PA Per Person']}
    wait until element is visible  ${ID_PA Per Event_ASRM_K12}
    Scroll Element Into View  ${ID_PA Per Event_ASRM_K12}
    Check and enter input  ${ID_PA Per Event_ASRM_K12}  ${test_data['PA Per Event']}
    wait until element is visible  ${ID_Death %_ASRM_K12}
    Scroll Element Into View  ${ID_Death %_ASRM_K12}
    Check and enter input  ${ID_Death %_ASRM_K12}  ${test_data['Death %']}
    wait until element is visible  ${ID_Loss of Limb/Sight %_ASRM_K12}
    Scroll Element Into View  ${ID_Loss of Limb/Sight %_ASRM_K12}
    Check and enter input  ${ID_Loss of Limb/Sight %_ASRM_K12}  ${test_data['Loss of Limb/Sight %']}
    wait until element is visible  ${ID_Loss of Extremity %_ASRM_K12}
    Scroll Element Into View  ${ID_Loss of Extremity %_ASRM_K12}
    Check and enter input  ${ID_Loss of Extremity %_ASRM_K12}  ${test_data['Loss of Extremity %']}

Threat Expense for ASRM K12
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_Per Insured Event Limit_2_ASRM_K12}
    Scroll Element Into View  ${ID_Per Insured Event Limit_2_ASRM_K12}
    Check and enter input  ${ID_Per Insured Event Limit_2_ASRM_K12}  ${test_data['Per Insured Event Limit']}
    wait until element is visible  ${ID_Annual Aggregate_2_ASRM_K12}
    Scroll Element Into View  ${ID_Annual Aggregate_2_ASRM_K12}
    Check and enter input  ${ID_Annual Aggregate_2_ASRM_K12}  ${test_data['Annual Aggregate']}
    wait until element is visible  ${ID_Indemnity Period_2_ASRM_K12}
    Scroll Element Into View  ${ID_Indemnity Period_2_ASRM_K12}
    Check and enter input  ${ID_Indemnity Period_2_ASRM_K12}  ${test_data['Indemnity Period']}
    wait until element is visible  ${ID_Excluded Countries_2_ASRM_K12}
    Scroll Element Into View  ${ID_Excluded Countries_2_ASRM_K12}
    Check and enter input  ${ID_Excluded Countries_2_ASRM_K12}  ${test_data['Endorsement Premium']}


Travel Evacuation Endorsement E307 for ASRM K12
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_Per Insured Event Limit_5_ASRM_K12}
    Scroll Element Into View  ${ID_Per Insured Event Limit_5_ASRM_K12}
    Check and enter input  ${ID_Per Insured Event Limit_5_ASRM_K12}  ${test_data['Travel_Per Insured Event Limit']}
    wait until element is visible  ${ID_Annual Aggregate_5_ASRM_K12}
    Scroll Element Into View  ${ID_Annual Aggregate_5_ASRM_K12}
    Check and enter input  ${ID_Annual Aggregate_5_ASRM_K12}  ${test_data['Travel_Annual Aggregate']}
    wait until element is visible  ${ID_Per Insured Person Limit_5_ASRM_K12}
    Scroll Element Into View  ${ID_Per Insured Person Limit_5_ASRM_K12}
    Check and enter input  ${ID_Per Insured Person Limit_5_ASRM_K12}  ${test_data['Travel_Per Insured Person Limit']}
    wait until element is visible  ${ID_Personal Effects/Person Limit_5_ASRM_K12}
    Scroll Element Into View  ${ID_Personal Effects/Person Limit_5_ASRM_K12}
    Check and enter input  ${ID_Personal Effects/Person Limit_5_ASRM_K12}  ${test_data['Travel_Personal Effects/Personal Limit']}
    wait until element is visible  ${ID_Security Consultant Fees_5_ASRM_K12}
    Scroll Element Into View  ${ID_Security Consultant Fees_5_ASRM_K12}
    Check and enter input  ${ID_Security Consultant Fees_5_ASRM_K12}  ${test_data['Travel_Security Consultant Fees']}
    wait until element is visible  ${ID_Excluded Countries_5_ASRM_K12}
    Scroll Element Into View  ${ID_Excluded Countries_5_ASRM_K12}
    Check and enter input ${ID_Excluded Countries_5_ASRM_K12}  ${test_data['Travel_Excluded Countries']}


Alternate Loss of Earnings Endorsement 315 for ASRM K12
    [Arguments]  ${test_data}
    wait until element is visible  ${ID_Per Insured Event Limit_7_ASRM_K12}
    Scroll Element Into View  ${ID_Per Insured Event Limit_7_ASRM_K12}
    Check and enter input  ${ID_Per Insured Event Limit_7_ASRM_K12}  ${test_data['Alt_Per Insured Event Limit']}
    wait until element is visible  ${ID_Cyber Event Sublimit_7_ASRM_K12}
    Scroll Element Into View  ${ID_Cyber Event Sublimit_7_ASRM_K12}
    Check and enter input  ${ID_Cyber Event Sublimit_7_ASRM_K12}  ${test_data['Alt_Cyber Event Sublimit']}
    wait until element is visible  ${ID_Cyber Annual Agg Sublimit_7_ASRM_12}
    Scroll Element Into View  ${ID_Cyber Annual Agg Sublimit_7_ASRM_12}
    Check and enter input  ${ID_Cyber Annual Agg Sublimit_7_ASRM_12}  ${test_data['Alt_Cyber Ann Agg Sublimit']}
    wait until element is visible  ${ID_Indemnity Period_7_ASRM_K12}
    Scroll Element Into View  ${ID_Indemnity Period_7_ASRM_K12}
    Check and enter input  ${ID_Indemnity Period_7_ASRM_K12}  ${test_data['Alt_Indemnity Period']}
    wait until element is visible  ${ID_Waiting Period_7_ASRM_K12}
    Scroll Element Into View  ${ID_Waiting Period_7_ASRM_K12}
    Check and enter input  ${ID_Waiting Period_7_ASRM_K12}  ${test_data['Alt_Waiting Period']}
    wait until element is visible  ${ID_Investigating Accountants_7_ASRM_K12}
    Scroll Element Into View  ${ID_Investigating Accountants_7_ASRM_K12}
    Check and enter input ${ID_Investigating Accountants_7_ASRM_K12}  ${test_data['Alt_Investigating Accountants']}
    wait until element is visible  ${ID_LOE Limit Override_7_ASRM_K12}
    Scroll Element Into View  ${ID_LOE Limit Override_7_ASRM_K12}
    Check and enter input  ${ID_LOE Limit Override_7_ASRM_K12}  ${test_data['Alt_LOE Limit Override']}
    sleep  2s
    wait until element is visible  ${ID_LOE Limit Override_7_ASRM_K12}
    Scroll Element Into View  ${ID_LOE Limit Override_7_ASRM_K12}
    Check and enter input  ${ID_LOE Limit Override_7_ASRM_K12}  ${test_data['Alt_Endorsement Premium']}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID_ApplyContinueButton}
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID_ApplyContinueButton}

Private ERP Validation
    [Arguments]  ${test_data}
    ${Value_ERP}=  get value  ${ID-RB-ERP}
    Run Keyword If    ${Value_ERP} == ${test_data['ERP']}   log to console  "${Value_ERP}-ERP1 value is correct"  ELSE   log to console  "${Value_ERP}-ERP1 value is incorrect"
    ${Value_ERP2}=  get value   ${ID-RB-ERP2}
    Run Keyword If  ${Value_ERP2} == ${test_data['ERP2']}   log to console  "${Value_ERP2}-ERP2 value is correct"  ELSE   log to console  "${Value_ERP2}-ERP2 value is incorrect"
    ${Value_ERP3}=  get value   ${ID-RB-ERP3}
    Run Keyword If  ${Value_ERP3} == ${test_data['ERP3']}    log to console  "${Value_ERP3}-ERP3 value is correct"  ELSE   log to console  "${Value_ERP3}-ERP3 value is incorrect"
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID_ApplyContinueButton}

Private Runoff Validation
    [Arguments]  ${test_data}
    ${Value_Runoff}=  get value  ${ID-RB-Runoff}
    Run Keyword If    ${Value_Runoff} == ${test_data['RunOff1']}   log to console  "${Value_Runoff}-Runoff1 value is correct"  ELSE   log to console  "${Value_Runoff}-Runoff1 value is incorrect"
    ${Value_Runoff3}=  get value  ${ID-RB-Runoff3}
    Run Keyword If    ${Value_Runoff3} == ${test_data['RunOff3']}   log to console  "${Value_Runoff3}-Runoff3 value is correct"  ELSE   log to console  "${Value_Runoff3}-Runoff3 value is incorrect"
    ${Value_Runoff6}=  get value  ${ID-RB-Runoff6}
    Run Keyword If    ${Value_Runoff6} == ${test_data['RunOff6']}   log to console  "${Value_Runoff6}-Runoff6 value is correct"  ELSE   log to console  "${Value_Runoff6}-Runoff6 value is incorrect"
    wait until element is not visible   globalAjaxLoading  100
    click element    ${ID_ApplyContinueButton}
