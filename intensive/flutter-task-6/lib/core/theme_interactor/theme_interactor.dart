import 'package:flutter/foundation.dart';
import 'package:surf_flutter_courses_template/theme/themes_repository/themes_repository.dart';
import 'package:surf_flutter_courses_template/domain/app_theme.dart';

class ThemeInteractor with ChangeNotifier {
  final ThemesRepository themesRepository;

  ThemeInteractor({required this.themesRepository});

  // Дефолтная тема, применяется при инициализации, пока не загрузилась необходимая тема
  AppTheme _currentTheme = SystemTheme();

  // Сохраняет полученную тему как выбранную
  Future<void> _saveTheme(AppTheme theme) async {
    await themesRepository.saveTheme(theme.name);
  }

  /// Обновляет текущую тему и сохраняет её в локальное хранилище
  Future<void> updateTheme(AppTheme theme) async {
    await _saveTheme(theme);
    _currentTheme = theme;
    notifyListeners();
  }

  // Возвращает текущую тему
  AppTheme get currentTheme => _currentTheme;

  // Возвращает светлые темы, описанные в репозитории
  List<AppTheme> getLightThemes() => themesRepository.lightThemes;

  // Возвращает темные темы, описанные в репозитории
  List<AppTheme> getDarkThemes() => themesRepository.darkThemes;

  // Читает из хранилища сохранённую тему
  Future<void> loadTheme() async {
    _currentTheme = await themesRepository.getCurrentTheme();
    notifyListeners();
  }
}
