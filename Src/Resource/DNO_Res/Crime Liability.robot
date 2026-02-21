*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/Generic.robot

*** Variables ***
${ML-CL-Emp_Welfare}=   //input[@name='EmployeeAccessCount' ]

*** Keywords ***
Crime Liability
    [Arguments]    &{test_data}
    sleep  2s
    wait until page contains   Are international and domestic purchasing, inventory and payables procedures and controls consistent?   10s
    click element    //input[@name='IntlDomesticPurchase' and @value='${test_data["Are international and domestic purchasing, inventory and payables procedures and controls consistent?"]}']
    click element    //input[@name='OriginalReceipts' and @value='${test_data["Does the Applicant have a process that requires all expense reimbursements to require original receipts"]}']
    click element    //input[@name='MonthlyReconcile' and @value='${test_data["Are bank accounts reconciled monthly by someone not authorized to make deposits, withdrawals, or write checks?"]}']
    click element    //input[@name='AccessControl' and @value='${test_data["Does the Applicant maintain a control that prohibits employees whom have access to the purchasing system"]}']
    click element    //input[@name='PriorEmployment' and @value='${test_data["Prior employment references?"]}']
    click element    //input[@name='CriminalHistory' and @value='${test_data["Criminal history?"]}']
    click element    //input[@name='CreditHistory' and @value='${test_data["Credit history in the case of employees who are in the finance department to detect higher risk employees?"]}']
    click element    //input[@name='FictitiousEmployees' and @value='${test_data["Does the Applicant have a process to detect fictitious employees in its payroll system?"]}']
    click element    //input[@name='Inventory' and @value='${test_data["Does the Applicant have inventory?"]}']
    Run Keyword If    '${test_data["Does the Applicant have inventory?"]}'=='YES'  Inventory Details  &{test_data}
    Run Keyword If   '${test_data['Program']}' == 'ML-PRIVATE'  Inventory Details  &{test_data}
    click element   //input[@name='WireTransfer' and @value='${test_data["the authority to initiate and approve all wire transfers separated amongst different employees?"]}']
    click element    //input[@name='VerbalComm' and @value='${test_data["Before an employee completes a wire transfer are bank account"]}']
    click element    //input[@name='SpoofedEmails' and @value='${test_data["Does the Applicant’s email server use authentication to detect Spoofed emails from a fraudulent domain?"]}']
    click element    //input[@name='TelephoneFundsTransfer' and @value='${test_data["Does the Applicant accept funds transfer instructions from clients over the telephone?"]}']
    click element    //input[@name='AntiFrausTraining' and @value='${test_data["Does the Applicant perform ongoing anti-fraud training to all employees of the organization"]}']
    Input Text    ${ML-CL-Emp_Welfare}  ${test_data["How many Employees handle, have access to or maintain records of money, securities"]}
    continue Click RE
    sleep  3s

Inventory Details
    [Arguments]    &{test_data}
    click element    //input[@name='PhysicalSafegaurds' and @value='${test_data["Does the Applicant have physical safeguards such as surveillance, security and lockup procedures?"]}']
    click element    //input[@name='PhysicalCount' and @value='${test_data["Does the Applicant perform a physical count of inventory at least on an annual basis?"]}']
    click element    //input[@name='InventoryMgmt' and @value='${test_data["inventory counted and audited by someone other than the person in charge"]}']
    click element    //input[@name='PreciousInventory' and @value='${test_data["Does the Applicant have any inventory considered to be precious or highly valued such as Gold"]}']
