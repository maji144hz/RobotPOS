*** Variables ***
# --- Base Configuration ---
${BASE_URL}           http://localhost:5173
${BROWSER}            chrome
${VALID_USER}         1
${VALID_PASSWORD}     123
${TIMEOUT}            15s
${SCREEN_DIR}         screenshots

# --- Suppliers Locators ---
${BTN_ADD_SUPPLIER}           id=create-supplier-button
${INPUT_SUPPLIER_NAME}        id=create-supplier-name-input
${INPUT_SUPPLIER_CONTACT}     id=create-supplier-contact-input
${INPUT_SUPPLIER_PHONE}       id=create-supplier-phone-input
${INPUT_SUPPLIER_ADDRESS}     id=create-supplier-address-input
${BTN_SAVE_SUPPLIER}          id=create-supplier-submit-button
${SEARCH_SUPPLIER}            id=supplier-search-input
${SPINNERS}                   css=.ant-spin,.loading,.v-overlay--active
${SWAL_CONFIRM}               css=button.swal2-confirm
