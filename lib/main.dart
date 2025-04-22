import 'package:flutter/material.dart';
import 'start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Использование super.key для передачи параметра в родительский класс

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 9',
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
