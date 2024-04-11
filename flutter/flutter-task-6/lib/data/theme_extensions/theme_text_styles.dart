import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/app_colors/app_colors.dart';
import 'package:surf_flutter_courses_template/data/app_typography/app_typography.dart';

// В случае использования TextStyle, стиль которых буде отличаться от стиля,
// определённого в TextStyle текущей темы, кастомный стиль можно описать в данном расширении
// и использовать его
class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle secondaryTextFieldStyle;
  final TextStyle primaryTextFieldStyle;
  final TextStyle themesBottomSheetLabelStyle;
  final TextStyle themesBottomSheetRadioLabelTextStyle;

  // TextStyle для светлой темы с зелёным цветом
  ThemeTextStyles.greenLight()
      : secondaryTextFieldStyle = AppTypography.customTextStyle
            .copyWith(color: AppColors.greyLightTitle),
        themesBottomSheetLabelStyle =
            AppTypography.smallTextStyle.copyWith(color: AppColors.black),
        themesBottomSheetRadioLabelTextStyle =
            AppTypography.largeTextStyle.copyWith(color: AppColors.black),
        primaryTextFieldStyle =
            AppTypography.customTextStyle.copyWith(color: AppColors.black);

  // TextStyle для светлой темы с синим цветом
  ThemeTextStyles.blueLight()
      : secondaryTextFieldStyle = AppTypography.customTextStyle
            .copyWith(color: AppColors.lightPurple),
        themesBottomSheetLabelStyle =
            AppTypography.smallTextStyle.copyWith(color: AppColors.black),
        themesBottomSheetRadioLabelTextStyle =
            AppTypography.largeTextStyle.copyWith(color: AppColors.black),
        primaryTextFieldStyle =
            AppTypography.customTextStyle.copyWith(color: AppColors.black);

  // TextStyle для светлой темы с бронзовым цветом
  ThemeTextStyles.orangeLight()
      : secondaryTextFieldStyle =
            AppTypography.customTextStyle.copyWith(color: AppColors.bronze),
        themesBottomSheetLabelStyle =
            AppTypography.smallTextStyle.copyWith(color: AppColors.black),
        themesBottomSheetRadioLabelTextStyle =
            AppTypography.largeTextStyle.copyWith(color: AppColors.black),
        primaryTextFieldStyle =
            AppTypography.customTextStyle.copyWith(color: AppColors.black);

  // TextStyle для тёмной темы с зелёным цветом
  ThemeTextStyles.greenDark()
      : secondaryTextFieldStyle = AppTypography.customTextStyle
            .copyWith(color: AppColors.greyLightTitle),
        themesBottomSheetLabelStyle = AppTypography.smallTextStyle,
        themesBottomSheetRadioLabelTextStyle = AppTypography.largeTextStyle,
        primaryTextFieldStyle = AppTypography.customTextStyle;

  // TextStyle для тёмной темы с синим цветом
  ThemeTextStyles.blueDark()
      : secondaryTextFieldStyle = AppTypography.customTextStyle
            .copyWith(color: AppColors.lightPurple),
        themesBottomSheetLabelStyle = AppTypography.smallTextStyle,
        themesBottomSheetRadioLabelTextStyle = AppTypography.largeTextStyle,
        primaryTextFieldStyle = AppTypography.customTextStyle;

  // TextStyle для тёмной темы с бронзовым цветом
  ThemeTextStyles.orangeDark()
      : secondaryTextFieldStyle =
            AppTypography.customTextStyle.copyWith(color: AppColors.bronze),
        themesBottomSheetLabelStyle = AppTypography.smallTextStyle,
        themesBottomSheetRadioLabelTextStyle = AppTypography.largeTextStyle,
        primaryTextFieldStyle = AppTypography.customTextStyle;

  ThemeTextStyles(
      {required this.secondaryTextFieldStyle,
      required this.primaryTextFieldStyle,
      required this.themesBottomSheetLabelStyle,
      required this.themesBottomSheetRadioLabelTextStyle});

  @override
  ThemeExtension<ThemeTextStyles> copyWith(
      {TextStyle? secondaryTextFieldStyle,
      TextStyle? primaryTextFieldStyle,
      TextStyle? themesBottomSheetLabelStyle,
      TextStyle? themesBottomSheetRadioLabelTextStyle}) {
    return ThemeTextStyles(
        primaryTextFieldStyle:
            primaryTextFieldStyle ?? this.primaryTextFieldStyle,
        secondaryTextFieldStyle:
            secondaryTextFieldStyle ?? this.secondaryTextFieldStyle,
        themesBottomSheetLabelStyle:
            themesBottomSheetLabelStyle ?? this.themesBottomSheetLabelStyle,
        themesBottomSheetRadioLabelTextStyle:
            themesBottomSheetRadioLabelTextStyle ??
                this.themesBottomSheetRadioLabelTextStyle);
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
      covariant ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      primaryTextFieldStyle: TextStyle.lerp(
          primaryTextFieldStyle, other.primaryTextFieldStyle, t)!,
      secondaryTextFieldStyle: TextStyle.lerp(
          secondaryTextFieldStyle, other.secondaryTextFieldStyle, t)!,
      themesBottomSheetLabelStyle: TextStyle.lerp(
          themesBottomSheetLabelStyle, other.themesBottomSheetLabelStyle, t)!,
      themesBottomSheetRadioLabelTextStyle: TextStyle.lerp(
          themesBottomSheetRadioLabelTextStyle,
          other.themesBottomSheetRadioLabelTextStyle,
          t)!,
    );
  }
}
