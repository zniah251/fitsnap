# fitsnap

## 1. Yêu cầu hệ thống

Trước khi chạy ứng dụng, cần chuẩn bị:
- Windows, macOS hoặc Linux
- Flutter SDK (bao gồm Dart)
- Android Studio (có plugin Flutter và Dart)
- Thiết bị thật hoặc giả lập Android/iOS

## 2. Cài đặt Flutter SDK

### Bước 1: Tải Flutter
- Truy cập trang: https://flutter.dev/docs/get-started/install
- Chọn bản Windows và tải file `.zip` (ví dụ: flutter_windows_3.x.x-stable.zip)

### Bước 2: Giải nén
Giải nén vào thư mục: C:\src\flutter //ví dụ thoai
Không nên đặt trong thư mục có dấu cách (ví dụ Program Files)

### Bước 3: Thêm vào biến môi trường (PATH)
- Mở Edit environment variables
- Ở phần User variables → Path → Edit
- Thêm dòng: C:\src\flutter\bin

### Bước 4: Kiểm tra Flutter
Mở CMD hoặc PowerShell và gõ: flutter doctor
Nếu thấy các dòng kiểm tra hiển thị đầy đủ là đã cài thành công.

---

## 3. Dart SDK

Dart được tích hợp sẵn trong Flutter SDK, không cần cài riêng.  
Kiểm tra bằng lệnh: dart --version

---

## 4. Cài đặt Android Studio

### Bước 1: Tải Android Studio
Tải tại: https://developer.android.com/studio

### Bước 2: Cài đặt thành phần cần thiết
Mở Android Studio → More Actions → SDK Manager  
Cài đặt các mục sau:
- Android SDK Platform (phiên bản mới nhất)
- Android SDK Build-Tools
- Android Emulator
- Android Virtual Device (AVD)

### Bước 3: Cài plugin Flutter và Dart
Trong Android Studio: File → Settings → Plugins
Tìm và cài đặt:
- Flutter
- Dart

---

## 5. Tạo thiết bị giả lập (Android Emulator)

- Vào Device Manager
- Nhấn Create Virtual Device
- Chọn mẫu máy (ví dụ Pixel 6)
- Chọn phiên bản Android (13 hoặc 14)
- Nhấn Finish và Run để khởi động giả lập

---

## 6. Clone và cài đặt project fitsnap

git clone https://github.com/zniah251/fitsnap.git

cd fitsnap
flutter pub get
flutter devices
flutter run


---

## 7. Build bản phát hành

### Android (APK)
flutter build apk --split-per-abi

### Android (AppBundle)
flutter build appbundle


---

## 8. Kiểm tra và xử lý lỗi môi trường

Nếu flutter doctor báo thiếu license Android:
flutter doctor --android-licenses
Nhấn y để chấp nhận toàn bộ.  
Sau đó chạy lại:

---

## 9. Kiểm thử ứng dụng

flutter test






