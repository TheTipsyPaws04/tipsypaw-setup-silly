# Tipsypaw Setup - SillyTavern

ติดตั้ง SillyTavern แบบคลิกเดียว ครบทั้ง **Windows** และ **Android (Termux)**

## Windows

เปิด **PowerShell** แล้ววางบรรทัดเดียวนี้:

```powershell
irm https://raw.githubusercontent.com/YOUR-USERNAME/tipsypaw-setup-silly/main/install.ps1 | iex
```

จะติดตั้ง Git + Node.js ให้เอง, โหลด SillyTavern, สร้างทางลัดหน้า Desktop แล้วเปิดให้ทันที

## Android (Termux)

ติดตั้ง Termux จาก [F-Droid](https://f-droid.org/en/packages/com.termux/) ก่อน แล้วเปิด Termux วางบรรทัดเดียวนี้:

```bash
curl -sL https://raw.githubusercontent.com/YOUR-USERNAME/tipsypaw-setup-silly/main/install.sh | bash
```

จากนั้นเปิดเบราว์เซอร์มือถือไปที่ `http://localhost:8000`

## ครั้งต่อไป (เปิดใช้ซ้ำ)

- Windows: ดับเบิลคลิกทางลัด `SillyTavern` บน Desktop
- Termux: `cd ~/SillyTavern && bash start.sh`

## หมายเหตุ

- Windows ต้องมี `winget` (มีใน Windows 10/11 ที่อัปเดตแล้ว)
- Android ควรใช้ Termux จาก F-Droid เท่านั้น (เวอร์ชัน Play Store เลิกอัปเดต)
- ถ้ามือถือเป็น 32-bit แล้วเจอ error `android arm LEtime-web` ให้รัน `pkg install -y esbuild` แล้วรันซ้ำ
