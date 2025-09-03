# RobotPOS – ชุดทดสอบด้วย Robot Framework

โปรเจกต์นี้คือชุดเทสอัตโนมัติสำหรับระบบ POS เขียนด้วย Robot Framework เน้นอ่านง่าย แยกไฟล์เป็นสัดส่วน ใช้งานสะดวก

## โครงสร้างหลักของโปรเจกต์

```
RobotPOS/
├── category_tests/    # เทสเกี่ยวกับหมวดหมู่
├── products_tests/    # เทสเกี่ยวกับสินค้า
├── suppliers_tests/   # เทสเกี่ยวกับซัพพลายเออร์
├── status_tests/      # เทสเกี่ยวกับสถานะ
├── settings_tests/    # เทสตั้งค่าร้าน
├── profile_tests/     # เทสโปรไฟล์ผู้ใช้
├── login_tests/       # เทสล็อกอิน
├── keywords/          # รวม Keywords ที่ใช้ซ้ำ
├── variables/         # รวมตัวแปร
├── resources/         # รูปภาพ/ไฟล์ประกอบการเทส
└── requirements.txt   # ไลบรารีที่ใช้
