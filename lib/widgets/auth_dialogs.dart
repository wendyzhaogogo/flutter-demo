import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

// A common dialog structure
void showAuthDialog(BuildContext context, {required Widget child}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppTheme.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(24.0),
          child: child,
        ),
      );
    },
  );
}

// Registration Dialog Content
class RegistrationDialog extends StatelessWidget {
  const RegistrationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '注册',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('已有账号? ', style: TextStyle(color: AppTheme.textGray)),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                showAuthDialog(context, child: const LoginDialog());
              },
              child: const Text('去登录', style: TextStyle(color: AppTheme.green)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildTextField(label: '邮箱', hint: '输入邮箱'),
        const SizedBox(height: 16),
        _buildTextField(label: '邀请码 (选填)', hint: '请输入邀请码'),
        const SizedBox(height: 8),
        const Text(
          '邀请码绑定后不可修改，请保证输入正确的邀请码',
          style: TextStyle(color: AppTheme.textGray, fontSize: 12),
        ),
        const SizedBox(height: 24),
        _buildAuthButton(text: '注册'),
        const SizedBox(height: 24),
        _buildDivider('其它注册方式'),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(icon: Icons.telegram, label: 'Telegram'),
            const SizedBox(width: 40),
            _buildSocialButton(
              icon: Icons.account_balance_wallet,
              label: 'Phantom',
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildFooter(),
      ],
    );
  }
}

// Login Dialog Content
class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '登录',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('还没有账号? ', style: TextStyle(color: AppTheme.textGray)),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                showAuthDialog(context, child: const RegistrationDialog());
              },
              child: const Text(
                '立即注册',
                style: TextStyle(color: AppTheme.green),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildTextField(label: '邮箱', hint: '输入邮箱'),
        const SizedBox(height: 16),
        _buildTextField(
          label: '密码',
          hint: '输入密码',
          obscureText: true,
          suffixIcon: Icons.visibility_off,
        ),
        const SizedBox(height: 8),
        const Align(
          alignment: Alignment.centerRight,
          child: Text('忘记密码?', style: TextStyle(color: AppTheme.textGray)),
        ),
        const SizedBox(height: 24),
        _buildAuthButton(text: '登录'),
        const SizedBox(height: 24),
        _buildDivider('或者'),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialButton(icon: Icons.telegram, label: 'Telegram'),
            _buildSocialButton(
              icon: Icons.account_balance_wallet,
              label: 'Phantom',
            ),
            _buildSocialButton(icon: Icons.qr_code_scanner, label: 'APP扫码'),
          ],
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            '连接插件钱包交易 ->',
            style: TextStyle(color: AppTheme.textGray),
          ),
        ),
        const SizedBox(height: 24),
        _buildFooter(),
      ],
    );
  }
}

// Common Widgets for Dialogs
Widget _buildTextField({
  required String label,
  required String hint,
  bool obscureText = false,
  IconData? suffixIcon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.white)),
      const SizedBox(height: 8),
      TextField(
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppTheme.textGray),
          filled: true,
          fillColor: AppTheme.buttonBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: AppTheme.textGray)
              : null,
        ),
      ),
    ],
  );
}

Widget _buildAuthButton({required String text}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.green,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _buildDivider(String text) {
  return Row(
    children: [
      const Expanded(child: Divider(color: AppTheme.borderGray)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(text, style: const TextStyle(color: AppTheme.textGray)),
      ),
      const Expanded(child: Divider(color: AppTheme.borderGray)),
    ],
  );
}

Widget _buildSocialButton({required IconData icon, required String label}) {
  return Column(
    children: [
      CircleAvatar(
        radius: 28,
        backgroundColor: AppTheme.buttonBackground,
        child: Icon(icon, color: Colors.white, size: 28),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(color: AppTheme.textGray)),
    ],
  );
}

Widget _buildFooter() {
  return const Center(
    child: Text(
      '服务条款 | 隐私政策',
      style: TextStyle(color: AppTheme.textGray, fontSize: 12),
    ),
  );
}
