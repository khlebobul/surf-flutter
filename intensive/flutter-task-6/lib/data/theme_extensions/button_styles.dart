import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/data/app_colors/app_colors.dart';
import 'package:surf_flutter_courses_template/data/app_typography/app_typography.dart';

// В случае использования кнопок, стиль которых буде отличаться от стиля,
// определённого в buttonTheme текущей темы, кастомный стиль можно описать в данном расширении
// и использовать его в кастомной кнопке
class ThemeButtonStyles extends ThemeExtension<ThemeButtonStyles> {
  // Стиль кнопки Log out
  final ButtonStyle logoutButtonStyle;
  // Тиль кнопки Применить на боттотмшите смены темы
  final ButtonStyle themesBottomSheetAcceptButtonStyle;

  ThemeButtonStyles({
    required this.logoutButtonStyle,
    required this.themesBottomSheetAcceptButtonStyle,
  });

  ThemeButtonStyles.classic()
      : logoutButtonStyle = ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(
              color: AppColors.red,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            AppTypography.largeTextStyle
                .copyWith(color: AppColors.red),
          ),
          foregroundColor: const MaterialStatePropertyAll(AppColors.red),
        ),
        themesBottomSheetAcceptButtonStyle = ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            AppTypography.largeTextStyle,
          ),
          alignment: Alignment.center,
          fixedSize: const MaterialStatePropertyAll(
            Size.fromHeight(50),
          ),
          foregroundColor: const MaterialStatePropertyAll(AppColors.white),
        );

  @override
  ThemeExtension<ThemeButtonStyles> copyWith({
    ButtonStyle? logoutButtonStyle,
    ButtonStyle? themesBottomSheetAcceptButtonStyle,
  }) {
    return ThemeButtonStyles(
      logoutButtonStyle: logoutButtonStyle ?? this.logoutButtonStyle,
      themesBottomSheetAcceptButtonStyle: themesBottomSheetAcceptButtonStyle ??
          this.themesBottomSheetAcceptButtonStyle,
    );
  }

  @override
  ThemeExtension<ThemeButtonStyles> lerp(
      covariant ThemeExtension<ThemeButtonStyles>? other, double t) {
    if (other is! ThemeButtonStyles) {
      return this;
    }
    return ThemeButtonStyles(
      logoutButtonStyle:
          ButtonStyle.lerp(logoutButtonStyle, other.logoutButtonStyle, t)!,
      themesBottomSheetAcceptButtonStyle: ButtonStyle.lerp(
          themesBottomSheetAcceptButtonStyle,
          other.themesBottomSheetAcceptButtonStyle,
          t)!,
    );
  }
}
