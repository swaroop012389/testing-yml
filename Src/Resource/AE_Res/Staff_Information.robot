*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  Collections
Library  String
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${AE_SI_Architects_Principals}=  //input[@name='SI_PrincipalsArchirectsPct']
${AE_SI_Architects_Staff}=  //input[@name='SI_StaffArchirectsPct']
${AE_SI_Engineers_Principals}=  //input[@name='SI_PrincipalsEngineersPct']
${AE_SI_Engineers_Staff}=  //input[@name='SI_StaffEngineersPct']
${AE_SI_Land_surveyors_Principals}=  //input[@name='SI_PrincipalsLandSurveyorsPct']
${AE_SI_Land_surveyors_Staff}=  //input[@name='SI_StaffLandSurveyorsPct']
${AE_SI_Landscape_architects_Principals}=  //input[@name='SI_PrincipalsLandscapeArchitectsPct']
${AE_SI_Landscape_architects_Staff}=  //input[@name='SI_StaffLandscapeArchitectsPct']
${AE_SI_Other_Principals}=  //input[@name='SI_PrincipalsConsultantsPct']
${AE_SI_Other_Staff}=  //input[@name='SI_StaffConsultantsPct']
${AE_SI_Are_more_than_50%_of_the_professional_staff}=  PrivatePracticeACECStaff
${AE_SI_Are_more_than_50%_of_the_professional_staff_LS}=  MemberOfACSMNSPS


*** Keywords ***
AE Staff Information
        [Arguments]    &{test_data}
        Input Text    ${AE_SI_Architects_Principals}   ${test_data['Architects Principals']}
        Input Text    ${AE_SI_Architects_Staff}   ${test_data['Architects Staff']}
        Input Text    ${AE_SI_Engineers_Principals}   ${test_data['Engineers Principals']}
        Input Text    ${AE_SI_Engineers_Staff}   ${test_data['Engineers Staff']}
        Input Text    ${AE_SI_Land_surveyors_Principals}   ${test_data['Land surveyors Principals']}
        Input Text    ${AE_SI_Land_surveyors_Staff}   ${test_data['Land surveyors Staff']}
        Input Text    ${AE_SI_Landscape_architects_Principals}   ${test_data['Landscape architects Principals']}
        Input Text    ${AE_SI_Landscape_architects_Staff}   ${test_data['Landscape architects Staff']}
        Input Text    ${AE_SI_Other_Principals}   ${test_data['Other Principals']}
        Input Text    ${AE_SI_Other_Staff}   ${test_data['Other Staff']}
        Run Keyword If  '${test_data['Please select firm type']}'=='LandSurveyor'  click element   //input[@name='ACSM_NSPSMemberYN' and @value='${test_data['Are the principal(s) of the firm and all other land surveyors in charge of projects a member of ACSM/NSPS?']}']  ELSE  Click Element   //input[@name='ProfessionalStaffGT50PctYN' and @value='${test_data["Are more than 50% of the professional staff at the firm members of the American Institute of Architects/National Society of Professional Engineers?"]}']
        continue Click RE
        wait until element is not visible  ${ID_wait-One-moment-please}  30
        wait until element is not visible  ${ID_Pleasewait}   30