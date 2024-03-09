// Класс для храниения параметров цветов для палитры
// Название ColorClass, чтобы отличался от Dart-класса Color
import 'dart:ui';

class ColorClass {
  //Название цвета
  final String name;
  // Код цвета HEX
  final String value;

  ColorClass({required this.name, required this.value});

  // Получение цвета, соответсвующего lue
  Color get hexColor => Color(int.parse('0xff${value.substring(1)}'));

  // Получить hex значение цвета без #
  String get clearValue => value.substring(1);

  // Получить составляющую Red
  String get redPart => clearValue.substring(0, 2);
  // Получить составляющую Green
  String get greenPart => clearValue.substring(2, 4);

  // Получить составляющую Blue
  String get bluePart => clearValue.substring(4);
}