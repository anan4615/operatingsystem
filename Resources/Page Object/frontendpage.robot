*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Dialogs
Library  Collections


*** Variables ***

# This needs to be updated

${BP_uid} =  //input[@id='username']
${BP_pwd} =  //input[@id='password']
${BP_loginsubmit} =  //button[@name='_eventId_proceed']
*** Keywords ***
##############Page Load##################################
Load
    [Arguments]  ${data}
    Go To   ${data}
    Maximize Browser Window

BP login
    [Arguments]  ${uname}  ${password}
    input text  xpath= ${BP_uid}   ${uname}
    input text  xpath= ${BP_pwd}    ${password}
    click element  xpath= ${BP_loginsubmit}
    sleep   15s
    page should contain element   //img[@class='responsiveBuff']



