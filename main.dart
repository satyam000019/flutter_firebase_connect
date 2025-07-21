import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home/splash_screen.dart';
import '../home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ShramSetuApp());
}

class ShramSetuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' firebase Auth',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
