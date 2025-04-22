import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'form_page.dart';
import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key}); // Использование super.key вместо key

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  Future<void> checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuth = prefs.getBool('isAuthenticated') ?? false;

    // Проверяем, что виджет еще "монтирован" перед использованием контекста
    if (!mounted) return;

    // Навигация с использованием pushReplacement
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => isAuth ? HomePage() : FormPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()), // Загрузка, пока идет проверка
    );
  }
}
