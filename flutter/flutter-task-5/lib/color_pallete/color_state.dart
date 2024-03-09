import '../data/color.dart';

sealed class ColorsPalleteState {
}
// Состояние загрузки цветов
final class ColorsPalleteLoadingState extends ColorsPalleteState
{

}
// Состояние успешной загрузки цветов
final class ColorsPalleteLoadedState extends ColorsPalleteState
{
  //Список цветов для отображения
  List<ColorClass> colors;
ColorsPalleteLoadedState({required this.colors});
}