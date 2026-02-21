*** Settings ***
Library  ReadData.py
Library    ResourceFile.py

*** Keywords ***
Read config data
    [Arguments]  ${filename}
    &{config}=  read_config  ${CURDIR}${/}${filename}
    RETURN  &{config}

Read master file
    [Arguments]  ${filename}
    &{tc_info}=  read_master  ${filename}
    RETURN  &{tc_info}

Read master file reg
    [Arguments]  ${filename}
    &{tc_info}=  read_master_reg  ${filename}
    RETURN  &{tc_info}

Read validation steps
    [Arguments]  ${filename}    ${col}
    &{checks}=  read_validations  ${filename}    ${col}
    RETURN

Read master file id
    [Arguments]  ${filename}
    @{tc_info}=  read_master_id  ${filename}
    RETURN  @{tc_info}

Read Column Data file
    [Arguments]    ${filename}    ${col}
    &{data}=    read_coldata     ${filename}    ${col}
    RETURN  &{data}

Read Row Data file
    [Arguments]    ${filename}    ${col}
    &{data}=    read_rowdata     ${filename}    ${col}
    RETURN  &{data}

Read data file
    [Arguments]  ${filename}  ${col}
    &{data}=  read_data  ${filename}  ${col}
    RETURN  &{data}

Read Execution Master
    [Arguments]  ${filename}
    @{tc_info}=  read_exe_master  ${filename}
    RETURN  @{tc_info}

Create test steps
    [Arguments]  ${filename}
    &{steps}=  create_steps  ${filename}
    RETURN  &{steps}


Read TC Row Data
    [Arguments]  ${filename}  ${col}
    &{data}=  read_tc_file_rowdata  ${filename}  ${col}
    RETURN  &{data}

Create resource file
    create_res  ${CURDIR}${/}Resource.csv

Create AE resource file
    create_sae_res    ${CURDIR}${/}AE_Resource.csv

Create Alternus resource file
    create_alt_res    ${CURDIR}${/}Alt_Resource.csv

Create TMS resource file
    create_tms_res    ${CURDIR}${/}TMS_Resource.csv

Update resource file
    [Arguments]  @{row}
    write_res  ${CURDIR}${/}Resource.csv  @{row}

Update AE_resource file
    [Arguments]  @{row}
    write_res  ${CURDIR}${/}AE_Resource.csv  @{row}

Update Alt_resource file
    [Arguments]  @{row}
    write_res  ${CURDIR}${/}Alt_Resource.csv  @{row}

Update TMS_resource file
    [Arguments]  @{row}
    write_res  ${CURDIR}${/}TMS_Resource.csv  @{row}