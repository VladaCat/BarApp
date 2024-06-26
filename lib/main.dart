import 'package:flutter/material.dart';
import 'package:your_best_bar/auth/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_best_bar/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      //home: LoginPage(),
      //home: HomePage(),
    );
  }
}
