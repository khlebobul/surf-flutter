import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_courses_template/data/data_source/local_storage/local_storage_abstract.dart';
// Реализация LocalStorage с использованием плагина SharedPreferences и паттерна singleton
class SharedPreferencesLocalStrorage implements ILocalStorageDataSource {
  SharedPreferencesLocalStrorage._internal();

  static final SharedPreferencesLocalStrorage _instance =
      SharedPreferencesLocalStrorage._internal();

  factory SharedPreferencesLocalStrorage() {
    return _instance;
  }

  @override
  Future<(T?, bool)> getByKey<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return (prefs.get(key) as T, true);
    } else {
      return (null, false);
    }
  }

  @override
  void set<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (T) {
      case String:
        prefs.setString(key, value as String);
      case Bool:
        prefs.setBool(key, value as bool);
      case Int:
        prefs.setInt(key, value as int);
      case Double:
        prefs.setDouble(key, value as double);
      default:
    }
  }
}
