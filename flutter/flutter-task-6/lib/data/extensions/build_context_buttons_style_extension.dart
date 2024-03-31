import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/theme_extensions/button_styles.dart';
// Расширение для получения используемых buttonStyle в теме.
// С ним вместо Theme.of(this).extension<ThemeButtonStyles>() 
// получить расширение можно обращаться из кода так: 
// context.buttonStyle
extension BuildContextButtolStyleExtension on BuildContext {
  // Получить используемые  ThemeColors в теме ThemeExtension
  ThemeButtonStyles? get buttonStyle => Theme.of(this).extension<ThemeButtonStyles>();
}