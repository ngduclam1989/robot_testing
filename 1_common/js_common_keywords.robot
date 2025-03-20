*** Settings ***
Resource    ../imports.robot


*** Keywords ***
[Common][JS] - Scroll up On Page
    Execute Javascript    window.scrollTo(document.body.scrollHeight,0);

[Common][JS] - Execute JavaScript Highlight Element
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}
    Execute Javascript

[Common][JS] - Verify Dropdownlist Contain options
    [Arguments]    ${dropdown_locator}    ${dropdown_item_locator}    @{options}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Page Should Contain Element
    ...    ${dropdown_locator}
    [Common][JS] - Execute JavaScript Click On Element By Xpath    ${dropdown_locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Page Should Contain Element
    ...    ${dropdown_item_locator}
    ${get_all_options}    Get Text    ${dropdown_item_locator}
    ${count}    Get Length    ${options}
    FOR    ${index}    IN RANGE    0    ${count}
        ${expected_option}    Get From List    ${options}    ${index}
        Should Contain    ${get_all_options}    ${expected_option}
    END

[Common][JS] - Click On Element And Wait For Expected Item To Appear Using JS
    [Arguments]    ${locator}    ${expectedItem}
    [Common][JS] - Execute JavaScript Click On Element By Xpath    ${locator}
    [Common][JS] - Wait For Element To Appear On Page    ${expectedItem}    ${time_out}

[Common][JS] - Click On Element And Wait For Expected Item Not To Appear Using JS
    [Arguments]    ${locator}    ${expectedItem}
    [Common][JS] - Execute JavaScript Click On Element By Xpath    ${locator}
    [Common][JS] - Wait For Element Not To Appear On Page    ${expectedItem}    ${time_out}

[Common][JS] - Execute JavaScript Wait Element Is Visible
    [Arguments]    ${locator}
    ${isVisible}    Run Keyword And Return Status
    ...    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Execute JavaScript
    ...    document.evaluate("${locator}", document, null, XPathResult.ANY_TYPE, null).iterateNext().style.display
    ${true}    Convert To Boolean    TRUE
    Should Be Equal    ${isVisible}    ${true}    Element ${locator} Is Not Visible !

[Common][JS] - Execute JavaScript Wait Element Is Not Visible
    [Arguments]    ${locator}
    ${isVisible}    Run Keyword And Return Status
    ...    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Execute JavaScript
    ...    document.evaluate("${locator}", document, null, XPathResult.ANY_TYPE, null).iterateNext().style.display
    ${false}    Convert To Boolean    FALSE
    Should Be Equal    ${isVisible}    ${false}    Element ${locator} Is Visible !

[Common][JS] - Execute JavaScript To Input Text
    [Arguments]    ${locator}    ${text}
    ${isVisible}    Run Keyword And Return Status
    ...    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Execute JavaScript
    ...    document.evaluate("${locator}", document, null, XPathResult.ANY_TYPE, null).iterateNext().Value = "${text}";
    ${true}    Convert To Boolean    TRUE
    Should Be Equal    ${isVisible}    ${true}    Element ${locator} Is Not Visible !

[Common][JS] - Scroll Right On Page
    Execute Javascript    window.scrollTo(document.body.scrollWidth,document.body.scrollHeight);

[Common][JS] - Scroll Down On Page
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight);

[Common][JS] - Scroll To Element By Xpath
    [Arguments]    ${locator}
    Sleep    ${time_out}
    Execute Javascript
    ...    document.evaluate("${locator}", document, null, XPathResult.ANY_TYPE, null).iterateNext().scrollIntoView(false);

[Common][JS] - Scroll To Element By Xpath With Additional Alignment
    [Arguments]    ${locator}    ${align_to}=true
    Execute Javascript
    ...    document.evaluate("${locator}", document, null, XPathResult.ANY_TYPE, null).iterateNext().scrollIntoView(${align_to});

[Common][JS] - Clear Element Text Using Backspace
    [Arguments]    ${locator}
    Execute JavaScript
    ...    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.select()
    press key    ${locator}    \\08

[Common][JS] - Set Element Text To Blank
    [Arguments]    ${locator}
    Execute JavaScript
    ...    document.evaluate("${locator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.value=""

[Common][JS] - Execute JavaScript Click On Element By Xpath
    [Arguments]    ${locator}
    Execute JavaScript
    ...    document.evaluate("${locator}", document, null, XPathResult.ANY_TYPE, null).iterateNext().click()
