import 'package:surf_flutter_courses_template/data/data_source/local_storage/themes_storage.dart';
import 'package:surf_flutter_courses_template/data/data_source/themes_data_source.dart';
import 'package:surf_flutter_courses_template/domain/app_theme.dart';

class ThemesRepository {
  final ThemesDataSource themesDataSource;
  final ThemesStorage themesStorage;
  ThemesRepository(
      {required this.themesDataSource, required this.themesStorage});

  // Возвращает доступные светлые темы
  List<AppTheme> get lightThemes =>
      themesDataSource.themes.whereType<LightTheme>().toList();

  // Возвращает доступные тёмные темы
  List<AppTheme> get darkThemes =>
      themesDataSource.themes.whereType<DarkTheme>().toList();

  // Сохраняет тему  в локадьное хранилище
  Future<void> saveTheme(String themeName) {
    themesStorage.setTheme(themeName);
    return Future.value();
  }

  // Получить тему, сохранённую в локальном хранилище
  Future<AppTheme> getCurrentTheme() async {
    try {
      final themeName = await themesStorage.getTheme;
      if (themeName != null) {
        return themesDataSource.themes.firstWhere(
          (element) => element.name == themeName,
          // Если тема не найдена, установим SystemTheme
          orElse: () => SystemTheme(),
        );
      } else {
        // Если тема не сохранена в хранилище, установим SystemTheme
        return SystemTheme();
      }
    } on Exception catch (_) {
      // При возникновении ошибки установим SystemTheme
      return SystemTheme();
    }
  }
}
