import 'dart:convert';

import 'colors.dart';
import 'color_entity.dart';
import 'colors_json.dart';
// Интерфейс репозитория получения цветов
abstract final interface class IColorsRepository
{
  // Получить список цветов дл яотображения
  List<ColorEntity> getColors();

}

// Репозиторий для получения цветов из локальных данных
final class ColorsRepositoryCurrent implements IColorsRepository
{
  // Получить список цветов дл яотображения
  @override
  List<ColorEntity> getColors()
  {
    // Полшучаем данные из файла colors_json.dart , 
    final data = jsonDecode(ColorsJson.rawJson);
    final List? colors = data['colors'];
    if (colors == null  ) {
      return [];
    }
    // Выберем цвета  с непустым значением цвета
    final notEmptyColors = colors
    .map((e) => ColorDTO.fromJson(e))
    .where((element) => element.value != null)
    .toList(); // Преобразование в список

final result = notEmptyColors
    .map((element) => ColorEntity(
        name: element.name, value: element.value!))
    .toList(); // Преобразование в список

return result;
  }
}