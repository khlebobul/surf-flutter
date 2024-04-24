import 'package:json_annotation/json_annotation.dart';

part 'colors.g.dart';

@JsonSerializable()
class ColorDTO {
  //Название цвета
  final String name;
  // Код цвета HEX
  // Сейчас является nullable полем, поскольку это допустимо описанием входных данных
  final String? value;

  const ColorDTO({required this.name, required this.value});

  factory ColorDTO.fromJson(Map<String, dynamic> json) =>
      _$ColorDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ColorDTOToJson(this);
}