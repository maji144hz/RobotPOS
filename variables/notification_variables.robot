*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         BN
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# --- Notification Test Cases ---
# Login Data
${NOTIFICATION_USERNAME}           ${VALID_USER}
${NOTIFICATION_PASSWORD}           ${VALID_PASSWORD}

# Notification Page Elements
${NOTIFICATION_BELL_ICON}          xpath=//*[@id="root"]/div/div/div/div[2]/div[1]/button
${NOTIFICATION_WINDOW}             xpath=//*[@id="root"]/div/div/div/div[2]/div[2]
${NOTIFICATION_LIST}               xpath=//*[@id="root"]/div/div/div/div[2]/div[2]/div
${NOTIFICATION_ITEM}               xpath=//*[@id="root"]/div/div/div/div[2]/div[2]/div/div

# Test Data
${NOTIFICATION_WINDOW_TITLE}       การแจ้งเตือน
${NOTIFICATION_ITEM_COUNT}         11
${NOTIFICATION_ITEM_TEXT}          รายการแจ้งเตือน

# Expected Messages
${NOTIFICATION_SUCCESS_MESSAGE}    เปิดหน้าต่างการแจ้งเตือนสำเร็จ
${NOTIFICATION_VIEW_MESSAGE}       ดูรายการแจ้งเตือนทั้งหมดสำเร็จ


