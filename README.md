# flutter_demo

一个新的 Flutter 项目。

## 环境要求

- Flutter SDK
- Dart SDK
- Android Studio / Xcode (取决于目标平台)
- iOS 模拟器 / Android 模拟器

## 开始使用

### 1. 安装依赖

```bash
flutter pub get
```

### 2. 运行项目

开发模式运行：
```bash
flutter run
```

指定设备运行（可选）：
```bash
flutter devices  # 查看可用设备
flutter run -d <device-id>  # 在指定设备上运行
```

### 3. 构建应用

#### Android 构建
```bash
# 构建 APK
flutter build apk

# 构建 Android App Bundle
flutter build appbundle
```
构建完成后可在 `build/app/outputs/` 目录下找到输出文件。

#### iOS 构建
```bash
# 构建 iOS 版本
flutter build ios

# 构建 iOS 版本并打开 Xcode 工程
open ios/Runner.xcworkspace
```
然后可以通过 Xcode 进行进一步的配置和发布。

## 项目结构

```
lib/          - 主要的代码目录
test/         - 测试文件目录
android/      - Android 平台相关代码
ios/          - iOS 平台相关代码
web/          - Web 平台相关代码
```

## 学习资源

- [Lab: 编写你的第一个 Flutter 应用](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: 实用 Flutter 示例](https://docs.flutter.dev/cookbook)
- [Flutter 在线文档](https://docs.flutter.dev/) - 提供教程、示例、移动开发指南和完整的 API 参考。
