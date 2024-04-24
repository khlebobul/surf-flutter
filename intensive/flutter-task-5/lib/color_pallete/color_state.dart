import '../data/color_entity.dart';

sealed class ColorsPalleteState {}

// Состояние загрузки цветов
final class ColorsPalleteLoadingState extends ColorsPalleteState {
  ColorsPalleteLoadingState();
}

// Состояние успешной загрузки цветов
final class ColorsPalleteLoadedState extends ColorsPalleteState {
  //Список цветов для отображения
  List<ColorEntity> colors;
  ColorsPalleteLoadedState({required this.colors});
}
