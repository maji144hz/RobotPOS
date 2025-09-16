*** Variables ***
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         BN
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# --- Notification Page Elements ---
${NOTIFICATION_BELL_ICON}          xpath=//*[@id="root"]/div/div/div/div[2]/div[1]/button
${FILTER_EXPIRING_BUTTON}          id=notification-filter-expiring-button
${PROMOTION_ITEM}                  xpath=//*[contains(normalize-space(.),"ข้าวกล้องหอมมะลิ 1 กก.")]
${PROMOTION_ACTION_ICON}           id=notification-action-button-1

# --- Promotion Form Elements ---
${PROMOTION_NAME_INPUT}            id=create-promotion-name-input
${PROMOTION_START_DATE_INPUT}      id=create-promotion-start-date
${PROMOTION_END_DATE_INPUT}        id=create-promotion-end-date
${PROMOTION_PRODUCT_COMBOBOX}      id=create-promotion-product-combobox
${PROMOTION_ORIGINAL_PRICE}        id=original-price
${PROMOTION_LOT_LOCATOR}           xpath=//*[@id="root"]/div/div/div/div[3]/div/div[1]/div[3]/div/label
${PROMOTION_DISCOUNTED_PRICE_INPUT}  id=create-promotion-discounted-price-input
${PROMOTION_SUBMIT_BUTTON}         id=create-promotion-submit-button

# --- Success locators (ใช้โดย Click Submit Promotion) ---
${PROMOTION_SUCCESS_MSG_1}         xpath=//div[contains(normalize-space(.),'สร้างโปรโมชั่นสำเร็จ')]
${PROMOTION_SUCCESS_MSG_2}         xpath=//div[contains(normalize-space(.),'บันทึกสำเร็จ')]
${PROMOTION_SUCCESS_MSG_3}         xpath=//div[contains(normalize-space(.),'สำเร็จ')]
# row locator ใช้ ${PROMOTION_NAME} ภายใน xpath — Robot จะขยายตัวแปรตอนรัน
${PROMOTION_ROW_LOCATOR}           xpath=//td[contains(normalize-space(.),'${PROMOTION_NAME}')]

# --- Test Data  ---
${PROMOTION_NAME}                  โปรโมชั่น ข้าวกล้องหอมมะลิ 1 กก.
${PROMOTION_START_DATE}            2025-09-01
${PROMOTION_END_DATE}              2025-09-21
${PROMOTION_PRODUCT}               ข้าวกล้องหอมมะลิ 1 กก.
${PROMOTION_DISCOUNTED_PRICE}      40
