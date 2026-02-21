*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Keywords ***
RE EPL Questions
    [Arguments]    &{test_data}
    Execute Javascript  window.scrollTo(0,100)
    Click element    //input[@name='PastWorkforceLoss' and @value='${test_data['Layoffs, staff reductions or facility closings that would affect more than 25% of the workforce?']}']
    Click element    //input[@name='FutureWorkforceLoss' and @value='${test_data['Staff reductions or facility closings that will affect more than 25% of the workforce in the next 12 months?']}']
    Click element    //input[@name='WrittenGuidelines' and @value='${test_data['Sexual harassment and employee complaints that are distributed to all employees and independent contractors?']}']
    Click element    //input[@name='SubsidiaryOfForeignCompany' and @value='${test_data['Is the applicant a subsidiary or U.S. division of a foreign parent company?']}']
    Click element    //input[@name='LiabalityClaims' and @value='${test_data['Has the applicant had employment practices liability claims or incidents during the last 3 years?']}']
    continue Click RE
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30