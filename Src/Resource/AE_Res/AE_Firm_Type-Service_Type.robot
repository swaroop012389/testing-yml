*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
#Architect
${AE_FT_Architect}=  //input[@value='Architect']
${AE_FT_Civil_engineering}=  //input[@value='CivilEngineering']
${AE_FT_Electrical_engineering}=  //input[@value='ElectricalEngineering']
${AE_FT_Mechanical_engineering}=  //input[@value='MechanicalEngineering']
${AE_FT_Structural_engineering}=  //input[@value='StructuralEngineering']
${AE_FT_Consultants}=  //input[@value='Consultants']
${AE_FT_Environmental}=  //input[@value='Environmental']
${AE_FT_Land_surveyor}=  //input[@value='LandSurveyor']
${AE_FT_Landscape_architecture}=  //input[@value='LandscapeArchitecture']
#${AE-Workid}=    //div[@id='lob-title']
##Architect firm type
${AE_FT_Archi_Alarm systems/fire protection}=   //input[@name='ARCH_AlarmSystemsFireProtection_Pct']
${AE_FT_Archi_Architecture}=  //input[@name='ARCH_Architecture_Pct']
${AE_FT_Archi_Chemical_engineering}=    //input[@name='ARCH_ChemicalEngineering_Pct']
${AE_FT_Archi_Civil_engineering}=   //input[@name='ARCH_CivilEngineering_Pct']
${AE_FT_Archi_Concept_design_w/o_construction_documents}=   //input[@name='ARCH_ConceptDesignWOConstructionDocuments_Pct']
${AE_FT_Archi_Construction/program management}=     //input[@name='ARCH_ConstructionProgramManagement_Pct']
${AE_FT_Archi_Design/build}=    //input[@name='ARCH_DesignBuild_Pct']
${AE_FT_Archi_Drafting services}=   //input[@name='ARCH_DraftingServices_Pct']
${AE_FT_Archi_Electrical engineering}=  //input[@name='ARCH_ElectricalEngineering_Pct']
${AE_FT_Archi_Environmental impact studies}=  //input[@name='ARCH_EnvionmentalImpactReports_Pct']
${AE_FT_Archi_Environmental abatement}=  //input[@name='ARCH_EnvironmentalAbatement_Pct']
${AE_FT_Archi_Environmental permitting}=  //input[@name='ARCH_EnvironmentalPermitting_Pct']
${AE_FT_Archi_Facilities and operations management}=  //input[@name='ARCH_FacilitiesAndOperationsManagement_Pct']
${AE_FT_Archi_Feasibility studies/reports opinions/master plans}=   //input[@name='ARCH_FeasibilityStudiesReportsOpinionsMasterPlans_Pct']
${AE_FT_Archi_Forensic investigations and testimony}=   //input[@name='ARCH_ForensicInvestigationsAndTestimony_Pct']
${AE_FT_Archi_Geotechnical engineering}=  //input[@name='ARCH_GeotechnicalEngineering_Pct']
${AE_FT_Archi_Historic preservation consulting}=  //input[@name='ARCH_HistoricPreservationConsulting_Pct']
${AE_FT_Archi_HVAC engineering}    //input[@name='ARCH_HVACEngineering_Pct']
${AE_FT_Archi_Interior design(non-structural)}=  //input[@name='ARCH_InteriorDesignNonStructural_Pct']
${AE_FT_Archi_Land surveying}=   //input[@name='ARCH_LandSurveying_Pct']
${AE_FT_Archi_Landscape architecture}=  //input[@name='ARCH_LandscapeArchitecture_Pct']
${AE_FT_Archi_LEED consulting}=     //input[@name='ARCH_LEEDConsulting_Pct']
${AE_FT_Archi_Machinery/equipment design}=  //input[@name='ARCH_MachineryEquipmentDesign_Pct']
${AE_FT_Archi_Management consulting}=   //input[@name='ARCH_ManagementConsulting_Pct']
${AE_FT_Archi_Marine engineering}=  //input[@name='ARCH_MarineEngineering_Pct']
${AE_FT_Archi_Mechanical engineering}=  //input[@name='ARCH_MechanicalEngineering_Pct']
${AE_FT_Archi_Mining engineering}=  //input[@name='ARCH_MiningEngineering_Pct']
${AE_FT_Archi_Process engineering}=  //input[@name='ARCH_ProcessEngineering_Pct']
${AE_FT_Archi_Schematic designs}=  //input[@name='ARCH_SchematicDesignsWOConstructionDocuments_Pct']
${AE_FT_Archi_Structural engineering}=  //input[@name='ARCH_StructuralEngineering_Pct']
${AE_FT_Archi_Steel detailing}=  //input[@name='ARCH_SteelDetailingYN']
${AE_FT_Archi_Technical consulting(non-licensed)}=  //input[@name='ARCH_TechnicalConsultingNonLicensed_Pct']
${AE_FT_Archi_Transportation engineering}=  //input[@name='ARCH_TransportationConsulting_Pct']
${AE_FT_Archi_Other}=  //input[@name='ARCH_Other_Pct']
${AE_FT_Archi_Other_Descr}=  //input[@name='ARCH_Other_Desc']
#${AE_FT_Architecture_showmore_checkbox}      id=ArchitectureShowMoreCheckbox

##Civil Engineering firm type
${AE_FT_Civil_Architecture}=  //input[@name='CIVL_Architecture_Pct']
${AE_FT_Civil_Civil_engineering}=   //input[@name='CIVL_CivilEngineering_Pct']
${AE_FT_Civil_Chemical_engineering}=  //input[@name='CIVL_ChemicalEngineering_Pct']
${AE_FT_Civil_Concept_design_w/o_construction_documents}=   //input[@name='CIVL_ConceptDesignWOConstructionDocuments_Pct']
${AE_FT_Civil_Construction/program management}=  //input[@name='CIVL_ConstructionProgramManagement_Pct']
${AE_FT_Civil_Drafting services}=  //input[@name='CIVL_DraftingServices_Pct']
${AE_FT_Civil_Electrical engineering}=  //input[@name='CIVL_ElectricalEngineering_Pct']
${AE_FT_Civil_Environmental impact studies}=    //input[@name='CIVL_EnvionmentalImpactReports_Pct']
${AE_FT_Civil_Environmental abatement}=  //input[@name='CIVL_EnvironmentalAbatement_Pct']
${AE_FT_Civil_Environmental permitting}=  //input[@name='CIVL_EnvironmentalPermitting_Pct']
${AE_FT_Civil_Facilities and operations management}=  //input[@name='CIVL_FacilitiesAndOperationsManagement_Pct']
${AE_FT_Civil_Feasibility studies/reports opinions/master plans}=  //input[@name='CIVL_FeasibilityStudiesReportsOpinionsMasterPlans_Pct']
${AE_FT_Civil_Forensic investigations and testimony}=   //input[@name='CIVL_ForensicInvestigationsAndTestimony_Pct']
${AE_FT_Civil_Geotechnical engineering}=  //input[@name='CIVL_GeotechnicalEngineering_Pct']
${AE_FT_Civil_HVAC engineering}=    //input[@name='CIVL_HVACEngineering_Pct']
${AE_FT_Civil_Interior design(non-structural)}=  //input[@name='CIVL_InteriorDesignNonStructural_Pct']
${AE_FT_Civil_Laboratory testing}=  //input[@name='CIVL_LaboratoryTesting_Pct']
${AE_FT_Civil_Land surveying}=   //input[@name='CIVL_LandSurveying_Pct']
${AE_FT_Civil_Landscape architecture}=  //input[@name='CIVL_LandscapeArchitecture_Pct']
${AE_FT_Civil_Machinery/equipment design}=  //input[@name='CIVL_MachineryEquipmentDesign_Pct']
${AE_FT_Civil_Management consulting}=   //input[@name='CIVL_ManagementConsulting_Pct']
${AE_FT_Civil_Marine engineering}=  //input[@name='CIVL_MarineEngineering_Pct']
${AE_FT_Civil_Mechanical engineering}=  //input[@name='CIVL_MechanicalEngineering_Pct']
${AE_FT_Civil_Mining engineering}=  //input[@name='CIVL_MiningEngineering_Pct']
${AE_FT_Civil_Process engineering}=  //input[@name='CIVL_ProcessEngineering_Pct']
${AE_FT_Civil_Schematic designs construction documents}=  //input[@name='CIVL_SchematicDesignsWOConstructionDocuments_Pct']
${AE_FT_Civil_Structural engineering}=    //input[@name='CIVL_StructuralEngineering_Pct']
${AE_FT_Civil_Steel detailing}=  //input[@name='CIVL_SteelDetailingYN']
${AE_FT_Civil_Technical consulting(non-licensed)}=   //input[@name='CIVL_TechnicalConsultingNonLicensed_Pct']
${AE_FT_Civil_Transportation engineering}=   //input[@name='CIVL_TransportationConsulting_Pct']
${AE_FT_Civil_Other}=   //input[@name='CIVL_Other_Pct']
${AE_FT_Civil_Other_Desc}=  //input[@name='CIVL_Other_Desc']
#${AE_FT_Civil_showmore_checkbox}      id=CivilEnggShowMoreCheckbox

##Electrical Engineering firm type
${AE_FT_Electrical_Alarm systems/fire protection}=  //input[@name='ELEC_AlarmSystemsFireProtection_Pct']
${AE_FT_Electrical_Chemical_engineering}=    //input[@name='ELEC_ChemicalEngineering_Pct']
${AE_FT_Electrical_Commisioning/test & balance}=  //input[@name='ELEC_CommisioningTestAndBalance_Pct']
${AE_FT_Electrical_Construction/program management}=  //input[@name='ELEC_ConstructionProgramManagement_Pct']
${AE_FT_Electrical_Drafting services}=   //input[@name='ELEC_DraftingServices_Pct']
${AE_FT_Electrical_Electrical Engineering}=   //input[@name='ELEC_ElectricalEngineering_Pct']
${AE_FT_Electrical_Environmental impact studies}=   //input[@name='ELEC_EnvionmentalImpactReports_Pct']
${AE_FT_Electrical_Environmental abatement}=  //input[@name='ELEC_EnvironmentalAbatement_Pct']
${AE_FT_Electrical_Facilities and operations management}=  //input[@name='ELEC_FacilitiesAndOperationsManagement_Pct']
${AE_FT_Electrical_Feasibility studies/reports opinions/master plans}=   //input[@name='ELEC_FeasibilityStudiesReportsOpinionsMasterPlans_Pct']
${AE_FT_Electrical_Forensic investigations and testimony}=   //input[@name='ELEC_ForensicInvestigationsAndTestimony_Pct']
${AE_FT_Electrical_HVAC engineering}=   //input[@name='ELEC_HVACEngineering_Pct']
${AE_FT_Electrical_Instrumentations/controls engineering}=  //input[@name='ELEC_InstrumentationsControlsEngineering_Pct']
${AE_FT_Electrical_Machinery/equipment design}=  //input[@name='ELEC_MachineryEquipmentDesign_Pct']
${AE_FT_Electrical_Marine engineering}=  //input[@name='ELEC_MarineEngineering_Pct']
${AE_FT_Electrical_Mechanical engineering}=  //input[@name='ELEC_MechanicalEngineering_Pct']
${AE_FT_Electrical_Mining engineering}=  //input[@name='ELEC_MiningEngineering_Pct']
${AE_FT_Electrical_Process engineering}=  //input[@name='ELEC_ProcessEngineering_Pct']
${AE_FT_Electrical_Schematic designs construction documents}=  //input[@name='ELEC_SchematicDesignsWOConstructionDocuments_Pct']
${AE_FT_Electrical_Structural engineering}=  //input[@name='ELEC_StructuralEngineering_Pct']
${AE_FT_Electrical_Steel detailing}=  //input[@name='ELEC_SteelDetailingYN']
${AE_FT_Electrical_Technical consulting(non-licensed)}=  //input[@name='ELEC_TechnicalConsultingNonLicensed_Pct']
${AE_FT_Electrical_Transportation engineering}=  //input[@name='ELEC_TransportationConsulting_Pct']
${AE_FT_Electrical_Other}=  //input[@name='ELEC_Other_Pct']
${AE_FT_Electrical_Other_Descr}=  //input[@name='ELEC_Other_Desc']
#${AE_FT_Electrical_showmore_checkbox}      id=ElectricalEnggShowMoreCheckbox

##Mechanical Engineering firm type
${AE_FT_Mechanical_Air balancing}=  //input[@name='MECH_AirBalancing_Pct']
${AE_FT_Mechanical_Alarm systems/fire protection}=   //input[@name='MECH_AlarmSystemsFireProtection_Pct']
${AE_FT_Mechanical_Architecture}=  //input[@name='MECH_Architecture_Pct']
${AE_FT_Mechanical_Chemical_engineering}=    //input[@name='MECH_ChemicalEngineering_Pct']
${AE_FT_Mechanical_Civil_engineering}=   //input[@name='MECH_CivilEngineering_Pct']
${AE_FT_Mechanical_Commisioning/test & balance}=   //input[@name='MECH_CommisioningTestAndBalance_Pct']
${AE_FT_Mechanical_Concept_design_w/o_construction_documents}=  //input[@name='MECH_ConceptDesignWOConstructionDocuments_Pct']
${AE_FT_Mechanical_Construction/program management}=  //input[@name='MECH_ConstructionProgramManagement_Pct']
${AE_FT_Mechanical_Drafting services}=   //input[@name='MECH_DraftingServices_Pct']
${AE_FT_Mechanical_Electrical Engineering}=  //input[@name='MECH_ElectricalEngineering_Pct']
${AE_FT_Mechanical_Environmental impact studies}=   //input[@name='MECH_EnvionmentalImpactReports_Pct']
${AE_FT_Mechanical_Environmental abatement}=  //input[@name='MECH_EnvironmentalAbatement_Pct']
${AE_FT_Mechanical_Facilities and operations management}=  //input[@name='MECH_FacilitiesAndOperationsManagement_Pct']
${AE_FT_Mechanical_Feasibility studies/reports opinions/master plans}=   //input[@name='MECH_FeasibilityStudiesReportsOpinionsMasterPlans_Pct']
${AE_FT_Mechanical_Forensic investigations and testimony}=   //input[@name='MECH_ForensicInvestigationsAndTestimony_Pct']
${AE_FT_Mechanical_HVAC engineering}=  //input[@name='MECH_HVACEngineering_Pct']
${AE_FT_Mechanical_Machinery/equipment design}=  //input[@name='MECH_MachineryEquipmentDesign_Pct']
${AE_FT_Mechanical_Marine engineering}=  //input[@name='MECH_MarineEngineering_Pct']
${AE_FT_Mechanical_Mechanical engineering}=  //input[@name='MECH_MechanicalEngineering_Pct']
${AE_FT_Mechanical_Mining engineering}=  //input[@name='MECH_MiningEngineering_Pct']
${AE_FT_Mechanical_Plumbing design}=   //input[@name='MECH_PlumbingDesign_Pct']
${AE_FT_Mechanical_Process engineering}=  //input[@name='MECH_ProcessEngineering_Pct']
${AE_FT_Mechanical_Schematic designs construction documents}=  //input[@name='MECH_SchematicDesignsWOConstructionDocuments_Pct']
${AE_FT_Mechanical_Structural engineering}=   //input[@name='MECH_StructuralEngineering_Pct']
${AE_FT_Mechanical_Steel detailing}=  //input[@name='MECH_SteelDetailingYN']
${AE_FT_Mechanical_Technical consulting(non-licensed)}=  //input[@name='MECH_TechnicalConsultingNonLicensed_Pct']
${AE_FT_Mechanical_Transportation engineering}=    //input[@name='MECH_TransportationConsulting_Pct']
${AE_FT_Mechanical_Other}=   //input[@name='MECH_Other_Pct']
${AE_FT_Mechanical_Other_Descr}=  //input[@name='MECH_Other_Desc']
#${AE_FT_Mechanical_showmore_checkbox}    id=MechEnggShowMoreCheckbox

##Structural Engineering firm type

${AE_FT_Structural_Architecture}=  //input[@name='STRU_Architecture_Pct']
${AE_FT_Structural_Chemical_engineering}=  //input[@name='STRU_ChemicalEngineering_Pct']
${AE_FT_Structural_Civil_engineering}=  //input[@name='STRU_CivilEngineering_Pct']
${AE_FT_Structural_Concept_design_w/o_construction_documents}=  //input[@name='STRU_ConceptDesignWOConstructionDocuments_Pct']
${AE_FT_Structural_Drafting services}=   //input[@name='STRU_DraftingServices_Pct']
${AE_FT_Structural_Electrical Engineering}=   //input[@name='STRU_ElectricalEngineering_Pct']
${AE_FT_Structural_Environmental impact studies}=   //input[@name='STRU_EnvionmentalImpactReports_Pct']
${AE_FT_Structural_Construction/program management}=   //input[@name='STRU_ConstructionProgramManagement_Pct']
${AE_FT_Structural_Environmental abatement}=  //input[@name='STRU_EnvironmentalAbatement_Pct']
${AE_FT_Structural_Facilities and operations management}=    //input[@name='STRU_FacilitiesAndOperationsManagement_Pct']
${AE_FT_Structural_Feasibility studies/reports opinions/master plans}=   //input[@name='STRU_FeasibilityStudiesReportsOpinionsMasterPlans_Pct']
${AE_FT_Structural_Forensic investigations and testimony}=   //input[@name='STRU_FeasibilityStudiesReportsOpinionsMasterPlans_Pct']
${AE_FT_Structural_Geotechnical engineering}=    //input[@name='STRU_GeotechnicalEngineering_Pct']
${AE_FT_Structural_HVAC engineering}=    //input[@name='STRU_HVACEngineering_Pct']
${AE_FT_Structural_Interior design(non-structural)}=    //input[@name='STRU_InteriorDesignNonStructural_Pct']
${AE_FT_Structural_Machinery/equipment design}=  //input[@name='STRU_MachineryEquipmentDesign_Pct']
${AE_FT_Structural_Marine engineering}=  //input[@name='STRU_MarineEngineering_Pct']
${AE_FT_Structural_Mechanical engineering}=   //input[@name='STRU_MechanicalEngineering_Pct']
${AE_FT_Structural_Mining engineering}=  //input[@name='STRU_MiningEngineering_Pct']
${AE_FT_Structural_Process engineering}=  //input[@name='STRU_ProcessEngineering_Pct']
${AE_FT_Structural_Schematic designs construction documents}=    //input[@name='STRU_SchematicDesignsWOConstructionDocuments_Pct']
${AE_FT_Structural_Structural engineering}=    //input[@name='STRU_StructuralEngineering_Pct']
${AE_FT_Structural_Steel detailing}=  //input[@name='STRU_SteelDetailingYN']
${AE_FT_Structural_Technical consulting(non-licensed)}=  //input[@name='STRU_TechnicalConsultingNonLicensed_Pct']
${AE_FT_Structural_Transportation engineering}=    //input[@name='STRU_TransportationConsulting_Pct']
${AE_FT_Structural_Other}=  //input[@name='STRU_Other_Pct']
${AE_FT_Structural_Other_Descr}=  //input[@name='STRU_Other_Desc']

##Consultant firm type
${AE_FT_Consultant_Acoustical consulting}=   //input[@name='CONS_AcousticalConsulting_Pct']
${AE_FT_Consultant_Agricultural engineering}=   //input[@name='CONS_AgriculturalEngineering_Pct']
${AE_FT_Consultant_Air balancing}=     //input[@name='CONS_AirBalancing_Pct']
${AE_FT_Consultant_Archeology}=  //input[@name='CONS_Archeology_Pct']
${AE_FT_Consultant_Architecture}=      //input[@name='CONS_Architecture_Pct']
${AE_FT_Consultant_At-risk construction management}=  //input[@name='CONS_AtRiskConstructionManagement_Pct']
${AE_FT_Consultant_Audio visual consulting}=  //input[@name='CONS_AudioVisualConsulting_Pct']
${AE_FT_Consultant_Chemical engineering}=    //input[@name='CONS_ChemicalEngineering_Pct']
${AE_FT_Consultant_Civil engineering}=  //input[@name='CONS_CivilEngineering_Pct']
${AE_FT_Consultant_Code compliance inspections}=  //input[@name='CONS_CodeComplianceInspections_Pct']
${AE_FT_Consultant_Construction/program management}=  //input[@name='CONS_ConstructionProgramManagement_Pct']
${AE_FT_Consultant_Cost Estimating}=  //input[@name='CONS_CostEstimating_Pct']
${AE_FT_Consultant_Obtaining/Evaluating Bids/Contracts}=  //input[@name='CONS_ObtainingEvaluatingBidsContracts_Pct']
${AE_FT_Consultant_Budgeting}=  //input[@name='CONS_Budgeting_Pct']
${AE_FT_Consultant_Value Engineering}=  //input[@name='CONS_ValueEngineering_Pct']
${AE_FT_Consultant_Commissioning}=  //input[@name='CONS_Commissioning_Pct']
${AE_FT_Consultant_Constructibiltiy Review}=  //input[@name='CONS_ConstructibiltiyReview_Pct']
${AE_FT_Consultant_Construction Observation}=  //input[@name='CONS_ConstructionObservation_Pct']
${AE_FT_Consultant_Supervising subcontractors}=  //input[@name='CONS_Supervisingsubcontractors_Pct']
${AE_FT_Consultant_Contracting}=  //input[@name='CONS_Contracting_Pct']
${AE_FT_Consultant_Building Construction}=  //input[@name='CONS_BuildingConstruction_Pct']
${AE_FT_Consultant_On-Site safety Inspections}=  //input[@name='CONS_OnSitesafetyInspections_Pct']
${AE_FT_Consultant_Hiring Contractors}=  //input[@name='CONS_HiringContractors_Pct']
${AE_FT_Consultant_Construction materials testing}=  //input[@name='CONS_ConstructionMaterialsTesting_Pct']
${AE_FT_Consultant_Construction site safety}=   //input[@name='CONS_ConstructionSiteSafety_Pct']
${AE_FT_Consultant_Drafting services}=  //input[@name='CONS_DraftingServices_Pct']
${AE_FT_Consultant_Drilling(sampling)}=  //input[@name='CONS_DrillingSampling_Pct']
${AE_FT_Consultant_Drilling(wells,blasting,engineering)}=   //input[@name='CONS_DrillingWellsBlastingEngineering_Pct']
${AE_FT_Consultant_Electrical engineering}=  //input[@name='CONS_ElectricalEngineering_Pct']
${AE_FT_Consultant_Elevator,escalator,moving walkway consulting}=   //input[@name='CONS_ElevatorEscalatorMovingWalkwayConsulting_Pct']
${AE_FT_Consultant_Engineering geologist}=  //input[@name='CONS_EngineeringGeologist_Pct']
${AE_FT_Consultant_Facilities and operations management}=   //input[@name='CONS_FacilitiesandOperationsManagement_Pct']
${AE_FT_Consultant_Feasibility studies/reports opinions/master plans}=    //input[@name='CONS_FeasibilityStudiesReportsOpinionsMasterPlans_Pct']
${AE_FT_Consultant_Food handling/kitchen consultant}=    //input[@name='CONS_FoodHandlingKitchenConsultant_Pct']
${AE_FT_Consultant_Forensic investigations and testimony}=  //input[@name='CONS_ForensicInvestigationsandTestimony_Pct']
${AE_FT_Consultant_Geologist}=  //input[@name='CONS_Geologist_Pct']
${AE_FT_Consultant_Geotechnical engineering}=   //input[@name='CONS_GeotechnicaEngineeringInvestigations_Pct']
${AE_FT_Consultant_Graphic design signage,museum and exhibit designers}=  //input[@name='CONS_GraphicDesignSignageMuseumandExhibitDesigners_Pct']
${AE_FT_Consultant_Historic preservation consulting}=  //input[@name='CONS_HistoricPreservationConsulting_Pct']
${AE_FT_Consultant_Home inspections}=     //input[@name='CONS_HomeInspections_Pct']
${AE_FT_Consultant_HVAC engineering}=     //input[@name='CONS_HVACEngineering_Pct']
${AE_FT_Consultant_Instrumentations/controls engineering}=     //input[@name='CONS_InstrumentationsControlsEngineering_Pct']
${AE_FT_Consultant_Hardware/Software}=     //input[@name='CONS_HardwareSoftware_Pct']
${AE_FT_Consultant_Panels/Stations}=     //input[@name='CONS_PanelsStations_Pct']
${AE_FT_Consultant_System Assembly}=     //input[@name='CONS_SystemAssembly_Pct']
${AE_FT_Consultant_Commissioning/Training}=     //input[@name='CONS_CommissioningTraining_Pct']
${AE_FT_Consultant_Ongoing Support}=     //input[@name='CONS_OngoingSupport_Pct']
${AE_FT_Consultant_Consulting}=     //input[@name='CONS_Consulting_Pct']
${AE_FT_Consultant_Project Management}=     //input[@name='CONS_ProjectManagement_Pct']
${AE_FT_Consultant_Specification/Design}=     //input[@name='CONS_SpecificationDesign_Pct']
${AE_FT_Development/Testing}=     //input[@name='CONS_DevelopmentTesting_Pct']
${AE_FT_Consultant_Interior design(non-structural)}=   //input[@name='CONS_InteriorDesignNonstructural_Pct']
${AE_FT_Consultant_Irrigation design}=   //input[@name='CONS_IrrigationDesign_Pct']
${AE_FT_Consultant_LEED consulting}=   //input[@name='CONS_LEEDConsulting_Pct']
${AE_FT_Consultant_Lighting design}=   //input[@name='CONS_LightingDesign_Pct']
${AE_FT_Consultant_Machinery equipment design}=  //input[@name='CONS_MachineryEquipmentDesign_Pct']
${AE_FT_Consultant_Materials transparency consultants}=    //input[@name='CONS_MaterialsTransparencyConsultants_Pct']
${AE_FT_Consultant_Mechanical engineering}=  //input[@name='CONS_MechanicalEngineering_Pct']
${AE_FT_Consultant_Mining engineering}=   //input[@name='CONS_MiningEngineering_Pct']
${AE_FT_Consultant_Modelers/renderers}=   //input[@name='CONS_ModelersRenderers_Pct']
${AE_FT_Consultant_Nondestructive testing}=  //input[@name='CONS_NondestructiveTesting_Pct']
${AE_FT_Consultant_Photogrammetry}=       //input[@name='CONS_Photogrammetry_Pct']
${AE_FT_Consultant_Planners}=   //input[@name='CONS_Planners_Pct']
${AE_FT_Consultant_Pre-Purchase commercial consultants}=       //input[@name='CONS_PrePurchaseCommercialConsultants_Pct']
${AE_FT_Consultant_Process engineering}=  //input[@name='CONS_ProcessEngineering_Pct']
${AE_FT_Consultant_Property condition assessments}=   //input[@name='CONS_PropertyConditionAssessments_Pct']
${AE_FT_Consultant_Roofing consulting}=  //input[@name='CONS_RoofingConsulting_Pct']
${AE_FT_Consultant_Security system consultant}=  //input[@name='CONS_SecuritySystemConsultant_Pct']
${AE_FT_Consultant_Sprinkler design}=     //input[@name='CONS_SprinklerDesign_Pct']
${AE_FT_Consultant_Structural engineering}=  //input[@name='CONS_StructuralEngineering_Pct']
${AE_FT_Consultant_Telecommunications/communications}=  //input[@name='CONS_TelecommunicationsCommunications_Pct']
${AE_FT_Consultant_Transportation consulting}=  //input[@name='CONS_TransportationConsulting_Pct']
${AE_FT_Consultant_Waste disposal/brokering consultants}=    //input[@name='CONS_WasteDisposalBrokeringConsultants_Pct']
${AE_FT_Consultant_Other}=  //input[@name='CONS_Other_Pct']
${AE_FT_Consultant_Other_Descr}=  //input[@name='CONS_Other_Desc']
#${AE_FT_Consultant_showmore_checkbox}= //input[@name='']
##Environment firm type
${AE_FT_Enivronmental_Air monitoring(asbestos)}=           //input[@name='ENV_AirMonitoringasbestos_Pct']
${AE_FT_Enivronmental_Air monitoring(other than asbestos)}=   //input[@name='ENV_AirMonitoringotherthanasbestos_Pct']
${AE_FT_Enivronmental_Archeologist/cultural resource specialist}=          //input[@name='ENV_ArcheologistCulturalResourceSpecialist_Pct']
${AE_FT_Enivronmental_Asbestos abatement}=                  //input[@name='ENV_AsbestosAbatement_Pct']
${AE_FT_Enivronmental_Asbestos management plan}=            //input[@name='ENV_AsbestosManagementPlan_Pct']
${AE_FT_Enivronmental_Asbestos sampling and testing}=       //input[@name='ENV_AsbestosSamplingandTesting_Pct']
${AE_FT_Enivronmental_Biologist}=                           //input[@name='ENV_Biologist_Pct']
${AE_FT_Enivronmental_Civil engineering}=                   //input[@name='ENV_CivilEngineering_Pct']
${AE_FT_Enivronmental_Corrosion engineering}=               //input[@name='ENV_CorrosionEngineering_Pct']
${AE_FT_Enivronmental_Drilling}=                            //input[@name='ENV_Drilling_Pct']
${AE_FT_Enivronmental_Ecologist}=                           //input[@name='ENV_Ecologist_Pct']
${AE_FT_Enivronmental_Environmental abatement}=             //input[@name='ENV_EnvironmentalAbatement_Pct']
${AE_FT_Enivronmental_Environmental health & safety consulting}=           //input[@name='ENV_EnvironmentalHealthSafetyConsulting_Pct']
${AE_FT_Enivronmental_Environmental impact reports}=        //input[@name='ENV_EnvironmentalImpactReports_Pct']
${AE_FT_Enivronmental_Environmental permitting}=            //input[@name='ENV_EnvironmentalPermitting_Pct']
${AE_FT_Enivronmental_Environmental program management}=    //input[@name='ENV_EnvironmentalProgramManagement_Pct']
${AE_FT_Enivronmental_Environmental remediation}=           //input[@name='ENV_EnvironmentalRemediation_Pct']
${AE_FT_Enivronmental_Environmental studies and reports}=   //input[@name='ENV_EnvironmentalStudiesandReports_Pct']
${AE_FT_Enivronmental_Erosion control engineer}=            //input[@name='ENV_ErosionControlEngineer_Pct']
${AE_FT_Enivronmental_Facilities and operations management}=  //input[@name='ENV_FacilitiesandOperationsManagement_Pct']
${AE_FT_Enivronmental_Feasibility studies/reports opinions/master plans}=  //input[@name='ENV_FeasibilityStudiesReportsOpinionsMasterPlans_Pct']
${AE_FT_Enivronmental_Fisheries management}=                //input[@name='ENV_FisheriesManagement_Pct']
${AE_FT_Enivronmental_Forestry management}=                 //input[@name='ENV_ForestryManagement_Pct']
${AE_FT_Enivronmental_Habitat/wetlands consulting}=         //input[@name='ENV_HabitatWetlandsConsulting_Pct']
${AE_FT_Enivronmental_Hazerdous materials management}=      //input[@name='ENV_HazerdousMaterialsManagement_Pct']
${AE_FT_Enivronmental_Hydrogeology/geology}=                //input[@name='ENV_HydrogeologyGeology_Pct']
${AE_FT_Enivronmental_Industrial hygenist}=                 //input[@name='ENV_IndustrialHygenist_Pct']
${AE_FT_Enivronmental_Laboratory testing}=                  //input[@name='ENV_LaboratoryTesting_Pct']
${AE_FT_Enivronmental_Litigation support}=                  //input[@name='ENV_LitigationSupport_Pct']
${AE_FT_Enivronmental_Mold investigations}=                 //input[@name='ENV_MoldInvestigations_Pct']
${AE_FT_Enivronmental_Mold remediation}=                    //input[@name='ENV_MoldRemediation_Pct']
${AE_FT_Enivronmental_Mold sampling and testing}=           //input[@name='ENV_MoldSamplingandTesting_Pct']
${AE_FT_Enivronmental_Natural resource managers}=           //input[@name='ENV_NaturalResourceManagers_Pct']
${AE_FT_Enivronmental_Perc/absorption rates}=               //input[@name='ENV_PercAbsorptionRates_Pct']
${AE_FT_Enivronmental_Permitting and compliance assistance}=   //input[@name='ENV_PermittingandComplianceAssistance_Pct']
${AE_FT_Enivronmental_Phase I environmental site assessments}=             //input[@name='ENV_PhaseIEnvironmentalSiteAssessments_Pct']
${AE_FT_Enivronmental_Phase II environmental site assessments}=            //input[@name='ENV_PhaseIIEnvironmentalSiteAssessments_Pct']
${AE_FT_Enivronmental_Soil, air and water sampling and testing}=           //input[@name='ENV_Soil,AirandWaterSamplingandTesting_Pct']
${AE_FT_Enivronmental_Storage tank (UST/AST)}=              //input[@name='ENV_StorageTankUSTAST_Pct']
${AE_FT_Enivronmental_Storm water management}=              //input[@name='ENV_StormWaterManagement_Pct']
${AE_FT_Enivronmental_Training/consulting}=                 //input[@name='ENV_TrainingConsulting_Pct']
${AE_FT_Enivronmental_Wildllife management specialist}=     //input[@name='ENV_WildllifeManagementSpecialist_Pct']
${AE_FT_Enivronmental_Other}=   //input[@name='ENV_Other_Pct']
${AE_FT_Consultant_Other_Descr}=   //input[@name='ENV_Other_Desc']
${AE_FT_Enivronmental_Please enter %}=     //input[@name='RemediationConstructionPct']
${AE_FT_Enivronmental_Briefly describe}=   //textarea[@name='RemediationConstructionDesc']

##Land Surveyor
${AE_FT_Land_Boundry_Property}=        //input[@name='SURV_BoundaryOrPropertySurveys_Pct']
${AE_FT_Land_Construction_Stakeout}=   //input[@name='SURV_ConstructionStakeout_Pct']
${AE_FT_Land_Geodetic_Control}=        //input[@name='SURV_GeodeticOrControlSurveys_Pct']
${AE_FT_Land_Hydrographic}=            //input[@name='SURV_HydrographicSurveys_Pct']
${AE_FT_Land_Mapping_Cartogrophy}=     //input[@name='SURV_MappingOrCartography_Pct']
${AE_FT_Land_Oil_Gas_wellLocation}=    //input[@name='SURV_OilGasWellLocationSurveys_Pct']
${AE_FT_Land_OS_Req_Eng_Stamp}=        //input[@name='SURV_OtherServicesRequiringEngineeringStamp_Pct']
${AE_FT_Land_Photogrammetric}=         //input[@name='SURV_PhotogrammetricSurveys_Pct']
${AE_FT_Land_Plans_Street_Highways}=   //input[@name='SURV_PlansSpecsforStreetsHighwaysEtc_Pct']
${AE_FT_Land_Quantity_Surveys}=        //input[@name='SURV_QuantitySurveys_Pct']
${AE_FT_Land_Route_Surveys_Eng}=       //input[@name='SURV_RouteSurveysforEngineeringProjects_Pct']
${AE_FT_Land_Subdivisions}=            //input[@name='SURV_Subdivisions_Pct']
${AE_FT_Land_Topographic_Surveys}=     //input[@name='SURV_TopographicSurveys_Pct']
${AE_FT_Land_Other}=     //input[@name='SURV_Other_Pct']
${AE_FT_Land_Other_Descr}=        //input[@name='SURV_Other_Desc']

##Landscape architecture
${AE_FT_Landscape_Architecture%}=      //input[@name='LAND_Architecture_Pct']
${AE_FT_Landscape_Concept design}=     //input[@name='LAND_ConceptDesignWoConstructionDocuments_Pct']
${AE_FT_Landscape_Construction/program managementl}=  //input[@name='LAND_ConstructionProgramManagement_Pct']
${AE_FT_Landscape_Golf course design}=        //input[@name='LAND_GolfCourseDesign_Pct']
${AE_FT_Landscape_Landscape architecture}=     //input[@name='LAND_LandscapeArchitecture_Pct']
${AE_FT_Landscape_Other}=        //input[@name='LAND_Other_Pct']
${AE_FT_Landscape_Other_Descr}=      //input[@name='LAND_Other_Desc']


*** Keywords ***
AE Firm Type/Service Type
        [Arguments]    &{test_data}
        Execute Javascript    window.scrollTo(0, 0)
        click element   //input[@name='FirmType' and @value='${test_data["Please select firm type"]}']
        Sleep    2s
        ${Firm_Licensed}=  Set Variable    ${test_data['Firm licensed']}
        ${First_Let}=  Get Substring    ${test_data['Firm licensed']}  0  1
        ${Lc}=  Convert To Lower Case    ${Firm_Licensed}
        ${Last_p}=  Get Substring   ${Lc}  1
        Log To Console  ${First_Let}${Last_p}
        click element   //input[@name='FirmLicenseYN' and @value='${First_Let}${Last_p}']
        run Keyword If   '${test_data['Please select firm type']}' == 'Architect'     run Keyword    Architect firm type  ${test_data}
        run Keyword If   '${test_data['Please select firm type']}' == 'CivilEngineering'     run Keyword    Civil Engineering firm type and services  ${test_data}
        run Keyword If   '${test_data['Please select firm type']}' == 'ElectricalEngineering'     run Keyword    Electrical Engineering firm type and services
        run Keyword If   '${test_data['Please select firm type']}' == 'MechanicalEngineering'     run Keyword    Mechanical Engineering firm type and services  ${test_data}
        run Keyword If   '${test_data['Please select firm type']}' == 'StructuralEngineering'     run Keyword    Structural Engineering firm type and services
        run Keyword If   '${test_data['Please select firm type']}' == 'Consultants'     run Keyword    Consultants firm type and services
        run Keyword If   '${test_data['Please select firm type']}' == 'Environmental'     run Keyword    Environmental firm type and services
        run Keyword If   '${test_data['Please select firm type']}' == 'LandSurveyor'     run Keyword    Land Surveyor firm type and services  ${test_data}
        run Keyword If   '${test_data['Please select firm type']}' == 'LandscapeArchitecture'     run Keyword    Landscape Architecture firm type and services  ${test_data}

Architect firm type
        [Arguments]  ${test_data}
        Input text    ${AE_FT_Archi_Architecture}  ${test_data['Architecture%']}
        Input text    ${AE_FT_Archi_Chemical_engineering}  ${test_data['Chemical engineering%']}
        Input text    ${AE_FT_Archi_Civil_engineering}  ${test_data['Civil engineering%']}
        Input text    ${AE_FT_Archi_Concept_design_w/o_construction_documents}  ${test_data['Concept design w/o construction documents%']}
        Input text    ${AE_FT_Archi_Construction/program management}  ${test_data['Construction/program management%']}
        Input text    ${AE_FT_Archi_Drafting services}  ${test_data['Drafting services%']}
        Input text    ${AE_FT_Archi_Electrical engineering}  ${test_data['Electrical engineering%']}
        Input text    ${AE_FT_Archi_Environmental abatement}  ${test_data['Environmental abatement%']}
        Input text    ${AE_FT_Archi_Environmental impact studies}  ${test_data['Environmental impact studies%']}
        Input text    ${AE_FT_Archi_Feasibility studies/reports opinions/master plans}  ${test_data['Feasibility studies/reports opinions/master plans%']}
        Input text    ${AE_FT_Archi_HVAC engineering}  ${test_data['HVAC engineering%']}
        Input text    ${AE_FT_Archi_Interior design(non-structural)}  ${test_data['Interior design(non-structural)%']}
        Input text    ${AE_FT_Archi_Landscape architecture}  ${test_data['Landscape architecture%']}
        Input text    ${AE_FT_Archi_Machinery/equipment design}  ${test_data['Machinery/equipment design%']}
        Input text    ${AE_FT_Archi_Marine engineering}  ${test_data['Marine engineering%']}
        Input text    ${AE_FT_Archi_Mining engineering}  ${test_data['Mining engineering%']}
        Input text    ${AE_FT_Archi_Mechanical engineering}  ${test_data['Mechanical engineering%']}
        Input text    ${AE_FT_Archi_Process engineering}  ${test_data['Process engineering%']}
        Input text    ${AE_FT_Archi_Structural engineering}  ${test_data['Structural engineering%']}
        Input text    ${AE_FT_Archi_Transportation engineering}  ${test_data['Transportation engineering%']}
        Input text    ${AE_FT_Archi_Alarm systems/fire protection}  ${test_data['Alarm systems/fire protection%']}
        Input text    ${AE_FT_Archi_Design/build}  ${test_data['Design/build%']}
        Input text    ${AE_FT_Archi_Environmental permitting}  ${test_data['Environmental permitting%']}
        Input text    ${AE_FT_Archi_Facilities and operations management}  ${test_data['Facilities and operations management%']}
        Input text    ${AE_FT_Archi_Forensic investigations and testimony}  ${test_data['Forensic investigations and testimony%']}
        Input text    ${AE_FT_Archi_Geotechnical engineering}  ${test_data['Geotechnical engineering%']}
        Input text    ${AE_FT_Archi_Historic preservation consulting}  ${test_data['Historic preservation consulting%']}
        Input text    ${AE_FT_Archi_Land surveying}  ${test_data['Land surveying%']}
        Input text    ${AE_FT_Archi_LEED consulting}  ${test_data['LEED consulting%']}
        Input text    ${AE_FT_Archi_Management consulting}  ${test_data['Management consulting%']}
        Input text    ${AE_FT_Archi_Schematic designs}  ${test_data['Schematic designs w/o construction documents%']}
        Input text    ${AE_FT_Archi_Technical consulting(non-licensed)}  ${test_data['Technical consulting (non-licensed)%']}
        Input text    ${AE_FT_Archi_Other}  ${test_data['Other (please specify)%']}
        run keyword if  '${test_data['Other (please specify)%']}' != 'nan'   Input text    ${AE_FT_Archi_Other_Descr}     ${test_data['Other Description']}
        continue Click RE
       # ELSE
       # continue Click RE
       # END


Civil Engineering firm type and services
        [Arguments]  ${test_data}
#        run keyword if   '${test_data['Please select firm type']}' == 'CivilEngineering'       click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']
        Input text    ${AE_FT_Civil_Architecture}   ${test_data['Civil_Architecture%']}
        Input text    ${AE_FT_Civil_Chemical_engineering}   ${test_data['Civil_Chemical engineering%']}
        Input text    ${AE_FT_Civil_Civil_engineering}  ${test_data['Civil_Civil engineering%']}
        Input text    ${AE_FT_Civil_Concept_design_w/o_construction_documents}  ${test_data['Civil_Concept design w/o construction documents%']}
        Input text    ${AE_FT_Civil_Construction/program management}    ${test_data['Civil_Construction/program management%']}
        Input text    ${AE_FT_Civil_Drafting services}  ${test_data['Civil_Drafting services%']}
        Input text    ${AE_FT_Civil_Environmental abatement}    ${test_data['Civil_Environmental abatement%']}
        Input text    ${AE_FT_Civil_Environmental impact studies}   ${test_data['Civil_Environmental impact studies%']}
        Input text    ${AE_FT_Civil_Feasibility studies/reports opinions/master plans}  ${test_data['Civil_Feasibility studies/reports opinions/master plans%']}
        Input text    ${AE_FT_Civil_Forensic investigations and testimony}  ${test_data['Civil_Forensic investigations and testimony%']}
        Input text    ${AE_FT_Civil_Geotechnical engineering}    ${test_data['Civil_Geotechnical engineering%']}
        Input text    ${AE_FT_Civil_Land surveying}  ${test_data['Civil_Land surveying%']}
        Input text    ${AE_FT_Civil_Landscape architecture}  ${test_data['Civil_Landscape architecture%']}
        Input text    ${AE_FT_Civil_Machinery/equipment design}  ${test_data['Civil_Machinery/equipment design%']}
        Input text    ${AE_FT_Civil_Marine engineering}    ${test_data['Civil_Marine engineering%']}
        Input text    ${AE_FT_Civil_Mining engineering}    ${test_data['Civil_Mining engineering%']}
        Input text    ${AE_FT_Civil_Process engineering}   ${test_data['Civil_Process engineering%']}
        Input text    ${AE_FT_Civil_Structural engineering}  ${test_data['Civil_Structural engineering%']}
        Input text    ${AE_FT_Civil_Transportation engineering}  ${test_data['Civil_Transportation engineering%']}
        Input text    ${AE_FT_Civil_Electrical engineering}  ${test_data['Civil_Electrical engineering%']}
        Input text    ${AE_FT_Civil_Environmental permitting}    ${test_data['Civil_Environmental permitting%']}
        Input text    ${AE_FT_Civil_Facilities and operations management}    ${test_data['Civil_Facilities and operations management%']}
        Input text    ${AE_FT_Civil_HVAC engineering}    ${test_data['Civil_HVAC engineering%']}
        Input text    ${AE_FT_Civil_Interior design(non-structural)}  ${test_data['Civil_Interior design (non-structural)%']}
        Input text    ${AE_FT_Civil_Laboratory testing}  ${test_data['Civil_Laboratory testing%']}
        Input text    ${AE_FT_Civil_Management consulting}   ${test_data['Civil_Management consulting%']}
        Input text    ${AE_FT_Civil_Mechanical engineering}  ${test_data['Civil_Mechanical engineering%']}
        Input text    ${AE_FT_Civil_Schematic designs construction documents}    ${test_data['Civil_Schematic designs w/o construction documents%']}
        Input text    ${AE_FT_Civil_Technical consulting(non-licensed)}  ${test_data['Civil_Technical consulting (non-licensed)%']}
        Input text    ${AE_FT_Civil_Other}  ${test_data['Civil_Other (please specify)%']}
        continue Click RE


Electrical Engineering firm type and services
#        run keyword if   '${test_data['Please select firm type']}' == 'ElectricalEngineering'       click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']
        Input text   ${AE_FT_Electrical_Alarm systems/fire protection}  ${test_data['Electrical_Alarm systems/fire protection%']}
        Input text   ${AE_FT_Electrical_Chemical_engineering}   ${test_data['Electrical_Chemical engineering%']}
        Input text   ${AE_FT_Electrical_Construction/program management}    ${test_data['Electrical_Construction/program management%']}
        Input text   ${AE_FT_Electrical_Drafting services}  ${test_data['Electrical_Drafting services%']}
        Input text   ${AE_FT_Electrical_Electrical Engineering}   ${test_data['Electrical_Electrical engineering%']}
        Input text   ${AE_FT_Electrical_Environmental abatement}  ${test_data['Electrical_Environmental abatement%']}
        Input text   ${AE_FT_Electrical_Environmental impact studies}  ${test_data['Electrical_Environmental impact studies%']}
        Input text   ${AE_FT_Electrical_Feasibility studies/reports opinions/master plans}  ${test_data['Electrical_Feasibility studies/reports opinions/master plans%']}
        Input text   ${AE_FT_Electrical_Forensic investigations and testimony}  ${test_data['Electrical_Forensic investigations and testimony%']}
        Input text   ${AE_FT_Electrical_HVAC engineering}   ${test_data['Electrical_HVAC engineering%']}
        Input text   ${AE_FT_Electrical_Instrumentations/controls engineering}  ${test_data['Electrical_Instrumentations/controls engineering%']}
        Input text   ${AE_FT_Electrical_Mechanical engineering}  ${test_data['Electrical_Mechanical engineering%']}
        Input text   ${AE_FT_Electrical_Machinery/equipment design}  ${test_data['Electrical_Machinery/equipment design%']}
        Input text   ${AE_FT_Electrical_Marine engineering}  ${test_data['Electrical_Marine engineering%']}
        Input text   ${AE_FT_Electrical_Mining engineering}  ${test_data['Electrical_Mining engineering%']}
        Input text   ${AE_FT_Electrical_Process engineering}  ${test_data['Electrical_Process engineering%']}
        Input text   ${AE_FT_Electrical_Structural engineering}  ${test_data['Electrical_Structural engineering%']}
        Input text   ${AE_FT_Electrical_Transportation engineering}  ${test_data['Electrical_Transportation engineering%']}
        Input text   ${AE_FT_Electrical_Commisioning/test & balance}    ${test_data['Electrical_Commisioning/test & balance%']}
        Input text   ${AE_FT_Electrical_Facilities and operations management}   ${test_data['Electrical_Facilities and operations management%']}
        Input text   ${AE_FT_Electrical_Schematic designs construction documents}   ${test_data['Electrical_Schematic designs w/o construction documents%']}
        Input text   ${AE_FT_Electrical_Technical consulting(non-licensed)}    ${test_data['Electrical_Technical consulting (non-licensed)%']}
        Input text   ${AE_FT_Electrical_Other}  ${test_data['Electrical_Other (please specify)%']}
        continue Click RE


Mechanical Engineering firm type and services
        [Arguments]  ${test_data}
#        run keyword if   '${test_data['Please select firm type']}' == 'MechanicalEngineering'       click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']
        Input text   ${AE_FT_Mechanical_Alarm systems/fire protection}  ${test_data['Mechanical_Alarm systems/fire protection%']}
        Input text   ${AE_FT_Mechanical_Architecture}   ${test_data['Mechanical_Architecture%']}
        Input text   ${AE_FT_Mechanical_Chemical_engineering}   ${test_data['Mechanical_Chemical engineering%']}
        Input text   ${AE_FT_Mechanical_Civil_engineering}  ${test_data['Mechanical_Civil engineering%']}
        Input text   ${AE_FT_Mechanical_Commisioning/test & balance}    ${test_data['Mechanical_Commisioning/test & balance%']}
        Input text   ${AE_FT_Mechanical_Concept_design_w/o_construction_documents}  ${test_data['Mechanical_Concept design w/o construction documents%']}
        Input text   ${AE_FT_Mechanical_Construction/program management}    ${test_data['Mechanical_Construction/program management%']}
        Input text   ${AE_FT_Mechanical_Drafting services}  ${test_data['Mechanical_Drafting services%']}
        Input text   ${AE_FT_Mechanical_Electrical Engineering}  ${test_data['Mechanical_Electrical engineering%']}
        Input text   ${AE_FT_Mechanical_Environmental abatement}    ${test_data['Mechanical_Environmental abatement%']}
        Input text   ${AE_FT_Mechanical_Environmental impact studies}   ${test_data['Mechanical_Environmental impact studies%']}
        Input text   ${AE_FT_Mechanical_Feasibility studies/reports opinions/master plans}  ${test_data['Mechanical_Feasibility studies/reports opinions/master plans%']}
        Input text   ${AE_FT_Mechanical_HVAC engineering}   ${test_data['Mechanical_HVAC engineering%']}
        Input text   ${AE_FT_Mechanical_Machinery/equipment design}  ${test_data['Mechanical_Machinery/equipment design%']}
        Input text   ${AE_FT_Mechanical_Marine engineering}     ${test_data['Mechanical_Marine engineering%']}
        Input text   ${AE_FT_Mechanical_Mining engineering}  ${test_data['Mechanical_Mining engineering%']}
        Input text   ${AE_FT_Mechanical_Mechanical engineering}  ${test_data['Mechanical_Mechanical engineering%']}
        Input text   ${AE_FT_Mechanical_Plumbing design}    ${test_data['Mechanical_Plumbing design%']}
        Input text   ${AE_FT_Mechanical_Process engineering}    ${test_data['Mechanical_Process engineering%']}
        Input text   ${AE_FT_Mechanical_Structural engineering}  ${test_data['Mechanical_Structural engineering%']}
        Input text   ${AE_FT_Mechanical_Transportation engineering}     ${test_data['Mechanical_Transportation engineering%']}
        Input text   ${AE_FT_Mechanical_Air balancing}  ${test_data['Mechanical_Air balancing%']}
        Input text   ${AE_FT_Mechanical_Facilities and operations management}   ${test_data['Mechanical_Facilities and operations management%']}
        Input text   ${AE_FT_Mechanical_Forensic investigations and testimony}  ${test_data['Mechanical_Forensic investigations and testimony%']}
        Input text   ${AE_FT_Mechanical_Schematic designs construction documents}   ${test_data['Mechanical_Schematic designs w/o construction documents%']}
        Input text   ${AE_FT_Mechanical_Technical consulting(non-licensed)}    ${test_data['Mechanical_Technical consulting (non-licensed)%']}
        Input text   ${AE_FT_Mechanical_Other}  ${test_data['Mechanical_Other (please specify)%']}
        run keyword if  '${test_data['Mechanical_Other (please specify)%']}' != 'nan'  Input text   ${AE_FT_Mechanical_Other_Descr}     ${test_data['Mechanical_Other description']}
        continue Click RE

Structural Engineering firm type and services
#        run keyword if   '${test_data['Please select firm type']}' == 'StructuralEngineering'       click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']
        Input text   ${AE_FT_Structural_Architecture}   ${test_data['Structrual_Architecture%']}
        Input text   ${AE_FT_Structural_Chemical_engineering}   ${test_data['Structrual_Chemical engineering%']}
        Input text   ${AE_FT_Structural_Civil_engineering}  ${test_data['Structrual_Civil engineering%']}
        Input text   ${AE_FT_Structural_Concept_design_w/o_construction_documents}  ${test_data['Structrual_Concept design w/o construction documents%']}
        Input text   ${AE_FT_Structural_Construction/program management}    ${test_data['Structrual_Construction/program management%']}
        Input text   ${AE_FT_Structural_Electrical Engineering}  ${test_data['Structrual_Electrical engineering%']}
        Input text   ${AE_FT_Structural_Environmental abatement}    ${test_data['Structrual_Environmental abatement%']}
        Input text   ${AE_FT_Structural_Environmental impact studies}   ${test_data['Structrual_Environmental impact studies%']}
        Input text   ${AE_FT_Structural_Feasibility studies/reports opinions/master plans}  ${test_data['Structrual_Feasibility studies/reports opinions/master plans%']}
        Input text   ${AE_FT_Structural_Forensic investigations and testimony}  ${test_data['Structrual_Forensic investigations and testimony%']}
        Input text   ${AE_FT_Structural_Geotechnical engineering}   ${test_data['Structrual_Geotechnical engineering%']}
        Input text   ${AE_FT_Structural_Interior design(non-structural)}   ${test_data['Structrual_Interior design (non-structural)%']}
        Input text   ${AE_FT_Structural_Machinery/equipment design}  ${test_data['Structrual_Machinery/equipment design%']}
        Input text   ${AE_FT_Structural_Marine engineering}  ${test_data['Structrual_Marine engineering%']}
        Input text   ${AE_FT_Structural_Mining engineering}  ${test_data['Structrual_Mining engineering%']}
        Input text   ${AE_FT_Structural_Mechanical engineering}  ${test_data['Structrual_Mechanical engineering%']}
        Input text   ${AE_FT_Structural_Process engineering}    ${test_data['Structrual_Process engineering%']}
        Input text   ${AE_FT_Structural_Structural engineering}  ${test_data['Structrual_Structural engineering%']}
        Input text   ${AE_FT_Structural_Transportation engineering}  ${test_data['Structrual_Transportation engineering%']}
        Input text   ${AE_FT_Structural_Drafting services}  ${test_data['Structrual_Drafting services%']}
        Input text   ${AE_FT_Structural_Facilities and operations management}   ${test_data['Structrual_Facilities and operations management%']}
        Input text   ${AE_FT_Structural_HVAC engineering}   ${test_data['Structrual_HVAC engineering%']}
        Input text   ${AE_FT_Structural_Schematic designs construction documents}   ${test_data['Structrual_Schematic designs w/o construction documents%']}
        Input text   ${AE_FT_Structural_Technical consulting(non-licensed)}    ${test_data['Structrual_Technical consulting (non-licensed)%']}
        Input text   ${AE_FT_Structural_Other}  ${test_data['Structrual_Other (please specify)%']}
        run keyword if  '${test_data['Structrual_Other (please specify)%']}' != 'nan'  Input text   ${AE_FT_Structural_Other_Descr}  ${test_data['Mechanical_Air balancing%']}
        continue Click RE



Consultants firm type and services
#        run keyword if   '${test_data['Please select firm type']}' == 'Consultants'       click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']
        Input text   ${AE_FT_Consultant_Archeology}  ${test_data['Consultants_Archeology%']}
        Input text   ${AE_FT_Consultant_At-risk construction management}  ${test_data['Consultants_At-risk construction management%']}
        Input text   ${AE_FT_Consultant_Construction/program management}  ${test_data['Consultants_Construction/program management (agency)%']}
        Input text   ${AE_FT_Consultant_Construction materials testing}  ${test_data['Consultants_Construction materials testing%']}
        Input text   ${AE_FT_Consultant_Drafting services}   ${test_data['Consultants_Drafting services%']}
        Input text   ${AE_FT_Consultant_Forensic investigations and testimony}  ${test_data['Consultants_Forensic investigations and testimony%']}
        Input text   ${AE_FT_Consultant_Geotechnical engineering}  ${test_data['Consultants_Geotechnical engineering/investigations%']}
        Input text   ${AE_FT_Consultant_Interior design(non-structural)}  ${test_data['Consultants_Interior design (non-structural)%']}
        Input text   ${AE_FT_Consultant_Lighting design}  ${test_data['Consultants_Lighting design%']}
        Input text   ${AE_FT_Consultant_Materials transparency consultants}  ${test_data['Consultants_Materials transparency consultants%']}
        Input text   ${AE_FT_Consultant_Planners}  ${test_data['Consultants_Planners%']}
        Input text   ${AE_FT_Consultant_Property condition assessments}  ${test_data['Consultants_Property condition assessments%']}
        Input text   ${AE_FT_Consultant_Roofing consulting}  ${test_data['Consultants_Roofing consulting%']}
        Input text   ${AE_FT_Consultant_Security system consultant}  ${test_data['Consultants_Security system consultant%']}
        Input text   ${AE_FT_Consultant_Transportation consulting}  ${test_data['Consultants_Transportation consulting%']}
        Input text   ${AE_FT_Consultant_Waste disposal/brokering consultants}  ${test_data['Consultants_Waste disposal/brokering consultants%']}
       # IF    '${test_data['Consultants_Show more services%']}' == 'YES'
      #  Select Checkbox   ${AE_FT_Consultant_showmore_checkbox}
#        Set Selenium Implicit Wait    0.5
        Input text   ${AE_FT_Consultant_Acoustical consulting}  ${test_data['Consultants_Acoustical consulting%']}
        Input text   ${AE_FT_Consultant_Agricultural engineering}  ${test_data['Consultants_Agricultural engineering%']}
        Input text   ${AE_FT_Consultant_Air balancing}  ${test_data['Consultants_Air balancing%']}
        Input text   ${AE_FT_Consultant_Architecture}  ${test_data['Consultants_Architecture%']}
        Input text   ${AE_FT_Consultant_Audio visual consulting}  ${test_data['Consultants_Audio visual consulting%']}
        Input text   ${AE_FT_Consultant_Chemical engineering}  ${test_data['Consultants_Chemical engineering%']}
        Input text   ${AE_FT_Consultant_Civil engineering}  ${test_data['Consultants_Civil engineering%']}
        Input text   ${AE_FT_Consultant_Code compliance inspections}  ${test_data['Consultants_Code compliance inspections%']}
        Input text   ${AE_FT_Consultant_Construction site safety}  ${test_data['Consultants_Construction site safety%']}
        Input text   ${AE_FT_Consultant_Drilling(sampling)}  ${test_data['Consultants_Drilling (sampling)%']}
        Input text   ${AE_FT_Consultant_Drilling(wells,blasting,engineering)}  ${test_data['Consultants_Drilling (wells, blasting, engineering)%']}
        Input text   ${AE_FT_Consultant_Electrical engineering}  ${test_data['Consultants_Electrical engineering%']}
        Input text   ${AE_FT_Consultant_Elevator,escalator,moving walkway consulting}  ${test_data['Consultants_Elevator, escalator, moving walkway consulting%']}
        Input text   ${AE_FT_Consultant_Engineering geologist}  ${test_data['Consultants_Engineering geologist%']}
        Input text   ${AE_FT_Consultant_Facilities and operations management}  ${test_data['Consultants_Facilities and operations management%']}
        Input text   ${AE_FT_Consultant_Feasibility studies/reports opinions/master plans}  ${test_data['Consultants_Feasibility studies/reports opinions/master plans%']}
        Input text   ${AE_FT_Consultant_Food handling/kitchen consultant}  ${test_data['Consultants_Food handling/kitchen consultant%']}
        Input text   ${AE_FT_Consultant_Geologist}  ${test_data['Consultants_Geologist%']}
        Input text   ${AE_FT_Consultant_Graphic design signage,museum and exhibit designers}  ${test_data['Consultants_Graphic design: signage, museum and exhibit designers%']}
        Input text   ${AE_FT_Consultant_Historic preservation consulting}  ${test_data['Consultants_Historic preservation consulting%']}
        Input text   ${AE_FT_Consultant_Home inspections}  ${test_data['Consultants_Home inspections%']}
        Input text   ${AE_FT_Consultant_HVAC engineering}  ${test_data['Consultants_HVAC engineering%']}
        Input text   ${AE_FT_Consultant_Instrumentations/controls engineering}  ${test_data['Consultants_Instrumentations/controls engineering%']}
        Input text   ${AE_FT_Consultant_Irrigation design}  ${test_data['Consultants_Irrigation design%']}
        Input text   ${AE_FT_Consultant_LEED consulting}  ${test_data['Consultants_LEED consulting%']}
        Input text   ${AE_FT_Consultant_Machinery equipment design}  ${test_data['Consultants_Machinery equipment design%']}
        Input text   ${AE_FT_Consultant_Mechanical engineering}  ${test_data['Consultants_Mechanical engineering%']}
        Input text   ${AE_FT_Consultant_Mining engineering}  ${test_data['Consultants_Mining engineering%']}
        Input text   ${AE_FT_Consultant_Modelers/renderers}  ${test_data['Consultants_Modelers/renderers%']}
        Input text   ${AE_FT_Consultant_Nondestructive testing}  ${test_data['Consultants_Nondestructive testing%']}
        Input text   ${AE_FT_Consultant_Photogrammetry}  ${test_data['Consultants_Photogrammetry%']}
        Input text   ${AE_FT_Consultant_Pre-Purchase commercial consultants}  ${test_data['Consultants_Pre-Purchase commercial consultants%']}
        Input text   ${AE_FT_Consultant_Process engineering}  ${test_data['Consultants_Process engineering%']}
        Input text   ${AE_FT_Consultant_Sprinkler design}  ${test_data['Consultants_Sprinkler design%']}
        Input text   ${AE_FT_Consultant_Structural engineering}  ${test_data['Consultants_Structural engineering%']}
        Input text   ${AE_FT_Consultant_Telecommunications/communications}  ${test_data['Consultants_Telecommunications/communications%']}
        Input text   ${AE_FT_Consultant_Other}  ${test_data['Consultants_Other (please specify)%']}
        #Input text   ${AE_FT_Consultant_Other_Descr}  ${test_data['Structrual_Architecture%']}
        continue Click RE

Environmental firm type and services
#        run keyword if   '${test_data['Please select firm type']}' == 'Environmental'       click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']
        click element  //input[@name='RemediationConstructionYN' and @value='${test_data['Environment_Is your firm doing any remediation or construction?']}']
        IF    '${test_data['Environment_Is your firm doing any remediation or construction?']}' == 'YES'
        Input text   ${AE_FT_Enivronmental_Please enter %}  ${test_data['Environment_Please enter %']}
        Input text   ${AE_FT_Enivronmental_Briefly describe}    ${test_data['Environment_Briefly describe']}
        END
        Input text   ${AE_FT_Enivronmental_Air monitoring(asbestos)}   ${test_data['Environment_Air monitoring (asbestos)%']}
        Input text   ${AE_FT_Enivronmental_Air monitoring(other than asbestos)}    ${test_data['Environment_Air monitoring (other than asbestos)%']}
        Input text   ${AE_FT_Enivronmental_Archeologist/cultural resource specialist}   ${test_data['Environment_Archeologist/cultural resource specialist%']}
        Input text   ${AE_FT_Enivronmental_Asbestos abatement}  ${test_data['Environment_Asbestos abatement%']}
        Input text   ${AE_FT_Enivronmental_Asbestos management plan}    ${test_data['Environment_Asbestos management plan%']}
        Input text   ${AE_FT_Enivronmental_Asbestos sampling and testing}   ${test_data['Environment_Asbestos sampling and testing%']}
        Input text   ${AE_FT_Enivronmental_Biologist}   ${test_data['Environment_Biologist%']}
        Input text   ${AE_FT_Enivronmental_Civil engineering}   ${test_data['Environment_Civil engineering%']}
        Input text   ${AE_FT_Enivronmental_Corrosion engineering}   ${test_data['Environment_Corrosion engineering%']}
        Input text   ${AE_FT_Enivronmental_Drilling}    ${test_data['Environment_Drilling%']}
        Input text   ${AE_FT_Enivronmental_Ecologist}   ${test_data['Environment_Ecologist%']}
        Input text   ${AE_FT_Enivronmental_Environmental abatement}  ${test_data['Environment_Environmental abatement%']}
        Input text   ${AE_FT_Enivronmental_Environmental health & safety consulting}    ${test_data['Environment_Environmental health & safety consulting%']}
        Input text   ${AE_FT_Enivronmental_Environmental impact reports}    ${test_data['Environment_Environmental impact reports%']}
        Input text   ${AE_FT_Enivronmental_Environmental permitting}    ${test_data['Environment_Environmental permitting%']}
        Input text   ${AE_FT_Enivronmental_Environmental program management}    ${test_data['Environment_Environmental program management%']}
        Input text   ${AE_FT_Enivronmental_Environmental remediation}   ${test_data['Environment_Environmental remediation%']}
        Input text   ${AE_FT_Enivronmental_Environmental studies and reports}   ${test_data['Environment_Environmental studies and reports%']}
        Input text   ${AE_FT_Enivronmental_Erosion control engineer}    ${test_data['Environment_Erosion control engineer%']}
        Input text   ${AE_FT_Enivronmental_Facilities and operations management}    ${test_data['Environment_Facilities and operations management%']}
        Input text   ${AE_FT_Enivronmental_Feasibility studies/reports opinions/master plans}   ${test_data['Environment_Feasibility studies/reports opinions/master plans%']}
        Input text   ${AE_FT_Enivronmental_Fisheries management}    ${test_data['Environment_Fisheries management%']}
        Input text   ${AE_FT_Enivronmental_Forestry management}  ${test_data['Environment_Forestry management%']}
        Input text   ${AE_FT_Enivronmental_Habitat/wetlands consulting}    ${test_data['Environment_Habitat/wetlands consulting%']}
        Input text   ${AE_FT_Enivronmental_Hazerdous materials management}    ${test_data['Environment_Hazerdous materials management%']}
        Input text   ${AE_FT_Enivronmental_Hydrogeology/geology}    ${test_data['Environment_Hydrogeology/geology%']}
        Input text   ${AE_FT_Enivronmental_Industrial hygenist}    ${test_data['Environment_Industrial hygenist%']}
        Input text   ${AE_FT_Enivronmental_Laboratory testing}    ${test_data['Environment_Laboratory testing%']}
        Input text   ${AE_FT_Enivronmental_Litigation support}    ${test_data['Environment_Litigation support%']}
        Input text   ${AE_FT_Enivronmental_Mold investigations}    ${test_data['Environment_Mold investigations%']}
        Input text   ${AE_FT_Enivronmental_Mold remediation}    ${test_data['Environment_Mold remediation%']}
        Input text   ${AE_FT_Enivronmental_Mold sampling and testing}    ${test_data['Environment_Mold sampling and testing%']}
        Input text   ${AE_FT_Enivronmental_Natural resource managers}    ${test_data['Environment_Natural resource managers%']}
        Input text   ${AE_FT_Enivronmental_Perc/absorption rates}    ${test_data['Environment_Perc/absorption rates%']}
        Input text   ${AE_FT_Enivronmental_Permitting and compliance assistance}  ${test_data['Environment_Permitting and compliance assistance%']}
        Input text   ${AE_FT_Enivronmental_Phase I environmental site assessments}  ${test_data['Environment_Phase I environmental site assessments%']}
        Input text   ${AE_FT_Enivronmental_Phase II environmental site assessments}  ${test_data['Environment_Phase II environmental site assessments%']}
        Input text   ${AE_FT_Enivronmental_Soil, air and water sampling and testing}  ${test_data['Environment_Soil, air and water sampling and testing%']}
        Input text   ${AE_FT_Enivronmental_Storage tank (UST/AST)}    ${test_data['Environment_Storage tank (UST/AST)%']}
        Input text   ${AE_FT_Enivronmental_Storm water management}    ${test_data['Environment_Storm water management%']}
        Input text   ${AE_FT_Enivronmental_Training/consulting}   ${test_data['Environment_Training/consulting%']}
        Input text   ${AE_FT_Enivronmental_Wildllife management specialist}    ${test_data['Environment_Wildllife management specialist%']}
        Input text   ${AE_FT_Enivronmental_Other}    ${test_data['Environment_Other (please specify)%']}
        continue Click RE

Land Surveyor firm type and services
        [Arguments]    ${test_data}
#        click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']
        Run Keyword If    '${test_data['Land_Boundary or property surveys%']}' != 'nan'  Input text  ${AE_FT_Land_Boundry_Property}  ${test_data['Land_Boundary or property surveys%']}
        Run Keyword If    '${test_data['Land_Construction stakeout%']}' != 'nan'  Input text  ${AE_FT_Land_Construction_Stakeout}  ${test_data['Land_Construction stakeout%']}
        Run Keyword If    '${test_data['Land_Geodetic or control surveys%']}' != 'nan'  Input text  ${AE_FT_Land_Geodetic_Control}  ${test_data['Land_Geodetic or control surveys%']}
        Run Keyword If    '${test_data['Land_Hydrographic surveys%']}' != 'nan'  Input text  ${AE_FT_Land_Hydrographic}  ${test_data['Land_Hydrographic surveys%']}
        Run Keyword If    '${test_data['Land_Mapping or cartography%']}' != 'nan'  Input text  ${AE_FT_Land_Mapping_Cartogrophy}  ${test_data['Land_Mapping or cartography%']}
        Scroll Element Into View  ${AE_FT_Land_Quantity_Surveys}
        Run Keyword If    '${test_data['Land_Oil/gas well location surveys%']}' != 'nan'  Input text  ${AE_FT_Land_Oil_Gas_wellLocation}  ${test_data['Land_Oil/gas well location surveys%']}
        Run Keyword If    '${test_data['Land_Other services requiring engineering stamp%']}' != 'nan'  Input text  ${AE_FT_Land_OS_Req_Eng_Stamp}  ${test_data['Land_Other services requiring engineering stamp%']}
        Run Keyword If    '${test_data['Land_Photogrammetric surveys%']}' != 'nan'  Input text  ${AE_FT_Land_Photogrammetric}  ${test_data['Land_Photogrammetric surveys%']}
        Run Keyword If    '${test_data['Land_Plans/specs for streets/highways,etc%']}' != 'nan'  Input text  ${AE_FT_Land_Plans_Street_Highways}  ${test_data['Land_Plans/specs for streets/highways,etc%']}
        Run Keyword If    '${test_data['Land_Quantity surveys%']}' != 'nan'  Input text  ${AE_FT_Land_Quantity_Surveys}  ${test_data['Land_Quantity surveys%']}
        Run Keyword If    '${test_data['Land_Route surveys for engineering projects%']}' != 'nan'  Input text  ${AE_FT_Land_Route_Surveys_Eng}  ${test_data['Land_Route surveys for engineering projects%']}
        Run Keyword If    '${test_data['Land_Subdivisions%']}' != 'nan'  Input text  ${AE_FT_Land_Subdivisions}  ${test_data['Land_Subdivisions%']}
        Run Keyword If    '${test_data['Land_Topographic surveys%']}' != 'nan'  Input text  ${AE_FT_Land_Topographic_Surveys}  ${test_data['Land_Topographic surveys%']}
        Run Keyword If    '${test_data['Land_Other (please specify)%']}' != 'nan'  Input text  ${AE_FT_Land_Other}  ${test_data['Land_Other (please specify)%']}
        Run Keyword If    '${test_data['Land_Other_Description']}' != 'nan'  Input text  ${AE_FT_Land_Other_Descr}  ${test_data['Land_Other_Description']}
        continue Click RE

Landscape Architecture firm type and services
        [Arguments]    ${test_data}
#        click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']
        #run keyword if   '${test_data['Please select firm type']}' == 'StructuralEngineering'       click element   //input[@name='FirmLicenseYN' and @value='${test_data['Firm licensed']}']  
        Run Keyword If    '${test_data['Landscape_Architecture%']}' != 'nan'  Input text  ${AE_FT_Landscape_Architecture%}  ${test_data['Landscape_Architecture%']}
        Run Keyword If    '${test_data['Landscape_Concept design w/o construction documents%']}' != 'nan'  Input text  ${AE_FT_Landscape_Concept design}  ${test_data['Landscape_Concept design w/o construction documents%']}
        Run Keyword If    '${test_data['Landscape_Construction/program management%']}' != 'nan'  Input text  ${AE_FT_Landscape_Construction/program managementl}  ${test_data['Landscape_Construction/program management%']}
        Run Keyword If    '${test_data['Landscape_Golf course design%']}' != 'nan'  Input text  ${AE_FT_Landscape_Golf course design}  ${test_data['Landscape_Golf course design%']}
        Run Keyword If    '${test_data['Landscape_Landscape architecture%']}' != 'nan'  Input text  ${AE_FT_Landscape_Landscape architecture}  ${test_data['Landscape_Landscape architecture%']}
        Run Keyword If    '${test_data['Landscape_Other (please specify)%']}' != 'nan'  Input text  ${AE_FT_Landscape_Other}  ${test_data['Landscape_Other (please specify)%']}
        Run Keyword If    '${test_data['Landscape_Other_Description']}' != 'nan'  Input text  ${AE_FT_Landscape_Other_Descr}  ${test_data['Landscape_Other_Description']}
        continue Click RE