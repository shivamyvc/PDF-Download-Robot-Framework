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
    [Documentation]    Launches the Chrome browser with custom settings for automated PDF download.

    # Create a Service object for the ChromeDriver
    ${service}=    Get Service    ${DRIVER_PATH}

    # Create Chrome options object
    ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()    sys, selenium.webdriver

    # Maximize the browser window on launch
    Call Method    ${chrome_options}    add_argument    --start-maximized

    # Disable all browser extensions for a clean execution environment
    Call Method    ${chrome_options}    add_argument    --disable-extensions

    # Set Chrome preferences for automatic PDF download
    ${prefs} =    Create Dictionary
    ...     download.default_directory=E:\Shivam\Projects\Driver  # Set default download directory
    ...     download.prompt_for_download=${False}  # Disable download prompt
    ...     plugins.always_open_pdf_externally=${True}  # Prevent PDFs from opening in Chrome

    # Apply preferences to Chrome options
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}

    # Open browser with specified URL and configured options
    Open Browser    url=${web_url}    browser=chrome    service=${service}    options=${chrome_options}

    # Wait to ensure the PDF has time to download
    Sleep    10