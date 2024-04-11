// Класс для чтения/записи данных из локального хранилища
abstract interface class ILocalStorageDataSource {
  /// Получить значение из хранилища по ключу [key].
  Future<(T?, bool)> getByKey<T>(String key);

  /// Записать значение [value] в хранилище по ключу [key].
  void set<T>(String key, T value);
}
