*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   keywords/sale_history_keywords.robot
Resource   variables/sale_history_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC11002_การแก้ไขรายการสินค้าในรายการคำสั่งซื้อได้สำเร็จ
    [Documentation]    ตรวจสอบว่าสามารถแก้ไขรายการสินค้าในรายการคำสั่งซื้อได้สำเร็จ
    [Tags]    TC11001    Sales History    Edit Product

    # Step 1-4: Login
    Input Username    ${TC11002_USERNAME}
    Input Password    ${TC11002_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

    # Step 5: คลิกเมนูประวัติการขาย
    Click Sales History Menu

    # Step 6: คลิกเลือกรายการที่จะแก้ไข
    Click Order To Edit    ${TC11002_ORDER_ID}

    # Step 7: คลิกปุ่ม "แก้ไข"
    Click Edit Button

    # Step 8: คลิกปุ่ม "ดำเนินการต่อ"
    Click Continue Button

    # Step 9-10: เลือกข้อมูลที่ต้องการแก้ไขและกรอกราคาต่อหน่วย
    Input New Price    ${TC11002_NEW_PRICE}

    # Step 11: คลิกปุ่ม "บันทึกการเปลี่ยนแปลง"
    Click Save Changes Button

    # ตรวจสอบผลลัพธ์
    Verify Data Completeness    ${TC11002_SUCCESS_MESSAGE}
    Verify Edit Success Message    ${TC11002_EDIT_SUCCESS_MESSAGE}

