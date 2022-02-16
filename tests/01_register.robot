*** Settings ***
Documentation    This suite contains test cases related to user registration.
Resource         ../resources/register_resource.resource

Suite Setup    Run Keywords    Open Demo Application    AND
...                            Verify Demo Application Is Open   AND
...                            Initialize All Required Variables    AND
...                            Register User
Suite Teardown   Close Browser


*** Test Cases ***
Review Registered User
    [Documentation]   Review registered user information
    [Tags]    UICase
    [Teardown]  Logout User
    Open Demo App Link
    Login User
    Review User Information

Verify Existing User Registration
    [Documentation]   Verify registration of existing user information
    [Tags]    UICase
    Register User Information
    Click Register And Verify Message

Login With Incorrect Credentials
    [Documentation]   Verify error message by giving incorrect login credentials
    [Tags]    UICase
    Open Login Link
    Enter Username      ${USERNAME_NEW}
    Enter Password      ${INCORRECT_PASSWORD}
    Verify Incorrect Login Error

