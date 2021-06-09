*** Settings ***
Resource  ../Resources/frontend.robot
Resource  ../Resources/datamanager.robot
Resource  ../Resources/common.robot
Resource  ../Data/InputData.robot
Library   DatabaseLibrary
Library   OperatingSystem
Library   CustomLibs/dbtesting.py
#Test Setup    common.Begin Web test
*** Variables ***

# robot -d results tests/demo.robot

${Filepath}=  C:\\Users\\anan4615\\Documents\\UNIX\\logsample.txt
${text} =  INFO

${ORACLE DATABASE URL}           jdbc:oracle:thin:@edb-dev.int.colorado.edu:1521:eddev
${ORACLE DATABASE USER}         ANAN4615
${ORACLE DATABASE PASSWORD}     Colorado2020!
${ORACLE DATABASE DRIVER}       oracle.jdbc.driver.OracleDriver

*** Test Cases ***

#
#linkfile
#    [Arguments]     ${Filepath}    ${text}
#
#    #${CourseList}= datamanager.Get CSV data    ${courses_multi}
#    ${Output} =     get csv data    ${Filepath}    ${text}
#    log to console   ${Output}

#Verify a new student can login to BuffPortal
#     [Arguments]     ${BP_link} ${BP_username}  ${BP_password}
#     Open and login BP Portal    ${BP_link}  ${BP_username}  ${BP_password}

TC_001
    [Documentation]    get Data from table
    Connect To Database Using Custom Params    '${ORACLE DATABASE DRIVER}',  '${ORACLE DATABASE URL}',  ['${ORACLE DATABASE USER}',   '${ORACLE DATABASE PASSWORD}']

    @{S}  Query  select * from ISIS_STUDENTS where EMPLID = '000206000';
    log to console  @{S}




