*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Keywords ***
AE Risk Management and Loss Prevention
        [Arguments]    &{test_data}
        Sleep    3s
        Wait Until Page Contains Element    //input[@name='MajorityStaffQltyMgmntProceduresYN' and @value='${test_data["Does the majority of the staff know and implement the firm’s written in-house quality management procedures?"]}']  10s
        Execute Javascript    window.scrollTo(0, 0)
        click element    //input[@name='MajorityStaffQltyMgmntProceduresYN' and @value='${test_data["Does the majority of the staff know and implement the firm’s written in-house quality management procedures?"]}']
        click element    //input[@name='MajorityUseAutomatedMasterYN' and @value='${test_data["Do the majority of the firm’s projects use an automated master specification system?"]}']
        click element    //input[@name='InhouseContinuingPgmYN' and @value='${test_data["Does the firm have an in-house continuing education program for professional employees?"]}']
        click element    //input[@name='AttendRiskMgmntGT50PctYN' and @value='${test_data["In the last year, did at least 50% of the firm’s employees attend any risk management seminar/webinar?"]}']
        click element    //input[@name='CompletedRiskMgmnt50PctYN' and @value='${test_data["Have at least 50% of the firm’s employees completed at least one course within a risk management continuing education program?"]}']
        click element    //input[@name='UseWrittenContractsYN' and @value='${test_data["Does the firm use written contracts on all projects?"]}']
        click element    //input[@name='SpecifiedPaymentTerms51PctYN' and @value='${test_data["Do at least 51% of the firm's written contracts contain specified payment terms?"]}']
        click element    //input[@name='PreProjectPlanning51PctYN' and @value='${test_data["Do at least 51% of the firm’s projects involve pre-project planning that result in a project-definition document?"]}']
        click element    //input[@name='PeerReviewed51PctYN' and @value='${test_data["Are at least 51% of the firm’s instruments of service or deliverables peer reviewed prior to delivery?"]}']
        click element    //input[@name='DocumentConstructability51PctYN' and @value='${test_data["Do at least 51% of the firm’s projects use a documented constructability review process during design?"]}']
        click element    //input[@name='DocumentedSubmittalYN' and @value='${test_data["When the firm performs construction contract administration services, is a documented submittal or shop drawing "]}']
        click element    //input[@name='WrittenAgreementAndInsuranceCertificatesYN' and @value='${test_data["In projects with subconsultants, does the firm receive both a written agreement and insurance certificates"]}']
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30