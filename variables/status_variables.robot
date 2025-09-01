*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         1
${VALID_PASSWORD}     123
${TIMEOUT}            15s
${SCREEN_DIR}         screenshots

# --- Status Test Data ---
${STATUS_BASE}        ทดสอบสถานะ

# --- Status Locators ---
${BTN_ADD_STATUS}     css=button[data-tip='เพิ่มสถานะ']
${INPUT_STATUS}       xpath=//input[@placeholder='ชื่อสถานะ']
${BTN_SAVE_STATUS}    xpath=//button[contains(normalize-space(.),'บันทึก')]
${SEARCH_STATUS}      id=status-search-input
