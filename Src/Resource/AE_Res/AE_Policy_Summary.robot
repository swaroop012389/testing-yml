*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  ../../Resource/UMS.robot
Resource  ../../Resource/Generic.robot
Resource  ../../../Data Provider/DataProvider.robot


*** Variables ***
${ID-FileType} =  id=fileTypeCode


*** Keywords ***
AE Upload Document in policy summary page
        [Arguments]    ${test_data}
        ${file}=    set variable    c:\\Users\\Default\\NTUSER.DAT
        wait until element is enabled  //span[@class="has-files"]  10
        ${title} =  Get text  id=lob-title
        ${id} =  Get Regexp matches  ${title}  \\d
        ${work-id} =  Evaluate  "".join($id)
        click element  //span[@class="has-files"]
        wait until element is enabled  //*[@id="wia_upload_file"]  10
        choose file  //*[@id="wia_upload_file"]  ${file}
        wait until element is not visible  ${ID_wait-One-moment-please}  100
        wait until element is not visible  ${ID_Pleasewait}   100
        Check and select from list by label  ${ID-FileType}  Signed Application
        click element  //*[text()="Upload"]
        wait until element is not visible  ${ID_wait-One-moment-please}  50
        wait until element is not visible  ${ID_Pleasewait}   50
        click button  //input[@name="saveAndExitButton"]
        Click element  link:Clear All
        wait until element is enabled  //*[contains(text(),'Search Options')]
        wait until element is not visible  ${ID_wait-One-moment-please}  1
        wait until element is not visible  ${ID_Pleasewait}   1
        Click element  //*[contains(text(),'Search Options')]
        input text  id=workItemId  ${work-id}
        Click button  id=searchBtn
        ${policy-number} =  Get text  //*[@id="${work-id}"]/div[3]/table/tbody/tr/td[1]/ul/li[2]
        Write Log  Policy issued. Work id: ${work-id} and ${policy-number}
        ${ext-policy-number} =   Replace string  ${policy-number}  Policy Number:${SPACE}  ${EMPTY}
        set test variable  ${policy-no}  ${ext-policy-number}
        set to dictionary    ${test_data}    PolicyNumber=${ext-policy-number}


