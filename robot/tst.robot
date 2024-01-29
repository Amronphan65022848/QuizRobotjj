*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://automationexercise.com
${CORRECT_EMAIL}  example@example.com
${CORRECT_PASSWORD}  examplepassword
${USERNAME}       username

*** Test Cases ***
Verify User Login and Logout
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Automation Exercise

    Click Element    xpath://button[contains(text(),'Signup / Login')]
    Page Should Contain    Login to your account

    Input Text    id:username    ${CORRECT_EMAIL}
    Input Password    id:password    ${CORRECT_PASSWORD}
    Click Button    xpath://button[contains(text(),'Login')]
    
    Page Should Contain    Logged in as ${USERNAME}
    
    Click Element    xpath://button[contains(text(),'Logout')]
    Page Should Contain    Login to your account

    Close Browser
