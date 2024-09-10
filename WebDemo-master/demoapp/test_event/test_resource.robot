*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Firefox
${DELAY}          0
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html
${REGISTRATION URL}      http://${SERVER}/Lab12/Registration.html
${SUCCESS URL}      http://${SERVER}/Lab12/Success.html
${FIRST_NAME}     Somsri
${LAST_NAME}      Sodsai
${ORGANIZATION}   CS KKU
${EMAIL}          somsri@kkumail.com
${PHONE}          081-001-1234
${EMPTY}          ""

*** Keywords ***

Open Browser To Registration Page
    Open Browser    ${REGISTRATION URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Registration Page Should Be Open
    Title Should Be    Event Registration

Success Page Should Be Open
    Title Should Be    Success
    Page Should Contain    Success
    Page Should Contain    Thank you for participating in our event

Input Firstname
    [Arguments]    ${firstname}
    Input Text    firstname    ${firstname}

Input Lastname
    [Arguments]    ${lastname}
    Input Text    lastname    ${lastname}

Input Organization
    [Arguments]    ${organization}
    Input Text    organization    ${organization}

Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Submit Register
    Click Button    registerButton

