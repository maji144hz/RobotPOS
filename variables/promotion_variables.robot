*** Variables ***
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         1
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

# --- Edit Promotion (TC6002) ---
${EDIT_PROMOTION_SEARCH}        sale คุ้มสุด1
${EDIT_PROMOTION_NAME}          sale คุ้มสุดคุ้ม 1
${EDIT_PROMOTION_START_DAY}     10
${EDIT_PROMOTION_START_MONTH}   July
${EDIT_PROMOTION_START_YEAR}    2025
${EDIT_PROMOTION_END_DAY}       15
${EDIT_PROMOTION_END_MONTH}     July
${EDIT_PROMOTION_END_YEAR}      2025
${EDIT_PROMOTION_DISCOUNTED}    12
${EDIT_PROMOTION_LOT_LABEL}     xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]

# --- Delete Promotion (TC6003) ---
${DELETE_PROMOTION_SEARCH}      ${EDIT_PROMOTION_NAME}
${DELETE_CONFIRM_TEXT}          คุณแน่ใจหรือไม่?
${DELETE_SUCCESS_TEXT}          ลบสำเร็จ: โปรโมชันนี้ถูกลบแล้ว

# --- Print Promotions (TC6004) ---
${PRINT_BUTTON_ID}              print-all-promotions-button
${PRINT_PAGE_COUNT}             1
${PRINT_PER_PAGE}               40
${PRINT_LAYOUT_SUMMARY}         True
${PRINT_INCLUDE_ACTIVE}         True
${PRINT_INCLUDE_EXPIRED}        True

# --- Negative Test Cases (TC6005-TC6009) ---
# TC6005: ไม่กรอกชื่อโปรโมชั่น
${TC6005_PROMOTION_NAME}        ${EMPTY}
${TC6005_START_DAY}             10
${TC6005_START_MONTH}           July
${TC6005_START_YEAR}            2025
${TC6005_END_DAY}               15
${TC6005_END_MONTH}             July
${TC6005_END_YEAR}              2025
${TC6005_PRODUCT}               นมโฟร์โมสต์
${TC6005_ORIGINAL_PRICE}        15
${TC6005_LOT_LOCATOR}           xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]
${TC6005_DISCOUNTED_PRICE}      10
${TC6005_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

# TC6006: ไม่เลือกวันเริ่ม-สิ้นสุด
${TC6006_PROMOTION_NAME}        sale สุดคุ้ม1
${TC6006_START_DAY}             ${EMPTY}
${TC6006_START_MONTH}           ${EMPTY}
${TC6006_START_YEAR}            ${EMPTY}
${TC6006_END_DAY}               ${EMPTY}
${TC6006_END_MONTH}             ${EMPTY}
${TC6006_END_YEAR}              ${EMPTY}
${TC6006_PRODUCT}               นมโฟร์โมสต์
${TC6006_ORIGINAL_PRICE}        15
${TC6006_LOT_LOCATOR}           xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]
${TC6006_DISCOUNTED_PRICE}      10
${TC6006_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

# TC6007: ไม่เลือกสินค้า
${TC6007_PROMOTION_NAME}        sale สุดคุ้ม1
${TC6007_START_DAY}             10
${TC6007_START_MONTH}           July
${TC6007_START_YEAR}            2025
${TC6007_END_DAY}               15
${TC6007_END_MONTH}             July
${TC6007_END_YEAR}              2025
${TC6007_PRODUCT}               ${EMPTY}
${TC6007_ORIGINAL_PRICE}        15
${TC6007_LOT_LOCATOR}           xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]
${TC6007_DISCOUNTED_PRICE}      10
${TC6007_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

# TC6008: ไม่เลือกล็อตสินค้า
${TC6008_PROMOTION_NAME}        sale สุดคุ้ม1
${TC6008_START_DAY}             10
${TC6008_START_MONTH}           July
${TC6008_START_YEAR}            2025
${TC6008_END_DAY}               15
${TC6008_END_MONTH}             July
${TC6008_END_YEAR}              2025
${TC6008_PRODUCT}               นมโฟร์โมสต์
${TC6008_ORIGINAL_PRICE}        15
${TC6008_LOT_LOCATOR}           ${EMPTY}
${TC6008_DISCOUNTED_PRICE}      10
${TC6008_ERROR_MESSAGE}         กรุณาเลือกอย่างน้อย 1 ล็อต

# TC6009: ไม่กรอกราคาโปรโมชั่น
${TC6009_PROMOTION_NAME}        sale สุดคุ้ม1
${TC6009_START_DAY}             10
${TC6009_START_MONTH}           July
${TC6009_START_YEAR}            2025
${TC6009_END_DAY}               15
${TC6009_END_MONTH}             July
${TC6009_END_YEAR}              2025
${TC6009_PRODUCT}               นมโฟร์โมสต์
${TC6009_ORIGINAL_PRICE}        15
${TC6009_LOT_LOCATOR}           xpath=//*[@id="root"]/div/div/main/div/div/div[3]/div/div[1]/div[3]/div/label[1]
${TC6009_DISCOUNTED_PRICE}      ${EMPTY}
${TC6009_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน
