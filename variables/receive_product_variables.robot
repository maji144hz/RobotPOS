*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         BN
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# --- Locators ---
# Login Data
${NOTIFICATION_USERNAME}           ${VALID_USER}
${NOTIFICATION_PASSWORD}           ${VALID_PASSWORD}

# Menu & Navigation
${BTN_MANAGE}         xpath=//button[contains(.,'จัดการ')]
${BTN_RECEIVE}      xpath=//a[contains(.,'รับสินค้า')]

# --- 4001 ดูรายละเอียดใบรับสินค้า ---
${RECEIPT_SEARCH_INPUT}   xpath=//input[@placeholder="ค้นหาตามเลขใบสั่งของ หรือ ชื่อซัพพลายเออร์"]
${VIEW_RECEIPT_BUTTON}    xpath=//button[contains(@id,"po-view-receipt-button")]
${DETAIL_RECEIPT_HEADER}  xpath=//h2[contains(.,'ใบรับสินค้า')]
${TEST_RECEIPT_NUMBER}    31

# --- 4002 การอัพเดทข้อมูลการส่งมอบและรับสินค้า---
${TEST_PO}   31
${DELIVERED_0}    id=delivered-0
${EXPIRATION_0}   id=expiration-date-0
${DELIVERED_1}    id=delivered-1
${EXPIRATION_1}   id=expiration-date-1
${UPDATE_BUTTON}  xpath=/html/body/div[2]/div/div[6]/button[1]
