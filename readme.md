# Robot Framework Automation Testing Documentation

This documentation provides information about the automated testing framework and test suites using Robot Framework for the [Project Name] project.

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Directory Structure](#directory-structure)
- [Getting Started](#Getting Started)
- [Running Tests](#running-tests)
- [Reporting](#Reporting)




## Introduction

[Project Name] uses Robot Framework for automated testing to ensure the quality and reliability of the software. This document provides details on how to set up and run tests, as well as the directory structure and best practices for writing test cases.

## Prerequisites

Before running the automated tests, make sure you have the following prerequisites installed on your system:

- [Robot Framework](https://robotframework.org/)
- [Python](https://www.python.org/)
- IDE- Any supportive IDE to run test case
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- [WebDriver-Manager](https://pypi.org/project/webdriver-manager/)

## Directory Structure
``` tree -O
StoryWeaver/
├── TestSuites/     # All the Test cases will be stored in it
│   ├── Login_Test_Suites
│   │   └── Login_test.robot
│   ├── Unsigned_gateway_Test.robot
│   └── ...
├── Page_objects_&_Keywords/       # For Storing all the page objects
│   ├── LoginPage. robot        # Page object for the login page
│   │   └── Locators_login_page.robot      # Actions or methods specific to the login page and Element locators for the login page are being stored here
│   ├── HomePage. robot        # Page object for the home page & Element locators for the login page
│   │   └── Homepage_Locators.robot      # Actions or methods specific to the home page
│   └── ...
├── Resources/
│   ├── test_data.robot         # Test data will be stored in it
│   ├── configuration. robot
│   └── webdriver.py             # Installing webdriver with webdriver manager
├── Libraries/
│   ├── MyCustomLibrary.py      # If in case the external Libraries are used we will store in this folder
│   └── ...
├── Reports/                    # Reports generated to be stored in this
│   ├── report_1.html
│   ├── report_2.html
│   └── ...
└── Screenshots/                # Screenshots on failure to be stored in this folder
    ├── screenshot_1.png
    ├── screenshot_2.png
```

## Getting Started

1. Clone this repository to your local machine.
2. Set up a virtual environment in the `venv` directory.
3. Install required dependencies using `pip install -r requirements.txt`.
4. Update configuration files in the `Resources` directory as needed.
5. Define page locators in the `Locators` directory.
6. Create Page Object classes in the `Pages_objects_&_Keywords` directory.
7. Organize test data in the `TestData` directory.
8. Create test suite files in the `TestSuites` directory. 
9. Running single test using default `robot /Testfile.robot`.
10. Running parallel test cases with help of pabot library by suing the command `pabot /Testfile.robot`
## _Tools & Technologies Used_
_Python_, _Selenium_, _Robot_Framework_, _Pabot_

## Running Tests

To run the tests, navigate to the project root directory and execute the following command:
Running single Test case using default keyword
```bash
robot   /filename.robot
```
Running parallel Test cases using pabot
```bash
pabot   /filename.robot
```
## Reporting
* HTML reports can be found in the Reporting/HtmlReports directory.
* Logs are stored in the Reporting/Logs directory.
* Screenshots from test runs are saved in the Reporting/Screenshots directory.
To store the report in specific directory by using the pabot library run the following command.
```bash
pabot --outputdir 'ReportsFolder' testfile.robot
```