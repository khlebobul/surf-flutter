import 'package:surf_flutter_courses_template/data/data_source/local_storage/local_storage_abstract.dart';

// Класс для чтения/записи данных о теме приложения
class ThemesStorage {
  final ILocalStorageDataSource storage;

  ThemesStorage(this.storage);
  final String _themeKey = 'Theme';
  // Получить записанное значение темы
  Future<String?> get getTheme async {
    final result = await storage.getByKey(_themeKey);
    return result.$1;
  } 
  // Записать в хранилище тему, установленную в приложении
  void setTheme(String theme) => storage.set(_themeKey, theme);  
}
