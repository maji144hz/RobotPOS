*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         1
${VALID_PASSWORD}     123
${TIMEOUT}            15s
${SCREEN_DIR}         screenshots

# --- Category Test Data ---
${CATEGORY_BASE}      ทดสอบหมวดหมู่

# --- Category Locators ---
${BTN_ADD_CATEGORY}   css=button[data-tip='เพิ่มหมวดหมู่']
${INPUT_CATEGORY}     xpath=//input[@placeholder='ชื่อประเภทสินค้า']
${BTN_SAVE}           xpath=//button[contains(normalize-space(.),'บันทึก')]
${SEARCH_CATEGORY}    id=category-search-input
