*** Settings ***
Documentation    This resource file contains all locators related to demo application.

*** Variables ***
${LOC_DEMO_APP_HEADER_TEXT}=    xpath=//a[text()="Demo app"]
${LOC_REGISTER_LINK}=    xpath=//a[@href="/register"]
${LOC_REGISTER_HEADER_TEXT}=    xpath=//h1[text()="Register"]
${LOC_DEMO_APP_LINK}=    xpath=//a[text()="Demo app"]
${LOC_ERROR_MESSAGE}=    xpath=//div[@class="flash"]
${LOC_LOGIN_ERROR}=    xpath=//h1[text()="Login Failure"]
${LOC_LOGIN_ERROR_MESSAGE}=    //h1[text()="Login Failure"]/../../p[1]

${LOC_TXT_USERNAME}=    id=username
${LOC_TXT_PASSWORD}=    id=password
${LOC_TXT_FIRSTNAME}=    id=firstname
${LOC_TXT_LASTNAME}=    id=lastname
${LOC_TXT_PHONE}=    id=phone
${LOC_REGISTER_BUTTON}=    xpath=//input[@value="Register"]
${LOC_LOG_IN_HEADER_TEXT}=    xpath=//h1[text()="Log In"]

${LOC_LOGIN_LINK}=    xpath=//a[@href="/login"]
${LOC_LOGOUT_LINK}=    xpath=//a[@href="/logout"]
${LOC_LOGIN_BUTTON}=    xpath=//input[@value="Log In"]
${LOC_USER_INFO_HEADER_TEXT}=    xpath=//h1[text()="User Information"]
${LOC_USER_CONTENT}=    id=content
