import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  // Параметр 'key' передаем в суперконструктор
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Первая страница'));
  }
}
