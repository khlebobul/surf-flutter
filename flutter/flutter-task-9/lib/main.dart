import 'package:flutter/material.dart';

void main() {
  runApp(const FormValidationApp());
}

class FormValidationApp extends StatelessWidget {
  const FormValidationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Валидация формы',
      debugShowCheckedModeBanner: false,
    );
  }
}
