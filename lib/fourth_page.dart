import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});  // Использование super.key для передачи параметра в родительский класс

  @override
  FourthPageState createState() => FourthPageState();  // Переименован класс
}

class FourthPageState extends State<FourthPage> {  // Переименован класс
  String fullName = '', email = '', phone = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? '';
      email = prefs.getString('email') ?? '';
      phone = prefs.getString('phone') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ФИО: $fullName', style: TextStyle(fontSize: 18)),
          Text('Email: $email', style: TextStyle(fontSize: 18)),
          Text('Телефон: $phone', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
