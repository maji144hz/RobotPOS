# InvisRobot - Robot Framework Test Automation Project

## โครงสร้างโปรเจค

โปรเจคนี้ใช้ Robot Framework สำหรับการทดสอบอัตโนมัติ โดยมีการจัดโครงสร้างที่แยกแยะ Variables และ Keywords ให้เป็นระเบียบ

### 📁 โครงสร้างโฟลเดอร์

```
InvisRobot/
├── 📁 variables/                    # ตัวแปรทั้งหมด
│   ├── common_variables.robot      # ตัวแปรที่ใช้ร่วมกัน
│   ├── variables.robot             # ตัวแปรสำหรับ products tests
│   ├── category_variables.robot    # ตัวแปรสำหรับ category tests
│   ├── suppliers_variables.robot   # ตัวแปรสำหรับ suppliers tests
│   ├── status_variables.robot      # ตัวแปรสำหรับ status tests
│   ├── settings_variables.robot    # ตัวแปรสำหรับ settings tests
│   └── profile_variables.robot     # ตัวแปรสำหรับ profile tests
│
├── 📁 keywords/                     # Keywords ทั้งหมด
│   ├── common_keywords.robot       # Keywords ที่ใช้ร่วมกัน
│   ├── products_keywords.robot     # Keywords สำหรับ products tests
│   ├── category_keywords.robot     # Keywords สำหรับ category tests
│   ├── suppliers_keywords.robot    # Keywords สำหรับ suppliers tests
│   ├── status_keywords.robot       # Keywords สำหรับ status tests
│   ├── settings_keywords.robot     # Keywords สำหรับ settings tests
│   └── profile_keywords.robot      # Keywords สำหรับ profile tests
│
├── 📁 products_tests/               # Test cases สำหรับ products
│   ├── TC1001.robot               # เพิ่มสินค้า
│   ├── TC1002.robot               # เพิ่มสินค้าพร้อมข้อมูลครบ
│   ├── TC1003.robot               # เพิ่มสินค้าแบบพื้นฐาน
│   ├── TC1004.robot               # เพิ่มสินค้าแบบ minimal
│   ├── TC1005.robot               # เพิ่มสินค้าพร้อมข้อมูลติดลบ
│   ├── TC1006.robot               # เพิ่มสินค้าพร้อมข้อมูลเกิน
│   ├── TC1007.robot               # เพิ่มสินค้าพร้อมวันที่ผิด
│   ├── TC1008.robot               # เพิ่มสินค้าแล้วยกเลิก
│   └── TC1009.robot               # เพิ่มสินค้าปกติ
│
├── 📁 category_tests/               # Test cases สำหรับ categories
│   ├── addcategory.robot          # เพิ่มหมวดหมู่
│   ├── edit.robot                 # แก้ไขหมวดหมู่
│   └── delete.robot               # ลบหมวดหมู่
│
├── 📁 suppliers_tests/              # Test cases สำหรับ suppliers
│   ├── add.robot                  # เพิ่มซัพพลายเออร์
│   ├── edit.robot                 # แก้ไขซัพพลายเออร์
│   └── delete.robot               # ลบซัพพลายเออร์
│
├── 📁 status_tests/                 # Test cases สำหรับ status
│   ├── add.robot                  # เพิ่มสถานะ
│   ├── edit.robot                 # แก้ไขสถานะ
│   └── delete.robot               # ลบสถานะ
│
├── 📁 settings_tests/               # Test cases สำหรับ settings
│   └── shop_edit.robot            # แก้ไขข้อมูลร้าน
│
├── 📁 profile_tests/                # Test cases สำหรับ profile
│   ├── change_avatar.robot        # เปลี่ยนรูปโปรไฟล์
│   └── edit.robot                 # แก้ไขข้อมูลโปรไฟล์
│
├── 📁 login_tests/                  # Test cases สำหรับ login
│   ├── valid_login.robot          # Login ที่ถูกต้อง
│   ├── invalid_login.robot        # Login ที่ไม่ถูกต้อง
│   └── resource.robot             # Keywords สำหรับ login
│
├── 📁 resources/                     # ไฟล์รูปภาพและทรัพยากรอื่นๆ
├── 📁 screenshots/                   # Screenshots จาก test runs
├── resource.robot                    # Resource หลัก
└── requirements.txt                  # Dependencies
```

### 🔧 วิธีการใช้งาน

#### 1. การรัน Test ทั้งหมด
```bash
robot .
```

#### 2. การรัน Test เฉพาะโฟลเดอร์
```bash
robot products_tests/
robot category_tests/
robot suppliers_tests/
```

#### 3. การรัน Test เฉพาะไฟล์
```bash
robot products_tests/TC1001.robot
robot category_tests/addcategory.robot
```

### 📋 หลักการออกแบบ

#### Variables
- **common_variables.robot**: ตัวแปรที่ใช้ร่วมกันทั้งหมด (BASE_URL, BROWSER, TIMEOUT)
- **{module}_variables.robot**: ตัวแปรเฉพาะสำหรับแต่ละ module

#### Keywords
- **common_keywords.robot**: Keywords ที่ใช้ร่วมกัน (Login, Navigation, Utils)
- **{module}_keywords.robot**: Keywords เฉพาะสำหรับแต่ละ module

#### Test Files
- ใช้ Resource เพื่อ import variables และ keywords
- เน้นเฉพาะ Test Cases และ Test Logic
- ไม่มี Variables หรือ Keywords ในไฟล์ test

### 🚀 ประโยชน์ของการจัดโครงสร้างใหม่

1. **แยกแยะชัดเจน**: Variables และ Keywords แยกออกจาก Test Cases
2. **นำกลับมาใช้**: Keywords สามารถนำไปใช้ซ้ำใน test อื่นๆ ได้
3. **บำรุงรักษาง่าย**: แก้ไข Variables หรือ Keywords ในที่เดียว
4. **อ่านง่าย**: Test Cases อ่านง่ายและเข้าใจได้ทันที
5. **ขยายได้**: เพิ่ม test cases ใหม่ได้ง่ายโดยใช้ keywords ที่มีอยู่

### 📝 ตัวอย่างการใช้งาน

```robot
*** Settings ***
Resource          ../variables/common_variables.robot
Resource          ../variables/category_variables.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/category_keywords.robot

*** Test Cases ***
เพิ่มหมวดหมู่
    ${RANDOM}=    Generate Random Number
    ${name}=      Set Variable    ${CATEGORY_BASE} ${RANDOM}
    Create Category           ${name}
    Search Category By Name   ${name}
    Screenshot Latest Category Row    ${name}
```

### 🔍 การแก้ไขปัญหา

หากพบปัญหาในการรัน test:
1. ตรวจสอบว่า import Resource ถูกต้อง
2. ตรวจสอบว่า Variables และ Keywords ถูกต้อง
3. ตรวจสอบว่า Test Setup และ Test Teardown ถูกต้อง

### 📞 การติดต่อ

หากมีคำถามหรือต้องการความช่วยเหลือ กรุณาติดต่อทีมพัฒนา
