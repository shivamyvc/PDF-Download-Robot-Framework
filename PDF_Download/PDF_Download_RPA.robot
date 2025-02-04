*** Settings ***
Library    SeleniumLibrary
Library    RPA.Windows
Library    ..//setup_utility.py

*** Variables ***
${URL}    https://qwen.readthedocs.io/_/downloads/en/v1.5/pdf/
${DRIVER_PATH}    E:\\Shivam\\Projects\\Driver\\chromedriver.exe

*** Test Cases ***
Run Test
    Launch Browser    ${URL}
*** Keywords ***
Launch Browser
    [Arguments]    ${web_url}
    [Documentation]    Launching the Chrome browser using the latest Selenium approach.
    # New Selenium version deprecates the use of executable_path.
    # Use Service function of selenium.webdriver.chrome.service to start the webdriver
    # Service object is created using Python and called here.
    ${service}=    Get Service    ${DRIVER_PATH}

    Open Browser    url=${web_url}    browser=chrome    service=${service}
    Wait Until Element Is Visible    xpath=//embed
    #Right after the title of opened tab add browser name i.e here Chrome  "- Google Chrome"
    # Example title of opened PDF is Qwen
    # String should be passed as "Qwen - Google Chrome"
    ${winElement}=    Get Element        Qwen - Google Chrome    #Title of Chrome Tab Should Be used to Target the opened PDF window
    # The above variable stores the chrome's active tab window object which can be used to target send keys
    # Send Keys target locator name,element  keys and optional args
    Send Keys         ${winElement}       keys={Ctrl}{s}    interval=0.5    wait_time=0.5
    # Send Keys to windows save as windows
    Send Keys    Save As    keys={LAlt}{s}    interval=0.5    wait_time=2