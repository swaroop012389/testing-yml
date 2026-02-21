*** Settings ***
Library    SeleniumLibrary
Resource    ../Generic.robot

*** Keywords ***
Wind Coverages
    [Arguments]    ${test_data}
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Page Contains    Wind Coverages    50s
    click element  //input[@name='Structurewith1000ftofOceanGulfSeaTidalWaterYN' and @value='${test_data['Is the structure located within 1,000 feet of the ocean, sea or gulf coastline?']}']
    Click Continue Button