# 📁 Images Directory

โฟลเดอร์นี้ใช้สำหรับเก็บรูปภาพต่างๆ ที่ใช้ในการทดสอบ

## 🗂️ โครงสร้างโฟลเดอร์

```
images/
├── 📁 test_images/          # รูปภาพสำหรับทดสอบ
│   ├── น้ำยาล้างจาน.jpg     # รูปภาพสินค้าสำหรับทดสอบ
│   ├── TR1_1859-S09.jpg     # รูปภาพทดสอบอื่นๆ
│   └── ...
├── 📁 screenshots/           # Screenshots จาก test runs
│   ├── profile_*.png         # Screenshots ของ profile tests
│   ├── shop_*.png            # Screenshots ของ shop tests
│   └── ...
└── 📁 avatars/               # รูปภาพ avatar สำหรับทดสอบ
```

## 📋 รายละเอียด

### test_images/
- **น้ำยาล้างจาน.jpg**: รูปภาพสินค้าสำหรับทดสอบการเพิ่มสินค้า
- **รูปภาพอื่นๆ**: รูปภาพสำหรับทดสอบฟีเจอร์ต่างๆ

### screenshots/
- **profile_*.png**: Screenshots จาก profile tests
- **shop_*.png**: Screenshots จาก shop settings tests
- **รูปภาพอื่นๆ**: Screenshots จาก test cases อื่นๆ

### avatars/
- รูปภาพ avatar สำหรับทดสอบการเปลี่ยนรูปโปรไฟล์

## ⚠️ หมายเหตุ

- รูปภาพในโฟลเดอร์นี้จะไม่ถูก commit ไปยัง Git repository
- ไฟล์ .gitignore จะจัดการให้อัตโนมัติ
- หากต้องการเพิ่มรูปภาพใหม่ ให้วางในโฟลเดอร์ที่เหมาะสม

## 🔧 การใช้งาน

### ใน Robot Framework Test:
```robot
*** Variables ***
${PRODUCT_IMAGE_PATH}    ${EXECDIR}${/}images${/}test_images${/}น้ำยาล้างจาน.jpg
${AVATAR_IMAGE_PATH}     ${EXECDIR}${/}images${/}avatars${/}test_avatar.jpg
```

### การอัปโหลดรูปภาพ:
```robot
Upload Product Image    ${PRODUCT_IMAGE_PATH}
Change Profile Avatar   ${AVATAR_IMAGE_PATH}
```
