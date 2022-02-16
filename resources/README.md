# Project Name: Flasky Demo Application

* Frontend UI Test Automation is done using Robot Framework and Selenium Library.
* API Test Automation is done using Python. 

##Execution commands
1. For executing whole set in Chrome browser:
 - robot -v BROWSER:chrome tests/
2. For executing only UI tests: 
 - robot -v BROWSER:firefox tests/01_register.robot
3. For executing only API tests:
 - robot -v BROWSER:firefox tests/02_api_test.robot
4. ${BROWSER} variable is used to pass the different browser values. For e.g. chrome, firefox

##Python libraries required for executing tests:
* Robot Framework - pip install robotframework
* Selenium Library - pip install robotframework-seleniumlibrary
* Requests - pip install requests
* JSONLibrary - pip install robotframework-jsonlibrary

##Basic setup required for the execution:
* Set PATH for chromedriver and geckodriver.

##Folder structure in the project
* tests - 'tests' folder contains all the UI and API tests.
* resources - 'resources' folder contains the locator file (demo_app_locators.resource), keyword file (register_resource.resource), json files for the API tests and API library file contains all the python functions.
* drivers - 'drivers' folder contain all the drivers used for e.g. chromedriver and geckodriver.
* output - I have saved all the ouptput files in 'output' folder. 

##Test Cases
* User Registration is done as part of 'Suite Setup'.
* Review Registered User - To review and validate the Registered User.
* Verify Existing User Registration - To check if it allows Registration of an existing User.
* Login With Incorrect Credentials - Verifies Login with invalid credentials.

##API Tests
* Register New Users - Registers new User using API.
* Review Users Registered In System - Retrieves all the Registered Users.
* Get Personal Information Of User - Retrieves personal information of a particular User.
* Update Personal Information Of A User - Updates information of a particular User.

**Note:** All test case are independent of each other.