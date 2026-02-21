*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${AE_PT_Airports_(excluding terminals)}=  //input[@name='AirportsExclTerminalsPct']
${AE_PT_Airports_terminals}=  //input[@name='AirportTerminalsPct']
${AE_PT_Amusement_rides}=  //input[@name='AmusementRidesPct']
${AE_PT_Apartments}=  //input[@name='ApartmentsPct']
${AE_PT_Assisted_living_facilities}=  //input[@name='AssistedLivingFacilitiesPct']
${AE_PT_Bridges}=  //input[@name='BridgesPct']
${AE_PT_Churches/religious}=  //input[@name='ChurchesReligiousPct']
${AE_PT_Condos/co-ops}=  //input[@name='CondosCoopsPct']
${AE_PT_Convention_centers/arenas/stadiums}=  //input[@name='ConventionCentersPct']
${AE_PT_Dams}=  //input[@name='DamsPct']
${AE_PT_Dorms}=  //input[@name='DormsPct']
${AE_PT_Environmental_remediation}=  //input[@name='EnvironmentalRemediationPct']
${AE_PT_Harbors/ports/piers}=  //input[@name='HarborsPortsPiersPct']
${AE_PT_Hospitals/healthcare}=  //input[@name='HospitalsHealthcarePct']
${AE_PT_Hotels/motels}=  //input[@name='HotelsMotelsPct']
${AE_PT_projecttype_jail}=  //input[@name='JailsPct']
${AE_PT_Landfills/solid waste}=  //input[@name='LandfillsSolidWastePct']
${AE_PT_Libraries}=  //input[@name='LibrariesPct']
${AE_PT_Manufacturing/industrial}=  //input[@name='ManufacturingIndustrialPct']
${AE_PT_Mass_transit}=  //input[@name='MassTransitPct']
${AE_PT_Multi-family residential}=  //input[@name='MultiFamilyResidentialPct']
${AE_PT_Nuclear}=  //input[@name='NuclearPct']
${AE_PT_Office_buildings/banks}=  //input[@name='OfficeBuildingsBanksPct']
${AE_PT_Parking}=  //input[@name='ParkingPct']
${AE_PT_Parks/playgrounds}=  //input[@name='ParksPlaygroundsPct']
${AE_PT_Petrol_chemicals}=  //input[@name='PetroChemicalPct']
${AE_PT_Potable_water_systems}=  //input[@name='PotableWaterSystemsPct']
${AE_PT_Real_estate_development}=  //input[@name='RealEstateDevelopmentPct']
${AE_PT_Recreation/sports}=  //input[@name='RecreationSportsPct']
${AE_PT_Roads/highways}=  //input[@name='RoadsHighwaysPct']
${AE_PT_Schools/colleges}=  //input[@name='SchoolsCollegesPct']
${AE_PT_Shopping centers retail/restaurants}=  //input[@name='ShoppingCentersPct']
${AE_PT_Single-family_residential}=  //input[@name='SingleFamilyResidentialPct']
${AE_PT_Storm_water_systems}=  //input[@name='StormWaterSystemsPct']
${AE_PT_Tunnels}=  //input[@name='TunnelsPct']
${AE_PT_Utilities}=  //input[@name='UtilitiesPct']
${AE_PT_Warehouses}=  //input[@name='WarehousesPct']
${AE_PT_Wastewater_treatment}=  //input[@name='WastewaterTreatmentPct']
${AE_PT_Waste_treatment}=  //input[@name='WasteTreatmentPct']
${AE_PT_Water/sewer/pipelines}=  //input[@name='WaterSewerPipelinesPct']
${AE_PT_Other_(please provide description)}=  //input[@name='OtherPct']
${AE_PT_PT_Description}=  //input[@name='OtherDesc']
${IDcontinue}=  //input[@id='continueButton']


*** Keywords ***
AE Project Types
        [Arguments]    &{test_data}
        Wait Until Page Contains Element     ${AE_PT_Airports_(excluding terminals)}  10s
        Input text    ${AE_PT_Airports_(excluding terminals)}   ${test_data['Airports (excluding terminals)']}
        Input text    ${AE_PT_Airports_terminals}   ${test_data['Airports terminals']}
        Input text    ${AE_PT_Amusement_rides}  ${test_data['Amusement rides']}
        Input text    ${AE_PT_Apartments}   ${test_data['Apartments']}
        Input text    ${AE_PT_Assisted_living_facilities}   ${test_data['Assisted living facilities']}
        Input text    ${AE_PT_Bridges}  ${test_data['Bridges']}
        Input text    ${AE_PT_Churches/religious}  ${test_data['Churches/religious']}
        Input text    ${AE_PT_Condos/co-ops}    ${test_data['Condos/co-ops']}
        Input text    ${AE_PT_Convention_centers/arenas/stadiums}  ${test_data['Convention centers/arenas/stadiums']}
        Input text    ${AE_PT_Dams}   ${test_data['Dams']}
        Input text    ${AE_PT_Dorms}    ${test_data['Dorms']}
        Input text    ${AE_PT_Environmental_remediation}   ${test_data['Environmental remediation']}
        Input text    ${AE_PT_Hotels/motels}       ${test_data['Hotels/motels']}
        Input text    ${AE_PT_projecttype_jail}    ${test_data['Jails']}
        Input text    ${AE_PT_Harbors/ports/piers}   ${test_data['Harbors/ports/piers']}
        Input text    ${AE_PT_Hospitals/healthcare}   ${test_data['Hospitals/healthcare']}
        Input text    ${AE_PT_Landfills/solid waste}   ${test_data['Landfills/solid waste']}
        Input text    ${AE_PT_Libraries}   ${test_data['Libraries']}
        Input text    ${AE_PT_Manufacturing/industrial}  ${test_data['Manufacturing/industrial']}
        Input text    ${AE_PT_Mass_transit}    ${test_data['Mass transit']}
        Input text    ${AE_PT_Multi-family residential}   ${test_data['Multi-family residential']}
        Input text    ${AE_PT_Nuclear}     ${test_data['Nuclear']}
        Input text    ${AE_PT_Office_buildings/banks}   ${test_data['Office buildings/banks']}
        Input text    ${AE_PT_Parking}     ${test_data['Parking']}
        Input text    ${AE_PT_Parks/playgrounds}   ${test_data['Parks/playgrounds']}
        Input text    ${AE_PT_Petrol_chemicals}  ${test_data['Petrol chemicals']}
        Input text    ${AE_PT_Potable_water_systems}   ${test_data['Potable water systems']}
        Input text    ${AE_PT_Real_estate_development}   ${test_data['Real estate development']}
        Input text    ${AE_PT_Recreation/sports}   ${test_data['Recreation/sports']}
        Input text    ${AE_PT_Roads/highways}     ${test_data['Roads/highways']}
        Input text    ${AE_PT_Schools/colleges}   ${test_data['Schools/colleges']}
        Input text    ${AE_PT_Shopping centers retail/restaurants}   ${test_data['Shopping centers retail/restaurants']}
        Input text    ${AE_PT_Single-family_residential}   ${test_data['Single-family residential']}
        Input text    ${AE_PT_Storm_water_systems}   ${test_data['Storm water systems']}
        Input text    ${AE_PT_Tunnels}     ${test_data['Tunnels']}
        Scroll Element Into View    ${AE_PT_Utilities}
        Input text    ${AE_PT_Utilities}    ${test_data['Utilities']}
        Input text    ${AE_PT_Warehouses}    ${test_data['Warehouses']}
        Input text    ${AE_PT_Wastewater_treatment}   ${test_data['Wastewater treatment']}
        Input text    ${AE_PT_Waste_treatment}   ${test_data['Waste treatment']}
        Input text    ${AE_PT_Water/sewer/pipelines}   ${test_data['Water/sewer/pipelines']}
        Input text    ${AE_PT_Other_(please provide description)}   ${test_data['PT Other']}
        Run Keyword If   '${test_data['PT Other']}' != 'nan'      Input text    ${AE_PT_PT_Description}   ${test_data['Description']}
        continue Click RE
       # wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30
