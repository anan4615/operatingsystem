*** Settings ***
Library   DatabaseLibrary
Library   OperatingSystem
Library
#Suite Setup     Connect To database     jaydebeapi      ${DBName}    ${ORACLE DATABASE USER}   ${ORACLE DATABASE PASSWORD}    ${DBHost}   ${DBPort}
#Suite Setup     Connect To database using custom params      cx_Oracle      ${DBName}    ${DB_USERNAME}   ${DB_PASSWORD}    ${DBHost}   ${DBPort}
#Suite Teardown      disconnect from database

*** Variables ***

${DBName}       edb-dev.int.colorado.edu
${DB_USERNAME}        
${DB_PASSWORD}     
${DBHost}       edb-dev.int.colorado.edu
${DBPort}       1521
*** Variables ***
${DB_CONNECT_STRING}    '${DB_USERNAME}/${DB_PASSWORD}@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=${DBHost})(PORT=${DBPort}))(CONNECT_DATA=(SERVER=edb-dev.int.colorado.edu)(SID=eddev)))'
${QUERY_TO_EXECUTE}     select * from dirsvcs.DIR_PERSON where SID='000206000';
*** Test Cases ***


Connect To DB
    [Arguments]    ${DB_CONNECT_STRING}
    #Set Environment Variable    PATH    'C:\\development\\instantclient-basiclite-nt-19.8.0.0.0dbru\\instantclient_19_8'
    Set Global Variable    ${DB_CONNECT_STRING}
    log to console   ${DB_CONNECT_STRING}
    #Connect to DB
    connect to database using custom params    cx_Oracle    ${DB_CONNECT_STRING}


#Run Query and log results
#    [Arguments]    ${QUERY_TO_EXECUTE}
#    Set Global Variable    ${QUERY_TO_EXECUTE}
#    ${queryResults}    Query    ${QUERY_TO_EXECUTE}
##    log to console    ${queryResults}
#


Check record present in DB
    check if exists in database     select * from dirsvcs.DIR_PERSON where SID='000206000'

Retrieve records from DB
    ${result}=  Query   select * from dirsvcs.DIR_PERSON where SID='000206000'
    log to console   ${result}

Disconnect From DB
    #Disconnect from DB
    disconnect from database
