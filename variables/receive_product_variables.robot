*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         BN
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# --- Locators ---
# Login Data
${NOTIFICATION_USERNAME}    ${VALID_USER}
${NOTIFICATION_PASSWORD}    ${VALID_PASSWORD}

# Menu & Navigation
${BTN_MANAGE}         xpath=//button[contains(.,'จัดการ')]
${BTN_RECEIVE}        xpath=//a[contains(.,'รับสินค้า')]

# --- 4001 ดูรายละเอียดใบรับสินค้า ---
${RECEIPT_SEARCH_INPUT}   xpath=//input[@placeholder="ค้นหาตามเลขใบสั่งของ หรือ ชื่อซัพพลายเออร์"]
${VIEW_RECEIPT_BUTTON}    xpath=//*[@id="po-view-receipt-button-68ce7ed1fe87b6da89f5464e"]
${DETAIL_RECEIPT_HEADER}  xpath=//h2[contains(.,'ใบรับสินค้า')]
${TEST_RECEIPT_NUMBER}    36

# --- TC4002 การอัพเดทข้อมูลการส่งมอบและรับสินค้า ---
${TEST_PO}              60
${BTN_UPDATE_DELIVERY}  id=po-update-delivery-button-68dd4546fae9ddcd77bb58f2

${DELIVERED_0}          id=delivered-0
${DELIVERED_1}          id=delivered-1
${EXPIRATION_0}         id=expiration-date-0

${BTN_CONFIRM_UPDATE}   css=button.swal2-confirm.swal2-styled

# --- TC4003 การยืนยันการรับสินค้า ---
${TC4003_PO_NUMBER}             31
${TC4003_RECEIPT_ID}            68cd91134f536abd0d2bb245
${TC4003_FINISHED_TAB}          xpath=//button[contains(@class,'px-4 py-2 text-sm font-medium border-b-2') and contains(.,'เสร็จสิ้น')]
${TC4003_UPDATE_DELIVERY_BTN}   id=po-update-delivery-button-${TC4003_RECEIPT_ID}
${TC4003_ACTUAL_PRICE_0}        id=actual-price-0
${TC4003_ACTUAL_PRICE_1}        id=actual-price-1
${TC4003_PRICE_0_VALUE}         22
${TC4003_PRICE_1_VALUE}         65
${TC4003_SAVE_BUTTON}           css=button.swal2-confirm.swal2-styled
${TC4003_CONFIRM_RECEIPT_BTN}   id=po-confirm-receipt-button-${TC4003_RECEIPT_ID}
${TC4003_SUCCESS_MESSAGE}       สำเร็จ

# --- TC4004 การลบใบรับสินค้า ---
${TC4004_PO_NUMBER}             66
${TC4004_RECEIPT_ID}            68dd6661fae9ddcd77bc5ba0
${TC4004_DELETE_BUTTON}         id=po-delete-button-${TC4004_RECEIPT_ID}
${TC4004_CONFIRM_DELETE_BTN}    css=button.swal2-confirm.swal2-styled
${TC4004_DELETE_SUCCESS_MSG}    ลบใบสั่งของเรียบร้อยแล้ว

# --- TC4005 กรณีไม่กรอกจำนวนที่ส่งมอบ ---
${TC4005_PO_NUMBER}             64
${TC4005_RECEIPT_ID}            68dd5faefae9ddcd77bc0286
${TC4005_FINISHED_TAB}          xpath=//button[contains(@class,'px-4 py-2 text-sm font-medium border-b-2') and contains(.,'เสร็จสิ้น')]
${TC4005_UPDATE_DELIVERY_BTN}   id=po-update-delivery-button-${TC4005_RECEIPT_ID}
${TC4005_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

# --- TC4006 กรณีไม่กรอกราคาจริงต่อหน่วย ---
${TC4006_PO_NUMBER}             65
${TC4006_RECEIPT_ID}            68dd62f3fae9ddcd77bc2830
${TC4006_FINISHED_TAB}          xpath=//button[contains(@class,'px-4 py-2 text-sm font-medium border-b-2') and contains(.,'เสร็จสิ้น')]
${TC4006_UPDATE_DELIVERY_BTN}   id=po-update-delivery-button-${TC4006_RECEIPT_ID}
${TC4006_ACTUAL_PRICE_0}        id=actual-price-0
${TC4006_PRICE_0_VALUE}         0
${TC4006_UPDATE_AND_RECEIVE_BTN}    css=button.swal2-confirm.swal2-styled
${TC4006_ERROR_MESSAGE}         กรุณากรอกข้อมูลให้ครบถ้วน

