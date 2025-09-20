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

# --- Negative Test Case: TC3006 (ไม่เลือกซัพพลายเออร์) ---
${TC3006_PRODUCT}          ข้าวโพดหวานกระป๋อง
${TC3006_PRICE}            150
${TC3006_QUANTITY}         5
${TC3006_SUPPLIER}         ${EMPTY}    # ไม่เลือกซัพพลายเออร์
${TC3006_ERROR_MESSAGE}    กรุณาเลือกซัพพลายเออร์

# --- Negative Test Case: TC4005 (ไม่กรอกราคาซื้อ) ---
${TC3007_PRODUCT}       ข้าวโพดหวานกระป๋อง
${TC3007_QUANTITY}      5
${TC3007_PRICE}         ${EMPTY}        # ไม่กรอกราคาซื้อ
${TC3007_SUPPLIER}      บริษัท ฟู๊ดซัพพลายเออร์ จำกัด
${TC3007_ERROR_MESSAGE}  กรุณากรอกราคาซื้อกรุณากรอกจำนวนและราคาซื้อให้ครบถ้วน






