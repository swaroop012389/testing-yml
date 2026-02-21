*** Settings ***
Library    SeleniumLibrary
Library  String
Library    DateTime

*** Variables ***
${ID-UMS-Apply}=    //input[@value='Apply']
${ID-UMS-ApplyFilter}=  //input[@value='Apply Filter']
${ID-UMS-ApplyChanges}=    //button/span[text()='Apply Changes']
${ID-Apply&Continue}=    //input[@value='Apply & Continue']
${ID-UMS-Apply&Continue}=    //input[@value='Apply & Continue']
${ID-UMS-Generateforreview}=   //button/span[text()='Generate for review']
${ID-UMS-Submit}=  id=Submit
${ID-UMS-ReviewAction}=   Action
${ID-UMS-OK}=    //input[@value='OK']
${UMS-Select}=    link=Select
${ID-BinderLetterDateString}=    id=BinderLetterDateString
${ID-BinderTerminateDateString}=    id=BinderTerminateDateString
${PS-ViewCoverages}=    //a[contains(@href, '/Nexus/RatingCoverages/ViewCoverages/')]

*** Keywords ***
Add Number of Days to the Date
    [Arguments]  ${element}    ${days}
    ${month}=    get substring    ${element}    0    2
    ${date}=    get substring    ${element}    3    5
    ${year}=    get substring    ${element}    6
    ${Eff_Startdate}=   convert date    ${year}-${month}-${date}    date_format=%Y-%m-%d
    ${Effective-date}=   add time to date    ${Eff_Startdate}    ${days} days
    ${T_year}=    get substring    ${Effective-date}  0  4
    ${T_month}=    get substring    ${Effective-date}    5    7
    ${T_date}=    get substring    ${Effective-date}    8    10
    ${Terminate_date}=    set variable    ${T_month}/${T_date}/${T_year}
    RETURN    ${Terminate_date}

Get Substring Value
    [Arguments]  ${element}    ${Start_index}    ${End_index}
    ${Substring_value}=    get substring   ${element}    ${Start_index}    ${End_index}
    RETURN    ${Substring_value}

Click Policy
    click element    ${PS-ViewCoverages}
    wait until element is not visible   globalAjaxLoading  40

TMS Current Date Conversion
    ${Current-DateTime}=    get current date
    ${Cur_Date}=    fetch from left    ${Current-DateTime}   ${space}
    ${Year}=    get substring    ${Cur_Date}    0    4
    ${month}=    get substring    ${Cur_Date}    5    7
    ${Mod-month}=    run keyword if    '${month[0]}' == '0'    get substring    ${Cur_Date}    6    7    ELSE    get substring   ${Cur_Date}    5    7
    ${date}=    get substring    ${Cur_Date}    8    10
    ${Converted_Date}=     set variable    ${Mod-month}/${date}/${Year}
    RETURN   ${Converted_Date}

UMS Username
    ${UMS_Username}=    get text    (//p[@align="right"])//i
    ${User_Name}=   fetch from right    ${UMS_Username}    ,${space}
    RETURN    ${User_Name}