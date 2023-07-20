import 'package:flutter/material.dart';
import 'package:your_best_bar/login_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      home: HomePage(),
    );
  }
}
