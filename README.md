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
```

## วิธีรันเทสแบบง่ายๆ

- รันทั้งหมดในโปรเจกต์
```bash
robot .
```

- รันเฉพาะโฟลเดอร์
```bash
robot products_tests/
robot category_tests/
robot login_tests/
```

- รันเฉพาะไฟล์
```bash
robot products_tests/TC1001.robot
robot login_tests/valid_login.robot
```

## ไฟล์ที่ควรรู้จัก

- `variables/` เก็บค่าตัวแปร เช่น `BASE_URL`, `BROWSER`, `TIMEOUT`
- `keywords/` เก็บคีย์เวิร์ดที่นำกลับมาใช้ซ้ำได้ในหลายเทส
- ไฟล์เทสใน `*_tests/` จะโฟกัสที่ Test Cases อย่างเดียว (import ตัวแปร/คีย์เวิร์ดจากโฟลเดอร์ด้านบน)

## เคล็ดลับเวลาเทสมีปัญหา

- เช็กว่า import ไฟล์ในส่วน Settings ถูกพิมพ์ถูกเส้นทางหรือไม่
- ดูว่า variables/keywords ที่อ้างถึงมีอยู่จริงและสะกดตรงกัน
- ลองรันเป็นไฟล์เดี่ยวเพื่อดู log จุดที่พังให้ชัดเจน

หวังว่าจะช่วยให้เริ่มต้นและดูแลชุดเทสได้ง่ายขึ้นครับ 🙂
