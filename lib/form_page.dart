import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});  // Используем супер-параметр

  @override
  FormPageState createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '', email = '', phone = '';

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('fullName', fullName);
      prefs.setString('email', email);
      prefs.setString('phone', phone);
      prefs.setBool('isAuthenticated', true);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'ФИО'),
              onChanged: (val) => fullName = val,
              validator: (val) => val!.isEmpty ? 'Введите ФИО' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (val) => email = val,
              validator: (val) => val!.isEmpty ? 'Введите Email' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Телефон'),
              onChanged: (val) => phone = val,
              validator: (val) => val!.isEmpty ? 'Введите телефон' : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Зарегистрироваться'),
            ),
          ]),
        ),
      ),
    );
  }
}
