*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot

*** Variables ***
${ML_GI_FirmName}=    //input[@name='FirmName']
#${ML_GI_PrimaryContactLastName}=  id=PrimaryContactLastName
#${ML_GI_Select-Result-Label-State}=    //div[@class='selectListContainerState']
#${ML_GI_State_Select}=    //select[@id='ApplicantMailingState']
#${ML_GI_State}=    id=ApplicantMailingState
${ML_GI_County}=    //input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedEnd MuiAutocomplete-input MuiAutocomplete-inputFocused css-3xklx']
#${ML_GI_Countyky}=    id=countyKY
#${ML_GI_Countyca}=    id=countyCA
#${ML_GI_Countynv}=    id=countyNV
#${ML_GI_Countyil}=    id=countyIL
#${ML_GI_Countyfl}=    id=countyFL
#${ML_GI_Zip_Code}=    id=ApplicantMailingZip
${ML_GI_Applicant_Website}=    //input[@name='ApplicantWebsite']
${ML_GI_ExistingPremium}=   //input[@name='ExistingPremium']
#${ML_GI_Primary_Contact_FirstName}=    id=PrimaryContactFirstName
#${ML_GI_Primary_Contact_LastName}=    id=PrimaryContactLastName
#${ML_GI_ApplicantEmail}=    id=ApplicantEmail
${ML-CQ-ExpirationDateOfCurrentPolicy}=   //input[@name='ExpirationDateCurrentPolicy']
${ML_GI_EffectiveDate}=    //input[@name='EffectiveDate']
${ML_GI_ExpirationDate}=    //input[@name='ExpirationDate']
#${ML_GI_continue}=    //input[@id='continueButton']
#${ML_GI_countyNY}=    id=countyNY
#${ML_GI_countyPA}=    id=countyPA
#${RE-Workid}=    //div[@id='lob-title']
#${ML_GI_IsUserRetainingEnteredData}=    //input[@id='IsUserRetainingEnteredData']
#${ML_GI_PrimaryContactLastName}=  id=PrimaryContactLastName
${ML_GI_Applicant_Address}=    //input[@name='ApplicantGoogleAddress_Explanation']
#${ID_wait-One-moment-please}=  //*[@id="lb_please_wait"]/div/div/div/p
##Private
${ML_GI_NatureofOperations}=  //input[@name='OrgType']
#${Text-GI-NatureofOperations}=  //input[@id='s2id_autogen1_search']
${select-GI-NatureofOperations}=  //div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary Mui-error MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-sizeSmall MuiInputBase-adornedEnd MuiAutocomplete-inputRoot css-1rumla0']
${ML_GI_EntityType}=  //input[@name='EntityType']
${ID-GIP-YearEstablished}=  //input[@name='YearEstablished']
${ML_GI_TotalEmployeeCount}=  //input[@name='TotalEmployeeCount']
#${ML_GI_HazardCounties}=  //select[@id='hazardCounties']
#${Name-GI-exposureToTobaccoCannabisMunitions}=   exposureToTobaccoCannabisMunitions
#${Name-GI-productsInvasiveOrFDAapproval}=  productsInvasiveOrFDAapproval
#${Name-GI-managementExperienceYrs}=   managementExperienceYrs
#${County_ID_nfp}=  id=ApplicantMailingCounty
@{County}=    Pennsylvania  California  Illinois  Florida  Nevada  New York
@{Decline_OrgType}=  Tobacco Farming--111910    Crude Petroleum and Natural Gas Extraction--211111    Natural Gas Liquid Extraction--211112    Bituminous Coal and Lignite Surface Mining--212111    Bituminous Coal Underground Mining--212112    Anthracite Mining--212113    Iron Ore Mining--212210    Gold Ore Mining--212221    Silver Ore Mining--212222    Lead Ore and Zinc Ore Mining--212231    Copper Ore and Nickel Ore Mining--212234    Uranium-Radium-Vanadium Ore Mining--212291    All Other Metal Ore Mining--212299    Dimension Stone Mining and Quarrying--212311    Crushed and Broken Limestone Mining and Quarrying--212312    Crushed and Broken Granite Mining and Quarrying--212313    Other Crushed and Broken Stone Mining and Quarrying--212319    Construction Sand and Gravel Mining--212321    Industrial Sand Mining--212322    Kaolin and Ball Clay Mining--212324    Clay and Ceramic and Refractory Minerals Mining--212325    Potash, Soda, and Borate Mineral Mining--212391    Phosphate Rock Mining--212392    Other Chemical and Fertilizer Mineral Mining--212393    All Other Nonmetallic Mineral Mining--212399    Drilling Oil and Gas Wells--213111    Support Activities for Oil and Gas Operations--213112    Support Activities for Coal Mining--213113    Support Activities for Metal Mining--213114    Support Activities for Nonmetallic Minerals (except Fuels) Mining--213115    Hydroelectric Power Generation--221111    Fossil Fuel Electric Power Generation--221112    Nuclear Electric Power Generation--221113    Solar Electric Power Generation--221114    Wind Electric Power Generation--221115    Geothermal Electric Power Generation--221116    Biomass Electric Power Generation--221117    Other Electric Power Generation--221118    Electric Bulk Power Transmission and Control--221121    Electric Power Distribution--221122    Natural Gas Distribution--221210    Water Supply and Irrigation Systems--221310    Sewage Treatment Facilities--221320    Steam and Air-Conditioning Supply--221330    Tobacco Manufacturing--312230    Petroleum Refineries--324110    Petroleum Lubricating Oil and Grease Manufacturing--324191    All Other Petroleum and Coal Products Manufacturing--324199    Petrochemical Manufacturing--325110    Industrial Gas Manufacturing--325120    Medicinal and Botanical Manufacturing--325411    Pharmaceutical Preparation Manufacturing--325412    In-Vitro Diagnostic Substance Manufacturing--325413    Biological Product (except Diagnostic) Manufacturing--325414    Explosives Manufacturing--325920    Small Arms Ammunition Manufacturing--332992    Ammunition (except Small Arms) Manufacturing--332993    Small Arms, Ordnance, and Ordnance Accessories Manufacturing--332994    Search, Detection, Navigation, Guidance, Aeronautical, and Nautical System and Instrument Manufacturing--334511    Aircraft Manufacturing--336411    Aircraft Engine and Engine Parts Manufacturing--336412    Other Aircraft Parts and Auxiliary Equipment Manufacturing--336413    Guided Missile and Space Vehicle Manufacturing--336414    Guided Missile and Space Vehicle Propulsion Unit and Propulsion Unit Parts Manufacturing--336415    Other Guided Missile and Space Vehicle Parts and Auxiliary Equipment Manufacturing--336419    Military Armored Vehicle, Tank, and Tank Component Manufacturing--336992    Jewelry and Silverware Manufacturing--339910    Jewelry, Watch, Precious Stone, and Precious Metal Merchant Wholesalers--423940    Tobacco and Tobacco Product Merchant Wholesalers--424940    Pharmacies and Drug Stores--446110    Jewelry Stores--448310    Tobacco Stores--453991    Scheduled Passenger Air Transportation--481111    Scheduled Freight Air Transportation--481112    Nonscheduled Chartered Passenger Air Transportation--481211    Nonscheduled Chartered Freight Air Transportation--481212    Other Nonscheduled Air Transportation--481219    Pipeline Transportation of Crude Oil--486110    Pipeline Transportation of Natural Gas--486210    Pipeline Transportation of Refined Petroleum Products--486910    All Other Pipeline Transportation--486990    Air Traffic Control--488111    Other Airport Operations--488119    Other Support Activities for Air Transportation--488190    Motion Picture and Video Production--512110    Motion Picture and Video Distribution--512120    Motion Picture Theaters (except Drive-Ins)--512131    Drive-In Motion Picture Theaters--512132    Teleproduction and Other Postproduction Services--512191    Other Motion Picture and Video Industries--512199    Record Production--512210    Integrated Record Production/Distribution--512220    Music Publishers--512230    Sound Recording Studios--512240    Other Sound Recording Industries--512290    Radio Networks--515111    Radio Stations--515112    Television Broadcasting--515120    News Syndicates--519110    Libraries and Archives--519120    Internet Publishing and Broadcasting and Web Search Portals--519130    All Other Information Services--519190    Monetary Authorities-Central Bank--521110    Commercial Banking--522110    Savings Institutions--522120    Credit Unions--522130    Other Depository Credit Intermediation--522190    Credit Card Issuing--522210    Sales Financing--522220    Consumer Lending--522291    Real Estate Credit--522292    International Trade Financing--522293    Secondary Market Financing--522294    All Other Nondepository Credit Intermediation--522298    Mortgage and Nonmortgage Loan Brokers--522310    Financial Transactions Processing, Reserve, and Clearinghouse Activities--522320    Other Activities Related to Credit Intermediation--522390    Investment Banking and Securities Dealing--523110    Securities Brokerage--523120    Commodity Contracts Dealing--523130    Commodity Contracts Brokerage--523140    Securities and Commodity Exchanges--523210    Miscellaneous Intermediation--523910    Portfolio Management--523920    Investment Advice--523930    Trust, Fiduciary, and Custody Activities--523991    Miscellaneous Financial Investment Activities--523999    Direct Life Insurance Carriers--524113    Direct Health and Medical Insurance Carriers--524114    Direct Property and Casualty Insurance Carriers--524126    Direct Title Insurance Carriers--524127    Other Direct Insurance (except Life, Health, and Medical) Carriers--524128    Reinsurance Carriers--524130    Claims Adjusting--524291    Third Party Administration of Insurance and Pension Funds--524292    All Other Insurance Related Activities--524298    Pension Funds--525110    Health and Welfare Funds--525120    Other Insurance Funds--525190    Open-End Investment Funds--525910    Trusts, Estates, and Agency Accounts--525920    Other Financial Vehicles--525990    Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)--533110    Offices of Lawyers--541110    All Other Legal Services--541199    Offices of Certified Public Accountants--541211    Tax Preparation Services--541213    Payroll Services--541214    Other Accounting Services--541219    Testing Laboratories--541380    Research and Development in Biotechnology--541711    Research and Development in the Physical, Engineering, and Life Sciences (except Biotechnology)--541712    Offices of Bank Holding Companies--551111    Offices of Other Holding Companies--551112    Corporate, Subsidiary, and Regional Managing Offices--551114    Employment Placement Agencies--561311    Temporary Help Services--561320    Professional Employer Organizations--561330    Collection Agencies--561440    Credit Bureaus--561450    Repossession Services--561491    Tour Operators--561520    Convention and Visitors Bureaus--561591    All Other Travel Arrangement and Reservation Services--561599    Investigation Services--561611    Security Guards and Patrol Services--561612    Armored Car Services--561613    Security Systems Services (except Locksmiths)--561621    Elementary and Secondary Schools--611110    Junior Colleges--611210    Colleges, Universities, and Professional Schools--611310    Business and Secretarial Schools--611410    Computer Training--611420    Professional and Management Development Training--611430    Cosmetology and Barber Schools--611511    Flight Training--611512    Apprenticeship Training--611513    Other Technical and Trade Schools--611519    Fine Arts Schools--611610    Sports and Recreation Instruction--611620    Language Schools--611630    Exam Preparation and Tutoring--611691    Automobile Driving Schools--611692    All Other Miscellaneous Schools and Instruction--611699    Educational Support Services--611710    Offices of Physicians (except Mental Health Specialists)--621111    Offices of Physicians, Mental Health Specialists--621112    Offices of Dentists--621210    Offices of Chiropractors--621310    Offices of Optometrists--621320    Offices of Mental Health Practitioners (except Physicians)--621330    Offices of Physical, Occupational and Speech Therapists, and Audiologists--621340    Offices of Podiatrists--621391    Offices of All Other Miscellaneous Health Practitioners--621399    Family Planning Centers--621410    Outpatient Mental Health and Substance Abuse Centers--621420    HMO Medical Centers--621491    Kidney Dialysis Centers--621492    Freestanding Ambulatory Surgical and Emergency Centers--621493    All Other Outpatient Care Centers--621498    Medical Laboratories--621511    Diagnostic Imaging Centers--621512    Home Health Care Services--621610    Ambulance Services--621910    Blood and Organ Banks--621991    All Other Miscellaneous Ambulatory Health Care Services--621999    General Medical and Surgical Hospitals--622110    Psychiatric and Substance Abuse Hospitals--622210    Specialty (except Psychiatric and Substance Abuse) Hospitals--622310    Nursing Care Facilities (Skilled Nursing Facilities)--623110    Residential Intellectual and Developmental Disability Facilities--623210    Residential Mental Health and Substance Abuse Facilities--623220    Continuing Care Retirement Communities--623311    Assisted Living Facilities for the Elderly--623312    Other Residential Care Facilities--623990    Child and Youth Services--624110    Services for the Elderly and Persons with Disabilities--624120    Other Individual and Family Services--624190    Community Food Services--624210    Temporary Shelters--624221    Other Community Housing Services--624229    Emergency and Other Relief Services--624230    Vocational Rehabilitation Services--624310    Child Day Care Services--624410    Theater Companies and Dinner Theaters--711110    Dance Companies--711120    Musical Groups and Artists--711130    Other Performing Arts Companies--711190    Sports Teams and Clubs--711211    Racetracks--711212    Other Spectator Sports--711219    Promoters of Performing Arts, Sports, and Similar Events with Facilities--711310    Promoters of Performing Arts, Sports, and Similar Events without Facilities--711320    Agents and Managers for Artists, Athletes, Entertainers, and Other Public Figures--711410    Independent Artists, Writers, and Performers--711510    Museums--712110    Historical Sites--712120    Zoos and Botanical Gardens--712130    Nature Parks and Other Similar Institutions--712190    Amusement and Theme Parks--713110    Amusement Arcades--713120    Casinos (except Casino Hotels)--713210    Other Gambling Industries--713290    Golf Courses and Country Clubs--713910    Skiing Facilities--713920    Marinas--713930    Fitness and Recreational Sports Centers--713940    Bowling Centers--713950    All Other Amusement and Recreation Industries--713990    Casino Hotels--721120    Bed-and-Breakfast Inns--721191    All Other Traveler Accommodation--721199    RV (Recreational Vehicle) Parks and Campgrounds--721211    Recreational and Vacation Camps (except Campgrounds)--721214    Rooming and Boarding Houses--721310    Diet and Weight Reducing Centers--812191    Other Personal Care Services--812199    All Other Personal Services--812990    Religious Organizations   (other than church / synagogue)--813110    Grantmaking Foundations--813211    Voluntary Health Organizations--813212    Other Grantmaking and Giving Services--813219    Human Rights Organizations--813311    Environment, Conservation and Wildlife Organizations--813312    Other Social Advocacy Organizations--813319    Civic and Social Organizations--813410    Business Associations--813910    Professional Organizations--813920    Labor Unions and Similar Labor Organizations--813930    Political Organizations--813940    Other Similar Organizations (except Business, Professional, Labor, and Political Organizations)--813990    Private Households--814110    Executive Offices--921110    Legislative Bodies--921120    Public Finance Activities--921130    Executive and Legislative Offices, Combined--921140    American Indian and Alaska Native Tribal Governments--921150    Other General Government Support--921190    Courts--922110    Police Protection--922120    Legal Counsel and Prosecution--922130    Correctional Institutions--922140    Parole Offices and Probation Offices--922150    Fire Protection--922160    Other Justice, Public Order, and Safety Activities--922190    Administration of Education Programs--923110    Administration of Public Health Programs--923120    Administration of Human Resource Programs (except Education, Public Health, and Veterans' Affairs Programs)--923130    Administration of Veterans' Affairs--923140    Administration of Air and Water Resource and Solid Waste Management Programs--924110    Administration of Conservation Programs--924120    Administration of Housing Programs--925110    Administration of Urban Planning and Community and Rural Development--925120    Administration of General Economic Programs--926110    Regulation and Administration of Transportation Programs--926120    Regulation and Administration of Communications, Electric, Gas, and Other Utilities--926130    Regulation of Agricultural Marketing and Commodities--926140    Regulation, Licensing, and Inspection of Miscellaneous Commercial Sectors--926150    Space Research and Technology--927110    National Security--928110    International Affairs--928120
@{Decline-If_OrgType}=  All Other Miscellaneous Crop Farming--111998     All Other Miscellaneous Food Manufacturing--311999     All Other Miscellaneous Wood Product Manufacturing--321999     All Other Miscellaneous Chemical Product and Preparation Manufacturing--325998     All Other Miscellaneous Nonmetallic Mineral Product Manufacturing--327999     All Other Miscellaneous Manufacturing--339999     Other Miscellaneous Durable Goods Merchant Wholesalers--423990     Other Miscellaneous Nondurable Goods Merchant Wholesalers--424990     Sporting Goods Retailers--459110     All Other Miscellaneous Retailers--459999
@{Additional_Decline-If_OrgType}=  Surgical and Medical Instrument Manufacturing--339112  Surgical Appliance and Supplies Manufacturing--339113  Dental Equipment and Supplies Manufacturing--339114  Ophthalmic Goods Manufacturing--339115  Dental Laboratories--339116
@{YearEstablished}=  2021  2022  2023  2024
#${Name-GI-Recommended-Fein}=  name=radioAddress
#${ML_GI_Confirm-Fein}=  (//input[@id="contButton"])[4]

*** Keywords ***
General FEIN Information
      [Arguments]  &{test_data}
       Wait Until Page Contains Element      //input[@name='FeinYesNo' and @value='${test_data['Does the applicant have a FEIN?']}']  100s
       Scroll Element Into View    //input[@name='FeinYesNo' and @value='${test_data['Does the applicant have a FEIN?']}']
       click element   //input[@name='FeinYesNo' and @value='${test_data['Does the applicant have a FEIN?']}']
       sleep  3s
       run keyword if  '${test_data["Does the applicant have a FEIN?"]}' == 'YES'   Input text  ${ML_GQ_FEIN}  ${test_data['What is the applicant’s FEIN?']}
       Continue Click RE
       Accept Clearance Popup

DNO General Information
        [Arguments]    &{test_data}
        Wait Until Page Contains Element   ${ML_GI_FirmName}  120s
        Fetch V2 Work ID
        run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  Private Geneneral Information   &{test_data}
        run keyword if  '${test_data['Dummy']}' == 'YES'  Input text    ${ML_GI_FirmName}    ${test_data['Applicant Name']}
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'   Add Applicant address   &{test_data}   ELSE   Input Text   ${ML_GI_Applicant_Address}  ${test_data['Applicant Address']}
        Sleep    2s
        run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  Press Keys    ${ML_GI_Applicant_Address}   ARROW_DOWN
        Sleep    2s
        run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  Press Keys    ${ML_GI_Applicant_Address}   RETURN
        Sleep    2s
       # run keyword if  '${test_data['Program']}' == 'ML-PRIVATE'  Get Work_ID
       # run keyword if  '${test_data['Dummy']}' == 'YES'  Input text    ${ML_GI_Applicant_Website}    ${test_data['Website Address']}
       # Execute Javascript  window.scrollTo(0,1000)
        IF    '${test_data['Program']}' == 'ML-PRIVATE'
            run keyword if  '${test_data['County']}' != 'nan'   Select Value from Dropdown  ${ML_GI_County}   ${test_data['County']}
        END
        sleep  3s
        run keyword if  '${test_data['Program']}' != 'ML-PRIVATE'  GI Effective Date   &{test_data}
        sleep  3s
        Continue Click RE
        Sleep    5s
        Accept Clearance Popup


Add Applicant address
        [Arguments]    &{test_data}
        IF  '${test_data["Does the applicant have a FEIN?"]}' != 'YES'
            Input Text   ${ML_GI_Applicant_Address}  ${test_data['Applicant Address']}
            sleep  2s
            Press Keys    ${ML_GI_Applicant_Address}   ARROW_DOWN
            sleep  2s
            Press Keys    ${ML_GI_Applicant_Address}   RETURN
            sleep  2s
        END

Private Geneneral Information
    [Arguments]    &{test_data}
    wait until element is not visible   globalAjaxLoading  80
    Sleep    2s
    Select Value from Dropdown    ${ML_GI_EntityType}    ${test_data["Entity Type"]}
    Sleep    2s
    wait until element is not visible   globalAjaxLoading  80
    Set Selenium Speed    0.1s
    Input text    ${ID-GIP-YearEstablished}    ${test_data['Year Established']}
    wait until element is not visible   globalAjaxLoading  80
    Set Selenium Speed    0s
    Input text  ${ML_GI_TotalEmployeeCount}   ${test_data['Total Employee count']}
    ${YearEstablished-check} =  run keyword and return status   list should contain value  ${YearEstablished}  ${test_data['Year Established']}
    sleep  3s
    run keyword if    ${YearEstablished-check}    Select Radio Button   ${Name-GI-managementExperienceYrs}  ${test_data['Does management have more than three years experience?']}

Private Org Type check
    [Arguments]    &{test_data}
    sleep  2s
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Page Contains Element   ${ML_GI_NatureofOperations}   60s
    Fetch V2 Work ID
    click element  ${ML_GI_NatureofOperations}
    wait until element is not visible   globalAjaxLoading  80
    Press Keys    ${ML_GI_NatureofOperations}  ${test_data['Nature of Operations']}
    sleep  3s
    Press Keys   ${ML_GI_NatureofOperations}  ALT  ARROW_DOWN
    Press Keys   NONE  RETURN
    ${Decline_OrgType-check} =  run keyword and return status  list should contain value  ${Decline_OrgType}  ${test_data['Nature of Operations']}
    run keyword if    ${Decline_OrgType-check}    Decline Orgs  &{test_data}
    wait until element is not visible   globalAjaxLoading  80
    ${Decline-If_OrgType-check} =  run keyword and return status  list should contain value  ${Decline-If_OrgType}  ${test_data['Nature of Operations']}
    run keyword if    ${Decline-If_OrgType-check}    Decline-If Orgs   &{test_data}
    wait until element is not visible   globalAjaxLoading  80
    ${Additional_Decline-If_OrgType-check} =  run keyword and return status  list should contain value  ${Additional_Decline-If_OrgType}  ${test_data['Nature of Operations']}
    run keyword if    ${Additional_Decline-If_OrgType-check}   Additional_Decline-If Orgs    &{test_data}

Enter Firm Name and Applicant Address
    [Arguments]  &{test_data}
    Input text    ${ML_GI_FirmName}    ${test_data['Applicant Name']}
    Sleep    1s
    Input Text   ${ML_GI_Applicant_Address}  ${test_data['Applicant Address']}
    Sleep    1s
    Press Keys    ${ML_GI_Applicant_Address}   ARROW_DOWN
    Sleep    1s
    Press Keys    ${ML_GI_Applicant_Address}   RETURN

Decline Orgs
    [Arguments]  &{test_data}
    Private Geneneral Information   &{test_data}
    Enter Firm Name and Applicant Address   &{test_data}
    Continue Click RE
    Accept Clearance Popup
    Decline Policy Summary  &{test_data}

Decline-If Orgs
    [Arguments]  &{test_data}
    wait until element is not visible   globalAjaxLoading  80
    sleep  1s
    Click element     //input[@name='TobaccoExposure' and @value='${test_data['Tobacco, Cannabis, Arms, Ordnance or Munitions?']}']
    wait until element is not visible   globalAjaxLoading  80
    Private Geneneral Information   &{test_data}
    Enter Firm Name and Applicant Address   &{test_data}
    Continue Click RE
    Accept Clearance Popup
    Run Keyword If    '${test_data['Tobacco, Cannabis, Arms, Ordnance or Munitions?']}' == 'YES'   Decline Policy Summary  &{test_data}


Additional_Decline-If Orgs
    [Arguments]  &{test_data}
    wait until element is not visible   globalAjaxLoading  80
    sleep  0.5s
    click element     //input[@name='productsInvasiveOrFDAapproval' and @value='${test_data['Are any products invasive? And/or are you seeking FDA approval of products currently?']}']
    wait until element is not visible   globalAjaxLoading  80
    Private Geneneral Information   &{test_data}
    Enter Firm Name and Applicant Address   &{test_data}
    Continue Click RE
    Accept Clearance Popup
    Run Keyword If    '${test_data['Are any products invasive? And/or are you seeking FDA approval of products currently?']}' == 'YES'   Decline Policy Summary  &{test_data}

GI Effective Date
    [Arguments]    &{test_data}
    scroll element into view    ${ML_GI_EffectiveDate}
    Sleep    2s
    Wait Until Element Is Visible   ${ML_GI_EffectiveDate}    timeout=20s
    ${Current_date}=  Get Current Date    result_format=%m/%d/%Y
    sleep  2s
    IF   '${test_data['Program']}' == 'ML-PRIVATE'
        IF  '${test_data['Does your client have existing coverage?']}' == 'YES'
            Sleep    2s
            Press Keys  ${ML-CQ-ExpirationDateOfCurrentPolicy}  ${Current_date}
            Sleep    2s
            Press keys  ${ML-CQ-ExpirationDateOfCurrentPolicy}   ALT
        ELSE
            Press Keys    ${ML_GI_EffectiveDate}  ${Current_date}
        END
    END
    run keyword if   '${test_data['Program']}' != 'ML-PRIVATE'    Press Keys    ${ML_GI_EffectiveDate}  ${Current_date}
    Sleep    2s
    run keyword if   '${test_data['Program']}' != 'ML-PRIVATE'   click element  ${ML_GI_ExpirationDate}
    #run keyword if   '${test_data['Program']}' == 'ML-PRIVATE' and '${test_data['Does your client have existing coverage?']}' == 'YES'  Input text  ${ML_GI_ExistingPremium}     ${test_data['Total premium for existing coverage']}
