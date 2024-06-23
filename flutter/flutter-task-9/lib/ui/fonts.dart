import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/ui/colors.dart';

class AppTextStyles {
  static const TextStyle categoryTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'SFProDisplay',
    color: AppColors.black,
  );

  static const TextStyle formsTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay',
    color: AppColors.greyText,
  );

  static const TextStyle headlineTextStyle = TextStyle(
    fontSize: 24,
    fontFamily: 'SFProDisplay',
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle checkListTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'SFProDisplay',
    color: AppColors.black,
  );

  static const TextStyle buttonInactiveTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'SFProDisplay',
    color: AppColors.greyButtonText,
  );

  static const TextStyle buttonActiveTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'SFProDisplay',
    color: AppColors.white,
  );
}
