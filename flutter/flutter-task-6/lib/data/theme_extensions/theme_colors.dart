import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/app_colors/app_colors.dart';
// Extension для хранения Colors используемых в приложении
class ThemeColors extends ThemeExtension<ThemeColors> {
  // Color of Save action in AppBar and others
  final Color appBarActionTextColor;
  // Color for chips in Profile screen
  final Color profileScreenChipsBackgroundColor;
  // Color of Button in BottomSheet for Select theme
  final Color changeThemeBottomSheetButtonColor;
  // Background color of Container with examples of used colors in BottomSheet for Themes changing
  final Color changeThemeBottomSheetExamplesBackgroundColor;
  ThemeColors(
      {required this.appBarActionTextColor,
      required this.changeThemeBottomSheetButtonColor,
      required this.profileScreenChipsBackgroundColor,
      required this.changeThemeBottomSheetExamplesBackgroundColor});

  ThemeColors.lightGreen()
      : appBarActionTextColor = AppColors.lightGreen,
        changeThemeBottomSheetButtonColor = AppColors.deepPurple,
        profileScreenChipsBackgroundColor = AppColors.greyLight,
        changeThemeBottomSheetExamplesBackgroundColor =
            AppColors.greenGreyBackground;
  ThemeColors.lightOrange()
      : appBarActionTextColor = AppColors.orange,
        changeThemeBottomSheetButtonColor = AppColors.mediumBlue,
        changeThemeBottomSheetExamplesBackgroundColor =
            AppColors.bronzeGreyBackground,
        profileScreenChipsBackgroundColor = AppColors.white;
  ThemeColors.lightPurple()
      : appBarActionTextColor = AppColors.mediumBlue,
        changeThemeBottomSheetButtonColor = AppColors.mediumOrange,
        changeThemeBottomSheetExamplesBackgroundColor =
            AppColors.blueGreyBackground,
        profileScreenChipsBackgroundColor = AppColors.white;
  ThemeColors.darkGreen()
      : appBarActionTextColor = AppColors.lightGreen,
        changeThemeBottomSheetButtonColor = AppColors.deepPurple,
        changeThemeBottomSheetExamplesBackgroundColor =
            AppColors.lightGreyBackground,
        profileScreenChipsBackgroundColor = AppColors.darkGrey;
  ThemeColors.darkOrange()
      : appBarActionTextColor = AppColors.orange,
        changeThemeBottomSheetButtonColor = AppColors.mediumOrange,
        profileScreenChipsBackgroundColor = AppColors.mediumBronze,
        changeThemeBottomSheetExamplesBackgroundColor =
            AppColors.lightBronzeBackground;
  ThemeColors.darkPurple()
      : appBarActionTextColor = AppColors.mediumBlue,
        changeThemeBottomSheetButtonColor = AppColors.mediumBlue,
        changeThemeBottomSheetExamplesBackgroundColor =
            AppColors.lightBlueBackground,
        profileScreenChipsBackgroundColor = AppColors.backgroundPurple;
  @override
  ThemeExtension<ThemeColors> copyWith(
      {Color? appBarActionTextColor,
      Color? profileScreenChipsBackgroundColor,
      Color? changeThemeBottomSheetButtonColor,
      Color? changeThemeBottomSheetExamplesBackgroundColor}) {
    return ThemeColors(
      changeThemeBottomSheetExamplesBackgroundColor:
          changeThemeBottomSheetExamplesBackgroundColor ??
              this.changeThemeBottomSheetExamplesBackgroundColor,
      appBarActionTextColor:
          appBarActionTextColor ?? this.appBarActionTextColor,
      profileScreenChipsBackgroundColor: profileScreenChipsBackgroundColor ??
          this.profileScreenChipsBackgroundColor,
      changeThemeBottomSheetButtonColor: changeThemeBottomSheetButtonColor ??
          this.changeThemeBottomSheetButtonColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
      covariant ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      appBarActionTextColor:
          Color.lerp(appBarActionTextColor, other.appBarActionTextColor, t)!,
      changeThemeBottomSheetButtonColor: Color.lerp(
          changeThemeBottomSheetButtonColor,
          other.changeThemeBottomSheetButtonColor,
          t)!,
      profileScreenChipsBackgroundColor: Color.lerp(
          profileScreenChipsBackgroundColor,
          other.profileScreenChipsBackgroundColor,
          t)!,
      changeThemeBottomSheetExamplesBackgroundColor: Color.lerp(
          changeThemeBottomSheetExamplesBackgroundColor,
          other.changeThemeBottomSheetExamplesBackgroundColor,
          t)!,
    );
  }
}
