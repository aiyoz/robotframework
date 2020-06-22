*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC00
    Open Browser    http://yourhost.com    chrome
    Wait And Input    id=THE_ID    VALUE
    Wait And Click    xpath=THE_XPATH
    Close Browser

TC01
    Open Browser    https://www.google.com.tw/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=/html/body/div/div[3]/form/div[2]/div[1]/div[1]/div/div[2]/input
    Input Text    xpath=/html/body/div/div[3]/form/div[2]/div[1]/div[1]/div/div[2]/input    puzzle & dragons
    Wait Until Element Is Visible    xpath=/html/body/div/div[3]/form/div[2]/div[1]/div[2]/div[2]/ul/li[1]/div/div[2]/div/span
    Click Element    xpath=/html/body/div/div[3]/form/div[2]/div[1]/div[2]/div[2]/ul/li[1]/div/div[2]/div/span
    Set Screenshot Directory    C:\\Python27\\Test SC01
    Capture Page Screenshot    aiyo_{index}.png
    Click Element    xpath=//*[@id="rso"]/div[1]/div/div[1]/a/h3
    Capture Page Screenshot    aiyo_{index}.png
    Close Browser
    Open Browser    https://pad.skyozora.com/    chrome
    Maximize Browser Window
    Capture Page Screenshot    aiyo_{index}.png
    Close Browser

TC01.1
    Open Browser    https://www.google.com.tw/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=/html/body/div/div[3]/form/div[2]/div[1]/div[1]/div/div[2]/input
    Input Text    xpath=/html/body/div/div[3]/form/div[2]/div[1]/div[1]/div/div[2]/input    puzzle & dragons
    Wait Until Element Is Visible    xpath=/html/body/div/div[3]/form/div[2]/div[1]/div[2]/div[2]/ul/li[1]/div/div[2]/div/span
    Click Element    xpath=/html/body/div/div[3]/form/div[2]/div[1]/div[2]/div[2]/ul/li[1]/div/div[2]/div/span
    Capture Page Screenshot    C:\\Python27\\Test SC01\\aiyo_{index}.png
    Click Element    xpath=//*[@id="rso"]/div[1]/div/div[1]/a/h3
    Capture Page Screenshot    C:\\Python27\\Test SC01\\aiyo_{index}.png
    Close Browser
    Open Browser    https://pad.skyozora.com/    chrome
    Maximize Browser Window
    Capture Page Screenshot    C:\\Python27\\Test SC01\\aiyo_{index}.png
    Close Browser

MU01
    Open Browser    https://www.youtubeto.com/zh/    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="url"]
    Input Text    xpath=//*[@id="url"]    https://www.youtube.com/watch?v=8tuzFSXeKI0&list=PLsyOSbh5bs15OXJIigNdRgK0za-JXwhz1
    Click Element    xpath=//*[@id="DownloadMP3_text"]
    Close Browser
    Click Element    xpath=//*[@id="SecondLineTaskDetails100"]/div
    wait until element visible    xpath=//*[@id="SecondLineTaskDetails100"]/div/div    none    none
    Click Element    xpath=//*[@id="SecondLineTaskDetails99"]/div
    wait until element visible    xpath=//*[@id="SecondLineTaskDetails99"]/div/div
    Click Element    xpath=//*[@id="SecondLineTaskDetails1"]/div
    wait until element visible    xpath=//*[@id="SecondLineTaskDetails1"]/div/div
    Close Browser

MU01.1
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To    https://www.youtubeto.com/zh/
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="url"]
    Input Text    xpath=//*[@id="url"]    https://www.youtube.com/watch?v=8tuzFSXeKI0&list=PLsyOSbh5bs15OXJIigNdRgK0za-JXwhz1
    Click Element    xpath=//*[@id="DownloadMP3_text"]
    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails100"]/div
    Click Element    xpath=//*[@id="SecondLineTaskDetails100"]/div
    Switch Window    MAIN
    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails100"]/div/div    none    none
    Sleep    10 seconds
    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails99"]/div
    Click Element    xpath=//*[@id="SecondLineTaskDetails99"]/div
    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails99"]/div/div    none    none
    Sleep    10 seconds
    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails1"]/div
    Click Element    xpath=//*[@id="SecondLineTaskDetails1"]/div
    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails1"]/div/div    none    none

MU01.2
    ${options}=    Evaluate    sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To    https://www.youtubeto.com/zh/
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@id="url"]
    Input Text    xpath=//*[@id="url"]    https://www.youtube.com/watch?v=8tuzFSXeKI0&list=PLsyOSbh5bs15OXJIigNdRgK0za-JXwhz1
    Click Element    xpath=//*[@id="DownloadMP3_text"]
    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails100"]/div
    Click Element    xpath=//*[@id="SecondLineTaskDetails100"]/div
    Switch Window    MAIN
    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails100"]/div/div    none    none
    Sleep    10 seconds
    FOR    ${INDEX}    IN RANGE    1    99
    \    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails${INDEX}"]/div
    \    Click Element    xpath=//*[@id="SecondLineTaskDetails${INDEX}"]/div
    \    Wait Until Element Is Visible    xpath=//*[@id="SecondLineTaskDetails${INDEX}"]/div/div    none    none
    \    Sleep    10 seconds

*** Keywords ***
Wait And Input
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${text}

Wait And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}
