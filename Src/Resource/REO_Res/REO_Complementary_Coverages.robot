*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot

*** Variables ***
${ID-CC-Nobutton}=    //input[@id='noButton']
${ID-CC-Yesbutton}=    //input[@id='contButton' and @value='Yes']
${Name-CC-BusinessOwnersPolicyChk}=    name=BusinessOwnersPolicyChk
${Name-CC-WorkersCompensationChk}=    name=WorkersCompensationChk
${ID-CC-Okbutton}=    //input[@value="Ok" and @id="contButton"]

*** Keywords ***
Complimentary Page
    [Arguments]    &{test_data}
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30
    run keyword if    '${test_data['Complementary Coverages']}' == 'No'    click element     ${ID-CC-Nobutton}
    run keyword if    '${test_data['Complementary Coverages']}' == 'Yes'    Complimentary products    &{test_data}

Complimentary products
    [Arguments]    &{test_data}
    run keyword if    '${test_data['Complementary Coverages']}' == 'Yes'    click element    ${ID-CC-Yesbutton}
    run keyword if    '${test_data['Business Owners Policy']}' == 'Yes'    select checkbox    ${Name-CC-BusinessOwnersPolicyChk}
    run keyword if    '${test_data['Workers Compensation']}' == 'Yes'    select checkbox    ${Name-CC-WorkersCompensationChk}
    continue Click RE
    click element    ${ID-CC-Okbutton}
    wait until element is not visible  ${ID_wait-One-moment-please}  30
    wait until element is not visible  ${ID_Pleasewait}   30