import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/theme_extensions/theme_colors.dart';

// Extension для получения ThemeExtension текущей темы
extension BuildContextThemeColorExtension on BuildContext {
  // Получить используемые  ThemeColors в теме ThemeExtension
  ThemeColors? get color => Theme.of(this).extension<ThemeColors>();
}
