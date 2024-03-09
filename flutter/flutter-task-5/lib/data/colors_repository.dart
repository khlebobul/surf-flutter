import 'dart:convert';

import 'colors.dart';
import 'color.dart';
import 'colors_json.dart';
// Интерфейс репозитория получения цветов
abstract final interface class IColorsRepository
{
  // Получить список цветов дл яотображения
  List<ColorClass> getColors();

}

// Репозиторий для получения цветов из локальных данных
final class ColorsRepositoryCurrent implements IColorsRepository
{
  // Получить список цветов дл яотображения
  @override
  List<ColorClass> getColors()
  {
    // Полшучаем данные из файла colors_json.dart , 
    final data = jsonDecode(ColorsJson.rawJson);
    final List? colors = data['colors'];
    if (colors == null  ) {
      return [];
    }
    // Выберем цвета  с непустым значением цвета
    final notEmptyColors = colors.map((e) => ColorDTO.fromJson(e),).where((element) => element.value != null);
    final result = notEmptyColors.expand((element) => [ColorClass(name: element.name, value: element.value!)]).toList();
    return result;
  }
}