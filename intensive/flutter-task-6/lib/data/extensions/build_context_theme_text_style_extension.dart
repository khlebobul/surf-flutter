import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/theme_extensions/theme_text_styles.dart';

// Extension для получения ThemeExtension текущей темы
extension BuildContextThemeTextStylesExtension on BuildContext {
  // Получить используемые  ThemeTextStyles в теме ThemeExtension
  ThemeTextStyles? get themeTextStyle => Theme.of(this).extension<ThemeTextStyles>();
}
