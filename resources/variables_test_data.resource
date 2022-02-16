*** Settings ***
Documentation    This resource file contains all test data related to demo application.

*** Variables ***
${URL}              http://0.0.0.0:8080/
${BROWSER}          Chrome
${GET_USERS_URL}    http://localhost:8080/api/users
${AUTHENTICATION_URL}    http://localhost:8080/api/auth/token

${USERNAME}=    test.name
${PASSWORD}=    TestN
${FIRSTNAME}=    First_
${FAMILYNAME}=    Family_

${FNAME_API}=    Alex
${LNAME_UPDATED}=    Updated

${INCORRECT_PASSWORD}=    123