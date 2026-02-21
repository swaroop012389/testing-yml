*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot


*** Variables ***
${Due_This_Week}=  //a[@href='/TMS/Home/DueThisWeekForAll']
${Due_This_Month}=  //a[@href='/TMS/Home/DueThisMonthForAll']
${Over_Due}=   //a[@href='/TMS/Home/OverDueForAll']
${Due_Today}=  //a[@href='/TMS/Home/DueTodayForAll']
${Task_Management_TMS}=  //i[@class='nav-icon fas fa-tasks']
${View_Task}=  //i[@class='nav-icon fas fa-file']
${Weekly_Task}=    //a[@href='/TMS/Home/DueThisWeekForAll']
${Date_Text}=    (//div//table//tbody/tr//td)[10]


*** Keywords ***
TMS Dashboard
    [Arguments]    ${test_data}
    Navigate to TMS
    Task Management
    View Task

Task Management
    set selenium implicit wait  5
    set focus to element  ${Task_Management_TMS}
    sleep  0.5
    mouse up  ${Task_Management_TMS}
    click element  ${Task_Management_TMS}  CTRL+ALT

View Task
    set selenium implicit wait  5
    set focus to element  ${View_Task}
    sleep  0.5
    mouse up  ${View_Task}
    click element  ${View_Task}

Back to TMS
    ${title} =    get window titles
    Switch Window    title=${title}[1]
    ${title} =    get window titles
    Switch Window    title=${title}[0]

Back to UMS
    ${title} =    get window titles
    Switch Window    title=${title}[0]
    ${title} =    get window titles
    Switch Window    title=${title}[1]

Weekly Task
    set selenium implicit wait  5
    set focus to element  ${Weekly_Task}
    sleep  0.5
    mouse up  ${Weekly_Task}
    click element  ${Weekly_Task}
    ${CheckDate}=  get text   ${Date_Text}
    log to console   ${CheckDate}

View TMS Weekly Task
    [Arguments]    ${test_data}
    Navigate to TMS
    Weekly Task