import 'package:easy_travel/core/ui/theme.dart';
import 'package:easy_travel/features/auth/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    final MaterialTheme theme = MaterialTheme(TextTheme());
    return MaterialApp(
      theme: theme.light(),
      darkTheme: theme.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: SignupPage())),
    );
  }
}
