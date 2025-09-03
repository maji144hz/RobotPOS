# รูปภาพสำหรับทดสอบ (images)

โฟลเดอร์นี้เอาไว้เก็บรูปที่ใช้ตอนรันทดสอบครับ ใช้งานง่ายๆ วางรูปไว้ใน `test_images/` แล้วอ้าง path ในเทสต์ได้เลย

## โครงสร้าง

```
images/
└── test_images/
    ├── น้ำยาล้างจาน.jpg
    ├── v3_0039338.jpg
    ├── v3_0418735.jpg
    └── 533184214_1353949076298825_6451036581861081456_n.jpg
```

## ใช้งานกับ Robot Framework

ตั้งตัวแปร path ไว้ในส่วน Variables แล้วเอาไปใช้ในคีย์เวิร์ดอัปโหลดรูป

```robot
*** Variables ***
${PRODUCT_IMAGE_PATH}    ${EXECDIR}${/}images${/}test_images${/}น้ำยาล้างจาน.jpg

*** Test Cases ***
อัปโหลดรูปสินค้า
    Upload Product Image    ${PRODUCT_IMAGE_PATH}
```

## หมายเหตุ

- ถ้าจะเพิ่มรูป ให้ใส่ไว้ใน `test_images/`
- หลีกเลี่ยงการ commit รูปที่ไม่เกี่ยวกับงานทดสอบ
