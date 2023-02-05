*** Settings ***
Documentation     Test& documentation
Suite Setup       !SuiteSetup
Suite Teardown    !SuiteTeardown
Library           Selenium2Library

*** Variables ***
${URL}            http://localhost:8000

*** Keywords ***
!SuiteSetup
    Open Browser    about:blank   ff  --headless
    Sleep  2s
    
!SuiteTeardown
    Close All Browsers


*** Test Cases ***
Parcours1
    Go To    ${URL}
    Wait Until Page Contains    Se connecter    timeout=10
    Maximize Browser Window
    Click Element   xpath: //*[@id="lsins"]
    Sleep  5s
    Click Element   xpath: /html/body/div[2]/div[2]/form/div/input[1]
    Sleep  1s
    Click Element  xpath: //*[@id="suiv"]
    Click Element  xpath: /html/body/div[2]/div[2]/div/form/div/input[1]
    Input Text  xpath: /html/body/div[2]/div[2]/div/form/div/input[1]  sss
    Sleep  2s
    Click Element  xpath: /html/body/div[2]/div[2]/div/form/div/input[2]  
    Input Text  xpath: /html/body/div[2]/div[2]/div/form/div/input[2]  sss
    Click Element  xpath: /html/body/div[2]/div[2]/div/form/div/input[3]
    Sleep  30s
    Close Browser
