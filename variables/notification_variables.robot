*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         1
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# ระยะเวลาหน่วงให้หน้าต่างแจ้งเตือนค้างแสดง (ปรับได้)
${NOTIFICATION_HOLD}  2s

# --- Notification Test Cases ---
# Login Data
${NOTIFICATION_USERNAME}           ${VALID_USER}
${NOTIFICATION_PASSWORD}           ${VALID_PASSWORD}

# Notification Page Elements
${NOTIFICATION_BELL_ICON}          xpath=//*[@id="root"]/div/div/div/div[2]/div[1]/button
${NOTIFICATION_WINDOW}             xpath=//*[contains(@class,'modal') or contains(@class,'dialog') or contains(@class,'overlay') or contains(@class,'drawer')][.//text()[contains(.,'การแจ้งเตือน')]]
${NOTIFICATION_LIST}               xpath=//*[@id="root"]/div/div/div/div[2]/div[2]/div
${NOTIFICATION_ITEM}               xpath=//*[@id="root"]/div/div/div/div[2]/div[2]/div/div

# Tabs & Filters
${TAB_ALL}                         ทั้งหมด
${TAB_EXPIRED}                     หมดอายุ
${FILTER_EXPIRED_BUTTON}           id=notification-filter-expired-button

# Disposal (ตัดจำหน่าย)
${DISPOSE_ACTION_BUTTON}           id=notification-action-button-0
${CONFIRM_DISPOSE_BUTTON}          css=button.swal2-confirm

# Test Data
${NOTIFICATION_WINDOW_TITLE}       การแจ้งเตือน
${NOTIFICATION_ITEM_COUNT}         11
${NOTIFICATION_ITEM_TEXT}          รายการแจ้งเตือน

# Expected Messages
${NOTIFICATION_SUCCESS_MESSAGE}    เปิดหน้าต่างการแจ้งเตือนสำเร็จ
${NOTIFICATION_VIEW_MESSAGE}       ดูรายการแจ้งเตือนทั้งหมดสำเร็จ
${DISPOSE_SUCCESS_TEXT}            สำเร็จ สร้างออเดอร์ตัดจำหน่ายสินค้าสำเร็จเรียบร้อย