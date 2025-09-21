# ProcessMaker 4 - Development Environment

این پروژه یک محیط توسعه برای **ProcessMaker 4** فراهم می‌کند که بر پایه‌ی **Docker** و **WSL2** طراحی شده است.  

---

## پیش‌نیازها

1. **ویندوز 10 یا 11 (64 بیتی)**
2. **WSL2** فعال شده
3. **Docker Desktop** نصب و در حال اجرا
4. اینترنت برای دانلود اولیه ایمیج‌ها

---

## ساختار پوشه‌ها

```bash
processmaker-dev/
├── app/
│ └── processmaker/
├── docker-compose.yml
├── .env
├── logs.bat
├── setup.bat
├── start-dev.bat
├── stop-dev.bat
├── mysql/
│ └── data/
├── nginx/
│ └── default.conf
└── redis/
└── data/
```

---

## نصب و راه‌اندازی

### **۱. آماده‌سازی اولیه**
برای آماده‌سازی سیستم (فعال‌سازی WSL2 و تست Docker):

```bash
setup.bat
```
---

### **۲. اجرای محیط توسعه**
```bash
start-dev.bat
```

سپس مرورگر را باز کنید و به آدرس زیر بروید:

```bash
http://localhost:8080

```


---

### **۳. توقف محیط**
```bash
stop-dev.bat
```

---

### **۴. مشاهده لاگ‌ها**
```bash
logs.bat
```

---

## فایل `.env` نمونه

```bash

MYSQL_ROOT_PASSWORD=rootpass
MYSQL_DATABASE=processmaker
MYSQL_USER=pm_user
MYSQL_PASSWORD=pm_pass

APP_PORT=8080
APP_URL=http://localhost:8080
PM_VOLUME=./app/processmaker

REDIS_PORT=6379

```

> **نکته:**  
> این مقادیر را بر اساس نیاز خود تغییر دهید.

---

## دستورات Docker اختیاری

```bash
# کانتینرهای در حال اجرا
docker ps

# مشاهده لاگ‌ها
docker-compose logs -f

# توقف همه سرویس‌ها
docker-compose down

# حذف همه ایمیج‌های پروژه
docker-compose down --rmi all
```

---

## عیب‌یابی

### بررسی نسخه WSL
```bash
wsl --list --verbose
```
باید نسخه **2** باشد. اگر نسخه 1 بود، دستور زیر را اجرا کنید:

```bash
wsl --set-default-version 2
```
---

## مزایا

- اجرای ساده فقط با دوبار کلیک (`start-dev.bat`)
- بدون نیاز به دانش Docker یا لینوکس
- پایداری داده‌ها حتی با حذف کانتینر
- هماهنگی کامل بین اعضای تیم توسعه
- مدیریت ساده نسخه‌ها و به‌روزرسانی‌ها

---

## لایسنس

این پروژه تحت لایسنس MIT منتشر شده است.

