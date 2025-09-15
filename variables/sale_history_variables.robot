*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         1
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# --- TC11001: ดูรายละเอียดประวัติการขาย ---
# Login Data
${TC11001_USERNAME}           ${VALID_USER}
${TC11001_PASSWORD}           ${VALID_PASSWORD}

# Sales History Page
${TC11001_SALES_HISTORY_MENU}    xpath=//*[@id="root"]/div/aside/div/nav/div/a[3]
${TC11001_ORDER_TABLE}           xpath=//*[@id="root"]/div/div/main/div/div/div/div[3]/div/table
${TC11001_ORDER_ROW}             xpath=//*[@id="root"]/div/div/main/div/div/div/div[3]/div[1]/table/tbody/tr[1]/td[1]
${TC11001_ORDER_DETAIL_MODAL}    xpath=//*[@id="root"]/div/div/main/div/div/div/div[4]/div/div[1]

# Test Data
${TC11001_ORDER_ID}              ORD2509156866918
${TC11001_ORDER_DATE}            15/9/2568
${TC11001_ORDER_STATUS}          ขายสำเร็จ
${TC11001_ORDER_TOTAL}           56  บาท
${TC11001_ORDER_ITEMS_COUNT}     1 รายการ
${TC11001_PAYMENT_METHOD}        BankTransfer
${TC11001_AMOUNT_RECEIVED}       100  บาท
${TC11001_CHANGE_AMOUNT}         44 บาท
${TC11001_LOT_ITEMS_COUNT}       1 รายการ
${TC11001_LOT_COUNT}             1 ล็อต
${TC11001_PIECES_COUNT}          2 ชิ้น

# Expected Messages
${TC11001_SUCCESS_MESSAGE}       ระบบตรวจสอบว่าข้อมูลครบถ้วนและถูกต้อง
${TC11001_MODAL_MESSAGE}         ระบบแสดงหน้าต่างmodal "รายละเอียดคำสั่งซื้อ"

# --- TC11002: การแก้ไขรายการสินค้าในรายการคำสั่งซื้อได้สำเร็จ ---
# Login Data
${TC11002_USERNAME}           ${VALID_USER}
${TC11002_PASSWORD}           ${VALID_PASSWORD}

# Sales History Page
${TC11002_SALES_HISTORY_MENU}    xpath=//*[@id="root"]/div/aside/div/nav/div/a[3]
${TC11002_ORDER_ROW}             xpath=//*[@id="root"]/div/div/main/div/div/div/div[3]/div/table/tbody/tr[1]/td[1]
${TC11002_EDIT_BUTTON}           xpath=//*[@id="root"]/div/div/main/div/div/div/div[4]/div/div[2]/div[2]/div[2]/div/div/div/div/div[5]/button
${TC11002_CONTINUE_BUTTON}       xpath=/html/body/div[2]/div/div[6]/button[1]
${TC11002_PRICE_INPUT}           xpath=//*[@id="root"]/div/div/main/div/div/div/div[5]/div/div[2]/div[3]/input
${TC11002_SAVE_CHANGES_BUTTON}   xpath=//*[@id="root"]/div/div/main/div/div/div/div[5]/div/div[2]/div[5]/button[2]

# Test Data
${TC11002_ORDER_ID}              ORD2509156866918
${TC11002_PRODUCT_NAME}          น้ำตาลทรายขาว 1 กก.
${TC11002_CURRENT_QUANTITY}      2 แพ็ค
${TC11002_CURRENT_PRICE}         28 บาท
${TC11002_NEW_PRICE}             30
${TC11002_LOT_USED}              LOT001(2)
${TC11002_PURCHASE_PRICE}        B24
${TC11002_EXPIRATION_DATE}       30/12/2568

# Summary Data
${TC11002_QUANTITY_SUMMARY}      2 - 2 แพ็ค
${TC11002_PRICE_SUMMARY}         28 - 30 บาท
${TC11002_NEW_TOTAL}             60 บาท

# Expected Messages
${TC11002_SUCCESS_MESSAGE}       ระบบตรวจสอบว่าข้อมูลครบถ้วนและถูกต้อง
${TC11002_EDIT_SUCCESS_MESSAGE}  แก้ไขสำเร็จ อัพเดทรายละเอียดสินค้าเรียบร้อยแล้ว


# --- TC11003: การแก้ไขรายการสินค้าในรายการคำสั่งซื้อไม่สำเร็จ ---
# Login Data
${TC11003_USERNAME}           ${VALID_USER}
${TC11003_PASSWORD}           ${VALID_PASSWORD}

# Sales History Page (ใช้ locators เดียวกันกับ TC11002)
${TC11003_SALES_HISTORY_MENU}    xpath=//*[@id="root"]/div/aside/div/nav/div/a[3]
${TC11003_ORDER_ROW}             xpath=//*[@id="root"]/div/div/main/div/div/div/div[3]/div/table/tbody/tr[1]/td[1]
${TC11003_EDIT_BUTTON}           xpath=//*[@id="root"]/div/div/main/div/div/div/div[4]/div/div[2]/div[2]/div[2]/div[1]/div/div/div/div[5]/button
${TC11003_CONTINUE_BUTTON}       xpath=/html/body/div[2]/div/div[6]/button[1]
${TC11003_PRICE_INPUT}           xpath=//*[@id="root"]/div/div/main/div/div/div/div[5]/div/div[2]/div[3]/input
${TC11003_SAVE_CHANGES_BUTTON}   xpath=//*[@id="root"]/div/div/main/div/div/div/div[5]/div/div[2]/div[5]/button[2]

# Test Data
${TC11003_ORDER_ID}              ORD2509156866918
${TC11003_PRODUCT_NAME}          น้ำตาลทรายขาว 1 กก.
${TC11003_CURRENT_QUANTITY}      2 แพ็ค
${TC11003_CURRENT_PRICE}         28 บาท
${TC11003_INVALID_PRICE}         0
${TC11003_LOT_USED}              LOT001(2)
${TC11003_PURCHASE_PRICE}        B24
${TC11003_EXPIRATION_DATE}       30/12/2568

# Summary Data
${TC11003_QUANTITY_SUMMARY}      1 - 1 แพ็ค
${TC11003_PRICE_SUMMARY}         28 - 0 บาท
${TC11003_NEW_TOTAL}             0 บาท

# Expected Messages
${TC11003_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

# --- TC11004: การแก้ไขสถานะสินค้า (กรณีเปลี่ยนเป็นยกเลิก) ---
# Login Data
${TC11004_USERNAME}           ${VALID_USER}
${TC11004_PASSWORD}           ${VALID_PASSWORD}

# Sales History Page
${TC11004_SALES_HISTORY_MENU}    xpath=//*[@id="root"]/div/aside/div/nav/div/a[3]
${TC11004_ORDER_ROW}             xpath=//*[@id="root"]/div/div/main/div/div/div/div[3]/div/table/tbody/tr[1]/td[1]
${TC11004_ORDER_DETAIL_MODAL}    xpath=//*[@id="root"]/div/div/main/div/div/div/div[4]/div/div[1]
${TC11004_STATUS_DROPDOWN}       css=select.px-3.py-1.text-sm.border.border-gray-300.rounded-md
${TC11004_CONFIRM_BUTTON}        xpath=/html/body/div[2]/div/div[6]/button[1]

# Test Data
${TC11004_ORDER_ID}              ORD2509146866556
${TC11004_ORDER_DATE}            14/9/2568
${TC11004_CURRENT_STATUS}        ขายสำเร็จ
${TC11004_NEW_STATUS}            ยกเลิก
${TC11004_ORDER_TOTAL}           578 บาท
${TC11004_ORDER_ITEMS_COUNT}     2 รายการ
${TC11004_PAYMENT_METHOD}        Cash
${TC11004_AMOUNT_RECEIVED}       1000 บาท
${TC11004_CHANGE_AMOUNT}         422 บาท
${TC11004_LOT_ITEMS_COUNT}       2 รายการ
${TC11004_LOT_COUNT}             2 ล็อต
${TC11004_PIECES_COUNT}          22 ชิ้น

# Product Details
${TC11004_PRODUCT1_NAME}         เลย์ รสหอยเชลล์อบเนย 77 กรัม
${TC11004_PRODUCT1_QUANTITY}     1 แพ็ค
${TC11004_PRODUCT1_PRICE}        290 บาท
${TC11004_PRODUCT1_TOTAL}        290 บาท
${TC11004_PRODUCT1_LOT}          LOT001(10)
${TC11004_PRODUCT1_PURCHASE}     B30
${TC11004_PRODUCT1_EXPIRY}       15/7/2569

${TC11004_PRODUCT2_NAME}         เลย์ รสโนริสาหร่าย 50 กรัม
${TC11004_PRODUCT2_QUANTITY}     1 แพ็ค
${TC11004_PRODUCT2_PRICE}        288 บาท
${TC11004_PRODUCT2_TOTAL}        288 บาท
${TC11004_PRODUCT2_LOT}          LOT001(12)
${TC11004_PRODUCT2_PURCHASE}     B25
${TC11004_PRODUCT2_EXPIRY}       15/4/2569

# Expected Messages
${TC11004_SUCCESS_MESSAGE}       เปลี่ยนสถานะสำเร็จ อัปเดตสถานะเป็น "ยกเลิก" เรียบร้อยแล้ว

# --- TC11005: การแก้ไขสถานะสินค้า (กรณีเปลี่ยนเป็นคืนสินค้า) ---
# Login Data
${TC11005_USERNAME}           ${VALID_USER}
${TC11005_PASSWORD}           ${VALID_PASSWORD}

# Sales History Page
${TC11005_SALES_HISTORY_MENU}    xpath=//*[@id="root"]/div/aside/div/nav/div/a[3]
${TC11005_ORDER_ROW}             xpath=//*[@id="root"]/div/div/main/div/div/div/div[3]/div/table/tbody/tr[1]/td[1]
${TC11005_ORDER_DETAIL_MODAL}    xpath=//*[@id="root"]/div/div/main/div/div/div/div[4]/div/div[1]
${TC11005_STATUS_DROPDOWN}       css=select.px-3.py-1.text-sm.border.border-gray-300.rounded-md
${TC11005_CONFIRM_BUTTON}        xpath=/html/body/div[2]/div/div[6]/button[1]

# Test Data
${TC11005_ORDER_ID}              ORD2509146866556
${TC11005_ORDER_DATE}            14/9/2568
${TC11005_CURRENT_STATUS}        ขายสำเร็จ
${TC11005_NEW_STATUS}            คืนสินค้า
${TC11005_ORDER_TOTAL}           578 บาท
${TC11005_ORDER_ITEMS_COUNT}     2 รายการ
${TC11005_PAYMENT_METHOD}        Cash
${TC11005_AMOUNT_RECEIVED}       1000 บาท
${TC11005_CHANGE_AMOUNT}         422 บาท
${TC11005_LOT_ITEMS_COUNT}       2 รายการ
${TC11005_LOT_COUNT}             2 ล็อต
${TC11005_PIECES_COUNT}          22 ชิ้น

# Product Details
${TC11005_PRODUCT1_NAME}         เลย์ รสหอยเชลล์อบเนย 77 กรัม
${TC11005_PRODUCT1_QUANTITY}     1 แพ็ค
${TC11005_PRODUCT1_PRICE}        290 บาท
${TC11005_PRODUCT1_TOTAL}        290 บาท
${TC11005_PRODUCT1_LOT}          LOT001(10)
${TC11005_PRODUCT1_PURCHASE}     B30
${TC11005_PRODUCT1_EXPIRY}       15/7/2569

${TC11005_PRODUCT2_NAME}         เลย์ รสโนริสาหร่าย 50 กรัม
${TC11005_PRODUCT2_QUANTITY}     1 แพ็ค
${TC11005_PRODUCT2_PRICE}        288 บาท
${TC11005_PRODUCT2_TOTAL}        288 บาท
${TC11005_PRODUCT2_LOT}          LOT001(12)
${TC11005_PRODUCT2_PURCHASE}     B25
${TC11005_PRODUCT2_EXPIRY}       15/4/2569

# Expected Messages
${TC11005_SUCCESS_MESSAGE}       เปลี่ยนสถานะสำเร็จ อัปเดตสถานะเป็น "คืนสินค้า" เรียบร้อยแล้ว

# --- TC11006: การแก้ไขสถานะสินค้า (กรณีเปลี่ยนเป็นตัดจำหน่าย) ---
# Login Data
${TC11006_USERNAME}           ${VALID_USER}
${TC11006_PASSWORD}           ${VALID_PASSWORD}

# Sales History Page
${TC11006_SALES_HISTORY_MENU}    xpath=//*[@id="root"]/div/aside/div/nav/div/a[3]
${TC11006_ORDER_ROW}             xpath=//*[@id="root"]/div/div/main/div/div/div/div[3]/div/table/tbody/tr[1]/td[1]
${TC11006_ORDER_DETAIL_MODAL}    xpath=//*[@id="root"]/div/div/main/div/div/div/div[4]/div/div[1]
${TC11006_STATUS_DROPDOWN}       css=select.px-3.py-1.text-sm.border.border-gray-300.rounded-md
${TC11006_CONFIRM_BUTTON}        xpath=/html/body/div[2]/div/div[6]/button[1]

# Test Data
${TC11006_ORDER_ID}              ORD2509146866556
${TC11006_ORDER_DATE}            14/9/2568
${TC11006_CURRENT_STATUS}        ขายสำเร็จ
${TC11006_NEW_STATUS}            ตัดจำหน่าย
${TC11006_ORDER_TOTAL}           578 บาท
${TC11006_ORDER_ITEMS_COUNT}     2 รายการ
${TC11006_PAYMENT_METHOD}        Cash
${TC11006_AMOUNT_RECEIVED}       1000 บาท
${TC11006_CHANGE_AMOUNT}         422 บาท
${TC11006_LOT_ITEMS_COUNT}       2 รายการ
${TC11006_LOT_COUNT}             2 ล็อต
${TC11006_PIECES_COUNT}          22 ชิ้น

# Product Details
${TC11006_PRODUCT1_NAME}         เลย์ รสหอยเชลล์อบเนย 77 กรัม
${TC11006_PRODUCT1_QUANTITY}     1 แพ็ค
${TC11006_PRODUCT1_PRICE}        290 บาท
${TC11006_PRODUCT1_TOTAL}        290 บาท
${TC11006_PRODUCT1_LOT}          LOT001(10)
${TC11006_PRODUCT1_PURCHASE}     B30
${TC11006_PRODUCT1_EXPIRY}       15/7/2569

${TC11006_PRODUCT2_NAME}         เลย์ รสโนริสาหร่าย 50 กรัม
${TC11006_PRODUCT2_QUANTITY}     1 แพ็ค
${TC11006_PRODUCT2_PRICE}        288 บาท
${TC11006_PRODUCT2_TOTAL}        288 บาท
${TC11006_PRODUCT2_LOT}          LOT001(12)
${TC11006_PRODUCT2_PURCHASE}     B25
${TC11006_PRODUCT2_EXPIRY}       15/4/2569

# Expected Messages
${TC11006_SUCCESS_MESSAGE}       เปลี่ยนสถานะสำเร็จ อัปเดตสถานะเป็น "ตัดจำหน่าย" เรียบร้อยแล้ว
