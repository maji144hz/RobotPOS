*** Variables ***
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         BN
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# --- Add Promotion ---
${PROMOTION_NAME}              Sale คุ้มสุด1
${PROMOTION_START_DAY}          10
${PROMOTION_START_MONTH}        July
${PROMOTION_START_YEAR}         2025
${PROMOTION_END_DAY}            15
${PROMOTION_END_MONTH}          July
${PROMOTION_END_YEAR}           2025
${PROMOTION_PRODUCT}            นมโฟร์โมสต์
${PROMOTION_ORIGINAL_PRICE}     13
${PROMOTION_LOT_LOCATOR}       xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]
${PROMOTION_DISCOUNTED_PRICE}   10

# --- Edit Promotion (TC7002) ---
${EDIT_PROMOTION_SEARCH}              sale คุ้มสุด1
${EDIT_PROMOTION_NAME}                sale คุ้มสุดคุ้ม 1
${EDIT_PROMOTION_START_DAY}           15
${EDIT_PROMOTION_START_MONTH}         July
${EDIT_PROMOTION_START_YEAR}          2025
${EDIT_PROMOTION_END_DAY}             20
${EDIT_PROMOTION_END_MONTH}           July
${EDIT_PROMOTION_END_YEAR}            2025
${EDIT_PROMOTION_SUBMIT_BUTTON}       id=edit-promotion-submit-button

# --- Delete Promotion (TC7003) ---
${DELETE_PROMOTION_SEARCH}      Sale คุ้มสุด31
${DELETE_CONFIRM_TEXT}          คุณแน่ใจหรือไม่?
${DELETE_SUCCESS_TEXT}          โปรโมชันนี้ถูกลบแล้ว

# --- Print Promotions (TC7004) ---
${PRINT_BUTTON_ID}              print-all-promotions-button
${PRINT_PAGE_COUNT}             1
${PRINT_PER_PAGE}               40
${PRINT_LAYOUT_SUMMARY}         True
${PRINT_INCLUDE_ACTIVE}         True
${PRINT_INCLUDE_EXPIRED}        True

# --- Negative Test Cases (TC7005-TC7009) ---
# TC7005: ไม่กรอกชื่อโปรโมชั่น
${TC7005_PROMOTION_NAME}        ${EMPTY}
${TC7005_START_DAY}             10
${TC7005_START_MONTH}           July
${TC7005_START_YEAR}            2025
${TC7005_END_DAY}               15
${TC7005_END_MONTH}             July
${TC7005_END_YEAR}              2025
${TC7005_PRODUCT}               นมโฟร์โมสต์
${TC7005_ORIGINAL_PRICE}        15
${TC7005_LOT_LOCATOR}           xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]
${TC7005_DISCOUNTED_PRICE}      10
${TC7005_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

# TC7006: ไม่เลือกวันเริ่ม-สิ้นสุด
${TC7006_PROMOTION_NAME}        sale สุดคุ้ม1
${TC7006_START_DAY}             ${EMPTY}
${TC7006_START_MONTH}           ${EMPTY}
${TC7006_START_YEAR}            ${EMPTY}
${TC7006_END_DAY}               ${EMPTY}
${TC7006_END_MONTH}             ${EMPTY}
${TC7006_END_YEAR}              ${EMPTY}
${TC7006_PRODUCT}               นมโฟร์โมสต์
${TC7006_ORIGINAL_PRICE}        15
${TC7006_LOT_LOCATOR}           xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]
${TC7006_DISCOUNTED_PRICE}      10
${TC7006_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

# TC7007: ไม่เลือกสินค้า
${TC7007_PROMOTION_NAME}        sale สุดคุ้ม1
${TC7007_START_DAY}             10
${TC7007_START_MONTH}           July
${TC7007_START_YEAR}            2025
${TC7007_END_DAY}               15
${TC7007_END_MONTH}             July
${TC7007_END_YEAR}              2025
${TC7007_PRODUCT}               ${EMPTY}
${TC7007_ORIGINAL_PRICE}        15
${TC7007_LOT_LOCATOR}           ${EMPTY}
${TC7007_DISCOUNTED_PRICE}      10
${TC7007_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

# TC7008: ไม่เลือกล็อตสินค้า
${TC7008_PROMOTION_NAME}        sale สุดคุ้ม1
${TC7008_START_DAY}             10
${TC7008_START_MONTH}           July
${TC7008_START_YEAR}            2025
${TC7008_END_DAY}               15
${TC7008_END_MONTH}             July
${TC7008_END_YEAR}              2025
${TC7008_PRODUCT}               นมโฟร์โมสต์
${TC7008_ORIGINAL_PRICE}        15
${TC7008_LOT_LOCATOR}           ${EMPTY}
${TC7008_DISCOUNTED_PRICE}      10
${TC7008_ERROR_MESSAGE}         กรุณาเลือกอย่างน้อย 1 ล็อต

# TC7009: ไม่กรอกราคาโปรโมชั่น
${TC7009_PROMOTION_NAME}        sale สุดคุ้ม1
${TC7009_START_DAY}             10
${TC7009_START_MONTH}           July
${TC7009_START_YEAR}            2025
${TC7009_END_DAY}               15
${TC7009_END_MONTH}             July
${TC7009_END_YEAR}              2025
${TC7009_PRODUCT}               นมโฟร์โมสต์
${TC7009_ORIGINAL_PRICE}        15
${TC7009_LOT_LOCATOR}           xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]
${TC7009_DISCOUNTED_PRICE}      ${EMPTY}
${TC7009_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน


