*** Settings ***
Documentation     A test suite with a single test for valid login.
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../test_resource.robot    # ชี้ไปยัง resource ไฟล์ที่อยู่ระดับเดียวกันกับโฟลเดอร์ test_registration_success
Library           SeleniumLibrary

*** Variables ***
${INVALID_PHONE}     1234

*** Test Cases ***

Open Event Registration Page
    [Documentation]    ทดสอบเปิดหน้า Event Registration
    Open Browser To Registration Page
    Registration Page Should Be Open
    #[Teardown]    Close Browser

Invalid Phone Number
    [Documentation]    ทดสอบการลงทะเบียนไม่สำเร็จ และกรอก Invalid Phone Number
    Open Browser To Registration Page
    Input Firstname    ${FIRST_NAME} 
    Input Lastname     ${LAST_NAME} 
    Input Organization    ${ORGANIZATION} 
    Input Email        ${EMAIL}
    Input Phone        ${INVALID_PHONE}
    Submit Register
    #[Teardown]    Close Browser