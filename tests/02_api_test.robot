*** Settings ***
Documentation    This suite contains all test cases related to API automation.
Library    ../resources/APILibrary.py
Library    String
Resource    ../resources/variables_test_data.resource

*** Test Cases ***
Register New Users
    [Documentation]    Registers new users in the application using API.
    [Tags]    API
    ${RNUM}=    Generate Random String    8    [LOWER]
    ${reponse}=    Register User    base_url=${GET_USERS_URL}    rnum=${RNUM}
    Log    ${reponse.text}

Review Users Registered In System
    [Documentation]    Get all the users registered in system.
    [Tags]    API
    ${reponse}=    Get Users    ${GET_USERS_URL}
    Log    ${reponse.text}

Get Personal Information Of User
    [Documentation]    Get personal information of a particular user
    [Tags]    API
    ${RNUM}=    Generate Random String    8    [LOWER]
    ${reponse}=    Register User    base_url=${GET_USERS_URL}    rnum=${RNUM}
    ${auth_token}=    Authenticate User    url=${AUTHENTICATION_URL}    username=${RNUM}
    ${user_info_reponse}=    Get Personal Info Of Users    base_url=${GET_USERS_URL}/${RNUM}    token=${auth_token[0]}
    Log    ${user_info_reponse.text}
    Builtin.Should Contain    ${user_info_reponse.text}    ${FNAME_API}

Update Personal Information Of A User
    [Documentation]    Update personal information of a user
    [Tags]    API
    ${RNUM}=    Generate Random String    8    [LOWER]
    ${UPDATE_LASTNAME}=    Set Variable    ${RNUM}Updated
    ${reponse}=    Register User    base_url=${GET_USERS_URL}    rnum=${RNUM}
    ${auth_token}=    Authenticate User    url=${AUTHENTICATION_URL}    username=${RNUM}
    ${personal_info_resp}=    Update Personal Info Of A User    base_url=${GET_USERS_URL}/${RNUM}
    ...                       token=${auth_token[0]}
    Log    ${personal_info_resp.text}
    Builtin.Should Contain    ${personal_info_resp.text}    ${LNAME_UPDATED}