*** Settings ***
Resource  ../Resources/Page Object/frontendpage.robot



*** Keywords ***
Open and login BP Portal
    [Arguments]  ${BP_link}  ${BP_username}  ${BP_password}
    frontendpage.Load  ${BP_link}
    frontendpage.BP login   ${BP_username}  ${BP_password}







