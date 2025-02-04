# RPA.Windows in Robot Framework

## Overview
This repository documents my learning and experiments with `RPA.Windows` in the Robot Framework. The goal is to automate various Windows GUI interactions, starting with saving PDF files from Chrome using keyboard shortcuts.

## Prerequisites
- Install [Robot Framework](https://robotframework.org/)
- Install [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- Install [RPA.Windows](https://rpaframework.org/)
- Install Chrome WebDriver
- Ensure Python is installed and set up correctly

## Setup
1. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
2. Update `chromedriver.exe` path in the `*** Variables ***` section of the script.

## Usage
Run the test script with:
```sh
robot PDF_Download_RPA.robot
```

## How It Works
- Opens Chrome and navigates to a PDF URL.
- Waits until the PDF is fully loaded.
- Simulates `Ctrl+S` to open the Save As dialog.
- Simulates `Alt+S` to confirm the save action.

## Future Enhancements
- Handle dynamic PDF titles
- Support different browsers
- Implement error handling for failed saves

