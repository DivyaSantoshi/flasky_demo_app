*** Settings ***
Documentation    This resource file contains all keywords related to user registration.
Library          SeleniumLibrary
Library          String
Resource         demo_app_locators.resource
Resource         variables_test_data.resource

*** Keywords ***
Initialize All Required Variables
    [Documentation]    This keyword initializes all the required variables.
    ${RNUM}=    Generate Random String    3    [LOWER]
    ${RPHONE_NUM}=    Generate Random String    10    [NUMBERS]
    ${USERNAME_NEW}=  Set Variable      ${USERNAME}${RNUM}
    Set Suite Variable   ${USERNAME_NEW}
    ${PASSWORD_NEW}=  Set Variable      ${PASSWORD}${RNUM}
    Set Suite Variable   ${PASSWORD_NEW}
    ${FIRSTNAME_NEW}=  Set Variable      ${FIRSTNAME}${RNUM}
    Set Suite Variable   ${FIRSTNAME_NEW}
    ${FAMILYNAME_NEW}=  Set Variable      ${FAMILYNAME}${RNUM}
    Set Suite Variable   ${FAMILYNAME_NEW}
    ${PHONE_NUM}=    Set Variable    ${RPHONE_NUM}
    Set Suite Variable   ${PHONE_NUM}

Open Demo Application
    [Documentation]    Opens demo application in a browser
    Open Browser       ${URL}    ${BROWSER}

Verify Demo Application Is Open
    [Documentation]    Verifies if demo application is open
    Page Should Contain Element    ${LOC_DEMO_APP_HEADER_TEXT}
    Log    Demo Application Opened Successfully

Open Register Link
    [Documentation]    Registers user by clicking on the Register link
    Click Element    ${LOC_REGISTER_LINK}
    Page Should Contain Element    ${LOC_REGISTER_HEADER_TEXT}

Enter Username
    [Documentation]    Enters username in the text box
    [Arguments]        ${USER_NAME}
    Input Text         ${LOC_TXT_USERNAME}    ${USER_NAME}

Enter Password
    [Documentation]    Enters password in the text box
    [Arguments]        ${PASSWORD_NEW}
    Input Text         ${LOC_TXT_PASSWORD}    ${PASSWORD_NEW}

Enter FirstName
    [Documentation]    Enters firstname in the text box
    [Arguments]        ${FIRST_NAME}
    Input Text         ${LOC_TXT_FIRSTNAME}    ${FIRST_NAME}

Enter FamilyName
    [Documentation]    Enters lastname in the text box
    [Arguments]        ${FAMILY_NAME}
    Input Text         ${LOC_TXT_LASTNAME}    ${FAMILY_NAME}

Enter PhoneNumber
    [Documentation]    Enters phone number in the text box
    Input Text         ${LOC_TXT_PHONE}    ${PHONE_NUM}

Open Demo App Link
    [Documentation]    Click on demo app link
    Page Should Contain Element    ${LOC_DEMO_APP_LINK}
    Click Element   ${LOC_DEMO_APP_LINK}

Register User Information
    [Documentation]    Registers user
    Open Register Link
    Enter Username      ${USERNAME_NEW}
    Enter Password      ${PASSWORD_NEW}
    Enter FirstName     ${FIRSTNAME_NEW}
    Enter FamilyName    ${FAMILYNAME_NEW}
    Enter PhoneNumber

Click Register Button
    [Documentation]     Clicks on Register button
    Page Should Contain Element    ${LOC_REGISTER_BUTTON}
    Click Element    ${LOC_REGISTER_BUTTON}
    Wait Until Page Contains Element      ${LOC_LOG_IN_HEADER_TEXT}
    Log    Registration done successfully

Open Login Link
    [Documentation]     Opens Login link
    Click Element       ${LOC_LOGIN_LINK}
    Wait Until Page Contains Element    ${LOC_TXT_USERNAME}

Click Login Button
    [Documentation]     Clicks on Login button
    Page Should Contain Element    ${LOC_LOGIN_BUTTON}
    Click Element    ${LOC_LOGIN_BUTTON}
    Wait Until Page Contains Element      ${LOC_USER_INFO_HEADER_TEXT}
    Page Should Contain Element    ${LOC_USER_CONTENT}
    Log    Login success

Review User Information
    [Documentation]    Review registered user information
    ${USERNAME_VISIBLE}=    Get Text    ${LOC_TXT_USERNAME}
    Should Be Equal As Strings    ${USERNAME_NEW}    ${USERNAME_VISIBLE}    Displayed Username is incorrect.
    ${FNAME_VISIBLE}=    Get Text    ${LOC_TXT_FIRSTNAME}
    Should Be Equal As Strings    ${FIRSTNAME_NEW}    ${FNAME_VISIBLE}    Displayed First Name is incorrect.
    ${LNAME_VISIBLE}=    Get Text    ${LOC_TXT_LASTNAME}
    Should Be Equal As Strings    ${FAMILYNAME_NEW}    ${LNAME_VISIBLE}    Displayed Family Name is incorrect.
    ${PHONE_VISIBLE}=    Get Text    ${LOC_TXT_PHONE}
    Should Be Equal As Strings    ${PHONE_NUM}    ${PHONE_VISIBLE}    Displayed Phone Number is incorrect.

Click Register And Verify Message
    [Documentation]    Clicks register button and verify the message for existing user
    Click Element    ${LOC_REGISTER_BUTTON}
    ${MSG}=    Get Text    ${LOC_ERROR_MESSAGE}
    Should Contain    ${MSG}   already registered    Existing user registration does not show error message.

Verify Incorrect Login Error
    [Documentation]    Verify error for invalid login credentials
    Click Element    ${LOC_LOGIN_BUTTON}
    Page Should Contain Element   ${LOC_LOGIN_ERROR}
    ${MSG}=    Get Text    ${LOC_LOGIN_ERROR_MESSAGE}
    Should Contain    ${MSG}   You provided incorrect login details

Register User
    [Documentation]    Register new user
    Register User Information
    Click Register Button

Login User
    [Documentation]    Login user
    Open Login Link
    Enter Username      ${USERNAME_NEW}
    Enter Password      ${PASSWORD_NEW}
    Click Login Button

Logout User
    [Documentation]    Logout user
    Click Element    ${LOC_LOGOUT_LINK}