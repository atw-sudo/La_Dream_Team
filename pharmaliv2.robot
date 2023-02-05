*** Settings ***
Documentation     Test& documentation
Suite Setup       !SuiteSetup
Suite Teardown    !SuiteTeardown
Library           Selenium2Library

*** Variables ***
${URL}            http://localhost:8000

*** Keywords ***
!SuiteSetup
    Open Browser    about:blank   ff
    Sleep  2s
    
!SuiteTeardown
    Close All Browsers


*** Test Cases ***
Parcours2
    Go To    ${URL}
    Wait Until Page Contains    Se connecter    timeout=10
    Maximize Browser Window
    Sleep  5s
    Click Element   xpath: /html/body/div[3]/div[2]/a
    Sleep  5s
    Click Element   xpath: /html/body/div[2]/div[2]/div/form/div/input[1]
    Sleep  1s
    Input Text  xpath: /html/body/div[2]/div[2]/div/form/div/input[1]  admin
    Click Element  xpath: /html/body/div[2]/div[2]/div/form/div/input[2]
    Input Text  xpath: /html/body/div[2]/div[2]/div/form/div/input[2]  admin
    Sleep  2s
    Click Element  xpath: /html/body/div[2]/div[2]/div/form/div/input[3]  
    Sleep  10s
    Click Element  xpath: /html/body/div/div[3]/form/input
    Sleep  10s
    Close Browser
