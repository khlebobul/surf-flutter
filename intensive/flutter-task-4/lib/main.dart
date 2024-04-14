import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/constants/fonts.dart';
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
          secondaryContainer: const Color(0xFFFFFFFF),
          tertiary: const Color(0xFFB5B5B5),
          error: const Color(0xFFFF0000),
          onPrimary: const Color(0xFF67CD00),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyles.titleMedium, // Используем новые стили
          displaySmall: TextStyles.displaySmall,
          displayMedium: TextStyles.displayMedium,
          bodySmall: TextStyles.bodySmall,
          bodyMedium: TextStyles.bodyMedium,
          labelLarge: TextStyles.labelLarge,
          headlineMedium: TextStyles.headlineMedium,
        ),
        useMaterial3: true,
        fontFamily: 'Sora',
      ),
      home: const ListOfProductScreen(),
    );
  }
}
