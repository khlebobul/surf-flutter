import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:surf_flutter_courses_template/data/app_colors/app_colors.dart';
import 'package:surf_flutter_courses_template/data/app_typography/app_typography.dart';
import 'package:surf_flutter_courses_template/data/theme_extensions/button_styles.dart';
import 'package:surf_flutter_courses_template/data/theme_extensions/theme_colors.dart';
import 'package:surf_flutter_courses_template/data/theme_extensions/theme_text_styles.dart';

// Класс темы приложения,
// Параметр name хранит строку с названием темы,
// используется для записи этой строки в SharedPreferences,
// и для сопоставления записанной в SharedPreferences определённой теме
sealed class AppTheme {
  final String name;
  final ThemeData? themeData;
  AppTheme({required this.name, required this.themeData});
}

//
sealed class DarkTheme implements AppTheme {}

sealed class LightTheme implements AppTheme {}

sealed class DefaultTheme implements AppTheme {}

class SystemTheme implements DefaultTheme {
  @override
  String get name => 'SystemTheme';

  @override
  ThemeData? get themeData {
    final Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    if (brightness == Brightness.dark) {
      return ThemeData.dark();
    } else {
      return ThemeData.light();
    }
  }
}

class LightGreenTheme implements LightTheme {
  @override
  String get name => 'Схема 1 светлая';

  @override
  ThemeData get themeData => ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            titleTextStyle: AppTypography.appBarTextStyle.copyWith(
              color: AppColors.black,
            ),
            iconTheme:
                const IconThemeData(color: AppColors.lightGreen, size: 24),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(AppColors.lightGreen),
          ),
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.white,
          bottomSheetTheme: const BottomSheetThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              backgroundColor: AppColors.white),
          cardTheme: const CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          extensions: <ThemeExtension<dynamic>>[
            ThemeColors.lightGreen(),
            ThemeTextStyles.greenLight(),
            ThemeButtonStyles.classic()
          ]);
}

class LightBlueTheme implements LightTheme {
  @override
  String get name => 'Схема 2 светлая';

  @override
  ThemeData get themeData => ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            titleTextStyle: AppTypography.appBarTextStyle.copyWith(
              color: AppColors.black,
            ),
            iconTheme:
                const IconThemeData(color: AppColors.lightPurple, size: 24),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(AppColors.lightPurple),
          ),
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.lightBlue,
          bottomSheetTheme: const BottomSheetThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              backgroundColor: AppColors.lightBlue),
          cardTheme: const CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          extensions: <ThemeExtension<dynamic>>[
            ThemeColors.lightPurple(),
            ThemeTextStyles.blueLight(),
            ThemeButtonStyles.classic()
          ]);
}

class LightOrangeTheme implements LightTheme {
  @override
  String get name => 'Схема 3 светлая';

  @override
  ThemeData get themeData => ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            titleTextStyle: AppTypography.appBarTextStyle.copyWith(
              color: AppColors.black,
            ),
            iconTheme: const IconThemeData(color: AppColors.orange, size: 24),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(AppColors.orange),
          ),
          textTheme: const TextTheme().apply(
            bodyColor: const Color(0xff22215B),
            displayColor: const Color(0xff22215B),
          ),
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.lightBronze,
          bottomSheetTheme: const BottomSheetThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              backgroundColor: AppColors.lightBronze),
          cardTheme: const CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          extensions: <ThemeExtension<dynamic>>[
            ThemeColors.lightOrange(),
            ThemeTextStyles.orangeLight(),
            ThemeButtonStyles.classic()
          ]);
}

class DarkGreenTheme implements DarkTheme {
  @override
  String get name => 'Схема 1 тёмная';

  @override
  ThemeData get themeData => ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            titleTextStyle: AppTypography.appBarTextStyle.copyWith(
              color: AppColors.white,
            ),
            iconTheme:
                const IconThemeData(color: AppColors.lightGreen, size: 24),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(AppColors.lightGreen),
          ),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.black,
          bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            backgroundColor: AppColors.black,
          ),
          cardTheme: const CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          extensions: <ThemeExtension<dynamic>>[
            ThemeColors.darkGreen(),
            ThemeTextStyles.greenDark(),
            ThemeButtonStyles.classic()
          ]);
}

class DarkBlueTheme implements DarkTheme {
  @override
  String get name => 'Схема 2 тёмная';

  @override
  ThemeData get themeData => ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            titleTextStyle: AppTypography.appBarTextStyle.copyWith(
              color: AppColors.white,
            ),
            iconTheme:
                const IconThemeData(color: AppColors.mediumBlue, size: 24),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(AppColors.mediumBlue),
          ),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.darkBlue,
          bottomSheetTheme: const BottomSheetThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              backgroundColor: AppColors.darkBlue),
          cardTheme: const CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          extensions: <ThemeExtension<dynamic>>[
            ThemeColors.darkPurple(),
            ThemeTextStyles.blueDark(),
            ThemeButtonStyles.classic()
          ]);
}

class DarkOrangeTheme implements DarkTheme {
  @override
  String get name => 'Схема 3 тёмная';

  @override
  ThemeData get themeData => ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.transparent,
            elevation: 0,
            titleTextStyle: AppTypography.appBarTextStyle.copyWith(
              color: AppColors.white,
            ),
            iconTheme: const IconThemeData(color: AppColors.orange, size: 24),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(AppColors.orange),
          ),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.darkBronze,
          bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            backgroundColor: AppColors.darkBronze,
          ),
          cardTheme: const CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          ),
          extensions: <ThemeExtension<dynamic>>[
            ThemeColors.darkOrange(),
            ThemeTextStyles.orangeDark(),
            ThemeButtonStyles.classic()
          ]);
}
