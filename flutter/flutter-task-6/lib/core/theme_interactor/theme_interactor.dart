import 'package:flutter/foundation.dart';
import 'package:surf_flutter_courses_template/data/themes_repository/themes_repository.dart';
import 'package:surf_flutter_courses_template/domain/app_theme.dart';

// Интепактор для сохранения и получения сохранённой темы
class ThemeInteractor with ChangeNotifier {
  final ThemesRepository themesRepository;
  ThemeInteractor({required this.themesRepository});
  // Дефлотная тема, применятеся при инициализации пока не загрузилась необходимая тема
  AppTheme _currentTheme = SystemTheme();

  // Сохраняет полученную тему как выбранную
  void _saveTheme(AppTheme theme) {
    themesRepository.saveTheme(theme.name);
  }

  /// Обновляет текущую тему и сохраняет её в локальное хранилище
  void updateTheme(AppTheme theme) {
    _saveTheme(theme);
    _currentTheme = theme;
    notifyListeners();
  }

  // возвращает текущую темы
  AppTheme get currentTheme {
    return _currentTheme;
  }

  // Возвращает светлые темы, описанные  в репозитории
  List<AppTheme> getLightThemes() {
    return themesRepository.lightThemes;
  }

  // Возвращает темные темы, описанные  в репозитории
  List<AppTheme> getDarkThemes() {
    return themesRepository.darkThemes;
  }

  // Читает из хранилища сохранённую тему
  void loadTheme() async {
    _currentTheme = await themesRepository.getCurrentTheme();
    notifyListeners();
    return;
  }
}
