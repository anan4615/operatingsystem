*** Settings ***
Library   DatabaseLibrary
Library   OperatingSystem

#Suite Setup     Connect To database using custom params   cx_Oracle     'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@edb-dev.int.colorado.edu:1521:eddev', ['ANAN4615', 'Colorado2020!']
#Suite Setup         Connect To Database Using Custom Params         cx_Oracle       'ANAN4615'      'Colorado2020!'     'edb-dev.int.colorado.edu:1521/eddev'
#Suite Teardown      disconnect from database

*** Variables ***

${DBName}       dirsvcs
${ORACLE DATABASE USER}        
${ORACLE DATABASE PASSWORD}     
${DBHost}       edb-dev.int.colorado.edu
${DBPort}       1521
${SID}          eddev

${DB_CONNECT_STRING}    '',     '',     '
*** Test Cases ***
#Check record present in DB
#    check if exists in database     select * from ISIS_STUDENTS where EMPLID = '000206000';
#
#Retrieve records from DB
#    Query   select * from ISIS_STUDENTS where EMPLID = '000206000';
Connect To DB
   # [Arguments]    ${DB_CONNECT_STRING}
    #Set Environment Variable    PATH    'C:\\development\\instantclient-basiclite-nt-19.8.0.0.0dbru\\instantclient_19_8'
    Set Global Variable    ${DB_CONNECT_STRING}
    #Connect to DB
    Connect To Database Using Custom Params     cx_Oracle   ${DB_CONNECT_STRING}
