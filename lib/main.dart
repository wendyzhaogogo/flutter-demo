import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/token_list_screen.dart';
import 'package:flutter_demo/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Token Tracker',
      theme: AppTheme.darkTheme,
      home: TokenListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
