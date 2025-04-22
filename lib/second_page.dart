import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});  // Использование super.key для передачи параметра в родительский класс

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Вторая страница'));
  }
}
