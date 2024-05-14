import 'package:flutter/material.dart';

// Класс для хранения TextStyle, используемых в приложении
class AppTypography {
  static const customTextStyle = TextStyle(
    inherit: false,
    fontSize: 14,
    fontStyle: FontStyle.normal,
  );
  static const smallTextStyle = TextStyle(
    inherit: false,
    fontSize: 12,
    fontStyle: FontStyle.normal,
  );
  static const largeTextStyle = TextStyle(
    inherit: false,
    fontSize: 16,
    fontStyle: FontStyle.normal,
  );
  static const appBarTextStyle = TextStyle(
    inherit: false,
    fontStyle: FontStyle.normal,
    fontSize: 20,
  );
}
