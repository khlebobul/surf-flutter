import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/widgets/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: const Color(0xFF252849),
          primaryContainer: const Color(0xFF60607B),
          secondaryContainer: const Color(0xFFF1F1F1),
          tertiary: const Color(0xFFB5B5B5),
          error: const Color(0xFFFF0000),
          onPrimary: const Color(0xFF67CD00),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          labelLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        useMaterial3: true,
        fontFamily: 'Sora',
      ),
      home: const ListOfProductScreen(),
    );
  }
}
