# Flutter 加密货币追踪器

一个基于 Flutter 的应用程序，用于追踪和显示加密货币代币列表及其各种数据点。

![应用截图](https://user-images.githubusercontent.com/12345/screenshot.png) <!-- 请将此处的URL替换为您的应用截图URL -->

## ✨ 功能特性

-   **动态数据网格**: 使用 `syncfusion_flutter_datagrid` 展示数据，支持首末列固定。
-   **自定义UI组件**: 丰富的自定义小部件，用于显示代币信息。
-   **现代状态管理**: 利用 `flutter_hooks` 实现高效的状态管理。
-   **GitHub Actions**: 配置了 CI/CD，可自动构建并部署到 GitHub Pages。

## 🚀 本地开发

1.  **环境要求**:
    -   确保已安装 [Flutter SDK](https://flutter.cn/docs/get-started/install)。
    -   使用 VS Code 或 Android Studio。

2.  **克隆并运行**:
    ```sh
    # 克隆仓库
    git clone https://github.com/<您的用户名>/flutter_demo.git
    cd flutter_demo

    # 安装依赖
    flutter pub get

    # 运行应用 (可指定 chrome, ios, android 等设备)
    flutter run -d chrome
    ```

## 📦 构建生产版本

-   **Android**:
    ```sh
    flutter build apk --release
    # or
    flutter build appbundle --release
    ```

-   **iOS**:
    ```sh
    flutter build ios --release
    # 然后在 Xcode 中打开 ios/Runner.xcworkspace 进行归档和分发。
    ```

-   **Web**:
    flutter build web --release --base-href /flutter-demo/
