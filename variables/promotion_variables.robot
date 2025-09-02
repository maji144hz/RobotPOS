*** Variables ***
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         1
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# --- Add Promotion ---
${PROMOTION_NAME}              Sale คุ้มสุด3
${PROMOTION_START_DATE}        2025-09-02
${PROMOTION_END_DATE}          2025-09-08
${PROMOTION_PRODUCT}           น้ำมันพืชอุ่น 1 ลิตร
${PROMOTION_ORIGINAL_PRICE}    842
${PROMOTION_LOT_LOCATOR}       xpath=//div[@id='root']/div/div/main/div/div/div[3]/div/div/div[1]/div[3]/div
${PROMOTION_DISCOUNTED_PRICE}  40
