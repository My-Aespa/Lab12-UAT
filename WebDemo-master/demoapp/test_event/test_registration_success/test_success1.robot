*** Settings ***
Documentation     A test suite with a single test for valid login.
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../test_resource.robot    # ชี้ไปยัง resource ไฟล์ที่อยู่ระดับเดียวกันกับโฟลเดอร์ test_registration_success
Library           SeleniumLibrary

*** Test Cases ***

Open Event Registration Page
    [Documentation]    ทดสอบเปิดหน้า Event Registration
    Open Browser To Registration Page
    Registration Page Should Be Open
    #[Teardown]    Close Browser

Register Success
    [Documentation]    ทดสอบการลงทะเบียนสำเร็จ
    Open Browser To Registration Page
    Input Firstname    ${FIRST_NAME} 
    Input Lastname     ${LAST_NAME} 
    Input Organization    ${ORGANIZATION} 
    Input Email        ${EMAIL}
    Input Phone        ${PHONE}
    Submit Register
    Success Page Should Be Open
    #[Teardown]    Close Browser
