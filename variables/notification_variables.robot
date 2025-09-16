*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         BN
${VALID_PASSWORD}     123
${TIMEOUT}            20s

# ระยะเวลาหน่วงให้หน้าต่างแจ้งเตือนค้างแสดง
${NOTIFICATION_HOLD}  3s

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
${TAB_EXPIRING}                    ใกล้หมดอายุ
${FILTER_EXPIRED_BUTTON}           id=notification-filter-expired-button
${FILTER_EXPIRING_BUTTON}          id=notification-filter-expiring-button
${FILTER_LOWSTOCK_BUTTON}          id=notification-filter-lowstock-button

# Disposal (ตัดจำหน่าย)
${DISPOSE_ACTION_BUTTON}           id=notification-action-button-0
${CONFIRM_DISPOSE_BUTTON}          css=button.swal2-confirm

# Create PO From Lowstock
${LOWSTOCK_ACTION_BUTTON}          id=notification-action-button-0
${CREATE_PO_BUTTON}                id=create-purchase-order-button
${PRODUCT_SEARCH_INPUT}            id=product-list-search-input
${PRODUCT_ADD_BUTTON}              css=[id^='product-list-add-button']
${PO_SUPPLIER_SELECT}              id=create-po-supplier-select
${PO_QUANTITY_INPUT}               xpath=//*[@id="root"]/div/div/main/div/div/div[2]/div[2]/div/div[2]/div[1]/div[2]/div[2]/div/div[1]/input
${PO_UNIT_SWITCH}                  xpath=//*[@id='root']//label[.//input[@type='checkbox']]
${PO_SUBMIT_BUTTON}                id=create-po-submit-button

# Test Data
${NOTIFICATION_WINDOW_TITLE}       การแจ้งเตือน
${NOTIFICATION_ITEM_COUNT}         11
${NOTIFICATION_ITEM_TEXT}          รายการแจ้งเตือน
${PO_SEARCH_KEYWORD}               ข้าวโพดหวานกระป๋อง
${PO_SUPPLIER_NAME}                บริษัท ฟู้ดซัพพลายเออร์ จำกัด
${PO_QUANTITY}                     5

# Expected Messages
${NOTIFICATION_SUCCESS_MESSAGE}    เปิดหน้าต่างการแจ้งเตือนสำเร็จ
${NOTIFICATION_VIEW_MESSAGE}       ดูรายการแจ้งเตือนทั้งหมดสำเร็จ
${DISPOSE_SUCCESS_TEXT}            สำเร็จ สร้างออเดอร์ตัดจำหน่ายสินค้าสำเร็จเรียบร้อย
${PURCHASE_SUCCESS_TEXT}           สำเร็จ สร้างใบสั่งซื้อสำเร็จ
${PO_ERROR_TEXT}                   กรุณากรอกจำนวนที่สั่งซื้อ


