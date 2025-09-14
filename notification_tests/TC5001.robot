*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource   ../keywords/notification_keywords.robot
Resource   ../variables/notification_variables.robot

Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers

*** Test Cases ***
TC5001_การเปิดหน้าต่างการแจ้งเตือน
    [Documentation]    ตรวจสอบว่าสามารถเปิดหน้าต่างการแจ้งเตือนและดูรายการแจ้งเตือนได้สำเร็จ
    [Tags]    TC5001    Notification    View Notifications

    # Step 1: เปิดเว็บเบราว์เซอร์และไปที่ URL: http://localhost:5173/login
    Go To    ${BASE_URL}/login

    # Step 2: กรอกชื่อผู้ใช้ในช่อง "Username"
    Input Username    ${NOTIFICATION_USERNAME}

    # Step 3: กรอกรหัสผ่านในช่อง "Password"
    Input Password    ${NOTIFICATION_PASSWORD}

    # Step 4: คลิกปุ่ม "Login"
    Submit Credentials
    Welcome Page Should Be Open

    # Step 5: คลิกไอคอนรูปกระดิ่งด้านบน
    Click Notification Bell Icon

    # ตรวจสอบว่าหน้าต่างการแจ้งเตือนแสดงขึ้นมา
    Verify Notification Window Is Displayed

    # ตรวจสอบว่ามีรายการแจ้งเตือน
    Verify Notification Items Are Present

    Log    เปิดหน้าต่างการแจ้งเตือนและเห็นรายการแจ้งเตือนสำเร็จ
