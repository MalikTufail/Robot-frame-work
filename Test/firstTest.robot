*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://www.saucedemo.com/
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    standard_user
    Input Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser    
invalid Login
    Open Browser To Login Page
    Input invalid Username  demo
    Input invalid Password  memo
    Submit Credentials
    Validation message should be
    [Teardown]  Close Browser
*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Swag Labs

Input Username
    [Arguments]    ${username} 
    Input Text    css=[id="user-name"]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    css=[id="password"]    ${password}
Input invalid Username
    [Arguments]  ${username}
    Input Text    Css=[id="user-name"]    ${username}

Input invalid password
    [Arguments]  ${password}
    Input Text    css=[id="password"]      ${password}

Submit Credentials
    Click Button    css=[id="login-button"]

Welcome Page Should Be Open
    Title Should Be    Swag Labs

Validation message should be
    Page Should Contain    Epic sadface: Username and password do not match any user in this service