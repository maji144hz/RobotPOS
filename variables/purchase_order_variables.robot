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
${BTN_CREATE_PO}      xpath=//a[contains(.,'จัดการใบสั่งของ')]

# Product
${PRODUCT_SEARCH_INPUT}   id=product-list-search-input
${PRODUCT_ADD_BUTTON}     css=[id^='product-list-add-button']

# PO Form
${PO_PRICE_INPUT}        id=create-po-purchaseprice-input-0
${PO_QUANTITY_INPUT}     xpath=//*[@id="root"]/div/div/main/div/div/div[2]/div[2]/div/div[2]/div[1]/div[2]/div[2]/div/div[1]/input
${PO_UNIT_SWITCH}        xpath=//button[contains(@class,'inline-flex') and contains(@class,'rounded-full')]
${PO_SUPPLIER_SELECT}    xpath=//*[@id="create-po-supplier-select"]
${PO_SUBMIT_BUTTON}      id=create-po-submit-button
${CREATE_PO_BUTTON}      id=create-purchase-order-button

# --- Test Data ---
${PO_SEARCH_KEYWORD}  ข้าวโพดหวานกระป๋อง
${PO_PRICE}           150
${PO_QUANTITY}        5
${PO_UNIT}            แพ็ค
${PO_SUPPLIER_NAME}   บริษัท ฟู๊ดซัพพลายเออร์ จำกัด

# --- Expected Messages ---
${PURCHASE_SUCCESS_TEXT}   สำเร็จ สร้างใบสั่งซื้อสำเร็จ

# --- Negative Test Case: TC3002 (แก้ไขจำนวนสินค้า) ---
# --- Edit Purchase Order ---
${PO_SEARCH_INPUT}          id=purchase-order-search-input
${PO_EDIT_BUTTON}           css=[id^='po-edit-button']
${PO_PRICE_INPUT_EDIT}      id=edit-po-purchaseprice-input-0
${PO_QUANTITY_INPUT_EDIT}    css=input.w-12.text-center
${PO_UNIT_SWITCH_EDIT}      xpath=//button[contains(@class,'inline-flex') and contains(@class,'rounded-full')]
${PO_SUPPLIER_SELECT_EDIT}  id=edit-po-supplier-select
${PO_SUBMIT_BUTTON_EDIT}    id=edit-po-submit-button

${PO_NUMBER}         36
${EDIT_PRICE}        150
${EDIT_QUANTITY}     7
${EDIT_UNIT}         แพ็ค
${EDIT_SUPPLIER}     บริษัท ฟู้ดซัพพลาย จำกัด
${EDIT_SUCCESS_TEXT}    สำเร็จ แก้ไขใบสั่งซื้อสำเร็จ

# --- Negative Test Case: TC3003 (แก้ไขราคาซื้อ) ---
${TC3003_PO_NUMBER}         36
${TC3003EDIT_PRICE}        155
${TC3003EDIT_QUANTITY}     7
${TC3003EDIT_UNIT}         แพ็ค
${TC3003EDIT_SUPPLIER}     บริษัท ฟู้ดซัพพลาย จำกัด
${TC3003EDIT_SUCCESS_TEXT}    สำเร็จ แก้ไขใบสั่งซื้อสำเร็จ

# --- Negative Test Case: TC3004 (แก้ไขซัพพลายเออร์) ---
${TC3004_PO_NUMBER}         36
${TC3004EDIT_PRICE}        155
${TC3004EDIT_QUANTITY}     7
${TC3004EDIT_UNIT}         แพ็ค
${TC3004EDIT_SUPPLIER}     สมบูรณ์การค้า
${TC3004EDIT_SUCCESS_TEXT}    สำเร็จ แก้ไขใบสั่งซื้อสำเร็จ


# --- Negative Test Case: TC3005 (ลบใบสั่งของ) ---
${TC3005_PO_NUMBER}             39
${TC3005_DELETE_SUCCESS_TEXT}   สำเร็จ ลบใบสั่งซื้อสำเร็จ

# --- Negative Test Case: TC3006 (ไม่เลือกซัพพลายเออร์) ---
${TC3006_PRODUCT}          ข้าวโพดหวานกระป๋อง
${TC3006_PRICE}            150
${TC3006_QUANTITY}         5
${TC3006_SUPPLIER}         ${EMPTY}    # ไม่เลือกซัพพลายเออร์
${TC3006_ERROR_MESSAGE}    กรุณาเลือกซัพพลายเออร์

# --- Negative Test Case: TC3007 (ไม่กรอกราคาซื้อ) ---
${TC3007_PRODUCT}       ข้าวโพดหวานกระป๋อง
${TC3007_QUANTITY}      5
${TC3007_PRICE}         ${EMPTY}        # ไม่กรอกราคาซื้อ
${TC3007_SUPPLIER}      บริษัท ฟู๊ดซัพพลายเออร์ จำกัด
${TC3007_ERROR_MESSAGE}  กรุณากรอกราคาซื้อกรุณากรอกจำนวนและราคาซื้อให้ครบถ้วน

# --- Negative Test Case: TC3008 (ดูรายละเอียด) ---
${TC3008_PO_NUMBER}            31
${TC3008_PO_ID}                68cd91134f536abd0d2bb245
${TC3008_VIEW_ORDER_BUTTON}    xpath=//button[@id='po-view-order-button-${TC3008_PO_ID}']








