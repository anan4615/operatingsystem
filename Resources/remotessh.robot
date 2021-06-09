*** Settings ***
Documentation      Robot Framework test script
Library     SSHLibrary

*** Variables ***
${host}            edb-dev-old.int.colorado.edu
${username}        anan4615
${password}        J05hJay!23
${ROOT_PASS}        Quality123!

*** Test Cases ***
Test SSH Connection
    Open Connection     ${host}
    Login               ${username}    ${password}    delay=1
    log to console  Connected
    Write    sudo su - diragnt
    Write    ${ROOT_PASS}

    Write    whoami
    log to console  Connected as diragnt
    Write   cd /data/edb/extracts

    @{items}=	List Directory	/data/edb/extracts
    log to console   ${items}
    Write   vi ADB\t
    #File Should Exist       ADB\t
    #Write   vi ADB_ITS_PROV204_2020-09-16_160101.dat
    log to console   Success
     ${vioutput}=    Read
    log to console    ${vioutput}
    Close All Connections
